-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Tue Feb 17 15:06:46 2026
-- Host        : LAPTOP-9FF0L5N1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_hdc302x_i2c_master_0_0_sim_netlist.vhdl
-- Design      : design_1_hdc302x_i2c_master_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu7cg-ffvc1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hdc302x_i2c_master is
  port (
    done : out STD_LOGIC;
    temperature_raw : out STD_LOGIC_VECTOR ( 15 downto 0 );
    humidity_raw : out STD_LOGIC_VECTOR ( 15 downto 0 );
    state_debug : out STD_LOGIC_VECTOR ( 3 downto 0 );
    busy : out STD_LOGIC;
    ack_error : out STD_LOGIC;
    sda : inout STD_LOGIC;
    scl : inout STD_LOGIC;
    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hdc302x_i2c_master;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hdc302x_i2c_master is
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_12_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_13_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_14_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_15_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_16_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_9_n_0\ : STD_LOGIC;
  signal \^ack_error\ : STD_LOGIC;
  signal ack_error_i_1_n_0 : STD_LOGIC;
  signal ack_error_i_2_n_0 : STD_LOGIC;
  signal ack_error_i_3_n_0 : STD_LOGIC;
  signal bit_counter : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \bit_counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_counter[2]_i_3_n_0\ : STD_LOGIC;
  signal \bit_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \^busy\ : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal busy_i_2_n_0 : STD_LOGIC;
  signal byte_counter : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \byte_counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \byte_counter[3]_i_3_n_0\ : STD_LOGIC;
  signal \byte_counter[3]_i_4_n_0\ : STD_LOGIC;
  signal \byte_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \byte_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \byte_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \byte_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal data0 : STD_LOGIC;
  signal data3 : STD_LOGIC;
  signal delay_counter : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \delay_counter0_carry__0_n_0\ : STD_LOGIC;
  signal \delay_counter0_carry__0_n_1\ : STD_LOGIC;
  signal \delay_counter0_carry__0_n_2\ : STD_LOGIC;
  signal \delay_counter0_carry__0_n_3\ : STD_LOGIC;
  signal \delay_counter0_carry__0_n_4\ : STD_LOGIC;
  signal \delay_counter0_carry__0_n_5\ : STD_LOGIC;
  signal \delay_counter0_carry__0_n_6\ : STD_LOGIC;
  signal \delay_counter0_carry__0_n_7\ : STD_LOGIC;
  signal \delay_counter0_carry__1_n_1\ : STD_LOGIC;
  signal \delay_counter0_carry__1_n_2\ : STD_LOGIC;
  signal \delay_counter0_carry__1_n_3\ : STD_LOGIC;
  signal \delay_counter0_carry__1_n_4\ : STD_LOGIC;
  signal \delay_counter0_carry__1_n_5\ : STD_LOGIC;
  signal \delay_counter0_carry__1_n_6\ : STD_LOGIC;
  signal \delay_counter0_carry__1_n_7\ : STD_LOGIC;
  signal delay_counter0_carry_n_0 : STD_LOGIC;
  signal delay_counter0_carry_n_1 : STD_LOGIC;
  signal delay_counter0_carry_n_2 : STD_LOGIC;
  signal delay_counter0_carry_n_3 : STD_LOGIC;
  signal delay_counter0_carry_n_4 : STD_LOGIC;
  signal delay_counter0_carry_n_5 : STD_LOGIC;
  signal delay_counter0_carry_n_6 : STD_LOGIC;
  signal delay_counter0_carry_n_7 : STD_LOGIC;
  signal \delay_counter[24]_i_1_n_0\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[12]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[13]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[14]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[15]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[16]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[17]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[18]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[19]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[20]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[21]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[22]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[23]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[24]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \delay_counter_reg_n_0_[9]\ : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal in11 : STD_LOGIC;
  signal in27 : STD_LOGIC_VECTOR ( 24 downto 1 );
  signal load : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal p_0_in_0 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal p_1_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rh_lsb : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rh_lsb_1 : STD_LOGIC;
  signal rh_msb : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rh_msb_2 : STD_LOGIC;
  signal \rx_byte[0]_i_1_n_0\ : STD_LOGIC;
  signal \rx_byte[1]_i_1_n_0\ : STD_LOGIC;
  signal \rx_byte[2]_i_1_n_0\ : STD_LOGIC;
  signal \rx_byte[3]_i_1_n_0\ : STD_LOGIC;
  signal \rx_byte[4]_i_1_n_0\ : STD_LOGIC;
  signal \rx_byte[5]_i_1_n_0\ : STD_LOGIC;
  signal \rx_byte[6]_i_1_n_0\ : STD_LOGIC;
  signal \rx_byte[7]_i_1_n_0\ : STD_LOGIC;
  signal \rx_byte[7]_i_2_n_0\ : STD_LOGIC;
  signal \rx_byte_reg_n_0_[0]\ : STD_LOGIC;
  signal \rx_byte_reg_n_0_[1]\ : STD_LOGIC;
  signal \rx_byte_reg_n_0_[2]\ : STD_LOGIC;
  signal \rx_byte_reg_n_0_[3]\ : STD_LOGIC;
  signal \rx_byte_reg_n_0_[4]\ : STD_LOGIC;
  signal \rx_byte_reg_n_0_[5]\ : STD_LOGIC;
  signal \rx_byte_reg_n_0_[6]\ : STD_LOGIC;
  signal \rx_byte_reg_n_0_[7]\ : STD_LOGIC;
  signal \scl_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal scl_counter_reg : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \scl_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal scl_oe : STD_LOGIC;
  signal scl_oe_i_1_n_0 : STD_LOGIC;
  signal scl_oe_i_2_n_0 : STD_LOGIC;
  signal scl_oe_i_3_n_0 : STD_LOGIC;
  signal scl_oe_i_4_n_0 : STD_LOGIC;
  signal \scl_phase_reg_n_0_[0]\ : STD_LOGIC;
  signal sda_in : STD_LOGIC;
  signal sda_oe : STD_LOGIC;
  signal sda_oe_i_10_n_0 : STD_LOGIC;
  signal sda_oe_i_11_n_0 : STD_LOGIC;
  signal sda_oe_i_1_n_0 : STD_LOGIC;
  signal sda_oe_i_2_n_0 : STD_LOGIC;
  signal sda_oe_i_3_n_0 : STD_LOGIC;
  signal sda_oe_i_4_n_0 : STD_LOGIC;
  signal sda_oe_i_5_n_0 : STD_LOGIC;
  signal sda_oe_i_6_n_0 : STD_LOGIC;
  signal sda_oe_i_7_n_0 : STD_LOGIC;
  signal sda_oe_i_8_n_0 : STD_LOGIC;
  signal sda_oe_i_9_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal temp_lsb : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \temp_lsb[7]_i_2_n_0\ : STD_LOGIC;
  signal temp_lsb_3 : STD_LOGIC;
  signal temp_msb : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal temp_msb_4 : STD_LOGIC;
  signal \temperature_raw[15]_i_1_n_0\ : STD_LOGIC;
  signal tx_byte : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \tx_byte[7]_i_1_n_0\ : STD_LOGIC;
  signal \tx_byte[7]_i_3_n_0\ : STD_LOGIC;
  signal \tx_byte_reg_n_0_[0]\ : STD_LOGIC;
  signal NLW_IOBUF_SCL_O_UNCONNECTED : STD_LOGIC;
  signal \NLW_delay_counter0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_10\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_4\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_5\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_9\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "IDLE:0000,READ_BYTE:0100,SEND_MASTER_NACK:0101,RESTART:1000,SEND_MASTER_ACK:1010,WAIT_MEASUREMENT:0111,WAIT_ACK:0011,STOP:0110,SEND_BYTE:0010,ERROR:1011,COMPLETE:1001,START:0001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "IDLE:0000,READ_BYTE:0100,SEND_MASTER_NACK:0101,RESTART:1000,SEND_MASTER_ACK:1010,WAIT_MEASUREMENT:0111,WAIT_ACK:0011,STOP:0110,SEND_BYTE:0010,ERROR:1011,COMPLETE:1001,START:0001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "IDLE:0000,READ_BYTE:0100,SEND_MASTER_NACK:0101,RESTART:1000,SEND_MASTER_ACK:1010,WAIT_MEASUREMENT:0111,WAIT_ACK:0011,STOP:0110,SEND_BYTE:0010,ERROR:1011,COMPLETE:1001,START:0001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[3]\ : label is "IDLE:0000,READ_BYTE:0100,SEND_MASTER_NACK:0101,RESTART:1000,SEND_MASTER_ACK:1010,WAIT_MEASUREMENT:0111,WAIT_ACK:0011,STOP:0110,SEND_BYTE:0010,ERROR:1011,COMPLETE:1001,START:0001";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of IOBUF_SCL : label is "PRIMITIVE";
  attribute BOX_TYPE of IOBUF_SDA : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of ack_error_i_3 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \bit_counter[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bit_counter[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bit_counter[2]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \byte_counter[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \byte_counter[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \byte_counter[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \byte_counter[3]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \byte_counter[3]_i_4\ : label is "soft_lutpair10";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of delay_counter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \delay_counter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \delay_counter0_carry__1\ : label is 35;
  attribute SOFT_HLUTNM of \delay_counter[0]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \delay_counter[10]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \delay_counter[11]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \delay_counter[12]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \delay_counter[13]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \delay_counter[14]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \delay_counter[15]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \delay_counter[16]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \delay_counter[17]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \delay_counter[18]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \delay_counter[19]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \delay_counter[1]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \delay_counter[20]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \delay_counter[21]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \delay_counter[22]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \delay_counter[23]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \delay_counter[24]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \delay_counter[2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \delay_counter[3]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \delay_counter[4]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \delay_counter[5]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \delay_counter[6]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \delay_counter[7]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \delay_counter[8]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \delay_counter[9]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \scl_counter[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \scl_counter[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \scl_counter[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \scl_counter[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of scl_oe_i_4 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \scl_phase[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \scl_phase[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of sda_oe_i_10 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of sda_oe_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of sda_oe_i_8 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \state_debug[0]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \state_debug[1]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \state_debug[2]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \state_debug[3]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \temp_lsb[7]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \tx_byte[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \tx_byte[7]_i_3\ : label is "soft_lutpair11";
begin
  ack_error <= \^ack_error\;
  busy <= \^busy\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F30000A0FF"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2_n_0\,
      I1 => \FSM_sequential_state[3]_i_10_n_0\,
      I2 => state(1),
      I3 => state(0),
      I4 => state(3),
      I5 => state(2),
      O => next_state(0)
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[2]\,
      I1 => \byte_counter_reg_n_0_[3]\,
      I2 => sda_in,
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AABEABBE"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_2_n_0\,
      I1 => state(3),
      I2 => state(0),
      I3 => state(1),
      I4 => \FSM_sequential_state[3]_i_9_n_0\,
      O => next_state(1)
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABEAAAEAABAAAAA"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_3_n_0\,
      I1 => state(1),
      I2 => state(2),
      I3 => state(3),
      I4 => \FSM_sequential_state[3]_i_10_n_0\,
      I5 => \FSM_sequential_state[3]_i_9_n_0\,
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000D0000"
    )
        port map (
      I0 => state(0),
      I1 => sda_in,
      I2 => state(2),
      I3 => state(3),
      I4 => state(1),
      O => \FSM_sequential_state[1]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAEAEAEAEFFAEAE"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_2_n_0\,
      I1 => \FSM_sequential_state[2]_i_3_n_0\,
      I2 => \FSM_sequential_state[3]_i_10_n_0\,
      I3 => \FSM_sequential_state[2]_i_4_n_0\,
      I4 => state(2),
      I5 => \FSM_sequential_state[3]_i_9_n_0\,
      O => next_state(2)
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00040F00F0F00000"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2_n_0\,
      I1 => \byte_counter_reg_n_0_[1]\,
      I2 => state(3),
      I3 => state(2),
      I4 => state(1),
      I5 => state(0),
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      O => \FSM_sequential_state[2]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      O => \FSM_sequential_state[2]_i_4_n_0\
    );
\FSM_sequential_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBABABAAA"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_3_n_0\,
      I1 => \FSM_sequential_state[3]_i_4_n_0\,
      I2 => \FSM_sequential_state[3]_i_5_n_0\,
      I3 => \FSM_sequential_state[3]_i_6_n_0\,
      I4 => \FSM_sequential_state[3]_i_7_n_0\,
      I5 => \FSM_sequential_state[3]_i_8_n_0\,
      O => \FSM_sequential_state[3]_i_1_n_0\
    );
\FSM_sequential_state[3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[3]\,
      I1 => \byte_counter_reg_n_0_[2]\,
      I2 => \byte_counter_reg_n_0_[0]\,
      I3 => \byte_counter_reg_n_0_[1]\,
      O => \FSM_sequential_state[3]_i_10_n_0\
    );
\FSM_sequential_state[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040404040404000"
    )
        port map (
      I0 => state(3),
      I1 => state(0),
      I2 => state(1),
      I3 => sda_in,
      I4 => \byte_counter_reg_n_0_[3]\,
      I5 => \byte_counter_reg_n_0_[2]\,
      O => \FSM_sequential_state[3]_i_11_n_0\
    );
\FSM_sequential_state[3]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \delay_counter_reg_n_0_[20]\,
      I1 => \delay_counter_reg_n_0_[21]\,
      O => \FSM_sequential_state[3]_i_12_n_0\
    );
\FSM_sequential_state[3]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \delay_counter_reg_n_0_[10]\,
      I1 => \delay_counter_reg_n_0_[9]\,
      I2 => \delay_counter_reg_n_0_[11]\,
      O => \FSM_sequential_state[3]_i_13_n_0\
    );
\FSM_sequential_state[3]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88808080"
    )
        port map (
      I0 => \delay_counter_reg_n_0_[8]\,
      I1 => \delay_counter_reg_n_0_[7]\,
      I2 => \delay_counter_reg_n_0_[6]\,
      I3 => \delay_counter_reg_n_0_[4]\,
      I4 => \delay_counter_reg_n_0_[5]\,
      O => \FSM_sequential_state[3]_i_14_n_0\
    );
\FSM_sequential_state[3]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \delay_counter_reg_n_0_[14]\,
      I1 => \delay_counter_reg_n_0_[13]\,
      I2 => \delay_counter_reg_n_0_[12]\,
      O => \FSM_sequential_state[3]_i_15_n_0\
    );
\FSM_sequential_state[3]_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \delay_counter_reg_n_0_[17]\,
      I1 => \delay_counter_reg_n_0_[16]\,
      I2 => \delay_counter_reg_n_0_[19]\,
      O => \FSM_sequential_state[3]_i_16_n_0\
    );
\FSM_sequential_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFE300E000"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_9_n_0\,
      I1 => state(0),
      I2 => state(1),
      I3 => \FSM_sequential_state[3]_i_5_n_0\,
      I4 => \FSM_sequential_state[3]_i_10_n_0\,
      I5 => \FSM_sequential_state[3]_i_11_n_0\,
      O => next_state(3)
    );
\FSM_sequential_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03220022FFECCC20"
    )
        port map (
      I0 => \byte_counter[3]_i_3_n_0\,
      I1 => state(3),
      I2 => state(1),
      I3 => state(0),
      I4 => \bit_counter[2]_i_3_n_0\,
      I5 => state(2),
      O => \FSM_sequential_state[3]_i_3_n_0\
    );
\FSM_sequential_state[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      O => \FSM_sequential_state[3]_i_4_n_0\
    );
\FSM_sequential_state[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      O => \FSM_sequential_state[3]_i_5_n_0\
    );
\FSM_sequential_state[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEAAAAAAAAAA"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_12_n_0\,
      I1 => \FSM_sequential_state[3]_i_13_n_0\,
      I2 => \FSM_sequential_state[3]_i_14_n_0\,
      I3 => \FSM_sequential_state[3]_i_15_n_0\,
      I4 => \delay_counter_reg_n_0_[15]\,
      I5 => \FSM_sequential_state[3]_i_16_n_0\,
      O => \FSM_sequential_state[3]_i_6_n_0\
    );
\FSM_sequential_state[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEA"
    )
        port map (
      I0 => \delay_counter_reg_n_0_[24]\,
      I1 => \delay_counter_reg_n_0_[19]\,
      I2 => \delay_counter_reg_n_0_[18]\,
      I3 => \delay_counter_reg_n_0_[23]\,
      I4 => \delay_counter_reg_n_0_[22]\,
      O => \FSM_sequential_state[3]_i_7_n_0\
    );
\FSM_sequential_state[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000A0000C"
    )
        port map (
      I0 => \bit_counter[2]_i_3_n_0\,
      I1 => start,
      I2 => state(2),
      I3 => state(3),
      I4 => state(1),
      I5 => state(0),
      O => \FSM_sequential_state[3]_i_8_n_0\
    );
\FSM_sequential_state[3]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[2]\,
      I1 => \byte_counter_reg_n_0_[3]\,
      I2 => \byte_counter_reg_n_0_[0]\,
      I3 => \byte_counter_reg_n_0_[1]\,
      O => \FSM_sequential_state[3]_i_9_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[3]_i_1_n_0\,
      D => next_state(0),
      Q => state(0),
      R => busy_i_2_n_0
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[3]_i_1_n_0\,
      D => next_state(1),
      Q => state(1),
      R => busy_i_2_n_0
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[3]_i_1_n_0\,
      D => next_state(2),
      Q => state(2),
      R => busy_i_2_n_0
    );
\FSM_sequential_state_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \FSM_sequential_state[3]_i_1_n_0\,
      D => next_state(3),
      Q => state(3),
      R => busy_i_2_n_0
    );
IOBUF_SCL: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => scl,
      O => NLW_IOBUF_SCL_O_UNCONNECTED,
      T => scl_oe
    );
IOBUF_SDA: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => sda,
      O => sda_in,
      T => sda_oe
    );
ack_error_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C8FFFF00C80000"
    )
        port map (
      I0 => state(3),
      I1 => state(1),
      I2 => sda_in,
      I3 => state(2),
      I4 => ack_error_i_2_n_0,
      I5 => \^ack_error\,
      O => ack_error_i_1_n_0
    );
