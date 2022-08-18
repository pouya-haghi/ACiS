SHELL=/bin/bash

help:
	@echo "Makefile Usage:"
	@echo "  make all DEVICE=<FPGA platform> TARGETING=<hw/hw_emu/sw_emu>"
	@echo "      Command to generate the xo for specified device and Interface."
	@echo "      By default, DEVICE=xilinx_u280_xdma_201920_3, TARGETING=hw"
	@echo ""
	@echo "  make clean "
	@echo "      Command to remove the generated non-hardware files."
	@echo ""
	@echo "  make distclean"
	@echo "      Command to remove all the generated files in the current directory"
	@echo ""
	@echo "  make distcleanall"
	@echo "      Command to remove all the generated in the current directory and one level down"
	@echo ""

# Params
DEVICE ?= xilinx_u280_xdma_201920_3
TARGETING ?= hw

# Load dirs
STREAM_DIR = ./$(TARGETING)/
CGRA_DIR = ./CGRA/
LIST_XO += $(STREAM_DIR)_x.$(DEVICE)/krnl_mm2s.xo
LIST_XO += $(STREAM_DIR)_x.$(DEVICE)/krnl_s2mm.xo
LIST_XO += $(CGRA_DIR)rtl_kernel_CGRA_accelerator.xo

# Save and exe dirs
XSA := $(strip $(patsubst %.xpfm, % , $(shell basename $(DEVICE)))) # board name basically
VPP := $(XILINX_VITIS)/bin/v++ # v++ path
BUILD_DIR := ./$(TARGETING).$(XSA) # where the build goes
BINARY_CONTAINERS = $(BUILD_DIR)/$(TARGETING).xclbin

# all: check-devices check-vitis check-xrt check-targeting $(LIST_XO)
all: check-devices check-vitis check-xrt check-targeting $(BINARY_CONTAINERS)
# 	v++ -l -t hw --platform $(DEVICE) --save-temps --config ./config.cfg $(LIST_XO) -o hw.xclbin

$(BINARY_CONTAINERS): $(LIST_XO)
	mkdir -p $(BUILD_DIR)
	v++ -l -t hw --platform $(DEVICE) --save-temps --config ./config.cfg $(LIST_XO) -o hw.xclbin

$(STREAM_DIR)_x.$(DEVICE)/%.xo: $(STREAM_DIR)src/*.cpp
	make -C $(STREAM_DIR) all -j2

debug: 
	@echo "LIST_XO=$(LIST_XO)"

# Cleaning stuff
clean:
	rm -rf *v++* *.log *.jou *.str

distclean: clean
	rm -rf _x* *.tmp.ini .Xil .ipcache/

distcleanall: distclean
	make -C $(TARGETING)/ distclean

check-devices:
ifndef DEVICE
	$(error DEVICE not set. Please set the DEVICE properly and rerun. Run "make help" for more details.)
endif

#Checks for XILINX_VITIS
check-vitis:
ifndef XILINX_VITIS
	$(error XILINX_VITIS variable is not set, please set correctly and rerun)
endif

#Checks for XILINX_XRT
check-xrt:
ifndef XILINX_XRT
	$(error XILINX_XRT variable is not set, please set correctly and rerun)
endif

#Check if the design name is supported
check-targeting:
	@if [[ ($(TARGETING) != "hw") && ($(TARGETING) != "hw_emu") && ($(TARGETING) != "sw_emu") ]]; then\
		echo "TARGETING=$(TARGETING) is not supported!";\
		exit 1;\
	fi
