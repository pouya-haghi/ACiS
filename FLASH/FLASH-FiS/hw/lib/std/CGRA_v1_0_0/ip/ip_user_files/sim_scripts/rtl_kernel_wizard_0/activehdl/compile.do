vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"/ad/eng/research/eng_research_caad/haghi/G-FPin_HW/NetFPGA-PLUS/hw/lib/std/CGRA_v1_0_0/ip/synth/CGRA.gen/sources_1/ip/rtl_kernel_wizard_0/rtl_kernel_wizard_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