ack_error_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0E0A000000000505"
    )
        port map (
      I0 => state(3),
      I1 => ack_error_i_3_n_0,
      I2 => state(2),
      I3 => sda_in,
      I4 => state(1),
      I5 => state(0),
      O => ack_error_i_2_n_0
    );
ack_error_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => in11,
      I1 => p_0_in_0(2),
      I2 => \scl_phase_reg_n_0_[0]\,
      O => ack_error_i_3_n_0
    );
ack_error_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => ack_error_i_1_n_0,
      Q => \^ack_error\
    );
\bit_counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"000E"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(3),
      I3 => \bit_counter_reg_n_0_[0]\,
      O => bit_counter(0)
    );
\bit_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000E0E00"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(3),
      I3 => \bit_counter_reg_n_0_[0]\,
      I4 => \bit_counter_reg_n_0_[1]\,
      O => bit_counter(1)
    );
\bit_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00101071"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \bit_counter[2]_i_3_n_0\,
      I3 => state(2),
      I4 => state(3),
      O => \bit_counter[2]_i_1_n_0\
    );
\bit_counter[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0054545454000000"
    )
        port map (
      I0 => state(3),
      I1 => state(1),
      I2 => state(2),
      I3 => \bit_counter_reg_n_0_[1]\,
      I4 => \bit_counter_reg_n_0_[0]\,
      I5 => \bit_counter_reg_n_0_[2]\,
      O => bit_counter(2)
    );
