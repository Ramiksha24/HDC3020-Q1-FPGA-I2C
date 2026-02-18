`timescale 1ns / 1ps

module hdc302x_i2c_master #(
    parameter CLK_FREQ        = 50_000_000,
    parameter I2C_FREQ        = 400_000,
    parameter SLAVE_ADDR      = 7'h44,
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
    output reg  [15:0] temperature_raw,
    output reg  [15:0] humidity_raw,
    output wire [4:0]  state_debug
);

    // SCL_DIVIDER: quarter-period counter (4 phases per SCL cycle)
    localparam integer SCL_DIVIDER       = CLK_FREQ / (I2C_FREQ * 4);
    // 15 ms measurement wait (Low Power Mode 0 worst-case = 14.1 ms)
    localparam integer MEAS_DELAY_CYCLES = (CLK_FREQ / 1000) * 15;

    localparam [4:0]
        IDLE             = 5'd0,
        START            = 5'd1,
        SEND_BYTE        = 5'd2,
        WAIT_ACK         = 5'd3,
        STOP             = 5'd4,
        WAIT_MEASUREMENT = 5'd5,
        RESTART          = 5'd6,
        READ_BYTE        = 5'd7,
        SEND_MASTER_ACK  = 5'd8,
        SEND_MASTER_NACK = 5'd9,
        COMPLETE         = 5'd10,
        ERROR            = 5'd11;

    reg [4:0]  state, next_state;
    reg [24:0] delay_counter;
    reg [7:0]  scl_counter;
    reg [1:0]  scl_phase;
    reg        scl_tick;
    reg [7:0]  tx_byte;
    reg [7:0]  rx_byte;
    reg [2:0]  bit_counter;
    reg [3:0]  byte_counter;   // must reach 10; 4 bits sufficient
    reg        sda_oe;
    reg        scl_oe;
    wire       sda_in;
    wire       scl_in;
    reg [7:0]  temp_msb, temp_lsb, temp_crc;
    reg [7:0]  rh_msb,   rh_lsb,   rh_crc;

    // -----------------------------------------------------------------------
    // IOBUFs  (open-drain emulation)
    //   T = 1 ? tristate ? pin pulled HIGH by external resistor  (I2C "1")
    //   T = 0 ? drive I=0 ? pin LOW                              (I2C "0")
    // -----------------------------------------------------------------------
    IOBUF #(.DRIVE(12), .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))
    IOBUF_SDA (.O(sda_in), .IO(sda), .I(1'b0), .T(sda_oe));

    IOBUF #(.DRIVE(12), .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("DEFAULT"), .SLEW("SLOW"))
    IOBUF_SCL (.O(scl_in), .IO(scl), .I(1'b0), .T(scl_oe));

    // -----------------------------------------------------------------------
    // SCL clock divider - free-running, generates scl_tick every quarter period
    // -----------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            scl_counter <= 0;
            scl_phase   <= 0;
            scl_tick    <= 0;
        end else begin
            scl_tick <= 0;
            if (scl_counter >= (SCL_DIVIDER - 1)) begin
                scl_counter <= 0;
                scl_tick    <= 1;
                scl_phase   <= scl_phase + 1;
            end else begin
                scl_counter <= scl_counter + 1;
            end
        end
    end

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
    // Next-state logic  (combinational; reads registered byte_counter)
    //
    // byte_counter values at key decision points:
    //   Write phase  (incremented in WAIT_ACK phase 3):
    //     0 pre-inc ? addr_w ACKed  ? send 0x24
    //     1 pre-inc ? 0x24 ACKed   ? send 0x00
    //     2 pre-inc ? 0x00 ACKed   ? STOP ? WAIT_MEASUREMENT
    //   Read phase (incremented in READ_BYTE phase 3 on last bit):
    //     3 pre-inc ? addr_r ACKed ? READ_BYTE
    //     4..8      ? bytes 0..4 done ? SEND_MASTER_ACK
    //     9         ? rh_crc done    ? SEND_MASTER_NACK
    // -----------------------------------------------------------------------
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:
                if (start) next_state = START;

            START:
                if (scl_tick && scl_phase == 2'd3)
                    next_state = SEND_BYTE;

            SEND_BYTE:
                if (scl_tick && scl_phase == 2'd3 && bit_counter == 3'd7)
                    next_state = WAIT_ACK;

            WAIT_ACK:
                if (scl_tick && scl_phase == 2'd3) begin
                    if (sda_in == 1'b0) begin
                        case (byte_counter)
                            4'd0:    next_state = SEND_BYTE; // addr_w acked ? send cmd MSB
                            4'd1:    next_state = SEND_BYTE; // cmd MSB acked ? send cmd LSB
                            4'd2:    next_state = STOP;      // cmd LSB acked ? stop+wait
                            4'd3:    next_state = READ_BYTE; // addr_r acked ? read data
                            default: next_state = ERROR;
                        endcase
                    end else begin
                        next_state = ERROR;                  // NACK
                    end
                end

            STOP:
                if (scl_tick && scl_phase == 2'd3) begin
                    if (byte_counter == 4'd3)
                        next_state = WAIT_MEASUREMENT;       // after write phase
                    else
                        next_state = COMPLETE;               // after read phase
                end

            WAIT_MEASUREMENT:
                if (delay_counter >= MEAS_DELAY_CYCLES)
                    next_state = RESTART;

            RESTART:
                if (scl_tick && scl_phase == 2'd3)
                    next_state = SEND_BYTE;

            READ_BYTE:
                if (scl_tick && scl_phase == 2'd3 && bit_counter == 3'd7) begin
                    if (byte_counter == 4'd9)
                        next_state = SEND_MASTER_NACK;       // last byte = rh_crc
                    else
                        next_state = SEND_MASTER_ACK;
                end

            SEND_MASTER_ACK:
                if (scl_tick && scl_phase == 2'd3)
                    next_state = READ_BYTE;

            SEND_MASTER_NACK:
                if (scl_tick && scl_phase == 2'd3)
                    next_state = STOP;

            COMPLETE: next_state = IDLE;
            ERROR:    next_state = IDLE;
            default:  next_state = IDLE;
        endcase
    end

    // -----------------------------------------------------------------------
    // Output / datapath logic
    // -----------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sda_oe          <= 1'b1;   // tristate = HIGH (idle)
            scl_oe          <= 1'b1;   // tristate = HIGH (idle)
            busy            <= 1'b0;
            done            <= 1'b0;
            ack_error       <= 1'b0;
            tx_byte         <= 8'h00;
            rx_byte         <= 8'h00;
            bit_counter     <= 3'd0;
            byte_counter    <= 4'd0;
            delay_counter   <= 25'd0;
            temperature_raw <= 16'h0000;
            humidity_raw    <= 16'h0000;
            temp_msb <= 8'h00; temp_lsb <= 8'h00; temp_crc <= 8'h00;
            rh_msb   <= 8'h00; rh_lsb   <= 8'h00; rh_crc   <= 8'h00;
        end else begin
            done <= 1'b0;   // pulse; overridden in COMPLETE / ERROR

            case (state)

                // ----------------------------------------------------------
                IDLE: begin
                    busy          <= 1'b0;
                    ack_error     <= 1'b0;
                    sda_oe        <= 1'b1;
                    scl_oe        <= 1'b1;
                    bit_counter   <= 3'd0;
                    byte_counter  <= 4'd0;
                    delay_counter <= 25'd0;
                    if (start) busy <= 1'b1;
                end

                // ----------------------------------------------------------
                // START condition: SDA falls while SCL high
                // ----------------------------------------------------------
                START: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: begin sda_oe <= 1'b1; scl_oe <= 1'b1; end  // both released = HIGH
                        2'd1: begin sda_oe <= 1'b0; end                   // SDA low while SCL high
                        2'd2: begin scl_oe <= 1'b0; end                   // SCL low
                        2'd3: begin
                            bit_counter <= 3'd0;
                            tx_byte     <= {SLAVE_ADDR, 1'b0};            // write address
                        end
                    endcase
                end

                // ----------------------------------------------------------
                // SEND_BYTE: 8 bits, MSB first, open-drain
                //
                // FIX: sda_oe <= tx_byte[7-bit_counter]
                //      (NOT ~tx_byte[...])
                //   bit=1 ? sda_oe=1 ? T=1 ? tristate ? SDA HIGH  (I2C "1") ?
                //   bit=0 ? sda_oe=0 ? T=0 ? drive LOW ? SDA LOW  (I2C "0") ?
                // ----------------------------------------------------------
                SEND_BYTE: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= tx_byte[7 - bit_counter];  // ? FIX (was ~tx_byte[...])
                        2'd1: scl_oe <= 1'b1;                       // SCL high (released)
                        2'd2: ;                                      // hold
                        2'd3: begin
                            scl_oe <= 1'b0;
                            if (bit_counter == 3'd7)
                                bit_counter <= 3'd0;
                            else
                                bit_counter <= bit_counter + 3'd1;
                        end
                    endcase
                end

                // ----------------------------------------------------------
                // WAIT_ACK: release SDA, clock in ACK bit, prep next tx byte
                // ----------------------------------------------------------
                WAIT_ACK: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b1;                       // release SDA
                        2'd1: scl_oe <= 1'b1;                       // SCL high
                        2'd2: if (sda_in) ack_error <= 1'b1;        // sample: HIGH = NACK
                        2'd3: begin
                            scl_oe       <= 1'b0;
                            byte_counter <= byte_counter + 4'd1;
                            case (byte_counter)            // pre-increment value
                                4'd0: tx_byte <= 8'h24;   // command MSB
                                4'd1: tx_byte <= 8'h00;   // command LSB (LP Mode 0)
                                default: ;
                            endcase
                        end
                    endcase
                end

                // ----------------------------------------------------------
                // STOP condition: SDA rises while SCL high
                // ----------------------------------------------------------
                STOP: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b0;   // SDA low
                        2'd1: scl_oe <= 1'b1;   // SCL high
                        2'd2: sda_oe <= 1'b1;   // SDA high = STOP
                        2'd3: ;
                    endcase
                end

                // ----------------------------------------------------------
                // WAIT_MEASUREMENT: 15 ms counter
                // ----------------------------------------------------------
                WAIT_MEASUREMENT:
                    delay_counter <= delay_counter + 25'd1;

                // ----------------------------------------------------------
                // RESTART (repeated START) for the read phase
                // ----------------------------------------------------------
                RESTART: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: begin sda_oe <= 1'b1; scl_oe <= 1'b1; end
                        2'd1: sda_oe <= 1'b0;                        // SDA low = START
                        2'd2: scl_oe <= 1'b0;                        // SCL low
                        2'd3: begin
                            bit_counter <= 3'd0;
                            tx_byte     <= {SLAVE_ADDR, 1'b1};       // read address
                        end
                    endcase
                end

                // ----------------------------------------------------------
                // READ_BYTE: receive 8 bits MSB first
                //   byte_counter incremented on last bit so next-state and
                //   store-decode both see the pre-increment value.
                //
                //   byte_counter ? stored register:
                //     4 ? temp_msb,  5 ? temp_lsb,  6 ? temp_crc
                //     7 ? rh_msb,    8 ? rh_lsb,    9 ? rh_crc
                // ----------------------------------------------------------
                READ_BYTE: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b1;                           // release SDA
                        2'd1: scl_oe <= 1'b1;                           // SCL high
                        2'd2: rx_byte[7 - bit_counter] <= sda_in;       // sample
                        2'd3: begin
                            scl_oe <= 1'b0;
                            if (bit_counter == 3'd7) begin
                                bit_counter  <= 3'd0;
                                byte_counter <= byte_counter + 4'd1;    // increment here
                                case (byte_counter)    // pre-increment value
                                    4'd4: temp_msb <= rx_byte;
                                    4'd5: temp_lsb <= rx_byte;
                                    4'd6: temp_crc <= rx_byte;
                                    4'd7: rh_msb   <= rx_byte;
                                    4'd8: rh_lsb   <= rx_byte;
                                    4'd9: rh_crc   <= rx_byte;
                                    default: ;
                                endcase
                            end else begin
                                bit_counter <= bit_counter + 3'd1;
                            end
                        end
                    endcase
                end

                // ----------------------------------------------------------
                // SEND_MASTER_ACK: drive SDA low for one bit period
                // ----------------------------------------------------------
                SEND_MASTER_ACK: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b0;   // ACK (drive LOW)
                        2'd1: scl_oe <= 1'b1;
                        2'd2: ;
                        2'd3: scl_oe <= 1'b0;
                    endcase
                end

                // ----------------------------------------------------------
                // SEND_MASTER_NACK: release SDA (HIGH) after last byte
                // ----------------------------------------------------------
                SEND_MASTER_NACK: begin
                    if (scl_tick) case (scl_phase)
                        2'd0: sda_oe <= 1'b1;   // NACK (release = HIGH)
                        2'd1: scl_oe <= 1'b1;
                        2'd2: ;
                        2'd3: scl_oe <= 1'b0;
                    endcase
                end

                // ----------------------------------------------------------
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

            endcase
        end
    end

    assign state_debug = state;

endmodule