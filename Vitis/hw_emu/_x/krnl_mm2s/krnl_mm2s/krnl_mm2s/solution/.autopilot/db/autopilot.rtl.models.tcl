set SynModuleInfo {
  {SRCNAME krnl_mm2s_Pipeline_VITIS_LOOP_69_1 MODELNAME krnl_mm2s_Pipeline_VITIS_LOOP_69_1 RTLNAME krnl_mm2s_krnl_mm2s_Pipeline_VITIS_LOOP_69_1
    SUBMODULES {
      {MODELNAME krnl_mm2s_urem_29ns_12ns_11_33_1 RTLNAME krnl_mm2s_urem_29ns_12ns_11_33_1 BINDTYPE op TYPE urem IMPL auto LATENCY 32 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME krnl_mm2s MODELNAME krnl_mm2s RTLNAME krnl_mm2s IS_TOP 1
    SUBMODULES {
      {MODELNAME krnl_mm2s_control_s_axi RTLNAME krnl_mm2s_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME krnl_mm2s_gmem_m_axi RTLNAME krnl_mm2s_gmem_m_axi BINDTYPE interface TYPE interface_m_axi}
      {MODELNAME krnl_mm2s_regslice_both RTLNAME krnl_mm2s_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME krnl_mm2s_regslice_both_U}
    }
  }
}
