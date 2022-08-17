set SynModuleInfo {
  {SRCNAME krnl_s2mm_Pipeline_VITIS_LOOP_66_1 MODELNAME krnl_s2mm_Pipeline_VITIS_LOOP_66_1 RTLNAME krnl_s2mm_krnl_s2mm_Pipeline_VITIS_LOOP_66_1
    SUBMODULES {
      {MODELNAME krnl_s2mm_flow_control_loop_pipe_sequential_init RTLNAME krnl_s2mm_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME krnl_s2mm_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME krnl_s2mm MODELNAME krnl_s2mm RTLNAME krnl_s2mm IS_TOP 1
    SUBMODULES {
      {MODELNAME krnl_s2mm_control_s_axi RTLNAME krnl_s2mm_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME krnl_s2mm_gmem_m_axi RTLNAME krnl_s2mm_gmem_m_axi BINDTYPE interface TYPE interface_m_axi}
      {MODELNAME krnl_s2mm_regslice_both RTLNAME krnl_s2mm_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME krnl_s2mm_regslice_both_U}
    }
  }
}