\bit_counter[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => in11,
      I1 => p_0_in_0(2),
      I2 => \scl_phase_reg_n_0_[0]\,
      O => \bit_counter[2]_i_3_n_0\
    );
\bit_counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_counter[2]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => bit_counter(0),
      Q => \bit_counter_reg_n_0_[0]\
    );
\bit_counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_counter[2]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => bit_counter(1),
      Q => \bit_counter_reg_n_0_[1]\
    );
\bit_counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_counter[2]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => bit_counter(2),
      Q => \bit_counter_reg_n_0_[2]\
    );
busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF33FE00000002"
    )
        port map (
      I0 => start,
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => \^busy\,
      O => busy_i_1_n_0
    );
busy_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => busy_i_2_n_0
    );
busy_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => busy_i_1_n_0,
      Q => \^busy\
    );
\byte_counter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => \byte_counter_reg_n_0_[0]\,
      O => byte_counter(0)
    );
\byte_counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6660"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[1]\,
      I1 => \byte_counter_reg_n_0_[0]\,
      I2 => state(2),
      I3 => state(1),
      O => byte_counter(1)
    );
\byte_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0EEEE000"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => \byte_counter_reg_n_0_[0]\,
      I3 => \byte_counter_reg_n_0_[1]\,
      I4 => \byte_counter_reg_n_0_[2]\,
      O => byte_counter(2)
    );
