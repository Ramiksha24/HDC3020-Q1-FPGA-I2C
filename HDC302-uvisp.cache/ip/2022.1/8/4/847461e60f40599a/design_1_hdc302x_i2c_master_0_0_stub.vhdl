-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Thu Feb 12 16:50:21 2026
-- Host        : LAPTOP-9FF0L5N1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_hdc302x_i2c_master_0_0_stub.vhdl
-- Design      : design_1_hdc302x_i2c_master_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7cg-ffvc1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
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

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,start,sda,scl,busy,done,ack_error,temperature_raw[15:0],humidity_raw[15:0],state_debug[4:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "hdc302x_i2c_master,Vivado 2022.1";
begin
end;
