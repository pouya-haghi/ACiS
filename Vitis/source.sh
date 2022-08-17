# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

source /opt/Xilinx/Vitis/2021.2/settings64.sh
source /opt/xilinx/xrt/setup.sh
export PATH=/opt/Xilinx/Vitis/2021.2/bin:$PATH
export XILINXD_LICENSE_FILE=2100@XilinxLM.bu.edu
export PATH=/opt/Xilinx/Vivado/2021.2/bin:$PATH

#source /opt/Xilinx/Vitis2020.2/Vitis/2020.2/settings64.sh
#source /opt/xilinx/xrt/setup.sh
#export PATH=/opt/Xilinx/Vitis2020.2/Vitis/2020.2/bin:$PATH
#export XILINXD_LICENSE_FILE=2100@XilinxLM.bu.edu
#export PATH=/opt/Xilinx/Vitis2020.2/Vivado/2020.2/bin:$PATH