\byte_counter[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000202C303"
    )
        port map (
      I0 => \byte_counter[3]_i_3_n_0\,
      I1 => state(0),
      I2 => state(1),
      I3 => \bit_counter[2]_i_3_n_0\,
      I4 => state(2),
      I5 => state(3),
      O => \byte_counter[3]_i_1_n_0\
    );
\byte_counter[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F800000"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[1]\,
      I1 => \byte_counter_reg_n_0_[0]\,
      I2 => \byte_counter_reg_n_0_[2]\,
      I3 => \byte_counter_reg_n_0_[3]\,
      I4 => \byte_counter[3]_i_4_n_0\,
      O => byte_counter(3)
    );
\byte_counter[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \bit_counter_reg_n_0_[1]\,
      I1 => \bit_counter_reg_n_0_[0]\,
      I2 => \bit_counter_reg_n_0_[2]\,
      I3 => \scl_phase_reg_n_0_[0]\,
      I4 => p_0_in_0(2),
      I5 => in11,
      O => \byte_counter[3]_i_3_n_0\
    );
\byte_counter[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(3),
      O => \byte_counter[3]_i_4_n_0\
    );
\byte_counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \byte_counter[3]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => byte_counter(0),
      Q => \byte_counter_reg_n_0_[0]\
    );
\byte_counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \byte_counter[3]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => byte_counter(1),
      Q => \byte_counter_reg_n_0_[1]\
    );
\byte_counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \byte_counter[3]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => byte_counter(2),
      Q => \byte_counter_reg_n_0_[2]\
    );
\byte_counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \byte_counter[3]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => byte_counter(3),
      Q => \byte_counter_reg_n_0_[3]\
    );
delay_counter0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => \delay_counter_reg_n_0_[0]\,
      CI_TOP => '0',
      CO(7) => delay_counter0_carry_n_0,
      CO(6) => delay_counter0_carry_n_1,
      CO(5) => delay_counter0_carry_n_2,
      CO(4) => delay_counter0_carry_n_3,
      CO(3) => delay_counter0_carry_n_4,
      CO(2) => delay_counter0_carry_n_5,
      CO(1) => delay_counter0_carry_n_6,
      CO(0) => delay_counter0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => in27(8 downto 1),
      S(7) => \delay_counter_reg_n_0_[8]\,
      S(6) => \delay_counter_reg_n_0_[7]\,
      S(5) => \delay_counter_reg_n_0_[6]\,
      S(4) => \delay_counter_reg_n_0_[5]\,
      S(3) => \delay_counter_reg_n_0_[4]\,
      S(2) => \delay_counter_reg_n_0_[3]\,
      S(1) => \delay_counter_reg_n_0_[2]\,
      S(0) => \delay_counter_reg_n_0_[1]\
    );
\delay_counter0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => delay_counter0_carry_n_0,
      CI_TOP => '0',
      CO(7) => \delay_counter0_carry__0_n_0\,
      CO(6) => \delay_counter0_carry__0_n_1\,
      CO(5) => \delay_counter0_carry__0_n_2\,
      CO(4) => \delay_counter0_carry__0_n_3\,
      CO(3) => \delay_counter0_carry__0_n_4\,
      CO(2) => \delay_counter0_carry__0_n_5\,
      CO(1) => \delay_counter0_carry__0_n_6\,
      CO(0) => \delay_counter0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => in27(16 downto 9),
      S(7) => \delay_counter_reg_n_0_[16]\,
      S(6) => \delay_counter_reg_n_0_[15]\,
      S(5) => \delay_counter_reg_n_0_[14]\,
      S(4) => \delay_counter_reg_n_0_[13]\,
      S(3) => \delay_counter_reg_n_0_[12]\,
      S(2) => \delay_counter_reg_n_0_[11]\,
      S(1) => \delay_counter_reg_n_0_[10]\,
      S(0) => \delay_counter_reg_n_0_[9]\
    );
\delay_counter0_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \delay_counter0_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_delay_counter0_carry__1_CO_UNCONNECTED\(7),
      CO(6) => \delay_counter0_carry__1_n_1\,
      CO(5) => \delay_counter0_carry__1_n_2\,
      CO(4) => \delay_counter0_carry__1_n_3\,
      CO(3) => \delay_counter0_carry__1_n_4\,
      CO(2) => \delay_counter0_carry__1_n_5\,
      CO(1) => \delay_counter0_carry__1_n_6\,
      CO(0) => \delay_counter0_carry__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => in27(24 downto 17),
      S(7) => \delay_counter_reg_n_0_[24]\,
      S(6) => \delay_counter_reg_n_0_[23]\,
      S(5) => \delay_counter_reg_n_0_[22]\,
      S(4) => \delay_counter_reg_n_0_[21]\,
      S(3) => \delay_counter_reg_n_0_[20]\,
      S(2) => \delay_counter_reg_n_0_[19]\,
      S(1) => \delay_counter_reg_n_0_[18]\,
      S(0) => \delay_counter_reg_n_0_[17]\
    );
\delay_counter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(2),
      I1 => \delay_counter_reg_n_0_[0]\,
      O => delay_counter(0)
    );
\delay_counter[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(10),
      O => delay_counter(10)
    );
\delay_counter[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(11),
      O => delay_counter(11)
    );
\delay_counter[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(12),
      O => delay_counter(12)
    );
