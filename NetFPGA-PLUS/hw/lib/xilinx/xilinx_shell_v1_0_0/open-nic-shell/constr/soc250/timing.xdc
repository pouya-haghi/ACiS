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
create_clock -period 10.000 -name pcie_refclk [get_ports pcie_refclk_p]

set_false_path -through [get_ports pcie_rstn]

set axis_aclk [get_clocks -of_object [get_nets axis_aclk]]
foreach cmac_clk [get_clocks -of_object [get_nets cmac_clk*]] {
    set_max_delay -datapath_only -from $axis_aclk -to $cmac_clk 4.000
    set_max_delay -datapath_only -from $cmac_clk -to $axis_aclk 3.103
}
