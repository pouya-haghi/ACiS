// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon Apr 11 15:52:09 2022
// Host        : caad-10k running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /ad/eng/research/eng_research_caad/haghi/G-FPin_HW/NetFPGA-PLUS/hw/lib/std/CGRA_v1_0_0/ip/synth/CGRA.gen/sources_1/ip/rtl_kernel_wizard_0/rtl_kernel_wizard_0_stub.v
// Design      : rtl_kernel_wizard_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rtl_kernel_wizard_v1_0_2_dummy,Vivado 2020.2" *)
module rtl_kernel_wizard_0(ap_clk)
/* synthesis syn_black_box black_box_pad_pin="ap_clk" */;
  input ap_clk;
endmodule
