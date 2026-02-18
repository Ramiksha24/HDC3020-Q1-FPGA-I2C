//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Tue Feb 17 16:52:58 2026
//Host        : LAPTOP-9FF0L5N1 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk_0,
    scl_0,
    sda_0);
  input clk_0;
  inout scl_0;
  inout sda_0;

  wire clk_0;
  wire scl_0;
  wire sda_0;

  design_1 design_1_i
       (.clk_0(clk_0),
        .scl_0(scl_0),
        .sda_0(sda_0));
endmodule
