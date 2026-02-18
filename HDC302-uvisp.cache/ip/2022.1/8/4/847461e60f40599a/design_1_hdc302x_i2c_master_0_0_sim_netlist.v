// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Feb 12 16:50:21 2026
// Host        : LAPTOP-9FF0L5N1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_hdc302x_i2c_master_0_0_sim_netlist.v
// Design      : design_1_hdc302x_i2c_master_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu7cg-ffvc1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_hdc302x_i2c_master_0_0,hdc302x_i2c_master,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "hdc302x_i2c_master,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    rst_n,
    start,
    sda,
    scl,
    busy,
    done,
    ack_error,
    temperature_raw,
    humidity_raw,
    state_debug);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input start;
  inout sda;
  inout scl;
  output busy;
  output done;
  output ack_error;
  output [15:0]temperature_raw;
  output [15:0]humidity_raw;
  output [4:0]state_debug;

  wire \<const0> ;
  wire ack_error;
  wire busy;
  wire clk;
  wire done;
  wire [15:0]humidity_raw;
  wire rst_n;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire scl;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire sda;
  wire start;
  wire [3:0]\^state_debug ;
  wire [15:0]temperature_raw;

  assign state_debug[4] = \<const0> ;
  assign state_debug[3:0] = \^state_debug [3:0];
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hdc302x_i2c_master inst
       (.ack_error(ack_error),
        .busy(busy),
        .clk(clk),
        .done(done),
        .humidity_raw(humidity_raw),
        .rst_n(rst_n),
        .scl(scl),
        .sda(sda),
        .start(start),
        .state_debug(\^state_debug ),
        .temperature_raw(temperature_raw));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hdc302x_i2c_master
   (state_debug,
    done,
    temperature_raw,
    humidity_raw,
    busy,
    ack_error,
    sda,
    scl,
    clk,
    start,
    rst_n);
  output [3:0]state_debug;
  output done;
  output [15:0]temperature_raw;
  output [15:0]humidity_raw;
  output busy;
  output ack_error;
  inout sda;
  inout scl;
  input clk;
  input start;
  input rst_n;

  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[3]_i_10_n_0 ;
  wire \FSM_sequential_state[3]_i_11_n_0 ;
  wire \FSM_sequential_state[3]_i_12_n_0 ;
  wire \FSM_sequential_state[3]_i_13_n_0 ;
  wire \FSM_sequential_state[3]_i_14_n_0 ;
  wire \FSM_sequential_state[3]_i_15_n_0 ;
  wire \FSM_sequential_state[3]_i_16_n_0 ;
  wire \FSM_sequential_state[3]_i_17_n_0 ;
  wire \FSM_sequential_state[3]_i_18_n_0 ;
  wire \FSM_sequential_state[3]_i_1_n_0 ;
  wire \FSM_sequential_state[3]_i_3_n_0 ;
  wire \FSM_sequential_state[3]_i_4_n_0 ;
  wire \FSM_sequential_state[3]_i_5_n_0 ;
  wire \FSM_sequential_state[3]_i_6_n_0 ;
  wire \FSM_sequential_state[3]_i_7_n_0 ;
  wire \FSM_sequential_state[3]_i_8_n_0 ;
  wire \FSM_sequential_state[3]_i_9_n_0 ;
  wire ack_error;
  wire ack_error_i_1_n_0;
  wire ack_error_i_2_n_0;
  wire ack_error_i_3_n_0;
  wire ack_error_i_4_n_0;
  wire ack_error_i_5_n_0;
  wire [2:0]bit_counter;
  wire \bit_counter[2]_i_1_n_0 ;
  wire \bit_counter[2]_i_3_n_0 ;
  wire \bit_counter_reg_n_0_[0] ;
  wire \bit_counter_reg_n_0_[1] ;
  wire \bit_counter_reg_n_0_[2] ;
  wire busy;
  wire busy_i_1_n_0;
  wire busy_i_2_n_0;
  wire [2:0]byte_counter;
  wire \byte_counter[2]_i_1_n_0 ;
  wire \byte_counter_reg_n_0_[0] ;
  wire \byte_counter_reg_n_0_[1] ;
  wire \byte_counter_reg_n_0_[2] ;
  wire clk;
  wire data0;
  wire data3;
  wire [24:0]delay_counter;
  wire delay_counter0_carry__0_n_0;
  wire delay_counter0_carry__0_n_1;
  wire delay_counter0_carry__0_n_2;
  wire delay_counter0_carry__0_n_3;
  wire delay_counter0_carry__0_n_4;
  wire delay_counter0_carry__0_n_5;
  wire delay_counter0_carry__0_n_6;
  wire delay_counter0_carry__0_n_7;
  wire delay_counter0_carry__1_n_1;
  wire delay_counter0_carry__1_n_2;
  wire delay_counter0_carry__1_n_3;
  wire delay_counter0_carry__1_n_4;
  wire delay_counter0_carry__1_n_5;
  wire delay_counter0_carry__1_n_6;
  wire delay_counter0_carry__1_n_7;
  wire delay_counter0_carry_n_0;
  wire delay_counter0_carry_n_1;
  wire delay_counter0_carry_n_2;
  wire delay_counter0_carry_n_3;
  wire delay_counter0_carry_n_4;
  wire delay_counter0_carry_n_5;
  wire delay_counter0_carry_n_6;
  wire delay_counter0_carry_n_7;
  wire \delay_counter[24]_i_1_n_0 ;
  wire \delay_counter_reg_n_0_[0] ;
  wire \delay_counter_reg_n_0_[10] ;
  wire \delay_counter_reg_n_0_[11] ;
  wire \delay_counter_reg_n_0_[12] ;
  wire \delay_counter_reg_n_0_[13] ;
  wire \delay_counter_reg_n_0_[14] ;
  wire \delay_counter_reg_n_0_[15] ;
  wire \delay_counter_reg_n_0_[16] ;
  wire \delay_counter_reg_n_0_[17] ;
  wire \delay_counter_reg_n_0_[18] ;
  wire \delay_counter_reg_n_0_[19] ;
  wire \delay_counter_reg_n_0_[1] ;
  wire \delay_counter_reg_n_0_[20] ;
  wire \delay_counter_reg_n_0_[21] ;
  wire \delay_counter_reg_n_0_[22] ;
  wire \delay_counter_reg_n_0_[23] ;
  wire \delay_counter_reg_n_0_[24] ;
  wire \delay_counter_reg_n_0_[2] ;
  wire \delay_counter_reg_n_0_[3] ;
  wire \delay_counter_reg_n_0_[4] ;
  wire \delay_counter_reg_n_0_[5] ;
  wire \delay_counter_reg_n_0_[6] ;
  wire \delay_counter_reg_n_0_[7] ;
  wire \delay_counter_reg_n_0_[8] ;
  wire \delay_counter_reg_n_0_[9] ;
  wire done;
  wire done_i_1_n_0;
  wire [15:0]humidity_raw;
  wire in12;
  wire [24:1]in27;
  wire load;
  wire [3:0]next_state__0;
  wire [4:1]p_0_in;
  wire [2:2]p_0_in_0;
  wire [1:0]p_1_in;
  wire [7:0]rh_lsb;
  wire \rh_lsb[7]_i_2_n_0 ;
  wire \rh_lsb[7]_i_3_n_0 ;
  wire rh_lsb_1;
  wire [7:0]rh_msb;
  wire rh_msb_3;
  wire rst_n;
  wire \rx_byte[0]_i_1_n_0 ;
  wire \rx_byte[1]_i_1_n_0 ;
  wire \rx_byte[2]_i_1_n_0 ;
  wire \rx_byte[3]_i_1_n_0 ;
  wire \rx_byte[3]_i_2_n_0 ;
  wire \rx_byte[4]_i_1_n_0 ;
  wire \rx_byte[5]_i_1_n_0 ;
  wire \rx_byte[6]_i_1_n_0 ;
  wire \rx_byte[6]_i_2_n_0 ;
  wire \rx_byte[7]_i_1_n_0 ;
  wire \rx_byte[7]_i_2_n_0 ;
  wire \rx_byte[7]_i_3_n_0 ;
  wire \rx_byte_reg_n_0_[0] ;
  wire \rx_byte_reg_n_0_[1] ;
  wire \rx_byte_reg_n_0_[2] ;
  wire \rx_byte_reg_n_0_[3] ;
  wire \rx_byte_reg_n_0_[4] ;
  wire \rx_byte_reg_n_0_[5] ;
  wire \rx_byte_reg_n_0_[6] ;
  wire \rx_byte_reg_n_0_[7] ;
  wire scl;
  wire \scl_counter[0]_i_1_n_0 ;
  wire [4:1]scl_counter_reg;
  wire \scl_counter_reg_n_0_[0] ;
  wire scl_oe;
  wire scl_oe_i_1_n_0;
  wire scl_oe_i_2_n_0;
  wire scl_oe_i_3_n_0;
  wire scl_oe_i_4_n_0;
  wire \scl_phase_reg_n_0_[0] ;
  wire sda;
  wire sda_in;
  wire sda_oe;
  wire sda_oe_i_1_n_0;
  wire sda_oe_i_2_n_0;
  wire sda_oe_i_3_n_0;
  wire sda_oe_i_4_n_0;
  wire sda_oe_i_6_n_0;
  wire sda_oe_i_7_n_0;
  wire sda_oe_i_8_n_0;
  wire sda_oe_reg_i_5_n_0;
  wire start;
  wire [3:0]state;
  wire [3:0]state_debug;
  wire [7:0]temp_lsb;
  wire \temp_lsb[7]_i_2_n_0 ;
  wire \temp_lsb[7]_i_3_n_0 ;
  wire temp_lsb_2;
  wire [7:0]temp_msb;
  wire \temp_msb[7]_i_2_n_0 ;
  wire \temp_msb[7]_i_3_n_0 ;
  wire temp_msb_4;
  wire [15:0]temperature_raw;
  wire \temperature_raw[15]_i_1_n_0 ;
  wire [7:2]tx_byte0_in;
  wire \tx_byte[0]_i_1_n_0 ;
  wire \tx_byte[7]_i_1_n_0 ;
  wire \tx_byte[7]_i_3_n_0 ;
  wire \tx_byte_reg_n_0_[0] ;
  wire NLW_IOBUF_SCL_O_UNCONNECTED;
  wire [7:7]NLW_delay_counter0_carry__1_CO_UNCONNECTED;

  LUT6 #(
    .INIT(64'h2320333320202323)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(state[3]),
        .I2(state[2]),
        .I3(sda_in),
        .I4(state[0]),
        .I5(state[1]),
        .O(next_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(\byte_counter_reg_n_0_[1] ),
        .I1(\byte_counter_reg_n_0_[2] ),
        .I2(\byte_counter_reg_n_0_[0] ),
        .I3(state[0]),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h070407040704F4F4)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(state[2]),
        .I2(state[3]),
        .I3(\FSM_sequential_state[1]_i_3_n_0 ),
        .I4(state[0]),
        .I5(state[1]),
        .O(next_state__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hAAAAABA2)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(state[1]),
        .I1(\byte_counter_reg_n_0_[1] ),
        .I2(\byte_counter_reg_n_0_[2] ),
        .I3(\byte_counter_reg_n_0_[0] ),
        .I4(state[0]),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF07FFFFFF)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\byte_counter_reg_n_0_[0] ),
        .I1(\byte_counter_reg_n_0_[1] ),
        .I2(\byte_counter_reg_n_0_[2] ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(sda_in),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h04AA000055FF5555)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[3]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(sda_in),
        .I3(state[0]),
        .I4(state[1]),
        .I5(\FSM_sequential_state[3]_i_7_n_0 ),
        .O(next_state__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(state[2]),
        .I1(\byte_counter_reg_n_0_[2] ),
        .I2(\byte_counter_reg_n_0_[1] ),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1F1F1F1F111F1111)) 
    \FSM_sequential_state[3]_i_1 
       (.I0(\FSM_sequential_state[3]_i_3_n_0 ),
        .I1(state[2]),
        .I2(\FSM_sequential_state[3]_i_4_n_0 ),
        .I3(\FSM_sequential_state[3]_i_5_n_0 ),
        .I4(\delay_counter_reg_n_0_[19] ),
        .I5(\FSM_sequential_state[3]_i_6_n_0 ),
        .O(\FSM_sequential_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hC8888888)) 
    \FSM_sequential_state[3]_i_10 
       (.I0(state[0]),
        .I1(state[3]),
        .I2(in12),
        .I3(\scl_phase_reg_n_0_[0] ),
        .I4(p_0_in_0),
        .O(\FSM_sequential_state[3]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h40FF)) 
    \FSM_sequential_state[3]_i_11 
       (.I0(sda_in),
        .I1(\byte_counter_reg_n_0_[2] ),
        .I2(state[1]),
        .I3(state[0]),
        .O(\FSM_sequential_state[3]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state[3]_i_12 
       (.I0(\bit_counter_reg_n_0_[0] ),
        .I1(\bit_counter_reg_n_0_[1] ),
        .O(\FSM_sequential_state[3]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[3]_i_13 
       (.I0(state[2]),
        .I1(state[3]),
        .O(\FSM_sequential_state[3]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \FSM_sequential_state[3]_i_14 
       (.I0(\delay_counter_reg_n_0_[12] ),
        .I1(\delay_counter_reg_n_0_[13] ),
        .I2(\delay_counter_reg_n_0_[14] ),
        .O(\FSM_sequential_state[3]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hF8000000)) 
    \FSM_sequential_state[3]_i_15 
       (.I0(\delay_counter_reg_n_0_[5] ),
        .I1(\delay_counter_reg_n_0_[4] ),
        .I2(\delay_counter_reg_n_0_[6] ),
        .I3(\delay_counter_reg_n_0_[7] ),
        .I4(\delay_counter_reg_n_0_[8] ),
        .O(\FSM_sequential_state[3]_i_15_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_sequential_state[3]_i_16 
       (.I0(\delay_counter_reg_n_0_[11] ),
        .I1(\delay_counter_reg_n_0_[9] ),
        .I2(\delay_counter_reg_n_0_[10] ),
        .O(\FSM_sequential_state[3]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state[3]_i_17 
       (.I0(\delay_counter_reg_n_0_[17] ),
        .I1(\delay_counter_reg_n_0_[16] ),
        .O(\FSM_sequential_state[3]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state[3]_i_18 
       (.I0(state[1]),
        .I1(state[0]),
        .O(\FSM_sequential_state[3]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAAA00008000)) 
    \FSM_sequential_state[3]_i_2 
       (.I0(\FSM_sequential_state[3]_i_7_n_0 ),
        .I1(sda_in),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[3]),
        .I5(state[2]),
        .O(next_state__0[3]));
  LUT6 #(
    .INIT(64'h00AE00AE000000AE)) 
    \FSM_sequential_state[3]_i_3 
       (.I0(\FSM_sequential_state[3]_i_8_n_0 ),
        .I1(state[1]),
        .I2(\FSM_sequential_state[3]_i_9_n_0 ),
        .I3(\FSM_sequential_state[3]_i_10_n_0 ),
        .I4(\bit_counter[2]_i_3_n_0 ),
        .I5(\FSM_sequential_state[3]_i_11_n_0 ),
        .O(\FSM_sequential_state[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0F0F0FBF0FFFFFFF)) 
    \FSM_sequential_state[3]_i_4 
       (.I0(\FSM_sequential_state[3]_i_12_n_0 ),
        .I1(\bit_counter_reg_n_0_[2] ),
        .I2(\FSM_sequential_state[3]_i_13_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\bit_counter[2]_i_3_n_0 ),
        .O(\FSM_sequential_state[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF4445)) 
    \FSM_sequential_state[3]_i_5 
       (.I0(\delay_counter_reg_n_0_[15] ),
        .I1(\FSM_sequential_state[3]_i_14_n_0 ),
        .I2(\FSM_sequential_state[3]_i_15_n_0 ),
        .I3(\FSM_sequential_state[3]_i_16_n_0 ),
        .I4(\FSM_sequential_state[3]_i_17_n_0 ),
        .I5(\delay_counter_reg_n_0_[18] ),
        .O(\FSM_sequential_state[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_sequential_state[3]_i_6 
       (.I0(\delay_counter_reg_n_0_[21] ),
        .I1(\delay_counter_reg_n_0_[20] ),
        .I2(\delay_counter_reg_n_0_[23] ),
        .I3(\delay_counter_reg_n_0_[24] ),
        .I4(\delay_counter_reg_n_0_[22] ),
        .I5(\FSM_sequential_state[3]_i_18_n_0 ),
        .O(\FSM_sequential_state[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFEF00FDFFFFFFFF)) 
    \FSM_sequential_state[3]_i_7 
       (.I0(\byte_counter_reg_n_0_[0] ),
        .I1(\byte_counter_reg_n_0_[2] ),
        .I2(\byte_counter_reg_n_0_[1] ),
        .I3(state[0]),
        .I4(state[1]),
        .I5(state[2]),
        .O(\FSM_sequential_state[3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hEEEF)) 
    \FSM_sequential_state[3]_i_8 
       (.I0(state[3]),
        .I1(state[0]),
        .I2(start),
        .I3(state[1]),
        .O(\FSM_sequential_state[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FSM_sequential_state[3]_i_9 
       (.I0(p_0_in_0),
        .I1(\scl_phase_reg_n_0_[0] ),
        .I2(in12),
        .I3(\bit_counter_reg_n_0_[2] ),
        .I4(\bit_counter_reg_n_0_[0] ),
        .I5(\bit_counter_reg_n_0_[1] ),
        .O(\FSM_sequential_state[3]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:0000,READ_BYTE:0100,SEND_MASTER_NACK:0101,RESTART:1000,SEND_MASTER_ACK:1010,WAIT_MEASUREMENT:0111,WAIT_ACK:0011,STOP:0110,SEND_BYTE:0010,ERROR:1011,COMPLETE:1001,START:0001" *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(\FSM_sequential_state[3]_i_1_n_0 ),
        .D(next_state__0[0]),
        .Q(state[0]),
        .R(busy_i_2_n_0));
  (* FSM_ENCODED_STATES = "IDLE:0000,READ_BYTE:0100,SEND_MASTER_NACK:0101,RESTART:1000,SEND_MASTER_ACK:1010,WAIT_MEASUREMENT:0111,WAIT_ACK:0011,STOP:0110,SEND_BYTE:0010,ERROR:1011,COMPLETE:1001,START:0001" *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(\FSM_sequential_state[3]_i_1_n_0 ),
        .D(next_state__0[1]),
        .Q(state[1]),
        .R(busy_i_2_n_0));
  (* FSM_ENCODED_STATES = "IDLE:0000,READ_BYTE:0100,SEND_MASTER_NACK:0101,RESTART:1000,SEND_MASTER_ACK:1010,WAIT_MEASUREMENT:0111,WAIT_ACK:0011,STOP:0110,SEND_BYTE:0010,ERROR:1011,COMPLETE:1001,START:0001" *) 
  FDRE \FSM_sequential_state_reg[2] 
       (.C(clk),
        .CE(\FSM_sequential_state[3]_i_1_n_0 ),
        .D(next_state__0[2]),
        .Q(state[2]),
        .R(busy_i_2_n_0));
  (* FSM_ENCODED_STATES = "IDLE:0000,READ_BYTE:0100,SEND_MASTER_NACK:0101,RESTART:1000,SEND_MASTER_ACK:1010,WAIT_MEASUREMENT:0111,WAIT_ACK:0011,STOP:0110,SEND_BYTE:0010,ERROR:1011,COMPLETE:1001,START:0001" *) 
  FDRE \FSM_sequential_state_reg[3] 
       (.C(clk),
        .CE(\FSM_sequential_state[3]_i_1_n_0 ),
        .D(next_state__0[3]),
        .Q(state[3]),
        .R(busy_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    IOBUF_SCL
       (.I(1'b0),
        .IO(scl),
        .O(NLW_IOBUF_SCL_O_UNCONNECTED),
        .T(scl_oe));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    IOBUF_SDA
       (.I(1'b0),
        .IO(sda),
        .O(sda_in),
        .T(sda_oe));
  LUT6 #(
    .INIT(64'hFFFFA8FF0000A800)) 
    ack_error_i_1
       (.I0(ack_error_i_2_n_0),
        .I1(sda_in),
        .I2(state[3]),
        .I3(ack_error_i_3_n_0),
        .I4(ack_error_i_4_n_0),
        .I5(ack_error),
        .O(ack_error_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ack_error_i_2
       (.I0(state[1]),
        .I1(state[2]),
        .O(ack_error_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h45)) 
    ack_error_i_3
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(ack_error_i_3_n_0));
  LUT6 #(
    .INIT(64'h02222222EEEEEEEE)) 
    ack_error_i_4
       (.I0(state[0]),
        .I1(state[3]),
        .I2(in12),
        .I3(sda_in),
        .I4(ack_error_i_5_n_0),
        .I5(state[1]),
        .O(ack_error_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ack_error_i_5
       (.I0(p_0_in_0),
        .I1(\scl_phase_reg_n_0_[0] ),
        .O(ack_error_i_5_n_0));
  FDCE ack_error_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(ack_error_i_1_n_0),
        .Q(ack_error));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0054)) 
    \bit_counter[0]_i_1 
       (.I0(\bit_counter_reg_n_0_[0] ),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[3]),
        .O(bit_counter[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00006660)) 
    \bit_counter[1]_i_1 
       (.I0(\bit_counter_reg_n_0_[1] ),
        .I1(\bit_counter_reg_n_0_[0] ),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[3]),
        .O(bit_counter[1]));
  LUT5 #(
    .INIT(32'h00101071)) 
    \bit_counter[2]_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(\bit_counter[2]_i_3_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .O(\bit_counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000078787800)) 
    \bit_counter[2]_i_2 
       (.I0(\bit_counter_reg_n_0_[0] ),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[2] ),
        .I3(state[1]),
        .I4(state[2]),
        .I5(state[3]),
        .O(bit_counter[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \bit_counter[2]_i_3 
       (.I0(in12),
        .I1(\scl_phase_reg_n_0_[0] ),
        .I2(p_0_in_0),
        .O(\bit_counter[2]_i_3_n_0 ));
  FDCE \bit_counter_reg[0] 
       (.C(clk),
        .CE(\bit_counter[2]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(bit_counter[0]),
        .Q(\bit_counter_reg_n_0_[0] ));
  FDCE \bit_counter_reg[1] 
       (.C(clk),
        .CE(\bit_counter[2]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(bit_counter[1]),
        .Q(\bit_counter_reg_n_0_[1] ));
  FDCE \bit_counter_reg[2] 
       (.C(clk),
        .CE(\bit_counter[2]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(bit_counter[2]),
        .Q(\bit_counter_reg_n_0_[2] ));
  LUT6 #(
    .INIT(64'hF0FFFFFE00000002)) 
    busy_i_1
       (.I0(start),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[3]),
        .I4(state[0]),
        .I5(busy),
        .O(busy_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    busy_i_2
       (.I0(rst_n),
        .O(busy_i_2_n_0));
  FDCE busy_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(busy_i_1_n_0),
        .Q(busy));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \byte_counter[0]_i_1 
       (.I0(state[1]),
        .I1(\byte_counter_reg_n_0_[0] ),
        .O(byte_counter[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \byte_counter[1]_i_1 
       (.I0(state[1]),
        .I1(\byte_counter_reg_n_0_[1] ),
        .I2(\byte_counter_reg_n_0_[0] ),
        .O(byte_counter[1]));
  LUT5 #(
    .INIT(32'h10410001)) 
    \byte_counter[2]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[3]),
        .I4(\bit_counter[2]_i_3_n_0 ),
        .O(\byte_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \byte_counter[2]_i_2 
       (.I0(state[1]),
        .I1(\byte_counter_reg_n_0_[1] ),
        .I2(\byte_counter_reg_n_0_[0] ),
        .I3(\byte_counter_reg_n_0_[2] ),
        .O(byte_counter[2]));
  FDCE \byte_counter_reg[0] 
       (.C(clk),
        .CE(\byte_counter[2]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(byte_counter[0]),
        .Q(\byte_counter_reg_n_0_[0] ));
  FDCE \byte_counter_reg[1] 
       (.C(clk),
        .CE(\byte_counter[2]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(byte_counter[1]),
        .Q(\byte_counter_reg_n_0_[1] ));
  FDCE \byte_counter_reg[2] 
       (.C(clk),
        .CE(\byte_counter[2]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(byte_counter[2]),
        .Q(\byte_counter_reg_n_0_[2] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 delay_counter0_carry
       (.CI(\delay_counter_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({delay_counter0_carry_n_0,delay_counter0_carry_n_1,delay_counter0_carry_n_2,delay_counter0_carry_n_3,delay_counter0_carry_n_4,delay_counter0_carry_n_5,delay_counter0_carry_n_6,delay_counter0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in27[8:1]),
        .S({\delay_counter_reg_n_0_[8] ,\delay_counter_reg_n_0_[7] ,\delay_counter_reg_n_0_[6] ,\delay_counter_reg_n_0_[5] ,\delay_counter_reg_n_0_[4] ,\delay_counter_reg_n_0_[3] ,\delay_counter_reg_n_0_[2] ,\delay_counter_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 delay_counter0_carry__0
       (.CI(delay_counter0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({delay_counter0_carry__0_n_0,delay_counter0_carry__0_n_1,delay_counter0_carry__0_n_2,delay_counter0_carry__0_n_3,delay_counter0_carry__0_n_4,delay_counter0_carry__0_n_5,delay_counter0_carry__0_n_6,delay_counter0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in27[16:9]),
        .S({\delay_counter_reg_n_0_[16] ,\delay_counter_reg_n_0_[15] ,\delay_counter_reg_n_0_[14] ,\delay_counter_reg_n_0_[13] ,\delay_counter_reg_n_0_[12] ,\delay_counter_reg_n_0_[11] ,\delay_counter_reg_n_0_[10] ,\delay_counter_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 delay_counter0_carry__1
       (.CI(delay_counter0_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_delay_counter0_carry__1_CO_UNCONNECTED[7],delay_counter0_carry__1_n_1,delay_counter0_carry__1_n_2,delay_counter0_carry__1_n_3,delay_counter0_carry__1_n_4,delay_counter0_carry__1_n_5,delay_counter0_carry__1_n_6,delay_counter0_carry__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in27[24:17]),
        .S({\delay_counter_reg_n_0_[24] ,\delay_counter_reg_n_0_[23] ,\delay_counter_reg_n_0_[22] ,\delay_counter_reg_n_0_[21] ,\delay_counter_reg_n_0_[20] ,\delay_counter_reg_n_0_[19] ,\delay_counter_reg_n_0_[18] ,\delay_counter_reg_n_0_[17] }));
  LUT2 #(
    .INIT(4'h2)) 
    \delay_counter[0]_i_1 
       (.I0(state[2]),
        .I1(\delay_counter_reg_n_0_[0] ),
        .O(delay_counter[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[10]_i_1 
       (.I0(in27[10]),
        .I1(state[2]),
        .O(delay_counter[10]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[11]_i_1 
       (.I0(in27[11]),
        .I1(state[2]),
        .O(delay_counter[11]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[12]_i_1 
       (.I0(in27[12]),
        .I1(state[2]),
        .O(delay_counter[12]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[13]_i_1 
       (.I0(in27[13]),
        .I1(state[2]),
        .O(delay_counter[13]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[14]_i_1 
       (.I0(in27[14]),
        .I1(state[2]),
        .O(delay_counter[14]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[15]_i_1 
       (.I0(in27[15]),
        .I1(state[2]),
        .O(delay_counter[15]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[16]_i_1 
       (.I0(in27[16]),
        .I1(state[2]),
        .O(delay_counter[16]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[17]_i_1 
       (.I0(in27[17]),
        .I1(state[2]),
        .O(delay_counter[17]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[18]_i_1 
       (.I0(in27[18]),
        .I1(state[2]),
        .O(delay_counter[18]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[19]_i_1 
       (.I0(in27[19]),
        .I1(state[2]),
        .O(delay_counter[19]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[1]_i_1 
       (.I0(in27[1]),
        .I1(state[2]),
        .O(delay_counter[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[20]_i_1 
       (.I0(in27[20]),
        .I1(state[2]),
        .O(delay_counter[20]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[21]_i_1 
       (.I0(in27[21]),
        .I1(state[2]),
        .O(delay_counter[21]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[22]_i_1 
       (.I0(in27[22]),
        .I1(state[2]),
        .O(delay_counter[22]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[23]_i_1 
       (.I0(in27[23]),
        .I1(state[2]),
        .O(delay_counter[23]));
  LUT4 #(
    .INIT(16'h0081)) 
    \delay_counter[24]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[3]),
        .O(\delay_counter[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[24]_i_2 
       (.I0(in27[24]),
        .I1(state[2]),
        .O(delay_counter[24]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[2]_i_1 
       (.I0(in27[2]),
        .I1(state[2]),
        .O(delay_counter[2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[3]_i_1 
       (.I0(in27[3]),
        .I1(state[2]),
        .O(delay_counter[3]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[4]_i_1 
       (.I0(in27[4]),
        .I1(state[2]),
        .O(delay_counter[4]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[5]_i_1 
       (.I0(in27[5]),
        .I1(state[2]),
        .O(delay_counter[5]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[6]_i_1 
       (.I0(in27[6]),
        .I1(state[2]),
        .O(delay_counter[6]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[7]_i_1 
       (.I0(in27[7]),
        .I1(state[2]),
        .O(delay_counter[7]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[8]_i_1 
       (.I0(in27[8]),
        .I1(state[2]),
        .O(delay_counter[8]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \delay_counter[9]_i_1 
       (.I0(in27[9]),
        .I1(state[2]),
        .O(delay_counter[9]));
  FDCE \delay_counter_reg[0] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[0]),
        .Q(\delay_counter_reg_n_0_[0] ));
  FDCE \delay_counter_reg[10] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[10]),
        .Q(\delay_counter_reg_n_0_[10] ));
  FDCE \delay_counter_reg[11] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[11]),
        .Q(\delay_counter_reg_n_0_[11] ));
  FDCE \delay_counter_reg[12] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[12]),
        .Q(\delay_counter_reg_n_0_[12] ));
  FDCE \delay_counter_reg[13] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[13]),
        .Q(\delay_counter_reg_n_0_[13] ));
  FDCE \delay_counter_reg[14] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[14]),
        .Q(\delay_counter_reg_n_0_[14] ));
  FDCE \delay_counter_reg[15] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[15]),
        .Q(\delay_counter_reg_n_0_[15] ));
  FDCE \delay_counter_reg[16] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[16]),
        .Q(\delay_counter_reg_n_0_[16] ));
  FDCE \delay_counter_reg[17] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[17]),
        .Q(\delay_counter_reg_n_0_[17] ));
  FDCE \delay_counter_reg[18] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[18]),
        .Q(\delay_counter_reg_n_0_[18] ));
  FDCE \delay_counter_reg[19] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[19]),
        .Q(\delay_counter_reg_n_0_[19] ));
  FDCE \delay_counter_reg[1] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[1]),
        .Q(\delay_counter_reg_n_0_[1] ));
  FDCE \delay_counter_reg[20] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[20]),
        .Q(\delay_counter_reg_n_0_[20] ));
  FDCE \delay_counter_reg[21] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[21]),
        .Q(\delay_counter_reg_n_0_[21] ));
  FDCE \delay_counter_reg[22] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[22]),
        .Q(\delay_counter_reg_n_0_[22] ));
  FDCE \delay_counter_reg[23] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[23]),
        .Q(\delay_counter_reg_n_0_[23] ));
  FDCE \delay_counter_reg[24] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[24]),
        .Q(\delay_counter_reg_n_0_[24] ));
  FDCE \delay_counter_reg[2] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[2]),
        .Q(\delay_counter_reg_n_0_[2] ));
  FDCE \delay_counter_reg[3] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[3]),
        .Q(\delay_counter_reg_n_0_[3] ));
  FDCE \delay_counter_reg[4] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[4]),
        .Q(\delay_counter_reg_n_0_[4] ));
  FDCE \delay_counter_reg[5] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[5]),
        .Q(\delay_counter_reg_n_0_[5] ));
  FDCE \delay_counter_reg[6] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[6]),
        .Q(\delay_counter_reg_n_0_[6] ));
  FDCE \delay_counter_reg[7] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[7]),
        .Q(\delay_counter_reg_n_0_[7] ));
  FDCE \delay_counter_reg[8] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[8]),
        .Q(\delay_counter_reg_n_0_[8] ));
  FDCE \delay_counter_reg[9] 
       (.C(clk),
        .CE(\delay_counter[24]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(delay_counter[9]),
        .Q(\delay_counter_reg_n_0_[9] ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h08)) 
    done_i_1
       (.I0(state[3]),
        .I1(state[0]),
        .I2(state[2]),
        .O(done_i_1_n_0));
  FDCE done_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(done_i_1_n_0),
        .Q(done));
  FDCE \humidity_raw_reg[0] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_lsb[0]),
        .Q(humidity_raw[0]));
  FDCE \humidity_raw_reg[10] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_msb[2]),
        .Q(humidity_raw[10]));
  FDCE \humidity_raw_reg[11] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_msb[3]),
        .Q(humidity_raw[11]));
  FDCE \humidity_raw_reg[12] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_msb[4]),
        .Q(humidity_raw[12]));
  FDCE \humidity_raw_reg[13] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_msb[5]),
        .Q(humidity_raw[13]));
  FDCE \humidity_raw_reg[14] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_msb[6]),
        .Q(humidity_raw[14]));
  FDCE \humidity_raw_reg[15] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_msb[7]),
        .Q(humidity_raw[15]));
  FDCE \humidity_raw_reg[1] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_lsb[1]),
        .Q(humidity_raw[1]));
  FDCE \humidity_raw_reg[2] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_lsb[2]),
        .Q(humidity_raw[2]));
  FDCE \humidity_raw_reg[3] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_lsb[3]),
        .Q(humidity_raw[3]));
  FDCE \humidity_raw_reg[4] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_lsb[4]),
        .Q(humidity_raw[4]));
  FDCE \humidity_raw_reg[5] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_lsb[5]),
        .Q(humidity_raw[5]));
  FDCE \humidity_raw_reg[6] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_lsb[6]),
        .Q(humidity_raw[6]));
  FDCE \humidity_raw_reg[7] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_lsb[7]),
        .Q(humidity_raw[7]));
  FDCE \humidity_raw_reg[8] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_msb[0]),
        .Q(humidity_raw[8]));
  FDCE \humidity_raw_reg[9] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(rh_msb[1]),
        .Q(humidity_raw[9]));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \rh_lsb[7]_i_1 
       (.I0(\byte_counter_reg_n_0_[2] ),
        .I1(\byte_counter_reg_n_0_[0] ),
        .I2(in12),
        .I3(\temp_lsb[7]_i_3_n_0 ),
        .I4(\rh_lsb[7]_i_2_n_0 ),
        .I5(\rh_lsb[7]_i_3_n_0 ),
        .O(rh_lsb_1));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hF7FF)) 
    \rh_lsb[7]_i_2 
       (.I0(state[2]),
        .I1(p_0_in_0),
        .I2(\byte_counter_reg_n_0_[1] ),
        .I3(\scl_phase_reg_n_0_[0] ),
        .O(\rh_lsb[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \rh_lsb[7]_i_3 
       (.I0(\bit_counter_reg_n_0_[1] ),
        .I1(\bit_counter_reg_n_0_[0] ),
        .I2(\bit_counter_reg_n_0_[2] ),
        .O(\rh_lsb[7]_i_3_n_0 ));
  FDCE \rh_lsb_reg[0] 
       (.C(clk),
        .CE(rh_lsb_1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[0] ),
        .Q(rh_lsb[0]));
  FDCE \rh_lsb_reg[1] 
       (.C(clk),
        .CE(rh_lsb_1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[1] ),
        .Q(rh_lsb[1]));
  FDCE \rh_lsb_reg[2] 
       (.C(clk),
        .CE(rh_lsb_1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[2] ),
        .Q(rh_lsb[2]));
  FDCE \rh_lsb_reg[3] 
       (.C(clk),
        .CE(rh_lsb_1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[3] ),
        .Q(rh_lsb[3]));
  FDCE \rh_lsb_reg[4] 
       (.C(clk),
        .CE(rh_lsb_1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[4] ),
        .Q(rh_lsb[4]));
  FDCE \rh_lsb_reg[5] 
       (.C(clk),
        .CE(rh_lsb_1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[5] ),
        .Q(rh_lsb[5]));
  FDCE \rh_lsb_reg[6] 
       (.C(clk),
        .CE(rh_lsb_1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[6] ),
        .Q(rh_lsb[6]));
  FDCE \rh_lsb_reg[7] 
       (.C(clk),
        .CE(rh_lsb_1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[7] ),
        .Q(rh_lsb[7]));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \rh_msb[7]_i_1 
       (.I0(\temp_msb[7]_i_2_n_0 ),
        .I1(\bit_counter_reg_n_0_[0] ),
        .I2(\byte_counter_reg_n_0_[2] ),
        .I3(\byte_counter_reg_n_0_[1] ),
        .I4(\byte_counter_reg_n_0_[0] ),
        .I5(\temp_msb[7]_i_3_n_0 ),
        .O(rh_msb_3));
  FDCE \rh_msb_reg[0] 
       (.C(clk),
        .CE(rh_msb_3),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[0] ),
        .Q(rh_msb[0]));
  FDCE \rh_msb_reg[1] 
       (.C(clk),
        .CE(rh_msb_3),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[1] ),
        .Q(rh_msb[1]));
  FDCE \rh_msb_reg[2] 
       (.C(clk),
        .CE(rh_msb_3),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[2] ),
        .Q(rh_msb[2]));
  FDCE \rh_msb_reg[3] 
       (.C(clk),
        .CE(rh_msb_3),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[3] ),
        .Q(rh_msb[3]));
  FDCE \rh_msb_reg[4] 
       (.C(clk),
        .CE(rh_msb_3),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[4] ),
        .Q(rh_msb[4]));
  FDCE \rh_msb_reg[5] 
       (.C(clk),
        .CE(rh_msb_3),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[5] ),
        .Q(rh_msb[5]));
  FDCE \rh_msb_reg[6] 
       (.C(clk),
        .CE(rh_msb_3),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[6] ),
        .Q(rh_msb[6]));
  FDCE \rh_msb_reg[7] 
       (.C(clk),
        .CE(rh_msb_3),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[7] ),
        .Q(rh_msb[7]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rx_byte[0]_i_1 
       (.I0(sda_in),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .I3(\rx_byte[3]_i_2_n_0 ),
        .I4(\rx_byte_reg_n_0_[0] ),
        .O(\rx_byte[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    \rx_byte[1]_i_1 
       (.I0(sda_in),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .I3(\rx_byte[3]_i_2_n_0 ),
        .I4(\rx_byte_reg_n_0_[1] ),
        .O(\rx_byte[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    \rx_byte[2]_i_1 
       (.I0(sda_in),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .I3(\rx_byte[3]_i_2_n_0 ),
        .I4(\rx_byte_reg_n_0_[2] ),
        .O(\rx_byte[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \rx_byte[3]_i_1 
       (.I0(sda_in),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .I3(\rx_byte[3]_i_2_n_0 ),
        .I4(\rx_byte_reg_n_0_[3] ),
        .O(\rx_byte[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDFFFFFFFFFFFFFFF)) 
    \rx_byte[3]_i_2 
       (.I0(in12),
        .I1(state[1]),
        .I2(state[2]),
        .I3(ack_error_i_5_n_0),
        .I4(\rx_byte[7]_i_3_n_0 ),
        .I5(\bit_counter_reg_n_0_[2] ),
        .O(\rx_byte[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rx_byte[4]_i_1 
       (.I0(sda_in),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .I3(\rx_byte[6]_i_2_n_0 ),
        .I4(\rx_byte_reg_n_0_[4] ),
        .O(\rx_byte[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    \rx_byte[5]_i_1 
       (.I0(sda_in),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .I3(\rx_byte[6]_i_2_n_0 ),
        .I4(\rx_byte_reg_n_0_[5] ),
        .O(\rx_byte[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    \rx_byte[6]_i_1 
       (.I0(sda_in),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .I3(\rx_byte[6]_i_2_n_0 ),
        .I4(\rx_byte_reg_n_0_[6] ),
        .O(\rx_byte[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF7FFFFF)) 
    \rx_byte[6]_i_2 
       (.I0(\temp_lsb[7]_i_3_n_0 ),
        .I1(p_0_in_0),
        .I2(state[2]),
        .I3(\scl_phase_reg_n_0_[0] ),
        .I4(in12),
        .I5(\bit_counter_reg_n_0_[2] ),
        .O(\rx_byte[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \rx_byte[7]_i_1 
       (.I0(sda_in),
        .I1(\bit_counter_reg_n_0_[2] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .I3(\bit_counter_reg_n_0_[1] ),
        .I4(\rx_byte[7]_i_2_n_0 ),
        .I5(\rx_byte_reg_n_0_[7] ),
        .O(\rx_byte[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDFFFFFFFFFFF)) 
    \rx_byte[7]_i_2 
       (.I0(\rx_byte[7]_i_3_n_0 ),
        .I1(\scl_phase_reg_n_0_[0] ),
        .I2(p_0_in_0),
        .I3(state[2]),
        .I4(state[1]),
        .I5(in12),
        .O(\rx_byte[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \rx_byte[7]_i_3 
       (.I0(state[0]),
        .I1(state[3]),
        .O(\rx_byte[7]_i_3_n_0 ));
  FDCE \rx_byte_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte[0]_i_1_n_0 ),
        .Q(\rx_byte_reg_n_0_[0] ));
  FDCE \rx_byte_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte[1]_i_1_n_0 ),
        .Q(\rx_byte_reg_n_0_[1] ));
  FDCE \rx_byte_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte[2]_i_1_n_0 ),
        .Q(\rx_byte_reg_n_0_[2] ));
  FDCE \rx_byte_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte[3]_i_1_n_0 ),
        .Q(\rx_byte_reg_n_0_[3] ));
  FDCE \rx_byte_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte[4]_i_1_n_0 ),
        .Q(\rx_byte_reg_n_0_[4] ));
  FDCE \rx_byte_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte[5]_i_1_n_0 ),
        .Q(\rx_byte_reg_n_0_[5] ));
  FDCE \rx_byte_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte[6]_i_1_n_0 ),
        .Q(\rx_byte_reg_n_0_[6] ));
  FDCE \rx_byte_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte[7]_i_1_n_0 ),
        .Q(\rx_byte_reg_n_0_[7] ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00007FFF)) 
    \scl_counter[0]_i_1 
       (.I0(scl_counter_reg[3]),
        .I1(scl_counter_reg[4]),
        .I2(scl_counter_reg[1]),
        .I3(scl_counter_reg[2]),
        .I4(\scl_counter_reg_n_0_[0] ),
        .O(\scl_counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h1555AAAA)) 
    \scl_counter[1]_i_1 
       (.I0(\scl_counter_reg_n_0_[0] ),
        .I1(scl_counter_reg[2]),
        .I2(scl_counter_reg[3]),
        .I3(scl_counter_reg[4]),
        .I4(scl_counter_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h07FFF000)) 
    \scl_counter[2]_i_1 
       (.I0(scl_counter_reg[3]),
        .I1(scl_counter_reg[4]),
        .I2(\scl_counter_reg_n_0_[0] ),
        .I3(scl_counter_reg[1]),
        .I4(scl_counter_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h1CF0F0F0)) 
    \scl_counter[3]_i_1 
       (.I0(scl_counter_reg[4]),
        .I1(\scl_counter_reg_n_0_[0] ),
        .I2(scl_counter_reg[3]),
        .I3(scl_counter_reg[1]),
        .I4(scl_counter_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h3FFF8000)) 
    \scl_counter[4]_i_1 
       (.I0(\scl_counter_reg_n_0_[0] ),
        .I1(scl_counter_reg[3]),
        .I2(scl_counter_reg[1]),
        .I3(scl_counter_reg[2]),
        .I4(scl_counter_reg[4]),
        .O(p_0_in[4]));
  FDCE \scl_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(\scl_counter[0]_i_1_n_0 ),
        .Q(\scl_counter_reg_n_0_[0] ));
  FDCE \scl_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(p_0_in[1]),
        .Q(scl_counter_reg[1]));
  FDCE \scl_counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(p_0_in[2]),
        .Q(scl_counter_reg[2]));
  FDCE \scl_counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(p_0_in[3]),
        .Q(scl_counter_reg[3]));
  FDCE \scl_counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(p_0_in[4]),
        .Q(scl_counter_reg[4]));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    scl_oe_i_1
       (.I0(scl_oe_i_2_n_0),
        .I1(scl_oe_i_3_n_0),
        .I2(state[1]),
        .I3(scl_oe_i_4_n_0),
        .I4(scl_oe),
        .O(scl_oe_i_1_n_0));
  LUT6 #(
    .INIT(64'h000055550085FFDF)) 
    scl_oe_i_2
       (.I0(state[2]),
        .I1(p_0_in_0),
        .I2(state[1]),
        .I3(state[0]),
        .I4(in12),
        .I5(state[3]),
        .O(scl_oe_i_2_n_0));
  LUT6 #(
    .INIT(64'h013F000000000000)) 
    scl_oe_i_3
       (.I0(in12),
        .I1(state[3]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(p_0_in_0),
        .I5(\scl_phase_reg_n_0_[0] ),
        .O(scl_oe_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0004C05D)) 
    scl_oe_i_4
       (.I0(state[0]),
        .I1(p_0_in_0),
        .I2(\scl_phase_reg_n_0_[0] ),
        .I3(state[2]),
        .I4(state[3]),
        .O(scl_oe_i_4_n_0));
  FDPE scl_oe_reg
       (.C(clk),
        .CE(1'b1),
        .D(scl_oe_i_1_n_0),
        .PRE(busy_i_2_n_0),
        .Q(scl_oe));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \scl_phase[0]_i_1 
       (.I0(\scl_phase_reg_n_0_[0] ),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \scl_phase[1]_i_1 
       (.I0(\scl_phase_reg_n_0_[0] ),
        .I1(in12),
        .O(p_1_in[1]));
  FDCE \scl_phase_reg[0] 
       (.C(clk),
        .CE(load),
        .CLR(busy_i_2_n_0),
        .D(p_1_in[0]),
        .Q(\scl_phase_reg_n_0_[0] ));
  FDCE \scl_phase_reg[1] 
       (.C(clk),
        .CE(load),
        .CLR(busy_i_2_n_0),
        .D(p_1_in[1]),
        .Q(in12));
  LUT4 #(
    .INIT(16'h8000)) 
    scl_tick_i_1
       (.I0(scl_counter_reg[3]),
        .I1(scl_counter_reg[4]),
        .I2(scl_counter_reg[1]),
        .I3(scl_counter_reg[2]),
        .O(load));
  FDCE scl_tick_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(busy_i_2_n_0),
        .D(load),
        .Q(p_0_in_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    sda_oe_i_1
       (.I0(sda_oe_i_2_n_0),
        .I1(sda_oe_i_3_n_0),
        .I2(sda_oe_i_4_n_0),
        .I3(sda_oe_reg_i_5_n_0),
        .I4(sda_oe),
        .O(sda_oe_i_1_n_0));
  LUT6 #(
    .INIT(64'hC3F0F5F3FFFFF5FF)) 
    sda_oe_i_2
       (.I0(sda_oe_i_6_n_0),
        .I1(state[3]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\scl_phase_reg_n_0_[0] ),
        .O(sda_oe_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hCD13)) 
    sda_oe_i_3
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[3]),
        .O(sda_oe_i_3_n_0));
  LUT6 #(
    .INIT(64'hC3F0E0F200002002)) 
    sda_oe_i_4
       (.I0(in12),
        .I1(state[3]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(p_0_in_0),
        .O(sda_oe_i_4_n_0));
  LUT6 #(
    .INIT(64'h8C3F800F8C308000)) 
    sda_oe_i_6
       (.I0(\tx_byte_reg_n_0_[0] ),
        .I1(\bit_counter_reg_n_0_[2] ),
        .I2(\bit_counter_reg_n_0_[1] ),
        .I3(\bit_counter_reg_n_0_[0] ),
        .I4(data3),
        .I5(data0),
        .O(sda_oe_i_6_n_0));
  LUT6 #(
    .INIT(64'h00110000033F0303)) 
    sda_oe_i_7
       (.I0(\scl_phase_reg_n_0_[0] ),
        .I1(state[3]),
        .I2(state[0]),
        .I3(in12),
        .I4(p_0_in_0),
        .I5(state[2]),
        .O(sda_oe_i_7_n_0));
  LUT6 #(
    .INIT(64'h0002000000170000)) 
    sda_oe_i_8
       (.I0(state[2]),
        .I1(state[3]),
        .I2(state[0]),
        .I3(\scl_phase_reg_n_0_[0] ),
        .I4(p_0_in_0),
        .I5(in12),
        .O(sda_oe_i_8_n_0));
  FDPE sda_oe_reg
       (.C(clk),
        .CE(1'b1),
        .D(sda_oe_i_1_n_0),
        .PRE(busy_i_2_n_0),
        .Q(sda_oe));
  MUXF7 sda_oe_reg_i_5
       (.I0(sda_oe_i_7_n_0),
        .I1(sda_oe_i_8_n_0),
        .O(sda_oe_reg_i_5_n_0),
        .S(state[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hF504)) 
    \state_debug[0]_INST_0 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(state_debug[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hAE36)) 
    \state_debug[1]_INST_0 
       (.I0(state[3]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[0]),
        .O(state_debug[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h3504)) 
    \state_debug[2]_INST_0 
       (.I0(state[0]),
        .I1(state[3]),
        .I2(state[1]),
        .I3(state[2]),
        .O(state_debug[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hAAE0)) 
    \state_debug[3]_INST_0 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .O(state_debug[3]));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \temp_lsb[7]_i_1 
       (.I0(\temp_lsb[7]_i_2_n_0 ),
        .I1(\temp_lsb[7]_i_3_n_0 ),
        .I2(state[2]),
        .I3(p_0_in_0),
        .I4(\byte_counter_reg_n_0_[1] ),
        .I5(\scl_phase_reg_n_0_[0] ),
        .O(temp_lsb_2));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \temp_lsb[7]_i_2 
       (.I0(\bit_counter_reg_n_0_[1] ),
        .I1(\bit_counter_reg_n_0_[2] ),
        .I2(in12),
        .I3(\byte_counter_reg_n_0_[0] ),
        .I4(\byte_counter_reg_n_0_[2] ),
        .I5(\bit_counter_reg_n_0_[0] ),
        .O(\temp_lsb[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \temp_lsb[7]_i_3 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[3]),
        .O(\temp_lsb[7]_i_3_n_0 ));
  FDCE \temp_lsb_reg[0] 
       (.C(clk),
        .CE(temp_lsb_2),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[0] ),
        .Q(temp_lsb[0]));
  FDCE \temp_lsb_reg[1] 
       (.C(clk),
        .CE(temp_lsb_2),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[1] ),
        .Q(temp_lsb[1]));
  FDCE \temp_lsb_reg[2] 
       (.C(clk),
        .CE(temp_lsb_2),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[2] ),
        .Q(temp_lsb[2]));
  FDCE \temp_lsb_reg[3] 
       (.C(clk),
        .CE(temp_lsb_2),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[3] ),
        .Q(temp_lsb[3]));
  FDCE \temp_lsb_reg[4] 
       (.C(clk),
        .CE(temp_lsb_2),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[4] ),
        .Q(temp_lsb[4]));
  FDCE \temp_lsb_reg[5] 
       (.C(clk),
        .CE(temp_lsb_2),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[5] ),
        .Q(temp_lsb[5]));
  FDCE \temp_lsb_reg[6] 
       (.C(clk),
        .CE(temp_lsb_2),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[6] ),
        .Q(temp_lsb[6]));
  FDCE \temp_lsb_reg[7] 
       (.C(clk),
        .CE(temp_lsb_2),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[7] ),
        .Q(temp_lsb[7]));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \temp_msb[7]_i_1 
       (.I0(\temp_msb[7]_i_2_n_0 ),
        .I1(\bit_counter_reg_n_0_[0] ),
        .I2(\byte_counter_reg_n_0_[2] ),
        .I3(\byte_counter_reg_n_0_[1] ),
        .I4(\byte_counter_reg_n_0_[0] ),
        .I5(\temp_msb[7]_i_3_n_0 ),
        .O(temp_msb_4));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000008)) 
    \temp_msb[7]_i_2 
       (.I0(state[2]),
        .I1(p_0_in_0),
        .I2(state[3]),
        .I3(state[1]),
        .I4(state[0]),
        .O(\temp_msb[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \temp_msb[7]_i_3 
       (.I0(in12),
        .I1(\scl_phase_reg_n_0_[0] ),
        .I2(\bit_counter_reg_n_0_[1] ),
        .I3(\bit_counter_reg_n_0_[2] ),
        .O(\temp_msb[7]_i_3_n_0 ));
  FDCE \temp_msb_reg[0] 
       (.C(clk),
        .CE(temp_msb_4),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[0] ),
        .Q(temp_msb[0]));
  FDCE \temp_msb_reg[1] 
       (.C(clk),
        .CE(temp_msb_4),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[1] ),
        .Q(temp_msb[1]));
  FDCE \temp_msb_reg[2] 
       (.C(clk),
        .CE(temp_msb_4),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[2] ),
        .Q(temp_msb[2]));
  FDCE \temp_msb_reg[3] 
       (.C(clk),
        .CE(temp_msb_4),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[3] ),
        .Q(temp_msb[3]));
  FDCE \temp_msb_reg[4] 
       (.C(clk),
        .CE(temp_msb_4),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[4] ),
        .Q(temp_msb[4]));
  FDCE \temp_msb_reg[5] 
       (.C(clk),
        .CE(temp_msb_4),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[5] ),
        .Q(temp_msb[5]));
  FDCE \temp_msb_reg[6] 
       (.C(clk),
        .CE(temp_msb_4),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[6] ),
        .Q(temp_msb[6]));
  FDCE \temp_msb_reg[7] 
       (.C(clk),
        .CE(temp_msb_4),
        .CLR(busy_i_2_n_0),
        .D(\rx_byte_reg_n_0_[7] ),
        .Q(temp_msb[7]));
  LUT4 #(
    .INIT(16'h0008)) 
    \temperature_raw[15]_i_1 
       (.I0(state[3]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .O(\temperature_raw[15]_i_1_n_0 ));
  FDCE \temperature_raw_reg[0] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_lsb[0]),
        .Q(temperature_raw[0]));
  FDCE \temperature_raw_reg[10] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_msb[2]),
        .Q(temperature_raw[10]));
  FDCE \temperature_raw_reg[11] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_msb[3]),
        .Q(temperature_raw[11]));
  FDCE \temperature_raw_reg[12] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_msb[4]),
        .Q(temperature_raw[12]));
  FDCE \temperature_raw_reg[13] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_msb[5]),
        .Q(temperature_raw[13]));
  FDCE \temperature_raw_reg[14] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_msb[6]),
        .Q(temperature_raw[14]));
  FDCE \temperature_raw_reg[15] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_msb[7]),
        .Q(temperature_raw[15]));
  FDCE \temperature_raw_reg[1] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_lsb[1]),
        .Q(temperature_raw[1]));
  FDCE \temperature_raw_reg[2] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_lsb[2]),
        .Q(temperature_raw[2]));
  FDCE \temperature_raw_reg[3] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_lsb[3]),
        .Q(temperature_raw[3]));
  FDCE \temperature_raw_reg[4] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_lsb[4]),
        .Q(temperature_raw[4]));
  FDCE \temperature_raw_reg[5] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_lsb[5]),
        .Q(temperature_raw[5]));
  FDCE \temperature_raw_reg[6] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_lsb[6]),
        .Q(temperature_raw[6]));
  FDCE \temperature_raw_reg[7] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_lsb[7]),
        .Q(temperature_raw[7]));
  FDCE \temperature_raw_reg[8] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_msb[0]),
        .Q(temperature_raw[8]));
  FDCE \temperature_raw_reg[9] 
       (.C(clk),
        .CE(\temperature_raw[15]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(temp_msb[1]),
        .Q(temperature_raw[9]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFA8)) 
    \tx_byte[0]_i_1 
       (.I0(state[1]),
        .I1(\byte_counter_reg_n_0_[2] ),
        .I2(\byte_counter_reg_n_0_[1] ),
        .I3(state[3]),
        .O(\tx_byte[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \tx_byte[2]_i_1 
       (.I0(state[3]),
        .I1(state[1]),
        .I2(\byte_counter_reg_n_0_[1] ),
        .I3(\byte_counter_reg_n_0_[2] ),
        .I4(\byte_counter_reg_n_0_[0] ),
        .O(tx_byte0_in[2]));
  LUT6 #(
    .INIT(64'h0000080000003800)) 
    \tx_byte[7]_i_1 
       (.I0(\tx_byte[7]_i_3_n_0 ),
        .I1(state[0]),
        .I2(state[3]),
        .I3(\bit_counter[2]_i_3_n_0 ),
        .I4(state[2]),
        .I5(state[1]),
        .O(\tx_byte[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \tx_byte[7]_i_2 
       (.I0(state[1]),
        .I1(\byte_counter_reg_n_0_[1] ),
        .I2(\byte_counter_reg_n_0_[2] ),
        .O(tx_byte0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0BFF)) 
    \tx_byte[7]_i_3 
       (.I0(\byte_counter_reg_n_0_[0] ),
        .I1(\byte_counter_reg_n_0_[1] ),
        .I2(\byte_counter_reg_n_0_[2] ),
        .I3(state[1]),
        .O(\tx_byte[7]_i_3_n_0 ));
  FDCE \tx_byte_reg[0] 
       (.C(clk),
        .CE(\tx_byte[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(\tx_byte[0]_i_1_n_0 ),
        .Q(\tx_byte_reg_n_0_[0] ));
  FDCE \tx_byte_reg[2] 
       (.C(clk),
        .CE(\tx_byte[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(tx_byte0_in[2]),
        .Q(data3));
  FDCE \tx_byte_reg[7] 
       (.C(clk),
        .CE(\tx_byte[7]_i_1_n_0 ),
        .CLR(busy_i_2_n_0),
        .D(tx_byte0_in[7]),
        .Q(data0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
