-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Mon Apr 11 15:52:09 2022
-- Host        : caad-10k running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /ad/eng/research/eng_research_caad/haghi/G-FPin_HW/NetFPGA-PLUS/hw/lib/std/CGRA_v1_0_0/ip/synth/CGRA.gen/sources_1/ip/rtl_kernel_wizard_0/rtl_kernel_wizard_0_stub.vhdl
-- Design      : rtl_kernel_wizard_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rtl_kernel_wizard_0 is
  Port ( 
    ap_clk : in STD_LOGIC
  );

end rtl_kernel_wizard_0;

architecture stub of rtl_kernel_wizard_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rtl_kernel_wizard_v1_0_2_dummy,Vivado 2020.2";
begin
end;
