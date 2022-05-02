vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"/ad/eng/research/eng_research_caad/haghi/G-FPin_HW/NetFPGA-PLUS/hw/lib/std/CGRA_v1_0_0/ip/synth/CGRA.gen/sources_1/ip/rtl_kernel_wizard_0/rtl_kernel_wizard_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

