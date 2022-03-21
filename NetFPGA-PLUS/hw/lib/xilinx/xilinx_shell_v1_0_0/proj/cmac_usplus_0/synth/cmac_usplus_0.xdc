#------------------------------------------------------------------------------
#  (c) Copyright 2013 Xilinx, Inc. All rights reserved.
#
#  This file contains confidential and proprietary information
#  of Xilinx, Inc. and is protected under U.S. and
#  international copyright and other intellectual property
#  laws.
#
#  DISCLAIMER
#  This disclaimer is not a license and does not grant any
#  rights to the materials distributed herewith. Except as
#  otherwise provided in a valid license issued to you by
#  Xilinx, and to the maximum extent permitted by applicable
#  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#  (2) Xilinx shall not be liable (whether in contract or tort,
#  including negligence, or under any other theory of
#  liability) for any loss or damage of any kind or nature
#  related to, arising under or in connection with these
#  materials, including for any direct, or any indirect,
#  special, incidental, or consequential loss or damage
#  (including loss of data, profits, goodwill, or any type of
#  loss or damage suffered as a result of any action brought
#  by a third party) even if such damage or loss was
#  reasonably foreseeable or Xilinx had been advised of the
#  possibility of the same.
#
#  CRITICAL APPLICATIONS
#  Xilinx products are not designed or intended to be fail-
#  safe, or for use in any application requiring fail-safe
#  performance, such as life-support or safety devices or
#  systems, Class III medical devices, nuclear facilities,
#  applications related to the deployment of airbags, or any
#  other applications that could lead to death, personal
#  injury, or severe property or environmental damage
#  (individually and collectively, "Critical
#  Applications"). Customer assumes the sole risk and
#  liability of any use of Xilinx products in Critical
#  Applications, subject only to applicable laws and
#  regulations governing limitations on product liability.
#
#  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#  PART OF THIS FILE AT ALL TIMES.
#------------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# CMAC core-level XDC file
# -----------------------------------------------------------------------------

# Constraints to fix the CMAC core 
set_property LOC CMACE4_X0Y6 [get_cells -hierarchical -filter {NAME =~ *inst/i_cmac_usplus_0_top/* && REF_NAME==CMACE4}]

create_clock -period 6.400 [get_ports gt_ref_clk_p]

set_false_path -to [get_pins -leaf -of_objects [get_cells -hier *cdc_to* -filter {is_sequential}] -filter {NAME=~*cmac_cdc*/*/D}]

set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *i_cmac_usplus_0_top*}] -filter {REF_PIN_NAME =~ RX_RESET}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *i_cmac_usplus_0_top*}] -filter {REF_PIN_NAME =~ TX_RESET}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *i_cmac_usplus_0_top*}] -filter {REF_PIN_NAME =~ RX_SERDES_RESET*}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *i_cmac_usplus_0_top*}] -filter {REF_PIN_NAME =~ CTL_RX_ENABLE_PPP}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *i_cmac_usplus_0_top*}] -filter {REF_PIN_NAME =~ CTL_RX_CHECK_SA_PPP}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *i_cmac_usplus_0_top*}] -filter {REF_PIN_NAME =~ CTL_RX_CHECK_OPCODE_PPP}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *i_cmac_usplus_0_top*}] -filter {REF_PIN_NAME =~ CTL_RX_FORCE_RESYNC}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ */i_cmac_usplus_0_axi4_lite_reg_map/*_syncer/*meta_reg*}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ */*_sync*/*d2_cdc_to*}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~*i_cmac_usplus_0_top*}] -filter REF_PIN_NAME=~CTL_RX_RSFEC_ENABLE]


set_property DONT_TOUCH true [get_cells -hierarchical -filter {NAME =~ */*axi4_*_wrapper/*/*axi_araddr_reg*}]
set_property DONT_TOUCH true [get_cells -hierarchical -filter {NAME =~ */*axi4_*_wrapper/*/*axi_rdata_reg*}]




create_waiver -internal -scope -quiet -type CDC -id {CDC-10} -user "cmac_usplus" -tags "10930"\
-desc "The CDC-10 warning is waived as this is on the reset path and safe to ignore"\
-from [get_pins -of [get_cells -hier -filter {name =~ */inst/*/*out_d*}] -filter {name =~ *C}]\
-to [get_pins -of [get_cells -hier -filter {name =~ */inst/*cdc_sync_*x_reset_done_init_clk/*cdc_to*}] -filter {name =~ *D}]

create_waiver -internal -scope -quiet -type CDC -id {CDC-11} -user "cmac_usplus" -tags "10930"\
-desc "The CDC-11 warning is waived as this is on the reset path and safe to ignore"\
-from [get_pins -of [get_cells -hier -filter {name =~ */inst/*reset_done_reg*}] -filter {name =~ *C}]\
-to [get_pins -of [get_cells -hier -filter {name =~ */inst/*cdc_sync*/*cdc_to*}] -filter {name =~ *D}]

