//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Tue Feb 17 16:52:58 2026
//Host        : LAPTOP-9FF0L5N1 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk_0,
    scl_0,
    sda_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN design_1_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_0;
  inout scl_0;
  inout sda_0;

  wire Net;
  wire Net1;
  wire clk_0_1;
  wire hdc302x_i2c_master_0_ack_error;
  wire hdc302x_i2c_master_0_busy;
  wire hdc302x_i2c_master_0_done;
  wire [15:0]hdc302x_i2c_master_0_humidity_raw;
  wire [4:0]hdc302x_i2c_master_0_state_debug;
  wire [15:0]hdc302x_i2c_master_0_temperature_raw;
  wire [0:0]vio_0_probe_out0;
  wire [0:0]vio_0_probe_out1;

  assign clk_0_1 = clk_0;
  design_1_hdc302x_i2c_master_0_0 hdc302x_i2c_master_0
       (.ack_error(hdc302x_i2c_master_0_ack_error),
        .busy(hdc302x_i2c_master_0_busy),
        .clk(clk_0_1),
        .done(hdc302x_i2c_master_0_done),
        .humidity_raw(hdc302x_i2c_master_0_humidity_raw),
        .rst_n(vio_0_probe_out0),
        .scl(scl_0),
        .sda(sda_0),
        .start(vio_0_probe_out1),
        .state_debug(hdc302x_i2c_master_0_state_debug),
        .temperature_raw(hdc302x_i2c_master_0_temperature_raw));
  design_1_ila_0_0 ila_0
       (.clk(clk_0_1),
        .probe0(hdc302x_i2c_master_0_busy),
        .probe1(hdc302x_i2c_master_0_state_debug),
        .probe2(vio_0_probe_out0),
        .probe3(vio_0_probe_out1),
        .probe4(hdc302x_i2c_master_0_ack_error));
  design_1_vio_0_0 vio_0
       (.clk(clk_0_1),
        .probe_in0(hdc302x_i2c_master_0_busy),
        .probe_in1(hdc302x_i2c_master_0_done),
        .probe_in2(hdc302x_i2c_master_0_ack_error),
        .probe_in3(hdc302x_i2c_master_0_temperature_raw),
        .probe_in4(hdc302x_i2c_master_0_humidity_raw),
        .probe_in5(hdc302x_i2c_master_0_state_debug),
        .probe_out0(vio_0_probe_out0),
        .probe_out1(vio_0_probe_out1));
endmodule