\delay_counter[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(13),
      O => delay_counter(13)
    );
\delay_counter[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(14),
      O => delay_counter(14)
    );
\delay_counter[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(15),
      O => delay_counter(15)
    );
\delay_counter[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(16),
      O => delay_counter(16)
    );
\delay_counter[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(17),
      O => delay_counter(17)
    );
\delay_counter[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(18),
      O => delay_counter(18)
    );
\delay_counter[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(19),
      O => delay_counter(19)
    );
\delay_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(1),
      O => delay_counter(1)
    );
\delay_counter[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(20),
      O => delay_counter(20)
    );
\delay_counter[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(21),
      O => delay_counter(21)
    );
\delay_counter[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(22),
      O => delay_counter(22)
    );
\delay_counter[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(23),
      O => delay_counter(23)
    );
\delay_counter[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0081"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      I3 => state(3),
      O => \delay_counter[24]_i_1_n_0\
    );
\delay_counter[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(24),
      O => delay_counter(24)
    );
\delay_counter[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(2),
      O => delay_counter(2)
    );
\delay_counter[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(3),
      O => delay_counter(3)
    );
\delay_counter[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(4),
      O => delay_counter(4)
    );
\delay_counter[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(5),
      O => delay_counter(5)
    );
\delay_counter[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(6),
      O => delay_counter(6)
    );
\delay_counter[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(7),
      O => delay_counter(7)
    );
\delay_counter[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(8),
      O => delay_counter(8)
    );
\delay_counter[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(2),
      I1 => in27(9),
      O => delay_counter(9)
    );
\delay_counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(0),
      Q => \delay_counter_reg_n_0_[0]\
    );
\delay_counter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(10),
      Q => \delay_counter_reg_n_0_[10]\
    );
\delay_counter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(11),
      Q => \delay_counter_reg_n_0_[11]\
    );
\delay_counter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(12),
      Q => \delay_counter_reg_n_0_[12]\
    );
\delay_counter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(13),
      Q => \delay_counter_reg_n_0_[13]\
    );
\delay_counter_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(14),
      Q => \delay_counter_reg_n_0_[14]\
    );
\delay_counter_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(15),
      Q => \delay_counter_reg_n_0_[15]\
    );
\delay_counter_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(16),
      Q => \delay_counter_reg_n_0_[16]\
    );
\delay_counter_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(17),
      Q => \delay_counter_reg_n_0_[17]\
    );
\delay_counter_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(18),
      Q => \delay_counter_reg_n_0_[18]\
    );
\delay_counter_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(19),
      Q => \delay_counter_reg_n_0_[19]\
    );
\delay_counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(1),
      Q => \delay_counter_reg_n_0_[1]\
    );
\delay_counter_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(20),
      Q => \delay_counter_reg_n_0_[20]\
    );
\delay_counter_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(21),
      Q => \delay_counter_reg_n_0_[21]\
    );
\delay_counter_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(22),
      Q => \delay_counter_reg_n_0_[22]\
    );
\delay_counter_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(23),
      Q => \delay_counter_reg_n_0_[23]\
    );
\delay_counter_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(24),
      Q => \delay_counter_reg_n_0_[24]\
    );
\delay_counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(2),
      Q => \delay_counter_reg_n_0_[2]\
    );
\delay_counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(3),
      Q => \delay_counter_reg_n_0_[3]\
    );
\delay_counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(4),
      Q => \delay_counter_reg_n_0_[4]\
    );
\delay_counter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(5),
      Q => \delay_counter_reg_n_0_[5]\
    );
\delay_counter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(6),
      Q => \delay_counter_reg_n_0_[6]\
    );
\delay_counter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(7),
      Q => \delay_counter_reg_n_0_[7]\
    );
\delay_counter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(8),
      Q => \delay_counter_reg_n_0_[8]\
    );
\delay_counter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \delay_counter[24]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => delay_counter(9),
      Q => \delay_counter_reg_n_0_[9]\
    );
done_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(0),
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => done_i_1_n_0,
      Q => done
    );
\humidity_raw_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_lsb(0),
      Q => humidity_raw(0)
    );
\humidity_raw_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_msb(2),
      Q => humidity_raw(10)
    );
\humidity_raw_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_msb(3),
      Q => humidity_raw(11)
    );
\humidity_raw_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_msb(4),
      Q => humidity_raw(12)
    );
\humidity_raw_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_msb(5),
      Q => humidity_raw(13)
    );
\humidity_raw_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_msb(6),
      Q => humidity_raw(14)
    );
\humidity_raw_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_msb(7),
      Q => humidity_raw(15)
    );
\humidity_raw_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_lsb(1),
      Q => humidity_raw(1)
    );
\humidity_raw_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_lsb(2),
      Q => humidity_raw(2)
    );
\humidity_raw_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_lsb(3),
      Q => humidity_raw(3)
    );
\humidity_raw_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_lsb(4),
      Q => humidity_raw(4)
    );
\humidity_raw_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_lsb(5),
      Q => humidity_raw(5)
    );
\humidity_raw_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_lsb(6),
      Q => humidity_raw(6)
    );
\humidity_raw_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_lsb(7),
      Q => humidity_raw(7)
    );
\humidity_raw_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_msb(0),
      Q => humidity_raw(8)
    );
\humidity_raw_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => rh_msb(1),
      Q => humidity_raw(9)
    );
\rh_lsb[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[2]\,
      I1 => \byte_counter_reg_n_0_[3]\,
      I2 => \byte_counter_reg_n_0_[0]\,
      I3 => \byte_counter_reg_n_0_[1]\,
      I4 => \temp_lsb[7]_i_2_n_0\,
      O => rh_lsb_1
    );
\rh_lsb_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_lsb_1,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[0]\,
      Q => rh_lsb(0)
    );
\rh_lsb_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_lsb_1,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[1]\,
      Q => rh_lsb(1)
    );
\rh_lsb_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_lsb_1,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[2]\,
      Q => rh_lsb(2)
    );
\rh_lsb_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_lsb_1,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[3]\,
      Q => rh_lsb(3)
    );
\rh_lsb_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_lsb_1,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[4]\,
      Q => rh_lsb(4)
    );
\rh_lsb_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_lsb_1,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[5]\,
      Q => rh_lsb(5)
    );
\rh_lsb_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_lsb_1,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[6]\,
      Q => rh_lsb(6)
    );
\rh_lsb_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_lsb_1,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[7]\,
      Q => rh_lsb(7)
    );
\rh_msb[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[1]\,
      I1 => \byte_counter_reg_n_0_[0]\,
      I2 => \byte_counter_reg_n_0_[2]\,
      I3 => \byte_counter_reg_n_0_[3]\,
      I4 => \temp_lsb[7]_i_2_n_0\,
      O => rh_msb_2
    );
