// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Tue Feb 17 16:54:50 2026
// Host        : LAPTOP-9FF0L5N1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_hdc302x_i2c_master_0_0_stub.v
// Design      : design_1_hdc302x_i2c_master_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7cg-ffvc1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "hdc302x_i2c_master,Vivado 2022.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, rst_n, start, sda, scl, busy, done, ack_error, 
  temperature_raw, humidity_raw, state_debug)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_n,start,sda,scl,busy,done,ack_error,temperature_raw[15:0],humidity_raw[15:0],state_debug[4:0]" */;
  input clk;
  input rst_n;
  input start;
  inout sda;
  inout scl;
  output busy;
  output done;
  output ack_error;
  output [15:0]temperature_raw;
  output [15:0]humidity_raw;
  output [4:0]state_debug;
endmodule