create_waiver -internal -scope -quiet -type CDC -id {CDC-11} -user "cmac_usplus" -tags "10930"\
-desc "The CDC-11 warning is waived as fan-out is expected for this path"\
-from [get_pins -of [get_cells -hier -filter {name =~ */inst/*axi4_lite_if_wrapper/*axi4_lite_reg_map/*reg*}] -filter {name =~ *C}]\
-to [get_pins -of [get_cells -hier -filter {name =~ */inst/*axi4_lite_if_wrapper/*axi4_lite_reg_map/*/*_cdc_to*}] -filter {name =~ *D}]

create_waiver -internal -scope -quiet -type CDC -id {CDC-11} -user "cmac_usplus" -tags "10930"\
-desc "The CDC-11 warning is waived as fan-out is expected for this reset path"\
-from [get_pins -of [get_cells -hier -filter {name =~ */inst/*axi4_lite_if_wrapper/*axi4_lite_reg_map/*reg*}] -filter {name =~ *C}]\
-to [get_pins -of [get_cells -hier -filter {name =~ */inst/*cdc_sync_axi_usr_*reset*/*cdc_to*}] -filter {name =~ *D}]

create_waiver -internal -scope -quiet -type CDC -id {CDC-6} -user "cmac_usplus" -tags "10930"\
-desc "The CDC-6 warning is waived; In RTL, ASYNC_REG primitive declared, it is falsely reported by the tool"\
-to [get_pins -of [get_cells -hier -filter {name =~ */inst/*axi4_lite_if_wrapper/*axi4_lite_reg_map/*syncer/*cdc_to*}] -filter {name =~ *D}]


create_waiver -internal -scope -quiet -type CDC -id {CDC-11} -user "cmac" -tags "10930"\
-desc "The CDC-11 warning is waived as fan-out is expected for this stat signal"\
-from [get_pins -of [get_cells -hier -filter {name =~ */inst/*_top/*}] -filter {name =~ *RX_CLK}]\
-to [get_pins -of [get_cells -hier -filter {name =~ */*stat_rx_aligned/*cdc_to*}] -filter {name =~ *D}]

create_waiver -internal -scope -quiet -type CDC -id {CDC-13} -user "cmac" -tags "10930"\
-desc "The CDC-13 warning is waived, the signal is synchronized with the required clk but the path is falsely reported by the tool"\
-to [get_pins -hier -filter {name =~ */*top/*/CTL_RX_FORCE_RESYNC}]

create_waiver -internal -scope -quiet -type CDC -id {CDC-13} -user "cmac_usplus" -tags "10930"\
-desc "The CDC-13 warning is waived, this is on the reset path and safe to ignore"\
-to [get_pins -hier -filter {name =~ */*top*/*/*SERDES_RESET*}]

create_waiver -internal -scope -quiet -type CDC -id {CDC-13} -user "cmac_usplus" -tags "10930"\
-desc "The CDC-13 warning is waived; Syncer is available in this path but it is falsely reported by the tool"\
-to [get_pins -hier -filter {name =~ */inst/*top/*/CTL_RX_RSFEC_ENABLE}]

create_waiver -internal -scope -quiet -type CDC -id {CDC-13} -user "cmac_usplus" -tags "10930"\
-desc "The CDC-13 warning is waived; Syncer is available in this path but it is falsely reported by the tool"\
-from [get_pins -of [get_cells -hier -filter {name =~ */inst/*cmac_cdc_sync*/s_out_d*}] -filter {name =~ *C}]