\rh_msb_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_msb_2,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[0]\,
      Q => rh_msb(0)
    );
\rh_msb_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_msb_2,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[1]\,
      Q => rh_msb(1)
    );
\rh_msb_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_msb_2,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[2]\,
      Q => rh_msb(2)
    );
\rh_msb_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_msb_2,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[3]\,
      Q => rh_msb(3)
    );
\rh_msb_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_msb_2,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[4]\,
      Q => rh_msb(4)
    );
\rh_msb_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_msb_2,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[5]\,
      Q => rh_msb(5)
    );
\rh_msb_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_msb_2,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[6]\,
      Q => rh_msb(6)
    );
\rh_msb_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => rh_msb_2,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[7]\,
      Q => rh_msb(7)
    );
\rx_byte[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => sda_in,
      I1 => \rx_byte[7]_i_2_n_0\,
      I2 => \bit_counter_reg_n_0_[1]\,
      I3 => \bit_counter_reg_n_0_[0]\,
      I4 => \bit_counter_reg_n_0_[2]\,
      I5 => \rx_byte_reg_n_0_[0]\,
      O => \rx_byte[0]_i_1_n_0\
    );
\rx_byte[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF20000000"
    )
        port map (
      I0 => sda_in,
      I1 => \bit_counter_reg_n_0_[0]\,
      I2 => \bit_counter_reg_n_0_[1]\,
      I3 => \bit_counter_reg_n_0_[2]\,
      I4 => \rx_byte[7]_i_2_n_0\,
      I5 => \rx_byte_reg_n_0_[1]\,
      O => \rx_byte[1]_i_1_n_0\
    );
\rx_byte[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => sda_in,
      I1 => \bit_counter_reg_n_0_[0]\,
      I2 => \bit_counter_reg_n_0_[2]\,
      I3 => \bit_counter_reg_n_0_[1]\,
      I4 => \rx_byte[7]_i_2_n_0\,
      I5 => \rx_byte_reg_n_0_[2]\,
      O => \rx_byte[2]_i_1_n_0\
    );
\rx_byte[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFF02000000"
    )
        port map (
      I0 => sda_in,
      I1 => \bit_counter_reg_n_0_[1]\,
      I2 => \bit_counter_reg_n_0_[0]\,
      I3 => \bit_counter_reg_n_0_[2]\,
      I4 => \rx_byte[7]_i_2_n_0\,
      I5 => \rx_byte_reg_n_0_[3]\,
      O => \rx_byte[3]_i_1_n_0\
    );
\rx_byte[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF20000000"
    )
        port map (
      I0 => sda_in,
      I1 => \bit_counter_reg_n_0_[2]\,
      I2 => \rx_byte[7]_i_2_n_0\,
      I3 => \bit_counter_reg_n_0_[0]\,
      I4 => \bit_counter_reg_n_0_[1]\,
      I5 => \rx_byte_reg_n_0_[4]\,
      O => \rx_byte[4]_i_1_n_0\
    );
\rx_byte[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => sda_in,
      I1 => \bit_counter_reg_n_0_[0]\,
      I2 => \bit_counter_reg_n_0_[1]\,
      I3 => \bit_counter_reg_n_0_[2]\,
      I4 => \rx_byte[7]_i_2_n_0\,
      I5 => \rx_byte_reg_n_0_[5]\,
      O => \rx_byte[5]_i_1_n_0\
    );
\rx_byte[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => sda_in,
      I1 => \bit_counter_reg_n_0_[1]\,
      I2 => \bit_counter_reg_n_0_[0]\,
      I3 => \bit_counter_reg_n_0_[2]\,
      I4 => \rx_byte[7]_i_2_n_0\,
      I5 => \rx_byte_reg_n_0_[6]\,
      O => \rx_byte[6]_i_1_n_0\
    );
\rx_byte[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEF00000020"
    )
        port map (
      I0 => sda_in,
      I1 => \bit_counter_reg_n_0_[2]\,
      I2 => \rx_byte[7]_i_2_n_0\,
      I3 => \bit_counter_reg_n_0_[0]\,
      I4 => \bit_counter_reg_n_0_[1]\,
      I5 => \rx_byte_reg_n_0_[7]\,
      O => \rx_byte[7]_i_1_n_0\
    );
\rx_byte[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000004000000000"
    )
        port map (
      I0 => \scl_phase_reg_n_0_[0]\,
      I1 => p_0_in_0(2),
      I2 => in11,
      I3 => state(0),
      I4 => state(1),
      I5 => \FSM_sequential_state[3]_i_5_n_0\,
      O => \rx_byte[7]_i_2_n_0\
    );
\rx_byte_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \rx_byte[0]_i_1_n_0\,
      Q => \rx_byte_reg_n_0_[0]\
    );
\rx_byte_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \rx_byte[1]_i_1_n_0\,
      Q => \rx_byte_reg_n_0_[1]\
    );
\rx_byte_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \rx_byte[2]_i_1_n_0\,
      Q => \rx_byte_reg_n_0_[2]\
    );
\rx_byte_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \rx_byte[3]_i_1_n_0\,
      Q => \rx_byte_reg_n_0_[3]\
    );
\rx_byte_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \rx_byte[4]_i_1_n_0\,
      Q => \rx_byte_reg_n_0_[4]\
    );
\rx_byte_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \rx_byte[5]_i_1_n_0\,
      Q => \rx_byte_reg_n_0_[5]\
    );
\rx_byte_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \rx_byte[6]_i_1_n_0\,
      Q => \rx_byte_reg_n_0_[6]\
    );
\rx_byte_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \rx_byte[7]_i_1_n_0\,
      Q => \rx_byte_reg_n_0_[7]\
    );
\scl_counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007FFF"
    )
        port map (
      I0 => scl_counter_reg(3),
      I1 => scl_counter_reg(4),
      I2 => scl_counter_reg(1),
      I3 => scl_counter_reg(2),
      I4 => \scl_counter_reg_n_0_[0]\,
      O => \scl_counter[0]_i_1_n_0\
    );
\scl_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1555AAAA"
    )
        port map (
      I0 => \scl_counter_reg_n_0_[0]\,
      I1 => scl_counter_reg(2),
      I2 => scl_counter_reg(3),
      I3 => scl_counter_reg(4),
      I4 => scl_counter_reg(1),
      O => p_0_in(1)
    );
\scl_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07FFF000"
    )
        port map (
      I0 => scl_counter_reg(3),
      I1 => scl_counter_reg(4),
      I2 => \scl_counter_reg_n_0_[0]\,
      I3 => scl_counter_reg(1),
      I4 => scl_counter_reg(2),
      O => p_0_in(2)
    );
