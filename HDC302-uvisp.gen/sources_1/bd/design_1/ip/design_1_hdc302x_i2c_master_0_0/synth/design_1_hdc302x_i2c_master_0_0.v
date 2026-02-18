// (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:hdc302x_i2c_master:1.0
// IP Revision: 1

(* X_CORE_INFO = "hdc302x_i2c_master,Vivado 2022.1" *)
(* CHECK_LICENSE_TYPE = "design_1_hdc302x_i2c_master_0_0,hdc302x_i2c_master,{}" *)
(* CORE_GENERATION_INFO = "design_1_hdc302x_i2c_master_0_0,hdc302x_i2c_master,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=hdc302x_i2c_master,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,CLK_FREQ=50000000,I2C_FREQ=400000,SLAVE_ADDR=1000100,USE_ASYNC_RESET=0}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_hdc302x_i2c_master_0_0 (
  clk,
  rst_n,
  start,
  sda,
  scl,
  busy,
  done,
  ack_error,
  temperature_raw,
  humidity_raw,
  state_debug
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
input wire start;
inout wire sda;
inout wire scl;
output wire busy;
output wire done;
output wire ack_error;
output wire [15 : 0] temperature_raw;
output wire [15 : 0] humidity_raw;
output wire [4 : 0] state_debug;

  hdc302x_i2c_master #(
    .CLK_FREQ(50000000),
    .I2C_FREQ(400000),
    .SLAVE_ADDR(7'B1000100),
    .USE_ASYNC_RESET(0)
  ) inst (
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
endmodule
