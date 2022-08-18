#!/bin/sh

# 
# v++(TM)
# runme.sh: a v++-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/Xilinx/Vitis_HLS/2021.2/bin:/opt/Xilinx/Vitis/2021.2/bin:/opt/Xilinx/Vitis/2021.2/bin
else
  PATH=/opt/Xilinx/Vitis_HLS/2021.2/bin:/opt/Xilinx/Vitis/2021.2/bin:/opt/Xilinx/Vitis/2021.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/Will/Documents/Research-Files/G-FPin_HW/Vitis/hw/_x/krnl_s2mm/krnl_s2mm'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vitis_hls -f krnl_s2mm.tcl -messageDb vitis_hls.pb