\scl_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1CF0F0F0"
    )
        port map (
      I0 => scl_counter_reg(4),
      I1 => \scl_counter_reg_n_0_[0]\,
      I2 => scl_counter_reg(3),
      I3 => scl_counter_reg(1),
      I4 => scl_counter_reg(2),
      O => p_0_in(3)
    );
\scl_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3FFF8000"
    )
        port map (
      I0 => \scl_counter_reg_n_0_[0]\,
      I1 => scl_counter_reg(3),
      I2 => scl_counter_reg(1),
      I3 => scl_counter_reg(2),
      I4 => scl_counter_reg(4),
      O => p_0_in(4)
    );
\scl_counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => \scl_counter[0]_i_1_n_0\,
      Q => \scl_counter_reg_n_0_[0]\
    );
\scl_counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => p_0_in(1),
      Q => scl_counter_reg(1)
    );
\scl_counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => p_0_in(2),
      Q => scl_counter_reg(2)
    );
\scl_counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => p_0_in(3),
      Q => scl_counter_reg(3)
    );
\scl_counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => p_0_in(4),
      Q => scl_counter_reg(4)
    );
scl_oe_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABBBBBBBA8888888"
    )
        port map (
      I0 => scl_oe_i_2_n_0,
      I1 => scl_oe_i_3_n_0,
      I2 => scl_oe_i_4_n_0,
      I3 => \scl_phase_reg_n_0_[0]\,
      I4 => p_0_in_0(2),
      I5 => scl_oe,
      O => scl_oe_i_1_n_0
    );
scl_oe_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000008033F3F3B3F"
    )
        port map (
      I0 => p_0_in_0(2),
      I1 => state(2),
      I2 => state(3),
      I3 => state(1),
      I4 => state(0),
      I5 => in11,
      O => scl_oe_i_2_n_0
    );
scl_oe_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000002002F"
    )
        port map (
      I0 => p_0_in_0(2),
      I1 => \scl_phase_reg_n_0_[0]\,
      I2 => state(0),
      I3 => state(1),
      I4 => state(3),
      I5 => state(2),
      O => scl_oe_i_3_n_0
    );
scl_oe_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"030C370C"
    )
        port map (
      I0 => in11,
      I1 => state(2),
      I2 => state(3),
      I3 => state(1),
      I4 => state(0),
      O => scl_oe_i_4_n_0
    );
scl_oe_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => scl_oe_i_1_n_0,
      PRE => busy_i_2_n_0,
      Q => scl_oe
    );
\scl_phase[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \scl_phase_reg_n_0_[0]\,
      O => p_1_in(0)
    );
\scl_phase[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \scl_phase_reg_n_0_[0]\,
      I1 => in11,
      O => p_1_in(1)
    );
\scl_phase_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => load,
      CLR => busy_i_2_n_0,
      D => p_1_in(0),
      Q => \scl_phase_reg_n_0_[0]\
    );
\scl_phase_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => load,
      CLR => busy_i_2_n_0,
      D => p_1_in(1),
      Q => in11
    );
scl_tick_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => scl_counter_reg(3),
      I1 => scl_counter_reg(4),
      I2 => scl_counter_reg(1),
      I3 => scl_counter_reg(2),
      O => load
    );
scl_tick_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => busy_i_2_n_0,
      D => load,
      Q => p_0_in_0(2)
    );
sda_oe_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFFFEFEFE00"
    )
        port map (
      I0 => sda_oe_i_2_n_0,
      I1 => sda_oe_i_3_n_0,
      I2 => sda_oe_i_4_n_0,
      I3 => sda_oe_i_5_n_0,
      I4 => sda_oe_i_6_n_0,
      I5 => sda_oe,
      O => sda_oe_i_1_n_0
    );
sda_oe_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0013"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      O => sda_oe_i_10_n_0
    );
sda_oe_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_0_in_0(2),
      I1 => \scl_phase_reg_n_0_[0]\,
      O => sda_oe_i_11_n_0
    );
sda_oe_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0E0C0C3"
    )
        port map (
      I0 => in11,
      I1 => state(3),
      I2 => state(2),
      I3 => state(0),
      I4 => state(1),
      O => sda_oe_i_2_n_0
    );
sda_oe_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3300F000F0005500"
    )
        port map (
      I0 => data0,
      I1 => \tx_byte_reg_n_0_[0]\,
      I2 => sda_oe_i_7_n_0,
      I3 => sda_oe_i_8_n_0,
      I4 => \bit_counter_reg_n_0_[0]\,
      I5 => \bit_counter_reg_n_0_[1]\,
      O => sda_oe_i_3_n_0
    );
sda_oe_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
        port map (
      I0 => sda_oe_i_9_n_0,
      I1 => sda_oe_i_8_n_0,
      I2 => \bit_counter_reg_n_0_[2]\,
      I3 => \bit_counter_reg_n_0_[0]\,
      O => sda_oe_i_4_n_0
    );
sda_oe_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"04040000FF040000"
    )
        port map (
      I0 => \scl_phase_reg_n_0_[0]\,
      I1 => \FSM_sequential_state[3]_i_5_n_0\,
      I2 => \FSM_sequential_state[2]_i_4_n_0\,
      I3 => sda_oe_i_10_n_0,
      I4 => p_0_in_0(2),
      I5 => in11,
      O => sda_oe_i_5_n_0
    );
sda_oe_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000220202222F"
    )
        port map (
      I0 => sda_oe_i_11_n_0,
      I1 => in11,
      I2 => state(0),
      I3 => state(1),
      I4 => state(3),
      I5 => state(2),
      O => sda_oe_i_6_n_0
    );
sda_oe_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"41FF"
    )
        port map (
      I0 => \bit_counter_reg_n_0_[0]\,
      I1 => \bit_counter_reg_n_0_[1]\,
      I2 => \bit_counter_reg_n_0_[2]\,
      I3 => data3,
      O => sda_oe_i_7_n_0
    );
sda_oe_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => state(3),
      O => sda_oe_i_8_n_0
    );
sda_oe_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3F1C0F440414044"
    )
        port map (
      I0 => \scl_phase_reg_n_0_[0]\,
      I1 => state(3),
      I2 => state(2),
      I3 => state(1),
      I4 => state(0),
      I5 => p_0_in_0(2),
      O => sda_oe_i_9_n_0
    );
sda_oe_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => sda_oe_i_1_n_0,
      PRE => busy_i_2_n_0,
      Q => sda_oe
    );
\state_debug[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BA"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      I3 => state(3),
      O => state_debug(0)
    );
