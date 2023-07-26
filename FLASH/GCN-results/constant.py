HEADER_LENGTH= 34 # in Bytes
PHIT_SIZE = 64 # Bytes
# While NetFPGA runs at 3 ns lets pick 4 ns for our design
PERIOD_CLK = 4 # ns (250 MHz)
# PERIOD_CLK = 3 # ns (333.33 MHz)
SWITCH_LATENCY_NETFPGA = 171 # ns
SWITCH_LATENCY_OMNIPATH = 1160 # ns @ 512 Bytes
# https://downloads.dell.com/manuals/all-products/esuprt_software/esuprt_it_ops_datcentr_mgmt/high-computing-solution-resources_white-papers67_en-us.pdf
PE_LATENCY = 8 # cycles
NUM_COL = 16
SIMD_DEGREE = 16
UDP_ALVEO_LATENCY = 2759 # ns
NUM_PORTS_MAX = 8
# NUM_EXPERIMENTS = 1000
# SWEEP_STEP = 500 # ns
