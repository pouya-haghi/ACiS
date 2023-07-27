# *************************************************************************
#
# Copyright 2020 Xilinx, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# *************************************************************************
set_false_path -through [get_ports pci_rst_n]

set axis_aclk [get_clocks -of_object [get_nets u_top_wrapper/axis_aclk]]
foreach cmac_clk [get_clocks -of_object [get_nets u_top_wrapper/cmac_clk*]] {
    set_max_delay -datapath_only -from $axis_aclk -to $cmac_clk 4.000
    set_max_delay -datapath_only -from $cmac_clk -to $axis_aclk 3.103
}

create_pblock pblock_qdma_subsystem
add_cells_to_pblock [get_pblocks pblock_qdma_subsystem] [get_cells -quiet [list u_top_wrapper/xilinx_nic_shell/inst/qdma_subsystem_inst]]
resize_pblock [get_pblocks pblock_qdma_subsystem] -add {SLR0}

create_pblock pblock_cmac_subsystem
add_cells_to_pblock [get_pblocks pblock_cmac_subsystem] [get_cells -quiet {u_top_wrapper/xilinx_nic_shell/inst/cmac_port*.cmac_subsystem_inst}]
resize_pblock [get_pblocks pblock_cmac_subsystem] -add {SLR2}

create_pblock pblock_nf_datapath
add_cells_to_pblock [get_pblocks pblock_nf_datapath] [get_cells -quiet [list nf_datapath_0]]
add_cells_to_pblock [get_pblocks pblock_nf_datapath] [get_cells -quiet [list u_top_wrapper/u_nf_attachment]]
resize_pblock [get_pblocks pblock_nf_datapath] -add {SLR1}

# This false paths should be removed (ToDo)
set_false_path -from [get_cells  u_top_wrapper/u_nf_attachment/u_nf_attachment_0/inst/tx_fifo_rst/sync1_r_reg[5]]
set_false_path -from [get_cells  u_top_wrapper/u_nf_attachment/u_nf_attachment_1/inst/tx_fifo_rst/sync1_r_reg[5]]
set_false_path -from [get_cells  u_top_wrapper/u_nf_attachment/u_nf_attachment_0/inst/rx_fifo_rst/sync1_r_reg[5]]
set_false_path -from [get_cells  u_top_wrapper/u_nf_attachment/u_nf_attachment_1/inst/rx_fifo_rst/sync1_r_reg[5]]