\state_debug[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D1CE"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(0),
      I3 => state(1),
      O => state_debug(1)
    );
\state_debug[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"202E"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(1),
      I3 => state(0),
      O => state_debug(2)
    );
\state_debug[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B8A8"
    )
        port map (
      I0 => state(3),
      I1 => state(1),
      I2 => state(0),
      I3 => state(2),
      O => state_debug(3)
    );
\temp_lsb[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[1]\,
      I1 => \byte_counter_reg_n_0_[0]\,
      I2 => \byte_counter_reg_n_0_[2]\,
      I3 => \byte_counter_reg_n_0_[3]\,
      I4 => \temp_lsb[7]_i_2_n_0\,
      O => temp_lsb_3
    );
\temp_lsb[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000200"
    )
        port map (
      I0 => \byte_counter[3]_i_3_n_0\,
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => state(3),
      O => \temp_lsb[7]_i_2_n_0\
    );
\temp_lsb_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_lsb_3,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[0]\,
      Q => temp_lsb(0)
    );
\temp_lsb_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_lsb_3,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[1]\,
      Q => temp_lsb(1)
    );
\temp_lsb_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_lsb_3,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[2]\,
      Q => temp_lsb(2)
    );
\temp_lsb_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_lsb_3,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[3]\,
      Q => temp_lsb(3)
    );
\temp_lsb_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_lsb_3,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[4]\,
      Q => temp_lsb(4)
    );
\temp_lsb_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_lsb_3,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[5]\,
      Q => temp_lsb(5)
    );
\temp_lsb_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_lsb_3,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[6]\,
      Q => temp_lsb(6)
    );
\temp_lsb_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_lsb_3,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[7]\,
      Q => temp_lsb(7)
    );
\temp_msb[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[2]\,
      I1 => \byte_counter_reg_n_0_[3]\,
      I2 => \byte_counter_reg_n_0_[0]\,
      I3 => \byte_counter_reg_n_0_[1]\,
      I4 => \temp_lsb[7]_i_2_n_0\,
      O => temp_msb_4
    );
\temp_msb_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_msb_4,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[0]\,
      Q => temp_msb(0)
    );
\temp_msb_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_msb_4,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[1]\,
      Q => temp_msb(1)
    );
\temp_msb_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_msb_4,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[2]\,
      Q => temp_msb(2)
    );
\temp_msb_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_msb_4,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[3]\,
      Q => temp_msb(3)
    );
\temp_msb_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_msb_4,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[4]\,
      Q => temp_msb(4)
    );
\temp_msb_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_msb_4,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[5]\,
      Q => temp_msb(5)
    );
\temp_msb_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_msb_4,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[6]\,
      Q => temp_msb(6)
    );
\temp_msb_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => temp_msb_4,
      CLR => busy_i_2_n_0,
      D => \rx_byte_reg_n_0_[7]\,
      Q => temp_msb(7)
    );
\temperature_raw[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(0),
      I3 => state(1),
      O => \temperature_raw[15]_i_1_n_0\
    );
\temperature_raw_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_lsb(0),
      Q => temperature_raw(0)
    );
\temperature_raw_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_msb(2),
      Q => temperature_raw(10)
    );
\temperature_raw_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_msb(3),
      Q => temperature_raw(11)
    );
\temperature_raw_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_msb(4),
      Q => temperature_raw(12)
    );
\temperature_raw_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_msb(5),
      Q => temperature_raw(13)
    );
\temperature_raw_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_msb(6),
      Q => temperature_raw(14)
    );
\temperature_raw_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_msb(7),
      Q => temperature_raw(15)
    );
\temperature_raw_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_lsb(1),
      Q => temperature_raw(1)
    );
\temperature_raw_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_lsb(2),
      Q => temperature_raw(2)
    );
\temperature_raw_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_lsb(3),
      Q => temperature_raw(3)
    );
\temperature_raw_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_lsb(4),
      Q => temperature_raw(4)
    );
\temperature_raw_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_lsb(5),
      Q => temperature_raw(5)
    );
\temperature_raw_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_lsb(6),
      Q => temperature_raw(6)
    );
\temperature_raw_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_lsb(7),
      Q => temperature_raw(7)
    );
\temperature_raw_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_msb(0),
      Q => temperature_raw(8)
    );
\temperature_raw_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \temperature_raw[15]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => temp_msb(1),
      Q => temperature_raw(9)
    );
\tx_byte[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[0]\,
      I1 => state(3),
      I2 => state(1),
      O => tx_byte(2)
    );
\tx_byte[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000C00080C08"
    )
        port map (
      I0 => \tx_byte[7]_i_3_n_0\,
      I1 => \bit_counter[2]_i_3_n_0\,
      I2 => state(2),
      I3 => state(3),
      I4 => state(1),
      I5 => state(0),
      O => \tx_byte[7]_i_1_n_0\
    );
\tx_byte[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state(1),
      O => tx_byte(7)
    );
\tx_byte[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \byte_counter_reg_n_0_[1]\,
      I1 => state(0),
      I2 => \byte_counter_reg_n_0_[2]\,
      I3 => \byte_counter_reg_n_0_[3]\,
      O => \tx_byte[7]_i_3_n_0\
    );
\tx_byte_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_byte[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => state(3),
      Q => \tx_byte_reg_n_0_[0]\
    );
\tx_byte_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_byte[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => tx_byte(2),
      Q => data3
    );
\tx_byte_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_byte[7]_i_1_n_0\,
      CLR => busy_i_2_n_0,
      D => tx_byte(7),
      Q => data0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    start : in STD_LOGIC;
    sda : inout STD_LOGIC;
    scl : inout STD_LOGIC;
    busy : out STD_LOGIC;
    done : out STD_LOGIC;
    ack_error : out STD_LOGIC;
    temperature_raw : out STD_LOGIC_VECTOR ( 15 downto 0 );
    humidity_raw : out STD_LOGIC_VECTOR ( 15 downto 0 );
    state_debug : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_hdc302x_i2c_master_0_0,hdc302x_i2c_master,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "hdc302x_i2c_master,Vivado 2022.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^state_debug\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  state_debug(4) <= \<const0>\;
  state_debug(3 downto 0) <= \^state_debug\(3 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hdc302x_i2c_master
     port map (
      ack_error => ack_error,
      busy => busy,
      clk => clk,
      done => done,
      humidity_raw(15 downto 0) => humidity_raw(15 downto 0),
      rst_n => rst_n,
      scl => scl,
      sda => sda,
      start => start,
      state_debug(3 downto 0) => \^state_debug\(3 downto 0),
      temperature_raw(15 downto 0) => temperature_raw(15 downto 0)
    );
end STRUCTURE;
