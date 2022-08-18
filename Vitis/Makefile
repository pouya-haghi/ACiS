DEVICE ?= xilinx_u280_xdma_201920_3

all: ./hw/_x.xilinx_u280_xdma_201920_3/krnl_mm2s.xo ./hw/_x.xilinx_u280_xdma_201920_3/krnl_s2mm.xo ./CGRA/rtl_kernel_CGRA_accelerator.xo
	v++ -l -t hw --platform $(DEVICE) --save-temps --config ./config.cfg ./hw/_x.xilinx_u280_xdma_201920_3/krnl_mm2s.xo ./hw/_x.xilinx_u280_xdma_201920_3/krnl_s2mm.xo ./CGRA/rtl_kernel_CGRA_accelerator.xo -o vadd.xclbin
