`timescale 1ns / 1ps

// =============================================================================
//  hdc302x_i2c_master.v  - Fixed revision v2
//
//  Key bug fixed vs previous version:
//    - RESTART primed byte_counter to 4'd4, which caused WAIT_ACK to miss
//      all case branches (0,1,2,3) and fall to ERROR. Fixed to 4'd3 so that
//      the existing "4'd3 -> READ_BYTE" branch fires correctly, and READ_BYTE
//      increments to 4 on its first captured byte (T_MSB) as intended.
//
//  All other fixes from previous revision retained:
//    1. auto_configured cleared on soft-reset / exit-auto VIO commands
//    2. NACK on addr_r (measurement not ready) -> retry after delay, not ERROR
//    3. CRC accumulator initialised fresh for each 2-byte word
//    4. COMPLETE always commits both words to temperature_raw / humidity_raw
//    5. auto_configured explicitly cleared on rst_n
// =============================================================================

module hdc302x_i2c_master #(
    parameter CLK_FREQ        = 50_000_000,
    parameter I2C_FREQ        = 400_000,
    parameter SLAVE_ADDR      = 7'h44,
    parameter MEAS_MODE       = 1,          // 0 = trigger-on-demand, 1 = auto
    parameter USE_ASYNC_RESET = 0
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start,
    inout  wire        sda,
    inout  wire        scl,
    output reg         busy,
    output reg         done,
    output reg         ack_error,
    output reg         crc_error,
    output reg  [15:0] temperature_raw,
    output reg  [15:0] humidity_raw,
    output wire [5:0]  state_debug,

    // VIO register interface
    input  wire        vio_send,
    input  wire [7:0]  vio_cmd_msb,
    input  wire [7:0]  vio_cmd_lsb,
    input  wire        vio_write_en,
    input  wire [7:0]  vio_data_msb,
    input  wire [7:0]  vio_data_lsb,
    input  wire [7:0]  vio_data_crc,
    output reg         vio_done,
    output reg         vio_ack_err
);

    // -----------------------------------------------------------------------
    // Parameters
    // -----------------------------------------------------------------------
    localparam integer SCL_DIVIDER        = CLK_FREQ / (I2C_FREQ * 4);
    localparam integer MEAS_DELAY_CYCLES  = (CLK_FREQ / 1000) * 15;  // 15 ms
    localparam integer RETRY_DELAY_CYCLES = (CLK_FREQ / 1000) * 2;   // 2 ms

    localparam [7:0] AUTO_CMD_MSB = 8'h21, AUTO_CMD_LSB = 8'h30;
    localparam [7:0] RD_CMD_MSB   = 8'hE0, RD_CMD_LSB   = 8'h00;
    localparam [7:0] TOD_CMD_MSB  = 8'h24, TOD_CMD_LSB  = 8'h00;

    // -----------------------------------------------------------------------
    // States
    // -----------------------------------------------------------------------
    localparam [5:0]
        IDLE             = 6'd0,
        START            = 6'd1,
        SEND_BYTE        = 6'd2,
        WAIT_ACK         = 6'd3,
        STOP             = 6'd4,
        WAIT_MEASUREMENT = 6'd5,
        RESTART          = 6'd6,
        READ_BYTE        = 6'd7,
        SEND_MASTER_ACK  = 6'd8,
        SEND_MASTER_NACK = 6'd9,
        COMPLETE         = 6'd10,
        ERROR            = 6'd11,
        AUTO_READ_START  = 6'd12,
        AUTO_READ_CMD    = 6'd13,
        AUTO_READ_ACK    = 6'd14,
        RETRY_WAIT       = 6'd15,
        VIO_START        = 6'd16,
        VIO_SEND         = 6'd17,
        VIO_ACK          = 6'd18,
        VIO_STOP         = 6'd19,
        VIO_DONE_ST      = 6'd20;

    // -----------------------------------------------------------------------
    // Registers
    // -----------------------------------------------------------------------
    reg [5:0]  state, next_state;

    reg [7:0]  scl_counter;
    reg [1:0]  scl_phase;
    reg        scl_tick;

    reg        sda_oe, scl_oe;
    wire       sda_in, scl_in;

    reg [7:0]  tx_byte, rx_byte;
    wire [7:0] rx_byte_full;
    reg [2:0]  bit_counter;
    reg [3:0]  byte_counter;
    reg [3:0]  auto_byte_cnt;

    reg [7:0]  temp_msb, temp_lsb;
    reg [7:0]  rh_msb,   rh_lsb;

    reg [24:0] delay_counter;
    reg [24:0] retry_counter;

    reg        auto_configured;
    reg [7:0]  crc_calc;

    reg [7:0]  v_cmd_msb, v_cmd_lsb;
    reg        v_write_en;
    reg [7:0]  v_data_msb, v_data_lsb, v_data_crc;
    reg [3:0]  v_byte_cnt;

    // -----------------------------------------------------------------------
    // IOBUFs  (T=1 => Hi-Z/input, T=0 => drive low)
    // -----------------------------------------------------------------------
    IOBUF #(.DRIVE(12), .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))
    IOBUF_SDA (.O(sda_in), .IO(sda), .I(1'b0), .T(sda_oe));

    IOBUF #(.DRIVE(12), .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))
    IOBUF_SCL (.O(scl_in), .IO(scl), .I(1'b0), .T(scl_oe));

    // rx_byte_full: combinatorial fix so the last bit is captured correctly
    // even though the NBA hasn't committed yet at the same clock edge.
    assign rx_byte_full = (bit_counter == 3'd7) ? {rx_byte[7:1], sda_in}
                                                 : rx_byte;

    // -----------------------------------------------------------------------
    // SCL divider  (generates 4-phase tick)
    // -----------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            scl_counter <= 0; scl_phase <= 0; scl_tick <= 0;
        end else begin
            scl_tick <= 0;
            if (scl_counter >= (SCL_DIVIDER - 1)) begin
                scl_counter <= 0; scl_tick <= 1; scl_phase <= scl_phase + 1;
            end else
                scl_counter <= scl_counter + 1;
        end
    end

    // -----------------------------------------------------------------------
    // CRC-8/NRSC-5  poly=0x31  init=0xFF
    // -----------------------------------------------------------------------
    function [7:0] crc_update;
        input [7:0] crc_in, data_in;
        reg [7:0] c; integer i;
        begin
            c = crc_in ^ data_in;
            for (i = 0; i < 8; i = i + 1)
                c = c[7] ? (c << 1) ^ 8'h31 : (c << 1);
            crc_update = c;
        end
    endfunction

    // -----------------------------------------------------------------------
    // State register
    // -----------------------------------------------------------------------
    generate
        if (USE_ASYNC_RESET) begin
            always @(posedge clk or negedge rst_n)
                if (!rst_n) state <= IDLE; else state <= next_state;
        end else begin
            always @(posedge clk)
                if (!rst_n) state <= IDLE; else state <= next_state;
        end
    endgenerate

    // -----------------------------------------------------------------------
    // Next-state logic
    // -----------------------------------------------------------------------
    always @(*) begin
        next_state = state;
        case (state)

            IDLE: begin
                if (vio_send)
                    next_state = VIO_START;
                else if (MEAS_MODE == 0) begin
                    if (start) next_state = START;
                end else begin
                    if (!auto_configured) next_state = START;
                    else if (start)       next_state = AUTO_READ_START;
                end
            end

            START:
                if (scl_tick && scl_phase == 2'd3) next_state = SEND_BYTE;

            SEND_BYTE:
                if (scl_tick && scl_phase == 2'd3 && bit_counter == 3'd7)
                    next_state = WAIT_ACK;

            WAIT_ACK:
                if (scl_tick && scl_phase == 2'd3) begin
                    if (sda_in == 1'b0) begin
                        case (byte_counter)
                            4'd0: next_state = SEND_BYTE;   // addr_w -> cmd MSB
                            4'd1: next_state = SEND_BYTE;   // cmd MSB -> cmd LSB
                            4'd2: next_state = STOP;        // cmd LSB -> stop
                            // byte_counter==3: addr_r ACK after RESTART (TOD) or
                            //                 after RESTART (auto-mode write phase)
                            4'd3: next_state = READ_BYTE;
                            default: next_state = ERROR;
                        endcase
                    end else
                        next_state = ERROR;
                end

            STOP:
                if (scl_tick && scl_phase == 2'd3) begin
                    if (MEAS_MODE == 1 && !auto_configured)
                        next_state = IDLE;             // auto config sent, done
                    else if (byte_counter <= 4'd3)
                        next_state = WAIT_MEASUREMENT; // TOD write done
                    else
                        next_state = COMPLETE;         // read done
                end

            WAIT_MEASUREMENT:
                if (delay_counter >= MEAS_DELAY_CYCLES) next_state = RESTART;

            RESTART:
                if (scl_tick && scl_phase == 2'd3) next_state = SEND_BYTE;

            READ_BYTE:
                if (scl_tick && scl_phase == 2'd3 && bit_counter == 3'd7) begin
                    // byte_counter pre-increment: last byte is RH_CRC at case 4'd8
                    if (byte_counter == 4'd8) next_state = SEND_MASTER_NACK;
                    else                      next_state = SEND_MASTER_ACK;
                end

            SEND_MASTER_ACK:
                if (scl_tick && scl_phase == 2'd3) next_state = READ_BYTE;

            SEND_MASTER_NACK:
                if (scl_tick && scl_phase == 2'd3) next_state = STOP;

            COMPLETE: next_state = IDLE;
            ERROR:    next_state = IDLE;

            AUTO_READ_START:
                if (scl_tick && scl_phase == 2'd3) next_state = AUTO_READ_CMD;

            AUTO_READ_CMD:
                if (scl_tick && scl_phase == 2'd3 && bit_counter == 3'd7)
                    next_state = AUTO_READ_ACK;

            AUTO_READ_ACK:
                if (scl_tick && scl_phase == 2'd3) begin
                    if (sda_in == 1'b0) begin
                        case (auto_byte_cnt)
                            4'd0: next_state = AUTO_READ_CMD;  // -> cmd MSB
                            4'd1: next_state = AUTO_READ_CMD;  // -> cmd LSB
                            4'd2: next_state = RESTART;        // -> repeated START
                            4'd3: next_state = READ_BYTE;      // -> read data
                            default: next_state = ERROR;
                        endcase
                    end else begin
                        // NACK on addr_r = measurement not ready -> retry
                        if (auto_byte_cnt == 4'd3) next_state = RETRY_WAIT;
                        else                       next_state = ERROR;
                    end
                end

            RETRY_WAIT:
                if (retry_counter >= RETRY_DELAY_CYCLES) next_state = AUTO_READ_START;

            VIO_START:
                if (scl_tick && scl_phase == 2'd3) next_state = VIO_SEND;

            VIO_SEND:
                if (scl_tick && scl_phase == 2'd3 && bit_counter == 3'd7)
                    next_state = VIO_ACK;

            VIO_ACK:
                if (scl_tick && scl_phase == 2'd3) begin
                    if (sda_in == 1'b0) begin
                        if (v_write_en) begin
                            case (v_byte_cnt)
                                4'd0,4'd1,4'd2,4'd3,4'd4: next_state = VIO_SEND;
                                default:                   next_state = VIO_STOP;
                            endcase
                        end else begin
                            case (v_byte_cnt)
                                4'd0,4'd1: next_state = VIO_SEND;
                                default:   next_state = VIO_STOP;
                            endcase
                        end
                    end else
                        next_state = VIO_STOP;
                end

            VIO_STOP:
                if (scl_tick && scl_phase == 2'd3) next_state = VIO_DONE_ST;

            VIO_DONE_ST: next_state = IDLE;

            default: next_state = IDLE;
        endcase
    end

    // -----------------------------------------------------------------------
    // Datapath
    // -----------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sda_oe          <= 1'b1; scl_oe <= 1'b1;
            busy            <= 1'b0; done   <= 1'b0;
            ack_error       <= 1'b0; crc_error <= 1'b0;
            tx_byte         <= 8'h00; rx_byte <= 8'h00;
            bit_counter     <= 3'd0;
            byte_counter    <= 4'd0;
            auto_byte_cnt   <= 4'd0;
            delay_counter   <= 25'd0;
            retry_counter   <= 25'd0;
            temperature_raw <= 16'h0000;
            humidity_raw    <= 16'h0000;
            temp_msb <= 8'h00; temp_lsb <= 8'h00;
            rh_msb   <= 8'h00; rh_lsb   <= 8'h00;
            auto_configured <= 1'b0;
            crc_calc        <= 8'hFF;
            vio_done        <= 1'b0; vio_ack_err <= 1'b0;
            v_cmd_msb <= 8'h00; v_cmd_lsb <= 8'h00;
            v_write_en <= 1'b0;
            v_data_msb <= 8'h00; v_data_lsb <= 8'h00; v_data_crc <= 8'h00;
            v_byte_cnt <= 4'd0;
        end else begin
            done     <= 1'b0;
            vio_done <= 1'b0;

            case (state)

                // -----------------------------------------------------------
                IDLE: begin
                    busy          <= 1'b0;
                    ack_error     <= 1'b0;
                    crc_error     <= 1'b0;
                    sda_oe        <= 1'b1;
                    scl_oe        <= 1'b1;
                    bit_counter   <= 3'd0;
                    byte_counter  <= 4'd0;
                    auto_byte_cnt <= 4'd0;
                    delay_counter <= 25'd0;
                    retry_counter <= 25'd0;
                    crc_calc      <= 8'hFF;
                    if (vio_send) begin
                        v_cmd_msb  <= vio_cmd_msb; v_cmd_lsb  <= vio_cmd_lsb;
                        v_write_en <= vio_write_en;
                        v_data_msb <= vio_data_msb; v_data_lsb <= vio_data_lsb;
                        v_data_crc <= vio_data_crc;
                        v_byte_cnt <= 4'd0;
                        busy <= 1'b1;
                    end else if (MEAS_MODE == 0 && start)
                        busy <= 1'b1;
                    else if (MEAS_MODE == 1 && (!auto_configured || start))
                        busy <= 1'b1;
                end

                // -----------------------------------------------------------
                START: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: begin sda_oe <= 1'b1; scl_oe <= 1'b1; end
                        2'd1: sda_oe <= 1'b0;   // SDA falls while SCL high = START
                        2'd2: scl_oe <= 1'b0;   // SCL falls
                        2'd3: begin
                            bit_counter <= 3'd0;
                            tx_byte     <= {SLAVE_ADDR, 1'b0};  // addr + W
                        end
                    endcase
                end

                // -----------------------------------------------------------
                SEND_BYTE: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= tx_byte[7 - bit_counter]; // setup data
                        2'd1: scl_oe <= 1'b1;  // SCL rises
                        2'd2: ;                // SCL high (slave samples)
                        2'd3: begin
                            scl_oe <= 1'b0;    // SCL falls
                            if (bit_counter == 3'd7) bit_counter <= 3'd0;
                            else bit_counter <= bit_counter + 3'd1;
                        end
                    endcase
                end

                // -----------------------------------------------------------
                WAIT_ACK: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b1;  // release SDA (Hi-Z)
                        2'd1: scl_oe <= 1'b1;  // SCL rises
                        2'd2: if (sda_in) ack_error <= 1'b1; // sample ACK
                        2'd3: begin
                            scl_oe       <= 1'b0;
                            byte_counter <= byte_counter + 4'd1;
                            // Load next TX byte based on which byte just ACK'd
                            case (byte_counter)   // pre-increment value
                                4'd0: begin
                                    if      (MEAS_MODE == 0)   tx_byte <= TOD_CMD_MSB;
                                    else if (!auto_configured) tx_byte <= AUTO_CMD_MSB;
                                    else                       tx_byte <= RD_CMD_MSB;
                                end
                                4'd1: begin
                                    if      (MEAS_MODE == 0)   tx_byte <= TOD_CMD_LSB;
                                    else if (!auto_configured) tx_byte <= AUTO_CMD_LSB;
                                    else                       tx_byte <= RD_CMD_LSB;
                                end
                                4'd2: begin
                                    if (MEAS_MODE == 1 && !auto_configured)
                                        auto_configured <= 1'b1;
                                end
                                default: ;
                            endcase
                        end
                    endcase
                end

                // -----------------------------------------------------------
                STOP: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b0;  // SDA low
                        2'd1: scl_oe <= 1'b1;  // SCL rises
                        2'd2: sda_oe <= 1'b1;  // SDA rises while SCL high = STOP
                        2'd3: ;
                    endcase
                end

                // -----------------------------------------------------------
                WAIT_MEASUREMENT:
                    delay_counter <= delay_counter + 25'd1;

                // -----------------------------------------------------------
                // RESTART (repeated START)
                // byte_counter stays at 3 (its value after the 3-byte write
                // phase) so that WAIT_ACK's "4'd3 -> READ_BYTE" branch fires
                // correctly after the addr_r byte is ACK'd.
                // READ_BYTE then increments to 4 on the first captured byte.
                // -----------------------------------------------------------
                RESTART: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: begin sda_oe <= 1'b1; scl_oe <= 1'b1; end
                        2'd1: sda_oe <= 1'b0;   // SDA falls while SCL high
                        2'd2: scl_oe <= 1'b0;   // SCL falls
                        2'd3: begin
                            bit_counter  <= 3'd0;
                            // *** THE FIX: was 4'd4, must be 4'd3 ***
                            // If set to 4, WAIT_ACK has no matching case
                            // and falls through to ERROR. At 3 it correctly
                            // transitions to READ_BYTE after addr_r ACK.
                            byte_counter <= 4'd3;
                            crc_calc     <= 8'hFF;  // fresh CRC for temp word
                            tx_byte      <= {SLAVE_ADDR, 1'b1};  // addr + R
                        end
                    endcase
                end

                // -----------------------------------------------------------
                // READ_BYTE
                // byte_counter at phase-3 (pre-increment):
                //   3 -> 4: T_MSB
                //   4 -> 5: T_LSB
                //   5 -> 6: T_CRC
                //   6 -> 7: RH_MSB
                //   7 -> 8: RH_LSB
                //   8 -> 9: RH_CRC  (then -> SEND_MASTER_NACK)
                // -----------------------------------------------------------
                READ_BYTE: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b1;  // release SDA (Hi-Z for reading)
                        2'd1: scl_oe <= 1'b1;  // SCL rises
                        2'd2: rx_byte[7 - bit_counter] <= sda_in;  // sample
                        2'd3: begin
                            scl_oe <= 1'b0;
                            if (bit_counter == 3'd7) begin
                                bit_counter  <= 3'd0;
                                byte_counter <= byte_counter + 4'd1;
                                case (byte_counter)   // pre-increment
                                    4'd3: begin   // T_MSB  (byte_counter was 3, now 4)
                                        temp_msb <= rx_byte_full;
                                        crc_calc <= crc_update(8'hFF, rx_byte_full);
                                    end
                                    4'd4: begin   // T_LSB
                                        temp_lsb <= rx_byte_full;
                                        crc_calc <= crc_update(crc_calc, rx_byte_full);
                                    end
                                    4'd5: begin   // T_CRC - verify
                                        if (crc_calc != rx_byte_full) crc_error <= 1'b1;
                                        crc_calc <= 8'hFF;  // reset for RH word
                                    end
                                    4'd6: begin   // RH_MSB
                                        rh_msb   <= rx_byte_full;
                                        crc_calc <= crc_update(8'hFF, rx_byte_full);
                                    end
                                    4'd7: begin   // RH_LSB
                                        rh_lsb   <= rx_byte_full;
                                        crc_calc <= crc_update(crc_calc, rx_byte_full);
                                    end
                                    4'd8: begin   // RH_CRC - verify
                                        if (crc_calc != rx_byte_full) crc_error <= 1'b1;
                                    end
                                    default: ;
                                endcase
                            end else
                                bit_counter <= bit_counter + 3'd1;
                        end
                    endcase
                end

                // -----------------------------------------------------------
                SEND_MASTER_ACK: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b0;  // drive SDA low = ACK
                        2'd1: scl_oe <= 1'b1;
                        2'd2: ;
                        2'd3: scl_oe <= 1'b0;
                    endcase
                end

                SEND_MASTER_NACK: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b1;  // release SDA = NACK
                        2'd1: scl_oe <= 1'b1;
                        2'd2: ;
                        2'd3: scl_oe <= 1'b0;
                    endcase
                end

                // -----------------------------------------------------------
                COMPLETE: begin
                    busy            <= 1'b0;
                    done            <= 1'b1;
                    temperature_raw <= {temp_msb, temp_lsb};
                    humidity_raw    <= {rh_msb,   rh_lsb};
                end

                ERROR: begin
                    busy      <= 1'b0;
                    done      <= 1'b1;
                    ack_error <= 1'b1;
                end

                // -----------------------------------------------------------
                // Auto-mode read sub-transaction (0xE000 write then Sr + read)
                // -----------------------------------------------------------
                AUTO_READ_START: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: begin sda_oe <= 1'b1; scl_oe <= 1'b1; end
                        2'd1: sda_oe <= 1'b0;
                        2'd2: scl_oe <= 1'b0;
                        2'd3: begin
                            bit_counter   <= 3'd0;
                            auto_byte_cnt <= 4'd0;
                            // Also reset byte_counter so RESTART/WAIT_ACK path is clean
                            byte_counter  <= 4'd0;
                            tx_byte       <= {SLAVE_ADDR, 1'b0};
                        end
                    endcase
                end

                AUTO_READ_CMD: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= tx_byte[7 - bit_counter];
                        2'd1: scl_oe <= 1'b1;
                        2'd2: ;
                        2'd3: begin
                            scl_oe <= 1'b0;
                            if (bit_counter == 3'd7) bit_counter <= 3'd0;
                            else bit_counter <= bit_counter + 3'd1;
                        end
                    endcase
                end

                AUTO_READ_ACK: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b1;
                        2'd1: scl_oe <= 1'b1;
                        2'd2: ;
                        2'd3: begin
                            scl_oe        <= 1'b0;
                            auto_byte_cnt <= auto_byte_cnt + 4'd1;
                            case (auto_byte_cnt)  // pre-increment
                                4'd0: tx_byte <= RD_CMD_MSB;
                                4'd1: tx_byte <= RD_CMD_LSB;
                                // auto_byte_cnt==2 -> RESTART (primes byte_counter=3)
                                // auto_byte_cnt==3 -> READ_BYTE via AUTO_READ_ACK next-state
                                default: ;
                            endcase
                            // Prime byte_counter for the RESTART -> WAIT_ACK -> READ_BYTE
                            // path: when auto_byte_cnt==2 we are about to do RESTART,
                            // RESTART will set byte_counter=3, so addr_r ACK in WAIT_ACK
                            // sees 3 -> READ_BYTE. Nothing extra needed here.
                        end
                    endcase
                end

                RETRY_WAIT: begin
                    sda_oe        <= 1'b1;
                    scl_oe        <= 1'b1;
                    retry_counter <= retry_counter + 25'd1;
                    if (retry_counter >= RETRY_DELAY_CYCLES)
                        retry_counter <= 25'd0;
                end

                // -----------------------------------------------------------
                // VIO transaction
                // -----------------------------------------------------------
                VIO_START: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: begin sda_oe <= 1'b1; scl_oe <= 1'b1; end
                        2'd1: sda_oe <= 1'b0;
                        2'd2: scl_oe <= 1'b0;
                        2'd3: begin
                            bit_counter <= 3'd0;
                            v_byte_cnt  <= 4'd0;
                            tx_byte     <= {SLAVE_ADDR, 1'b0};
                        end
                    endcase
                end

                VIO_SEND: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= tx_byte[7 - bit_counter];
                        2'd1: scl_oe <= 1'b1;
                        2'd2: ;
                        2'd3: begin
                            scl_oe <= 1'b0;
                            if (bit_counter == 3'd7) bit_counter <= 3'd0;
                            else bit_counter <= bit_counter + 3'd1;
                        end
                    endcase
                end

                VIO_ACK: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b1;
                        2'd1: scl_oe <= 1'b1;
                        2'd2: if (sda_in) vio_ack_err <= 1'b1;
                        2'd3: begin
                            scl_oe     <= 1'b0;
                            v_byte_cnt <= v_byte_cnt + 4'd1;
                            case (v_byte_cnt)  // pre-increment
                                4'd0: tx_byte <= v_cmd_msb;
                                4'd1: tx_byte <= v_cmd_lsb;
                                4'd2: tx_byte <= v_data_msb;
                                4'd3: tx_byte <= v_data_lsb;
                                4'd4: tx_byte <= v_data_crc;
                                default: ;
                            endcase
                        end
                    endcase
                end

                VIO_STOP: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b0;
                        2'd1: scl_oe <= 1'b1;
                        2'd2: sda_oe <= 1'b1;
                        2'd3: ;
                    endcase
                end

                VIO_DONE_ST: begin
                    busy     <= 1'b0;
                    vio_done <= 1'b1;
                    // Clear auto_configured on reset/exit-auto commands
                    if ((v_cmd_msb == 8'h30 && v_cmd_lsb == 8'hA2) ||  // soft reset
                        (v_cmd_msb == 8'h30 && v_cmd_lsb == 8'h93) ||  // exit auto mode
                        (v_cmd_msb == 8'h00 && v_cmd_lsb == 8'h06))    // general call reset
                        auto_configured <= 1'b0;
                end

            endcase
        end
    end

    assign state_debug = state;

endmodule