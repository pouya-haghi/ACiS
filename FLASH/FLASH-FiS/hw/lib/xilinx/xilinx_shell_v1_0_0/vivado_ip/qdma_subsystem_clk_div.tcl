set clk_wiz qdma_subsystem_clk_div
create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name $clk_wiz -dir ${ip_build_dir}
set_property -dict {
  CONFIG.PRIMITIVE {Auto}
  CONFIG.USE_PHASE_ALIGNMENT {true}
  CONFIG.PRIM_IN_FREQ {250}
  CONFIG.SECONDARY_SOURCE {Single_ended_clock_capable_pin}
  CONFIG.CLKIN1_JITTER_PS {40.0}
  CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {250.000} 
  CONFIG.CLKOUT1_DRIVES {Buffer}
  CONFIG.CLKOUT2_DRIVES {Buffer}
  CONFIG.CLKOUT3_DRIVES {Buffer}
  CONFIG.CLKOUT4_DRIVES {Buffer}
  CONFIG.CLKOUT5_DRIVES {Buffer}
  CONFIG.CLKOUT6_DRIVES {Buffer}
  CONFIG.CLKOUT7_DRIVES {Buffer}
  CONFIG.FEEDBACK_SOURCE {FDBK_AUTO}
  CONFIG.USE_LOCKED {true}
  CONFIG.USE_RESET {false}
  CONFIG.MMCM_BANDWIDTH {OPTIMIZED}
  CONFIG.MMCM_CLKIN1_PERIOD {4.000}
  CONFIG.MMCM_CLKIN2_PERIOD {10.0}
  CONFIG.MMCM_COMPENSATION {AUTO}
  CONFIG.AUTO_PRIMITIVE {MMCM}
  CONFIG.MMCM_DIVCLK_DIVIDE {1} 
  CONFIG.MMCM_CLKFBOUT_MULT_F {4.750} 
  CONFIG.MMCM_CLKIN1_PERIOD {4.000} 
  CONFIG.MMCM_CLKIN2_PERIOD {10.0} 
  CONFIG.MMCM_CLKOUT0_DIVIDE_F {4.750} 
  CONFIG.CLKOUT1_JITTER {85.152} 
  CONFIG.CLKOUT1_PHASE_ERROR {78.266}
} [get_ips $clk_wiz]