////////////////////////////////////////////////////////////////////////////////
// Testbench: hdc302x_tb
// Description: Simple testbench to monitor I2C master behavior
//              Does NOT simulate slave - just observes master signals
//              Add pullups to SDA/SCL to see proper idle state
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module hdc302x_tb;

    //==========================================================================
    // Testbench Parameters
    //==========================================================================
    parameter CLK_PERIOD = 20;  // 50 MHz = 20ns period
    
    //==========================================================================
    // Signals
    //==========================================================================
    reg         clk;
    reg         rst_n;
    reg         start;
    
    wire        sda;
    wire        scl;
    
    wire        busy;
    wire        done;
    wire        ack_error;
    wire [15:0] temperature_raw;
    wire [15:0] humidity_raw;
    wire [4:0]  state_debug;
    
    // Pull-up resistors (simulate external pull-ups)
    wire        sda_pullup;
    wire        scl_pullup;
    
    assign (weak1, weak0) sda = 1'b1;  // Weak pull-up
    assign (weak1, weak0) scl = 1'b1;  // Weak pull-up
    
    //==========================================================================
    // DUT Instantiation
    //==========================================================================
    hdc302x_i2c_master #(
        .CLK_FREQ(50_000_000),
        .I2C_FREQ(400_000),
        .SLAVE_ADDR(7'h44),
        .USE_ASYNC_RESET(0)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .sda(sda),
        .scl(scl),
        .busy(busy),
        .done(done),
        .ack_error(ack_error),
        .temperature_raw(temperature_raw),
        .humidity_raw(humidity_raw),
        .state_debug(state_debug)
    );
    
    //==========================================================================
    // Clock Generation
    //==========================================================================
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    //==========================================================================
    // State Name for Debugging
    //==========================================================================
    reg [127:0] state_name;
    
    always @(*) begin
        case (state_debug)
            5'd0:  state_name = "IDLE";
            5'd1:  state_name = "START";
            5'd2:  state_name = "SEND_BYTE";
            5'd3:  state_name = "WAIT_ACK";
            5'd4:  state_name = "STOP";
            5'd5:  state_name = "WAIT_MEAS";
            5'd6:  state_name = "RESTART";
            5'd7:  state_name = "READ_BYTE";
            5'd8:  state_name = "SEND_M_ACK";
            5'd9:  state_name = "SEND_M_NACK";
            5'd10: state_name = "COMPLETE";
            5'd11: state_name = "ERROR";
            default: state_name = "UNKNOWN";
        endcase
    end
    
    //==========================================================================
    // I2C Bus Monitor
    //==========================================================================
    reg [7:0] captured_byte;
    reg [2:0] bit_count;
    reg       prev_scl;
    reg       prev_sda;
    
    // Detect START condition
    always @(posedge clk) begin
        prev_scl <= scl;
        prev_sda <= sda;
        
        // START: SDA falls while SCL is high
        if (prev_scl && scl && prev_sda && !sda) begin
            $display("[%0t] I2C START detected", $time);
            bit_count = 0;
            captured_byte = 8'h00;
        end
        
        // STOP: SDA rises while SCL is high
        if (prev_scl && scl && !prev_sda && sda) begin
            $display("[%0t] I2C STOP detected", $time);
        end
        
        // Data sampling on SCL rising edge
        if (!prev_scl && scl) begin
            if (bit_count < 8) begin
                captured_byte[7 - bit_count] = sda;
                bit_count = bit_count + 1;
                if (bit_count == 8) begin
                    $display("[%0t] I2C Byte captured: 0x%02h", $time, captured_byte);
                end
            end else if (bit_count == 8) begin
                $display("[%0t] I2C ACK/NACK: %b", $time, sda);
                bit_count = 0;
                captured_byte = 8'h00;
            end
        end
    end
    
    //==========================================================================
    // Status Monitor
    //==========================================================================
    always @(posedge clk) begin
        if (done) begin
            if (ack_error) begin
                $display("[%0t] === TRANSACTION COMPLETE WITH ERROR ===", $time);
                $display("[%0t] ACK Error detected!", $time);
            end else begin
                $display("[%0t] === TRANSACTION COMPLETE SUCCESSFULLY ===", $time);
                $display("[%0t] Temperature Raw: 0x%04h (%0d)", $time, temperature_raw, temperature_raw);
                $display("[%0t] Humidity Raw:    0x%04h (%0d)", $time, humidity_raw, humidity_raw);
            end
        end
    end
    
    // State transition monitor
    reg [4:0] prev_state;
    always @(posedge clk) begin
        prev_state <= state_debug;
        if (state_debug != prev_state) begin
            $display("[%0t] State: %0s", $time, state_name);
        end
    end
    
    //==========================================================================
    // Test Stimulus
    //==========================================================================
    initial begin
        // Initialize
        rst_n = 0;
        start = 0;
        
        $display("================================================================================");
        $display("HDC302x I2C Master Testbench");
        $display("Monitor only - no slave simulation");
        $display("================================================================================");
        $display("[%0t] Testbench started", $time);
        
        // Reset pulse
        #(CLK_PERIOD * 10);
        rst_n = 1;
        $display("[%0t] Reset released", $time);
        
        // Wait for stable state
        #(CLK_PERIOD * 5);
        
        // Start transaction
        $display("[%0t] Starting I2C transaction...", $time);
        start = 1;
        #(CLK_PERIOD);
        start = 0;
        
        // Wait for transaction to complete
        // Note: Without a slave, the master will timeout or error on ACK
        wait(done);
        #(CLK_PERIOD * 10);
        
        // Try another transaction
        $display("\n[%0t] Starting second transaction...", $time);
        start = 1;
        #(CLK_PERIOD);
        start = 0;
        
        wait(done);
        #(CLK_PERIOD * 10);
        
        $display("\n[%0t] Testbench completed", $time);
        $display("================================================================================");
        $display("NOTE: ACK errors are EXPECTED since there is no slave device simulated");
        $display("      This testbench only monitors the master's signal generation");
        $display("      To see full protocol, add a slave model or use a VCD waveform viewer");
        $display("================================================================================");
        
        $finish;
    end
    
    //==========================================================================
    // Waveform Dump
    //==========================================================================
    initial begin
        $dumpfile("hdc302x_tb.vcd");
        $dumpvars(0, hdc302x_tb);
    end
    
    //==========================================================================
    // Timeout Watchdog
    //==========================================================================
    initial begin
        #50_000_000;  // 50ms timeout
        $display("\n[%0t] ERROR: Simulation timeout!", $time);
        $finish;
    end

endmodule