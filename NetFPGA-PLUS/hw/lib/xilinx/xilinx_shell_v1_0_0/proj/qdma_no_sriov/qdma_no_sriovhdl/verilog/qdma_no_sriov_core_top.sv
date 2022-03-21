//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------
//
// Project    : The Xilinx PCI Express DMA 
// File       : qdma_no_sriov_core_top.sv
// Version    : 5.0
//-----------------------------------------------------------------------------

`timescale 1ps/1ps

module qdma_no_sriov_core_top 
#(
        parameter       COMPONENT_NAME               = "qdma_no_sriov",
        parameter       VERSION                      = 0,
        parameter       C_DEVICE_NUMBER              = 0, // Device number for Root Port configurations only
        parameter       VCU1262                      = "FALSE",
        parameter       xlnx_ref_board               = "None",
        parameter       GTWIZ_IN_CORE                = 1,
        parameter       INS_LOSS_PROFILE             = "Add-in_Card",
        parameter       PL_UPSTREAM_FACING           = "TRUE",
        parameter       TL_LEGACY_MODE_ENABLE        = "FALSE",
        parameter       PCIE_BLK_LOCN                = 0,
        parameter       PL_LINK_CAP_MAX_LINK_WIDTH   = 1,
        parameter       PL_LINK_CAP_MAX_LINK_SPEED   = 1,
        parameter       REF_CLK_FREQ                 = 0,
        parameter       FREE_RUN_FREQ                = 1,
        parameter       DRP_CLK_SEL                  = 0,
        parameter       AXI_ADDR_WIDTH               = 32,
        parameter       AXI_DATA_WIDTH               = 64,
        parameter       CORE_CLK_FREQ                = 2,
        parameter       PLL_TYPE                     = 0,
        parameter       USER_CLK_FREQ                = 1,
        parameter       SILICON_REV                  = "Production",
        parameter       PIPE_SIM                     = "FALSE",
        parameter       EXT_CH_GT_DRP                = "FALSE",
        parameter       PCIE3_DRP                    = "FALSE",
        parameter       DEDICATE_PERST               = "TRUE",
        parameter       SYS_RESET_POLARITY           = 0,
        parameter       MCAP_ENABLEMENT              = "NONE",
        parameter       EXT_STARTUP_PRIMITIVE        = "FALSE",
        parameter       PF0_VENDOR_ID                = 16'h10EE,
        parameter       PF0_DEVICE_ID                = 16'h9011,
        parameter       PF0_REVISION_ID              = 8'h00,
        parameter       PF0_SUBSYSTEM_VENDOR_ID      = 16'h10EE,
        parameter       PF0_SUBSYSTEM_ID             = 16'h0007,
        parameter       PF0_CLASS_CODE               = 24'h058000,
        parameter       PF1_VENDOR_ID                = 16'h10EE,
        parameter       PF1_DEVICE_ID                = 16'h9111,
        parameter       PF1_REVISION_ID              = 8'h00,
        parameter       PF1_SUBSYSTEM_VENDOR_ID      = 16'h10EE,
        parameter       PF1_SUBSYSTEM_ID             = 16'h0007,
        parameter       PF1_CLASS_CODE               = 24'h058000,
        parameter       PF2_VENDOR_ID                = 16'h10EE,
        parameter       PF2_DEVICE_ID                = 16'h9211,
        parameter       PF2_REVISION_ID              = 8'h00,
        parameter       PF2_SUBSYSTEM_VENDOR_ID      = 16'h10EE,
        parameter       PF2_SUBSYSTEM_ID             = 16'h0007,
        parameter       PF3_VENDOR_ID                = 16'h10EE,
        parameter       PF3_DEVICE_ID                = 16'h9311,
        parameter       PF3_REVISION_ID              = 8'h00,
        parameter       PF3_SUBSYSTEM_VENDOR_ID      = 16'h10EE,
        parameter       PF3_SUBSYSTEM_ID             = 16'h0007,
        parameter       AXILITE_MASTER_APERTURE_SIZE = 5'b00101,
        parameter       AXILITE_MASTER_CONTROL       = 3'b100,
        parameter       XDMA_APERTURE_SIZE           = 5'b00101,
        parameter       XDMA_CONTROL                 = 3'b000,
        parameter       AXIST_BYPASS_APERTURE_SIZE   = 5'b00101,
        parameter       AXIST_BYPASS_CONTROL         = 3'b000,
        parameter       PF0_INTERRUPT_PIN            = 3'b001,
        parameter       PF0_MSI_CAP_MULTIMSGCAP      = 0,
        parameter       C_COMP_TIMEOUT               = 0,
        parameter       SHARED_LOGIC                 = 1,
        parameter       SHARED_LOGIC_CLK             = "FALSE",
        parameter       SHARED_LOGIC_BOTH            = "FALSE",
        parameter       SHARED_LOGIC_GTC             = "FALSE",
        parameter       EN_TRANSCEIVER_STATUS_PORTS  = "FALSE",
        parameter       IS_BOARD_PROJECT             = 0,
        parameter       EN_GT_SELECTION              = "FALSE",
        parameter       SELECT_QUAD                  = "GTH_Quad_224",
        parameter       ULTRASCALE                   = "FALSE",
        parameter       ULTRASCALE_PLUS              = "FALSE",
        parameter       VERSAL                       = "FALSE",
        parameter       V7_GEN3                      = "FALSE",
        parameter       RP_MSI_ENABLED               = "TRUE",
        parameter       DEV_PORT_TYPE                = 0,
        parameter       MSI_ENABLED                  = "TRUE",
        parameter       XDMA_PCIE_64BIT_EN           = "FALSE",
        parameter       XDMA_AXI_INTF_MM             = 1,
        parameter       XDMA_AXILITE_MASTER          = "FALSE",
        parameter       XDMA_AXIST_BYPASS            = "FALSE",
        parameter       XDMA_RNUM_CHNL               = 1,
        parameter       XDMA_WNUM_CHNL               = 1,
        parameter       XDMA_AXILITE_SLAVE           = "FALSE",
        parameter       CSR_AXILITE_SLAVE            = "FALSE",
        parameter       XDMA_NUM_USR_IRQ             = 1,
        parameter       XDMA_RNUM_RIDS               = 32,
        parameter       XDMA_WNUM_RIDS               = 16,
        parameter       C_M_AXI_ID_WIDTH             = 4,
        parameter       C_FAMILY                     = "virtex7",
        parameter       XDMA_NUM_PCIE_TAG            = 64,
        parameter       XDMA_DSC_BYPASS              = "FALSE",
        parameter       C_METERING_ON                = 1,
        parameter       C_DBG_EN                     = "DEBUG_NONE",
        parameter       C_DSC_BYP_MODE               = "BYPASS_AND_INT",
        parameter       IEP_EN                       = "FALSE",
        parameter       RX_DETECT                    = 0,
        parameter       DSC_BYPASS_RD                = 0,
        parameter       DSC_BYPASS_WR                = 0,
        parameter       DSC_BYPASS_RD_OUT            = 0,
        parameter       DSC_BYPASS_WR_OUT            = 0,
        parameter       DSC_BYPASS_RD_CSR            = 1,
        parameter       DSC_BYPASS_WR_CSR            = 1,
        parameter       XDMA_STS_PORTS               = "FALSE",
        parameter       MSIX_ENABLED                 = "FALSE",
        parameter       CFG_MGMT_IF                  = "TRUE",
        parameter       RQ_SEQ_NUM_IGNORE            = 0,
        parameter       CFG_EXT_IF                   = "TRUE",
        parameter       LEGACY_CFG_EXT_IF            = "TRUE",
        parameter       C_PARITY_PROP                = 0,
        parameter       EN_DEBUG_PORTS               = "FALSE",
        parameter       VU9P_BOARD                   = "FALSE",
        parameter       ENABLE_JTAG_DBG              = "FALSE",
        parameter       ENABLE_IBERT                 = "FALSE",
        parameter       MM_SLAVE_EN                  = 0,
        parameter       DMA_EN                       = 1,
        parameter       SHELL_BRIDGE                    = 0,
        parameter       MSIX_PCIE_INTERNAL           = 0,
        parameter       C_M_AXIB_EN                  = "TRUE",
        parameter       BRIDGE_BURST                 = "FALSE",
        parameter       RQ_RCFG_EN                   = "FALSE",
        parameter       FUNC_MODE                    = 1,
        parameter       USER_INT_VECT_W              = 11,
        parameter       PF1_ENABLED                  = 0,
        parameter       PF2_ENABLED                  = 0,
        parameter       PF3_ENABLED                  = 0,
        parameter       C_AXIBAR_NUM                 = 1,
        parameter [63:0]C_AXIBAR_0                   = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR_HIGHADDR_0          = 64'hffff_ffff_ffff_ffff,
        parameter [63:0]C_AXIBAR_1                   = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR_HIGHADDR_1          = 64'hffff_ffff_ffff_ffff,
        parameter [63:0]C_AXIBAR_2                   = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR_HIGHADDR_2          = 64'hffff_ffff_ffff_ffff,
        parameter [63:0]C_AXIBAR_3                   = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR_HIGHADDR_3          = 64'hffff_ffff_ffff_ffff,
        parameter [63:0]C_AXIBAR_4                   = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR_HIGHADDR_4          = 64'hffff_ffff_ffff_ffff,
        parameter [63:0]C_AXIBAR_5                   = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR_HIGHADDR_5          = 64'hffff_ffff_ffff_ffff,
        parameter [63:0]C_AXIBAR2PCIEBAR_0           = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR2PCIEBAR_1           = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR2PCIEBAR_2           = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR2PCIEBAR_3           = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR2PCIEBAR_4           = 64'h0000_0000_0000_0000,
        parameter [63:0]C_AXIBAR2PCIEBAR_5           = 64'h0000_0000_0000_0000,
        parameter       EN_AXI_SLAVE_IF              = "TRUE",
        parameter       EN_AXI_MASTER_IF             = "TRUE",
        parameter       C_INCLUDE_BAROFFSET_REG      = 1,
        parameter [31:0]C_BASEADDR                   = 32'hFFFF_FFFF,
        parameter [31:0]C_HIGHADDR                   = 32'h0000_0000,
        parameter       C_S_AXI_NUM_READ             = 32,
        parameter       C_M_AXI_NUM_READ             = 32,
        parameter       C_S_AXI_NUM_WRITE            = 32,
        parameter       C_M_AXI_NUM_WRITE            = 32,
        parameter       MSIX_IMPL_EXT                = "TRUE",
        parameter       AXI_ACLK_LOOPBACK            = "FALSE",
        parameter       PL_DISABLE_UPCONFIG_CAPABLE  = "FALSE",
        parameter       PF0_BAR0_APERTURE_SIZE       = 5'b00011,
        parameter       PF0_BAR1_APERTURE_SIZE       = 5'b00000,
        parameter       PF0_BAR2_APERTURE_SIZE       = 5'b00011,
        parameter       PF0_BAR3_APERTURE_SIZE       = 5'b00011,
        parameter       PF0_BAR4_APERTURE_SIZE       = 5'b00011,
        parameter       PF0_BAR5_APERTURE_SIZE       = 5'b00011,
        parameter       PF0_BAR6_APERTURE_SIZE       = 5'b00011,
        parameter       PF0_BAR0_CONTROL             = 3'b100,
        parameter       PF0_BAR1_CONTROL             = 3'b000,
        parameter       PF0_BAR2_CONTROL             = 3'b100,
        parameter       PF0_BAR3_CONTROL             = 3'b000,
        parameter       PF0_BAR4_CONTROL             = 3'b100,
        parameter       PF0_BAR5_CONTROL             = 3'b000,
        parameter       PF0_BAR6_CONTROL             = 3'b000,
        parameter       PF0_SRIOV_BAR0_CONTROL       = 3'b100,
        parameter       PF0_SRIOV_BAR1_CONTROL       = 3'b000,
        parameter       PF0_SRIOV_BAR2_CONTROL       = 3'b100,
        parameter       PF0_SRIOV_BAR3_CONTROL       = 3'b000,
        parameter       PF0_SRIOV_BAR4_CONTROL       = 3'b100,
        parameter       PF0_SRIOV_BAR5_CONTROL       = 3'b000,
        parameter [63:0]C_PCIEBAR2AXIBAR_0           = 64'h0000000000000000,
        parameter [63:0]C_PCIEBAR2AXIBAR_1           = 64'h0000000000000000,
        parameter [63:0]C_PCIEBAR2AXIBAR_2           = 64'h0000000000000000,
        parameter [63:0]C_PCIEBAR2AXIBAR_3           = 64'h0000000000000000,
        parameter [63:0]C_PCIEBAR2AXIBAR_4           = 64'h0000000000000000,
        parameter [63:0]C_PCIEBAR2AXIBAR_5           = 64'h0000000000000000,
        parameter [63:0]C_PCIEBAR2AXIBAR_6           = 64'h0000000000000000,
        parameter [63:0]PF0_VF_PCIEBAR2AXIBAR_0         = 64'h0000000000000000,
        parameter [63:0]PF0_VF_PCIEBAR2AXIBAR_1         = 64'h0000000000000000,
        parameter [63:0]PF0_VF_PCIEBAR2AXIBAR_2         = 64'h0000000000000000,
        parameter [63:0]PF0_VF_PCIEBAR2AXIBAR_3         = 64'h0000000000000000,
        parameter [63:0]PF0_VF_PCIEBAR2AXIBAR_4         = 64'h0000000000000000,
        parameter [63:0]PF0_VF_PCIEBAR2AXIBAR_5         = 64'h0000000000000000,
        parameter [63:0]PF0_VF_PCIEBAR2AXIBAR_6         = 64'h0000000000000000,
        parameter       PF1_BAR0_APERTURE_SIZE       = 5'b00011,
        parameter       PF1_BAR1_APERTURE_SIZE       = 5'b00000,
        parameter       PF1_BAR2_APERTURE_SIZE       = 5'b00011,
        parameter       PF1_BAR3_APERTURE_SIZE       = 5'b00011,
        parameter       PF1_BAR4_APERTURE_SIZE       = 5'b00011,
        parameter       PF1_BAR5_APERTURE_SIZE       = 5'b00011,
        parameter       PF1_BAR6_APERTURE_SIZE       = 5'b00011,
        parameter       PF1_BAR0_CONTROL             = 3'b100,
        parameter       PF1_BAR1_CONTROL             = 3'b000,
        parameter       PF1_BAR2_CONTROL             = 3'b100,
        parameter       PF1_BAR3_CONTROL             = 3'b000,
        parameter       PF1_BAR4_CONTROL             = 3'b100,
        parameter       PF1_BAR5_CONTROL             = 3'b000,
        parameter       PF1_BAR6_CONTROL             = 3'b000,
        parameter       PF1_SRIOV_BAR0_CONTROL       = 3'b100,
        parameter       PF1_SRIOV_BAR1_CONTROL       = 3'b000,
        parameter       PF1_SRIOV_BAR2_CONTROL       = 3'b100,
        parameter       PF1_SRIOV_BAR3_CONTROL       = 3'b000,
        parameter       PF1_SRIOV_BAR4_CONTROL       = 3'b100,
        parameter       PF1_SRIOV_BAR5_CONTROL       = 3'b000,
        parameter [63:0]PF1_PCIEBAR2AXIBAR_0         = 64'h0000000000000000,
        parameter [63:0]PF1_PCIEBAR2AXIBAR_1         = 64'h0000000000000000,
        parameter [63:0]PF1_PCIEBAR2AXIBAR_2         = 64'h0000000000000000,
        parameter [63:0]PF1_PCIEBAR2AXIBAR_3         = 64'h0000000000000000,
        parameter [63:0]PF1_PCIEBAR2AXIBAR_4         = 64'h0000000000000000,
        parameter [63:0]PF1_PCIEBAR2AXIBAR_5         = 64'h0000000000000000,
        parameter [63:0]PF1_PCIEBAR2AXIBAR_6         = 64'h0000000000000000,
        parameter [63:0]PF1_VF_PCIEBAR2AXIBAR_0         = 64'h0000000000000000,
        parameter [63:0]PF1_VF_PCIEBAR2AXIBAR_1         = 64'h0000000000000000,
        parameter [63:0]PF1_VF_PCIEBAR2AXIBAR_2         = 64'h0000000000000000,
        parameter [63:0]PF1_VF_PCIEBAR2AXIBAR_3         = 64'h0000000000000000,
        parameter [63:0]PF1_VF_PCIEBAR2AXIBAR_4         = 64'h0000000000000000,
        parameter [63:0]PF1_VF_PCIEBAR2AXIBAR_5         = 64'h0000000000000000,
        parameter [63:0]PF1_VF_PCIEBAR2AXIBAR_6         = 64'h0000000000000000,
        parameter       PF2_BAR0_APERTURE_SIZE       = 5'b00011,
        parameter       PF2_BAR1_APERTURE_SIZE       = 5'b00000,
        parameter       PF2_BAR2_APERTURE_SIZE       = 5'b00011,
        parameter       PF2_BAR3_APERTURE_SIZE       = 5'b00011,
        parameter       PF2_BAR4_APERTURE_SIZE       = 5'b00011,
        parameter       PF2_BAR5_APERTURE_SIZE       = 5'b00011,
        parameter       PF2_BAR6_APERTURE_SIZE       = 5'b00011,
        parameter       PF2_BAR0_CONTROL             = 3'b100,
        parameter       PF2_BAR1_CONTROL             = 3'b000,
        parameter       PF2_BAR2_CONTROL             = 3'b100,
        parameter       PF2_BAR3_CONTROL             = 3'b000,
        parameter       PF2_BAR4_CONTROL             = 3'b100,
        parameter       PF2_BAR5_CONTROL             = 3'b000,
        parameter       PF2_BAR6_CONTROL             = 3'b000,
        parameter       PF2_SRIOV_BAR0_CONTROL       = 3'b100,
        parameter       PF2_SRIOV_BAR1_CONTROL       = 3'b000,
        parameter       PF2_SRIOV_BAR2_CONTROL       = 3'b100,
        parameter       PF2_SRIOV_BAR3_CONTROL       = 3'b000,
        parameter       PF2_SRIOV_BAR4_CONTROL       = 3'b100,
        parameter       PF2_SRIOV_BAR5_CONTROL       = 3'b000,
        parameter [63:0]PF2_PCIEBAR2AXIBAR_0         = 64'h0000000000000000,
        parameter [63:0]PF2_PCIEBAR2AXIBAR_1         = 64'h0000000000000000,
        parameter [63:0]PF2_PCIEBAR2AXIBAR_2         = 64'h0000000000000000,
        parameter [63:0]PF2_PCIEBAR2AXIBAR_3         = 64'h0000000000000000,
        parameter [63:0]PF2_PCIEBAR2AXIBAR_4         = 64'h0000000000000000,
        parameter [63:0]PF2_PCIEBAR2AXIBAR_5         = 64'h0000000000000000,
        parameter [63:0]PF2_PCIEBAR2AXIBAR_6         = 64'h0000000000000000,
        parameter [63:0]PF2_VF_PCIEBAR2AXIBAR_0         = 64'h0000000000000000,
        parameter [63:0]PF2_VF_PCIEBAR2AXIBAR_1         = 64'h0000000000000000,
        parameter [63:0]PF2_VF_PCIEBAR2AXIBAR_2         = 64'h0000000000000000,
        parameter [63:0]PF2_VF_PCIEBAR2AXIBAR_3         = 64'h0000000000000000,
        parameter [63:0]PF2_VF_PCIEBAR2AXIBAR_4         = 64'h0000000000000000,
        parameter [63:0]PF2_VF_PCIEBAR2AXIBAR_5         = 64'h0000000000000000,
        parameter [63:0]PF2_VF_PCIEBAR2AXIBAR_6         = 64'h0000000000000000,
        parameter       PF3_BAR0_APERTURE_SIZE       = 5'b00011,
        parameter       PF3_BAR1_APERTURE_SIZE       = 5'b00000,
        parameter       PF3_BAR2_APERTURE_SIZE       = 5'b00011,
        parameter       PF3_BAR3_APERTURE_SIZE       = 5'b00011,
        parameter       PF3_BAR4_APERTURE_SIZE       = 5'b00011,
        parameter       PF3_BAR5_APERTURE_SIZE       = 5'b00011,
        parameter       PF3_BAR6_APERTURE_SIZE       = 5'b00011,
        parameter       PF3_BAR0_CONTROL             = 3'b100,
        parameter       PF3_BAR1_CONTROL             = 3'b000,
        parameter       PF3_BAR2_CONTROL             = 3'b100,
        parameter       PF3_BAR3_CONTROL             = 3'b000,
        parameter       PF3_BAR4_CONTROL             = 3'b100,
        parameter       PF3_BAR5_CONTROL             = 3'b000,
        parameter       PF3_BAR6_CONTROL             = 3'b000,
        parameter       PF3_SRIOV_BAR0_CONTROL       = 3'b100,
        parameter       PF3_SRIOV_BAR1_CONTROL       = 3'b000,
        parameter       PF3_SRIOV_BAR2_CONTROL       = 3'b100,
        parameter       PF3_SRIOV_BAR3_CONTROL       = 3'b000,
        parameter       PF3_SRIOV_BAR4_CONTROL       = 3'b100,
        parameter       PF3_SRIOV_BAR5_CONTROL       = 3'b000,
        parameter [63:0]PF3_PCIEBAR2AXIBAR_0         = 64'h0000000000000000,
        parameter [63:0]PF3_PCIEBAR2AXIBAR_1         = 64'h0000000000000000,
        parameter [63:0]PF3_PCIEBAR2AXIBAR_2         = 64'h0000000000000000,
        parameter [63:0]PF3_PCIEBAR2AXIBAR_3         = 64'h0000000000000000,
        parameter [63:0]PF3_PCIEBAR2AXIBAR_4         = 64'h0000000000000000,
        parameter [63:0]PF3_PCIEBAR2AXIBAR_5         = 64'h0000000000000000,
        parameter [63:0]PF3_PCIEBAR2AXIBAR_6         = 64'h0000000000000000,
        parameter [63:0]PF3_VF_PCIEBAR2AXIBAR_0         = 64'h0000000000000000,
        parameter [63:0]PF3_VF_PCIEBAR2AXIBAR_1         = 64'h0000000000000000,
        parameter [63:0]PF3_VF_PCIEBAR2AXIBAR_2         = 64'h0000000000000000,
        parameter [63:0]PF3_VF_PCIEBAR2AXIBAR_3         = 64'h0000000000000000,
        parameter [63:0]PF3_VF_PCIEBAR2AXIBAR_4         = 64'h0000000000000000,
        parameter [63:0]PF3_VF_PCIEBAR2AXIBAR_5         = 64'h0000000000000000,
        parameter [63:0]PF3_VF_PCIEBAR2AXIBAR_6         = 64'h0000000000000000,
        parameter       PCIEBAR_NUM                  = 6,
        parameter       BARLITE1                     = 0,
        parameter       BARLITE2                     = 0,
        parameter       BARLITE_MB_PF0               = 0,
        parameter       BARLITE_MB_PF1               = 0,
        parameter       BARLITE_MB_PF2               = 0,
        parameter       BARLITE_MB_PF3               = 0,
        parameter       C_MSIX_INT_TABLE_EN          = 1,
        parameter       VCU118_BOARD                 = "FALSE",
        parameter       TCQ                          = 1,
        parameter       C_AXIBAR_AS_0                = 1,
        parameter       C_AXIBAR_AS_1                = 1,
        parameter       C_AXIBAR_AS_2                = 1,
        parameter       C_AXIBAR_AS_3                = 1,
        parameter       C_AXIBAR_AS_4                = 1,
        parameter       C_AXIBAR_AS_5                = 1,
        parameter       C_MSI_ENABLED                = (DEV_PORT_TYPE == 2) ? RP_MSI_ENABLED : MSI_ENABLED,
        parameter       C_NUM_DSC_PCIE_RID           = 32,
        parameter       C_NUM_PCIE_DSC_CPL_DID       = 512,
        parameter       C_NUM_AXI_DSC_CPL_DID        = 64,
        parameter [7:0] MULTQ_CHNL                   = 8'h00,
        parameter       IMPL_TARGET                  = "SOFT",
        parameter       C_M_AXI_DATA_WIDTH           = AXI_DATA_WIDTH,
        parameter       C_M_AXI_WUSER_WIDTH          = C_M_AXI_DATA_WIDTH/8,
        parameter       C_M_AXI_BUSER_WIDTH          = 1,
        parameter       C_M_AXI_RUSER_WIDTH          = C_M_AXI_DATA_WIDTH/8,
        parameter       USE_ATTR                     = 0,  // dont want to use Attribute
        parameter       XDMA_DSC_ENG                 = 1,  // Use XDMA dsc format
        parameter       C_H2C_TUSER_WIDTH            = 55,
        parameter       C_H2C_DATA_WIDTH             = 64,
        parameter       C_C2H_DATA_WIDTH             = 64,
        parameter       C_C2H_CTRL_WIDTH             = 37,
        parameter       C_C2H_TUSER_WIDTH            = 64,
        parameter       C_AXIBAR_REGIONEN            = 0,
        parameter       C_AXIBAR_NOXLATE             = 0,
        parameter       C_AXIBAR2PCIEATTR_0          = 3'b000,
        parameter       C_AXIBAR2PCIEATTR_1          = 3'b000,
        parameter       C_AXIBAR2PCIEATTR_2          = 3'b000,
        parameter       C_AXIBAR2PCIEATTR_3          = 3'b000,
        parameter       C_AXIBAR2PCIEATTR_4          = 3'b000,
        parameter       C_AXIBAR2PCIEATTR_5          = 3'b000,
        parameter       C_IGNORE_SIZE_AXI_SLAVE      = 1,
        parameter       C_TIMEOUT0_SEL               = 4'd14,
        parameter       C_TIMEOUT1_SEL               = 4'd15,
        parameter       C_TIMEOUT_MULT               = 3'h3,
        parameter       C_OLD_BRIDGE_TIMEOUT         = 0,
        parameter       C_LAST_CORE_CAP_ADDR         = 12'h100,     // DWORD address of last enabled block capability
        parameter       C_VSEC_CAP_ADDR              = 12'h128,     // DWORD address of start of VSEC Header
        parameter       C_VSEC_CAP_LAST              = "FALSE",     // VSEC next capability offset control
        parameter       C_VSEC_ID                    = 16'h0000,
        parameter       C_NUM_USER_INTR              = 9,           // Number of user interrupts in User interrupt vector
        parameter       C_NUM_USER_NEW_INTR          = 6,           // Number of user interrupts in User interrupt vector
        parameter       C_USER_PTR                   = 16'h00D8,    // Address pointer to User Space
        parameter       C_S_AXI_SUPPORTS_NARROW_BURST= 0,
        parameter       C_S_AXI_ID_WIDTH             = 4,
        parameter       CRC_WIDTH                    = 32,
        parameter       C_S_AXI_ADDR_WIDTH           = AXI_ADDR_WIDTH,
        parameter       C_S_AXI_DATA_WIDTH           = AXI_DATA_WIDTH,
        parameter       C_M_AXI_ADDR_WIDTH           = AXI_ADDR_WIDTH,
        parameter       C_S_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH,
        parameter       C_M_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH,
        parameter       C_M_AXIS_RQ_USER_WIDTH       = 137,
        parameter       C_S_AXIS_CQP_USER_WIDTH      = 183,
        parameter       C_S_AXIS_CQ_USER_WIDTH       = 183,
        parameter       C_M_AXIS_RC_USER_WIDTH       = 161,
        parameter       C_S_AXIS_CC_USER_WIDTH       = 81,
        parameter       C_M_AXIL_AWUSER_WIDTH        = 55,
        parameter       C_M_AXIL_ARUSER_WIDTH        = 55,
        parameter       C_M_AXI_AWUSER_WIDTH         = 32,
        parameter       C_M_AXI_ARUSER_WIDTH         = 32,
        parameter       C_M_AXIB_AWUSER_WIDTH        = 55,
        parameter       C_M_AXIB_ARUSER_WIDTH        = 55,
        parameter       C_S_AXIB_AWUSER_WIDTH        = 12,
        parameter       C_S_AXIB_ARUSER_WIDTH        = 12,
        parameter       C_S_KEEP_WIDTH               = C_S_AXI_DATA_WIDTH / 32,
        parameter       C_M_KEEP_WIDTH               = C_M_AXI_DATA_WIDTH / 32,
        parameter       C_KEEP_WIDTH                 = AXI_DATA_WIDTH/8,
        parameter       C_S_AXIS_USER_WIDTH          = 64,
        parameter       C_M_AXIS_USER_WIDTH          = 64,
        parameter       C_ADDR_ALGN                  = 1, // Bytes
        parameter       C_ECC_ENABLE                 = 0,
        parameter       C_DSC_MAGIC_EN               = 1,
        parameter       C_NUMQ_PER_CHNL              = 256,
        parameter       C_RD_BUFFER_ADDR_SIZE        = 9,
        parameter       C_RD_BUFFER_SIZE_BITS        = 5,
        parameter       C_PCIEBAR_NUM                = PCIEBAR_NUM,
        parameter       C_PCIEBAR_AS                 = 1,
        parameter       C_NUM_MSIX_VECTORS           = 32,
        parameter       DMA_SP                       = 0,
        parameter       DMA_MM                       = 1,
        parameter       DMA_ST                       = 0,
        parameter       DMA_COMPLETION               = 0,
        parameter       DMA_RESET_SOURCE_SEL         = 0,
        parameter       C_ADDR_BITS                  = 64,
        parameter       STS_WIDTH                    = 8,
        parameter       BACKPRESSURE                 = 0,
        parameter       USR_MPL_SIZE                 = 4096,
        parameter       USR_MRS_SIZE                 = 4096,
        parameter       PMON_EN                      = 1,
        parameter       C_MDMA_DSC_IN_NUM_CHNL       = 3,    // only 2 interface for Dsc bypass IN. MM and ST
        parameter       MULT_PF_DES                  = "FALSE",
        parameter       SPLIT_DMA                    = "FALSE",
        parameter       PIPE_LINE_STAGE              = 2,
        parameter       VU9P_TUL_EX                  = "FALSE",
        parameter       XLNX_DDR_EX                  = "FALSE",
        parameter       PCIE_BLK_TYPE                = 0,
        parameter       GEN4_EIEOS_0S7               = "FALSE",
        parameter       CCIX_ENABLE                  = "FALSE",
        parameter       CCIX_DVSEC	                 = "FALSE",
        parameter       ENABLE_ATS_SWITCH            = "FALSE",
        parameter       CDC_WB_EN                    = 1,
        parameter       AXIS_CCIX_RX_TDATA_WIDTH     = (AXI_DATA_WIDTH == 512 ? 512 : 256),
        parameter       AXIS_CCIX_TX_TDATA_WIDTH     = (AXI_DATA_WIDTH == 512 ? 512 : 256),
        parameter       AXIS_CCIX_RX_TUSER_WIDTH     = (AXI_DATA_WIDTH == 512 ? 101 : 47),
        parameter       AXIS_CCIX_TX_TUSER_WIDTH     = (AXI_DATA_WIDTH == 512 ? 101 : 47),
        parameter       C_ATS_DATA_WIDTH             = AXI_DATA_WIDTH,
        parameter       C_ATS_CQ_TUSER_WIDTH         = C_S_AXIS_CQ_USER_WIDTH,
        parameter       C_ATS_CC_TUSER_WIDTH         = C_S_AXIS_CC_USER_WIDTH,
        parameter       C_ATS_RQ_TUSER_WIDTH         = C_M_AXIS_RQ_USER_WIDTH,
        parameter       C_ATS_RC_TUSER_WIDTH         = C_M_AXIS_RC_USER_WIDTH,
        parameter       EXT_SYS_CLK_BUFG             = "FALSE",
        parameter       GTCOM_IN_CORE                = 1,
        parameter       C_NUM_OF_SC                  = 1,
        parameter       USR_IRQ_EXDES                = "FALSE",
        parameter       AXI_VIP_IN_EXDES             = "FALSE",
        parameter       XDMA_NON_INCREMENTAL_EXDES   = "FALSE",
        parameter       XDMA_ST_INFINITE_DESC_EXDES  = "FALSE",
        parameter       ACS_EXT_CAP_ENABLE           = "FALSE",
        parameter       EXT_XVC_VSEC_ENABLE          = "FALSE",
        parameter       EN_PCIE_DEBUG_PORTS          = "FALSE",
        parameter       C_MAX_NUM_QUEUE              = 2048,
        parameter       DMA_MODE_EN                  = "FALSE",
        parameter       MULTQ_EN                     = 0,
        parameter       C_PCIE_PFS_SUPPORTED         = 0,
        parameter       C_SRIOV_EN                   = 0,
        parameter       BARLITE_EXT_PF0              = 6'h00,
        parameter       BARLITE_EXT_PF1              = 6'h00,
        parameter       BARLITE_EXT_PF2              = 6'h00,
        parameter       BARLITE_EXT_PF3              = 6'h00,
        parameter       BARLITE_INT_PF0              = 6'h01,
        parameter       BARLITE_INT_PF1              = 6'h00,
        parameter       BARLITE_INT_PF2              = 6'h00,
        parameter       BARLITE_INT_PF3              = 6'h00,
        parameter       BARLITE_MSIX_PF0             = 6'h00,
        parameter       BARLITE_MSIX_PF1             = 6'h00,
        parameter       BARLITE_MSIX_PF2             = 6'h00,
        parameter       BARLITE_MSIX_PF3             = 6'h00,
        parameter       NUM_VFS_PF0                  = 4,
        parameter       NUM_VFS_PF1                  = 0,
        parameter       NUM_VFS_PF2                  = 0,
        parameter       NUM_VFS_PF3                  = 0,
        parameter       FIRSTVF_OFFSET_PF0           = 0,
        parameter       FIRSTVF_OFFSET_PF1           = 0,
        parameter       FIRSTVF_OFFSET_PF2           = 0,
        parameter       FIRSTVF_OFFSET_PF3           = 0,
        parameter       VF_BARLITE_EXT_PF0           = 6'h00,
        parameter       VF_BARLITE_EXT_PF1           = 6'h00,
        parameter       VF_BARLITE_EXT_PF2           = 6'h00,
        parameter       VF_BARLITE_EXT_PF3           = 6'h00,
        parameter       VF_BARLITE_INT_PF0           = 6'h01,
        parameter       VF_BARLITE_INT_PF1           = 6'h00,
        parameter       VF_BARLITE_INT_PF2           = 6'h00,
        parameter       VF_BARLITE_INT_PF3           = 6'h00,
        parameter       C_C2H_NUM_CHNL               = 2,
        parameter       C_H2C_NUM_CHNL               = 2,
        parameter       H2C_XDMA_CHNL                = 8'h0F,
        parameter       C2H_XDMA_CHNL                = 8'h0F,
        parameter[17:0] AXISTEN_IF_ENABLE_MSG_ROUTE  =18'h0,
        parameter       ENABLE_MORE                  ="FALSE",
        parameter       DISABLE_BRAM_PIPELINE        ="FALSE",
        parameter       DISABLE_EQ_SYNCHRONIZER      ="FALSE",
        parameter       C_ENABLE_RESOURCE_REDUCTION  ="FALSE",
        parameter       C_ATS_ENABLE                 ="FALSE",
        parameter       C_PRI_ENABLE                 ="FALSE",
        parameter       C_FF_ON_INT_IF               ="FALSE",
        parameter[29:0] C_ATS_OFFSET                 = 30'h120, // In DW offset; << 2 bits for Byte offset
        parameter[29:0] C_PR_OFFSET                  = 30'h124, // In DW offset; << 2 bits for Byte offset
        parameter[11:0] C_ATS_CAP_NEXTPTR            = 12'h000,
        parameter[11:0] C_PR_CAP_NEXTPTR             = 12'h000,
        parameter[4:0]  C_INV_QUEUE_DEPTH            = 5'h00,
        parameter       PF0_VF_BAR0_APERTURE_SIZE    = 5'b00011,
        parameter       PF0_VF_BAR1_APERTURE_SIZE    = 5'b00011,
        parameter       PF0_VF_BAR2_APERTURE_SIZE    = 5'b00011,
        parameter       PF0_VF_BAR3_APERTURE_SIZE    = 5'b00011,
        parameter       PF0_VF_BAR4_APERTURE_SIZE    = 5'b00011,
        parameter       PF0_VF_BAR5_APERTURE_SIZE    = 5'b00011,
        parameter       PF0_VF_BAR6_APERTURE_SIZE    = 5'b00011,
        parameter       PF1_VF_BAR0_APERTURE_SIZE    = 5'b00011,
        parameter       PF1_VF_BAR1_APERTURE_SIZE    = 5'b00011,
        parameter       PF1_VF_BAR2_APERTURE_SIZE    = 5'b00011,
        parameter       PF1_VF_BAR3_APERTURE_SIZE    = 5'b00011,
        parameter       PF1_VF_BAR4_APERTURE_SIZE    = 5'b00011,
        parameter       PF1_VF_BAR5_APERTURE_SIZE    = 5'b00011,
        parameter       PF1_VF_BAR6_APERTURE_SIZE    = 5'b00011,
        parameter       PF2_VF_BAR0_APERTURE_SIZE    = 5'b00011,
        parameter       PF2_VF_BAR1_APERTURE_SIZE    = 5'b00011,
        parameter       PF2_VF_BAR2_APERTURE_SIZE    = 5'b00011,
        parameter       PF2_VF_BAR3_APERTURE_SIZE    = 5'b00011,
        parameter       PF2_VF_BAR4_APERTURE_SIZE    = 5'b00011,
        parameter       PF2_VF_BAR5_APERTURE_SIZE    = 5'b00011,
        parameter       PF2_VF_BAR6_APERTURE_SIZE    = 5'b00011,
        parameter       PF3_VF_BAR0_APERTURE_SIZE    = 5'b00011,
        parameter       PF3_VF_BAR1_APERTURE_SIZE    = 5'b00011,
        parameter       PF3_VF_BAR2_APERTURE_SIZE    = 5'b00011,
        parameter       PF3_VF_BAR3_APERTURE_SIZE    = 5'b00011,
        parameter       PF3_VF_BAR4_APERTURE_SIZE    = 5'b00011,
        parameter       PF3_VF_BAR5_APERTURE_SIZE    = 5'b00011,
        parameter       PF3_VF_BAR6_APERTURE_SIZE    = 5'b00011,
        parameter       PF0_ADDR_MASK                = 32'h0000FFFF,
        parameter       PF1_ADDR_MASK                = 32'h0000FFFF,
        parameter       PF2_ADDR_MASK                = 32'h0000FFFF,
        parameter       PF3_ADDR_MASK                = 32'h0000FFFF,
        parameter       PF0_VF_ADDR_MASK             = 32'h00000FFF,
        parameter       PF1_VF_ADDR_MASK             = 32'h00000FFF,
        parameter       PF2_VF_ADDR_MASK             = 32'h00000FFF,
        parameter       PF3_VF_ADDR_MASK             = 32'h00000FFF,
        parameter       FLR_ENABLE                   = "TRUE",
        parameter       MAILBOX_ENABLE               = "FALSE",
        parameter       CFG_SPACE_ENABLE             = "FALSE",
        parameter       WRB_COAL_MAX_BUF             = 8,
        parameter       MDMA_PFCH_CACHE_DEPTH        = 8,
        parameter       CMP_COL_REG_0                = 9'h001,
        parameter       CMP_COL_REG_1                = 9'h000,
        parameter       CMP_COL_REG_2                = 9'h000,
        parameter       CMP_COL_REG_3                = 9'h000,
        parameter       CMP_COL_REG_4                = 9'h000,
        parameter       CMP_COL_REG_5                = 9'h000,
        parameter       CMP_COL_REG_6                = 9'h000,
        parameter       CMP_COL_REG_7                = 9'h000,
        parameter       CMP_ERR_REG_0                = 9'h002,
        parameter       CMP_ERR_REG_1                = 9'h000,
        parameter       CMP_ERR_REG_2                = 9'h000,
        parameter       CMP_ERR_REG_3                = 9'h000,
        parameter       CMP_ERR_REG_4                = 9'h000,
        parameter       CMP_ERR_REG_5                = 9'h000,
        parameter       CMP_ERR_REG_6                = 9'h000,
        parameter       CMP_ERR_REG_7                = 9'h000,
        parameter       C2H_STREAM_CPL_DATA_SIZE     = 2'h000,
        parameter[31:0] C_OST_PR_CAP                 = 32'h0,
        parameter       ARI_CAP_ENABLE =           "TRUE",
        parameter       AXISTEN_IF_MSIX_RX_PARITY_EN ="FALSE",
        parameter       AXISTEN_IF_MSIX_TO_RAM_PIPELINE ="TRUE",
        parameter       AXISTEN_IF_MSIX_FROM_RAM_PIPELINE ="TRUE",

        parameter [28:0]  PF0_MSIX_CAP_TABLE_OFFSET ='H30000, //'H30000,
        parameter [28:0]  PF1_MSIX_CAP_TABLE_OFFSET ='H30000, //'H30000,
        parameter [28:0]  PF2_MSIX_CAP_TABLE_OFFSET ='H30000, //'H30000,
        parameter [28:0]  PF3_MSIX_CAP_TABLE_OFFSET ='H30000, //'H30000,

        parameter  [28:0] VFG0_MSIX_CAP_TABLE_OFFSET ='H4000,
        parameter  [28:0] VFG1_MSIX_CAP_TABLE_OFFSET ='H4000,
        parameter  [28:0] VFG2_MSIX_CAP_TABLE_OFFSET ='H4000,
        parameter  [28:0] VFG3_MSIX_CAP_TABLE_OFFSET ='H4000,

        parameter [10:0]    PF0_MSIX_CAP_TABLE_SIZE=11'h7,
        parameter [10:0]    PF1_MSIX_CAP_TABLE_SIZE=11'h7,
        parameter [10:0]    PF2_MSIX_CAP_TABLE_SIZE=11'h7,
        parameter [10:0]    PF3_MSIX_CAP_TABLE_SIZE=11'h7,

        parameter [10:0]    VFG0_MSIX_CAP_TABLE_SIZE=PF0_MSIX_CAP_TABLE_SIZE,
        parameter [10:0]    VFG1_MSIX_CAP_TABLE_SIZE=PF1_MSIX_CAP_TABLE_SIZE,
        parameter [10:0]    VFG2_MSIX_CAP_TABLE_SIZE=PF2_MSIX_CAP_TABLE_SIZE,
        parameter [10:0]    VFG3_MSIX_CAP_TABLE_SIZE=PF3_MSIX_CAP_TABLE_SIZE,
        parameter    PF0_MSIX_VECTORS='h8,
        parameter    PF1_MSIX_VECTORS='h8,
        parameter    PF2_MSIX_VECTORS='h8,
        parameter    PF3_MSIX_VECTORS='h8,
        parameter    PCIE_ID_IF="TRUE",
        parameter    ADV_INT_USR="FALSE",
        parameter    ENABLE_ERROR_INJECTION="FALSE",
        parameter    WRB_COAL_LOOP_FIX_DISABLE=0,
        parameter    ENABLE_AT_PORTS="FALSE",
        parameter    VIRTIO_EN = "FALSE",
        parameter    MHOST_EN  = "FALSE",
        parameter    SOFT_NIC  = "FALSE",
        parameter    SOFT_NIC_BRIDGE  = "FALSE",
        parameter    VDM_EN    = "FALSE",
        parameter    USE_STANDARD_INTERFACES    ="FALSE",
        parameter    DMA_2RP                    ="FALSE",
        parameter    ALF_CAP_ENABLE = "FALSE",
        parameter    ASYNC_CLK_ENABLE = "FALSE",
        parameter    DATA_MOVER = "FALSE",
        parameter    CSR_MODULE       = 1,
        parameter    C_AXIBAR_NOTRANSLATE       = 0,
        parameter    USR_IRQ_XDMA_TYPE_INTERFACE="FALSE",
        parameter    RBAR_ENABLE                ="FALSE",
        parameter    VERSAL_PART_TYPE = "VPT",
        parameter    ALF_CAP_NEXTPTR = 'h0
)
(
  sys_clk,
  sys_clk_ce_out,
  sys_clk_gt,
  sys_rst_n,
  user_lnk_up,
  user_clk_dma_in,
  user_reset_dma_in,
  user_reset_dma_out,
  cfg_ltssm_state,
  config_space_enable,
  single_bit_err_inject_reg,
  double_bit_err_inject_reg,

  pci_exp_txp,
  pci_exp_txn,
  pci_exp_rxp,
  pci_exp_rxn,

  cfg_dev_id_pf0,
  cfg_dev_id_pf1,
  cfg_dev_id_pf2,
  cfg_dev_id_pf3,
  cfg_vend_id,
  cfg_rev_id_pf0,
  cfg_rev_id_pf1,
  cfg_rev_id_pf2,
  cfg_rev_id_pf3,
  cfg_subsys_id_pf0,
  cfg_subsys_id_pf1,
  cfg_subsys_id_pf2,
  cfg_subsys_id_pf3,
  cfg_subsys_vend_id,

  st_rx_msg_rdy,
  st_rx_msg_data,
  st_rx_msg_valid,
  st_rx_msg_last,
  st_rx_msg_error,

  free_run_clock,
  gt_drp_clk,
  axi_aclk,
  axi_aresetn,
  phy_ready,
  soft_reset_n,

  axi_ctl_aclk,
  axi_ctl_aresetn,

  usr_irq_req,
  usr_irq_ack,
  usr_irq_function_number,
  msi_enable,
  msi_vector_width,
  // AXI MM interface
  m_axi_awid,
  m_axi_awaddr,
  m_axi_awuser,
  m_axi_awlen,
  m_axi_awsize,
  m_axi_awburst,
  m_axi_awprot,
  m_axi_awvalid,
  m_axi_awready,
  m_axi_awlock,
  m_axi_awcache,
  m_axi_wdata,
  m_axi_wuser,
  m_axi_wstrb,
  m_axi_wlast,
  m_axi_wvalid,
  m_axi_wready,
  m_axi_bid,
  m_axi_bresp,
  m_axi_bvalid,
  m_axi_bready,
  m_axi_arid,
  m_axi_araddr,
  m_axi_aruser,
  m_axi_arlen,
  m_axi_arsize,
  m_axi_arburst,
  m_axi_arprot,
  m_axi_arvalid,
  m_axi_arready,
  m_axi_arlock,
  m_axi_arcache,
  m_axi_rid,
  m_axi_rdata,
  m_axi_ruser,
  m_axi_rresp,
  m_axi_rlast,
  m_axi_rvalid,
  m_axi_rready,

  // AXI BYPASS interface
  m_axib_awid,
  m_axib_awaddr,
  m_axib_awuser,
  m_axib_awlen,
  m_axib_awsize,
  m_axib_awburst,
  m_axib_awprot,
  m_axib_awvalid,
  m_axib_awready,
  m_axib_awlock,
  m_axib_awcache,
  m_axib_wdata,
  m_axib_wuser,
  m_axib_wstrb,
  m_axib_wlast,
  m_axib_wvalid,
  m_axib_wready,
  m_axib_bid,
  m_axib_bresp,
  m_axib_bvalid,
  m_axib_bready,
  m_axib_arid,
  m_axib_araddr,
  m_axib_aruser,
  m_axib_arlen,
  m_axib_arsize,
  m_axib_arburst,
  m_axib_arprot,
  m_axib_arvalid,
  m_axib_arready,
  m_axib_arlock,
  m_axib_arcache,
  m_axib_rid,
  m_axib_rdata,
  m_axib_ruser,
  m_axib_rresp,
  m_axib_rlast,
  m_axib_rvalid,
  m_axib_rready,

// AXI-Slave Interface (BRIDGE)
  s_axib_awid,
  s_axib_awaddr,
  s_axib_awregion,
  s_axib_awuser,
  s_axib_awlen,
  s_axib_awsize,
  s_axib_awburst,
  s_axib_awvalid,
  s_axib_awready,
  s_axib_wdata,
  s_axib_wstrb,
  s_axib_wlast,
  s_axib_wvalid,
  s_axib_wready,
  s_axib_bid,
  s_axib_bresp,
  s_axib_bvalid,
  s_axib_bready,
  s_axib_arid,
  s_axib_araddr,
  s_axib_arregion,
  s_axib_aruser,
  s_axib_arlen,
  s_axib_arsize,
  s_axib_arburst,
  s_axib_arvalid,
  s_axib_arready,
  s_axib_rid,
  s_axib_rresp,
  s_axib_rlast,
  s_axib_rvalid,
  s_axib_rdata,
  s_axib_wuser,
  s_axib_ruser,
  s_axib_rready,
  interrupt_out,
  interrupt_out_msi_vec0to31,
  interrupt_out_msi_vec32to63,

  s_axis_c2h_tdata_0,
  s_axis_c2h_tlast_0,
  s_axis_c2h_tuser_0,
  s_axis_c2h_tkeep_0,
  s_axis_c2h_tvalid_0,
  s_axis_c2h_tready_0,

  m_axis_h2c_tdata_0,
  m_axis_h2c_tlast_0,
  m_axis_h2c_tuser_0,
  m_axis_h2c_tkeep_0,
  m_axis_h2c_tvalid_0,
  m_axis_h2c_tready_0,

  s_axis_c2h_tdata_1,
  s_axis_c2h_tlast_1,
  s_axis_c2h_tuser_1,
  s_axis_c2h_tkeep_1,
  s_axis_c2h_tvalid_1,
  s_axis_c2h_tready_1,

  m_axis_h2c_tdata_1,
  m_axis_h2c_tlast_1,
  m_axis_h2c_tuser_1,
  m_axis_h2c_tkeep_1,
  m_axis_h2c_tvalid_1,
  m_axis_h2c_tready_1,

  s_axis_c2h_tdata_2,
  s_axis_c2h_tlast_2,
  s_axis_c2h_tuser_2,
  s_axis_c2h_tkeep_2,
  s_axis_c2h_tvalid_2,
  s_axis_c2h_tready_2,

  m_axis_h2c_tdata_2,
  m_axis_h2c_tlast_2,
  m_axis_h2c_tuser_2,
  m_axis_h2c_tkeep_2,
  m_axis_h2c_tvalid_2,
  m_axis_h2c_tready_2,

  s_axis_c2h_tdata_3,
  s_axis_c2h_tlast_3,
  s_axis_c2h_tuser_3,
  s_axis_c2h_tkeep_3,
  s_axis_c2h_tvalid_3,
  s_axis_c2h_tready_3,

  m_axis_h2c_tdata_3,
  m_axis_h2c_tlast_3,
  m_axis_h2c_tuser_3,
  m_axis_h2c_tkeep_3,
  m_axis_h2c_tvalid_3,
  m_axis_h2c_tready_3,

  // AXI-Lite Interface
  m_axil_awaddr,
  m_axil_awuser,
  m_axil_awprot,
  m_axil_awvalid,
  m_axil_awready,
  m_axil_wdata,
  m_axil_wstrb,
  m_axil_wvalid,
  m_axil_wready,
  m_axil_bvalid,
  m_axil_bresp,
  m_axil_bready,
  m_axil_araddr,
  m_axil_aruser,
  m_axil_arprot,
  m_axil_arvalid,
  m_axil_arready,
  m_axil_rdata,
  m_axil_rresp,
  m_axil_rvalid,
  m_axil_rready,

  // AXI-Lite Interface
  s_axil_awaddr,
  s_axil_awuser,
  s_axil_awprot,
  s_axil_awvalid,
  s_axil_awready,
  s_axil_wdata,
  s_axil_wstrb,
  s_axil_wvalid,
  s_axil_wready,
  s_axil_bvalid,
  s_axil_bresp,
  s_axil_bready,
  s_axil_araddr,
  s_axil_aruser,
  s_axil_arprot,
  s_axil_arvalid,
  s_axil_arready,
  s_axil_rdata,
  s_axil_rresp,
  s_axil_rvalid,
  s_axil_rready,

  // AXI-Lite CSR Interface
  csr_prog_done,
  s_axil_csr_awaddr,
  s_axil_csr_awprot,
  s_axil_csr_awvalid,
  s_axil_csr_awready,
  s_axil_csr_wdata,
  s_axil_csr_wstrb,
  s_axil_csr_wvalid,
  s_axil_csr_wready,
  s_axil_csr_bvalid,
  s_axil_csr_bresp,
  s_axil_csr_bready,
  s_axil_csr_araddr,
  s_axil_csr_arprot,
  s_axil_csr_arvalid,
  s_axil_csr_arready,
  s_axil_csr_rdata,
  s_axil_csr_rresp,
  s_axil_csr_rvalid,
  s_axil_csr_rready,
  // Descriptor Bypass
  c2h_dsc_byp_ready_0,
  c2h_dsc_byp_src_addr_0,
  c2h_dsc_byp_dst_addr_0,
  c2h_dsc_byp_len_0,
  c2h_dsc_byp_ctl_0,
  c2h_dsc_byp_load_0,

  c2h_dsc_byp_ready_1,
  c2h_dsc_byp_src_addr_1,
  c2h_dsc_byp_dst_addr_1,
  c2h_dsc_byp_len_1,
  c2h_dsc_byp_ctl_1,
  c2h_dsc_byp_load_1,

  c2h_dsc_byp_ready_2,
  c2h_dsc_byp_src_addr_2,
  c2h_dsc_byp_dst_addr_2,
  c2h_dsc_byp_len_2,
  c2h_dsc_byp_ctl_2,
  c2h_dsc_byp_load_2,

  c2h_dsc_byp_ready_3,
  c2h_dsc_byp_src_addr_3,
  c2h_dsc_byp_dst_addr_3,
  c2h_dsc_byp_len_3,
  c2h_dsc_byp_ctl_3,
  c2h_dsc_byp_load_3,

  h2c_dsc_byp_ready_0,
  h2c_dsc_byp_src_addr_0,
  h2c_dsc_byp_dst_addr_0,
  h2c_dsc_byp_len_0,
  h2c_dsc_byp_ctl_0,
  h2c_dsc_byp_load_0,

  h2c_dsc_byp_ready_1,
  h2c_dsc_byp_src_addr_1,
  h2c_dsc_byp_dst_addr_1,
  h2c_dsc_byp_len_1,
  h2c_dsc_byp_ctl_1,
  h2c_dsc_byp_load_1,

  h2c_dsc_byp_ready_2,
  h2c_dsc_byp_src_addr_2,
  h2c_dsc_byp_dst_addr_2,
  h2c_dsc_byp_len_2,
  h2c_dsc_byp_ctl_2,
  h2c_dsc_byp_load_2,

  h2c_dsc_byp_ready_3,
  h2c_dsc_byp_src_addr_3,
  h2c_dsc_byp_dst_addr_3,
  h2c_dsc_byp_len_3,
  h2c_dsc_byp_ctl_3,
  h2c_dsc_byp_load_3,

  c2h_sts_0,
  h2c_sts_0,
  c2h_sts_1,
  h2c_sts_1,
  c2h_sts_2,
  h2c_sts_2,
  c2h_sts_3,
  h2c_sts_3,

  m_axis_h2c_tdata,
  m_axis_h2c_tcrc,
  m_axis_h2c_tuser_qid,
  m_axis_h2c_tuser_port_id,
  m_axis_h2c_tuser_err,
  m_axis_h2c_tuser_mdata,
  m_axis_h2c_tuser_mty,
  m_axis_h2c_tuser_zero_byte,
  m_axis_h2c_tvalid,
  m_axis_h2c_tready,
  m_axis_h2c_tlast,


  s_axis_c2h_tdata,
  s_axis_c2h_tcrc,
  s_axis_c2h_ctrl_port_id,
  s_axis_c2h_ctrl_len,
  s_axis_c2h_ctrl_qid,
  s_axis_c2h_ctrl_has_cmpt,
  s_axis_c2h_ctrl_marker,
  s_axis_c2h_tvalid,
  s_axis_c2h_tready,
  s_axis_c2h_tlast,
  s_axis_c2h_mty,
  s_axis_c2h_ctrl_host_id,
  s_axis_c2h_ctrl_num_buf_ov,
  s_axis_c2h_ctrl_drop_req,
  s_axis_c2h_ctrl_var_desc,
  s_axis_c2h_ctrl_ecc,


  s_axis_c2h_cmpt_tdata,
  s_axis_c2h_cmpt_size,
  s_axis_c2h_cmpt_dpar,
  s_axis_c2h_cmpt_tvalid,
  s_axis_c2h_cmpt_tready,
  s_axis_c2h_cmpt_ctrl_qid,
  s_axis_c2h_cmpt_ctrl_cmpt_type,
  s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id,
  s_axis_c2h_cmpt_ctrl_port_id,
  s_axis_c2h_cmpt_ctrl_marker,
  s_axis_c2h_cmpt_ctrl_user_trig,
  s_axis_c2h_cmpt_ctrl_col_idx,
  s_axis_c2h_cmpt_ctrl_err_idx,
  s_axis_c2h_cmpt_ctrl_pld_virt_ch,
  s_axis_c2h_cmpt_ctrl_non_blocking,
  s_axis_c2h_cmpt_ctrl_no_wrb_marker,

  h2c_byp_out_dsc,
  h2c_byp_out_mm_chn,
  h2c_byp_out_st_mm,
  h2c_byp_out_qid,
  h2c_byp_out_dsc_sz,
  h2c_byp_out_error,
  h2c_byp_out_func,
  h2c_byp_out_cidx,
  h2c_byp_out_port_id,
  h2c_byp_out_vld,
  h2c_byp_out_rdy,
  h2c_byp_out_fmt,
  h2c_byp_out_cnt,
  h2c_byp_out_host_id,
  h2c_byp_out_pasid_en,
  h2c_byp_out_pasid,
  h2c_byp_out_end_rng,

  c2h_byp_out_dsc,
  c2h_byp_out_st_mm,
  c2h_byp_out_dsc_sz,
  c2h_byp_out_qid,
  c2h_byp_out_error,
  c2h_byp_out_func,
  c2h_byp_out_cidx,
  c2h_byp_out_port_id,
  c2h_byp_out_mm_chn,
  c2h_byp_out_vld,
  c2h_byp_out_rdy,
  c2h_byp_out_fmt,
  c2h_byp_out_cnt,
  c2h_byp_out_host_id,
  c2h_byp_out_pasid_en,
  c2h_byp_out_pasid,
  c2h_byp_out_var_desc,
  c2h_byp_out_pfch_tag,
  c2h_byp_out_desc_chain,
  c2h_byp_out_end_rng,

  h2c_byp_in_mm_radr,
  h2c_byp_in_mm_wadr,
  h2c_byp_in_mm_len,
  h2c_byp_in_mm_sdi,
  h2c_byp_in_mm_mrkr_req,
  h2c_byp_in_mm_err2ctxt,
  h2c_byp_in_mm_qid,
  h2c_byp_in_mm_error,
  h2c_byp_in_mm_func,
  h2c_byp_in_mm_cidx,
  h2c_byp_in_mm_port_id,
  h2c_byp_in_mm_at,
  h2c_byp_in_mm_vld,
  h2c_byp_in_mm_no_dma,
  h2c_byp_in_mm_rdy,
  h2c_byp_in_mm_host_id,
  h2c_byp_in_mm_pasid_en,
  h2c_byp_in_mm_pasid,

  h2c_byp_in_st_addr,
  h2c_byp_in_st_len,
  h2c_byp_in_st_eop,
  h2c_byp_in_st_sop,
  h2c_byp_in_st_sdi,
  h2c_byp_in_st_mrkr_req,
  h2c_byp_in_st_err2ctxt,
  h2c_byp_in_st_qid,
  h2c_byp_in_st_error,
  h2c_byp_in_st_func,
  h2c_byp_in_st_cidx,
  h2c_byp_in_st_port_id,
  h2c_byp_in_st_at,
  h2c_byp_in_st_no_dma,
  h2c_byp_in_st_vld,
  h2c_byp_in_st_rdy,
  h2c_byp_in_st_host_id,
  h2c_byp_in_st_pasid_en,
  h2c_byp_in_st_pasid,

  c2h_byp_in_mm_radr,
  c2h_byp_in_mm_wadr,
  c2h_byp_in_mm_len,
  c2h_byp_in_mm_sdi,
  c2h_byp_in_mm_mrkr_req,
  c2h_byp_in_mm_err2ctxt,
  c2h_byp_in_mm_qid,
  c2h_byp_in_mm_error,
  c2h_byp_in_mm_func,
  c2h_byp_in_mm_cidx,
  c2h_byp_in_mm_port_id,
  c2h_byp_in_mm_at,
  c2h_byp_in_mm_no_dma,
  c2h_byp_in_mm_vld,
  c2h_byp_in_mm_rdy,
  c2h_byp_in_mm_host_id,
  c2h_byp_in_mm_pasid_en,
  c2h_byp_in_mm_pasid,

  //c2h_byp_in_mm1_radr,
  //c2h_byp_in_mm1_wadr,
  //c2h_byp_in_mm1_len,
  //c2h_byp_in_mm1_sdi,
  //c2h_byp_in_mm1_mrkr_req,
  //c2h_byp_in_mm1_qid,
  //c2h_byp_in_mm1_error,
  //c2h_byp_in_mm1_func,
  //c2h_byp_in_mm1_cidx,
  //c2h_byp_in_mm1_port_id,
  //c2h_byp_in_mm1_at,
  //c2h_byp_in_mm1_no_dma,
  //c2h_byp_in_mm1_vld,
  //c2h_byp_in_mm1_rdy,
  //c2h_byp_in_mm1_host_id,
  //c2h_byp_in_mm1_pasid_en,
  //c2h_byp_in_mm1_pasid,

  c2h_byp_in_st_csh_addr,
  c2h_byp_in_st_csh_qid,
  c2h_byp_in_st_csh_error,
  c2h_byp_in_st_csh_func,
  c2h_byp_in_st_csh_port_id,
  c2h_byp_in_st_csh_err2ctxt,
  c2h_byp_in_st_csh_at,
  c2h_byp_in_st_csh_vld,
  c2h_byp_in_st_csh_rdy,
  c2h_byp_in_st_csh_cidx,
  c2h_byp_in_st_csh_fmt,
  c2h_byp_in_st_csh_host_id,
  c2h_byp_in_st_csh_pasid_en,
  c2h_byp_in_st_csh_pasid,
  c2h_byp_in_st_csh_var_desc,
  c2h_byp_in_st_csh_pfch_tag,
  c2h_byp_in_st_csh_len,

  tm_dsc_sts_vld,
  tm_dsc_sts_byp,
  tm_dsc_sts_qen,
  tm_dsc_sts_dir,
  tm_dsc_sts_mm,
  tm_dsc_sts_error,
  tm_dsc_sts_qid,
  tm_dsc_sts_avl,
  tm_dsc_sts_qinv,
  tm_dsc_sts_port_id,
  tm_dsc_sts_irq_arm,
  tm_dsc_sts_rdy,
  tm_dsc_sts_pidx,
  tm_dsc_sts_func,
  tm_dsc_sts_vio_hw_db,
  tm_dsc_sts_vio_sw_db,
  tm_dsc_sts_vio_avl_flg,
  tm_dsc_sts_vio_dsc_crdt,
  tm_dsc_sts_vio_en,

  dsc_crdt_in_vld,
  dsc_crdt_in_rdy,
  dsc_crdt_in_crdt,
  dsc_crdt_in_dir,
  dsc_crdt_in_fence,
  dsc_crdt_in_qid,
  dsc_crdt_in_misc,
  dsc_crdt_in_op,
  //dsc_crdt_in_bsel,
 // dsc_crdt_in_var_desc,
 // dsc_crdt_in_buf_sz_ix,
 // dsc_crdt_in_pfch_tag,



  axis_c2h_status_drop,
  axis_c2h_status_last,
  axis_c2h_status_valid,
  axis_c2h_status_qid,
  axis_c2h_status_cmp,
  axis_c2h_status_error,
  axis_c2h_status_port_id,
  axis_c2h_status_target_vh,
  axis_c2h_dmawr_cmp,
  axis_c2h_dmawr_target_vch,
  axis_c2h_dmawr_port_id,

// EQDMA VirtIO Descriptor Credit Input Ports
  virtio_dsc_crdt_in_vld,
  virtio_dsc_crdt_in_rdy,
  virtio_dsc_crdt_in_crdt,
  virtio_dsc_crdt_in_qid,
  virtio_dsc_crdt_in_dir,
  virtio_dsc_crdt_in_idx,

  mdma_c2h_st_mhost_feedback_qid_fifo_rd_out,
  mdma_c2h_st_mhost_feedback_payload_fifo_rd_out,
  mdma_c2h_st_mhost_feedback_pld_order,
  mdma_c2h_st_mhost_feedback_cmpt_fifo_rd_out,
  mdma_c2h_st_mhost_feedback_smpl_byp_rd_out,


  cfg_wrreq_flr_vld,
  cfg_wrreq_msi_vld,
  cfg_wrreq_msix_vld,
  cfg_wrreq_bme_vld,
  cfg_wrreq_vfe_vld,
  cfg_wrreq_func_num,
  cfg_wrreq_out_value,
  cfg_wrreq_flr_done,
  cfg_wrreq_flr_done_func_num,


  usr_irq_in_vld,
  usr_irq_in_vec,
  usr_irq_in_fnc,
  usr_irq_in_host_id,
  usr_irq_out_ack,
  usr_irq_out_fail,

  usr_flr_fnc,
  usr_flr_set,
  usr_flr_clr,
  usr_flr_done_fnc,
  usr_flr_done_vld,


  common_commands_in,
  pipe_rx_0_sigs,
  pipe_rx_1_sigs,
  pipe_rx_2_sigs,
  pipe_rx_3_sigs,
  pipe_rx_4_sigs,
  pipe_rx_5_sigs,
  pipe_rx_6_sigs,
  pipe_rx_7_sigs,
  pipe_rx_8_sigs,
  pipe_rx_9_sigs,
  pipe_rx_10_sigs,
  pipe_rx_11_sigs,
  pipe_rx_12_sigs,
  pipe_rx_13_sigs,
  pipe_rx_14_sigs,
  pipe_rx_15_sigs,
  common_commands_out,
  pipe_tx_0_sigs,
  pipe_tx_1_sigs,
  pipe_tx_2_sigs,
  pipe_tx_3_sigs,
  pipe_tx_4_sigs,
  pipe_tx_5_sigs,
  pipe_tx_6_sigs,
  pipe_tx_7_sigs,
  pipe_tx_8_sigs,
  pipe_tx_9_sigs,
  pipe_tx_10_sigs,
  pipe_tx_11_sigs,
  pipe_tx_12_sigs,
  pipe_tx_13_sigs,
  pipe_tx_14_sigs,
  pipe_tx_15_sigs,


  pipe_txprbssel,
  pipe_rxprbssel,
  pipe_txprbsforceerr,
  pipe_rxprbscntreset,
  pipe_loopback,
  pipe_rxprbserr,
  pipe_txinhibit,
  pipe_rst_fsm,
  pipe_qrst_fsm,
  pipe_rate_fsm,
  pipe_sync_fsm_tx,
  pipe_sync_fsm_rx,
  pipe_drp_fsm,
  pipe_rst_idle,
  pipe_qrst_idle,
  pipe_rate_idle,
  pipe_eyescandataerror,
  pipe_rxstatus,
  pipe_dmonitorout,
  pipe_cpll_lock,
  pipe_qpll_lock,
  pipe_rxpmaresetdone,
  pipe_rxbufstatus,
  pipe_txphaligndone,
  pipe_txphinitdone,
  pipe_txdlysresetdone,
  pipe_rxphaligndone,
  pipe_rxdlysresetdone,
  pipe_rxsyncdone,
  pipe_rxdisperr,
  pipe_rxnotintable,
  pipe_rxcommadet,
  gt_ch_drp_rdy,
  pipe_debug_0,
  pipe_debug_1,
  pipe_debug_2,
  pipe_debug_3,
  pipe_debug_4,
  pipe_debug_5,
  pipe_debug_6,
  pipe_debug_7,
  pipe_debug_8,
  pipe_debug_9,
  pipe_debug,

  gt_pcieuserratedone,
  gt_loopback,
  gt_txprbsforceerr,
  gt_txinhibit,
  gt_txprbssel,
  gt_rxprbssel,
  gt_rxprbscntreset,
  gt_dmonitorclk,
  gt_dmonfiforeset,
  gt_txelecidle,
  gt_txresetdone,
  gt_rxresetdone,
  gt_rxpmaresetdone,
  gt_txphaligndone,
  gt_txphinitdone,
  gt_txdlysresetdone,
  gt_rxphaligndone,
  gt_rxdlysresetdone,
  gt_rxsyncdone,
  gt_eyescandataerror,
  gt_rxprbserr,
  gt_dmonitorout,
  gt_rxcommadet,
  gt_phystatus,
  gt_rxvalid,
  gt_rxcdrlock,
  gt_pcierateidle,
  gt_pcieuserratestart,
  gt_gtpowergood,
  gt_cplllock,
  gt_rxoutclk,
  gt_rxrecclkout,
  gt_qpll1lock,
  gt_rxstatus,
  gt_rxbufstatus,
  gt_bufgtdiv,
  phy_txeq_ctrl,
  phy_txeq_preset,
  phy_rst_fsm,
  phy_txeq_fsm,
  phy_rxeq_fsm,
  phy_rst_idle,
  phy_rrst_n,
  phy_prst_n,

  ext_ch_gt_drpclk,
  ext_ch_gt_drpaddr,
  ext_ch_gt_drpen,
  ext_ch_gt_drpwe,
  ext_ch_gt_drpdi,
  ext_ch_gt_drprdy,
  ext_ch_gt_drpdo,
  //--------------------------------------------------------------------------------------//
  //  MCAP Design Switch signal                                                           //
  //   - This signal goes high once the tandem stage2 bitstream is loaded.                //
  //   - This signal may be asserted high by SW after the first PR programming sequence   //
  //     has completed.                                                                   //
  //   - After going high, this signal should not be written back to zero by SW.          //
  //--------------------------------------------------------------------------------------//
  mcap_design_switch,
  //--------------------------------------------------------------------------------------//
  //  Configuration Arbitration Signals                                                   //
  //    - These signals should be used to arbitrate for control of the underlying FPGA    //
  //      Configuration logic. Request, Grant, and Release signals should be connected in //
  //      the user design.                                                                //
  //--------------------------------------------------------------------------------------//
  cap_req,
  cap_gnt,
  cap_rel,
  //--------------------------------------------------------------------------------------//
  //  End of Startup (EOS) Signal                                                         //
  //    - This singal should be driven directly by the End of Startup (EOS) output of     //
  //      the STARTUP primitive                                                           //
  //--------------------------------------------------------------------------------------//
  mcap_eos_in,
  //--------------------------------------------------------------------------------------//
  //  Startup Signals                                                                     //
  //    - The startup interface is exposed to the external user for connectifity to other //
  //      IPs                                                                             //
  //--------------------------------------------------------------------------------------//
  startup_cfgclk,
  startup_cfgmclk,
  startup_di,
  startup_eos,
  startup_preq,
  startup_do,
  startup_dts,
  startup_fcsbo,
  startup_fcsbts,
  startup_gsr,
  startup_gts,
  startup_keyclearb,
  startup_pack,
  startup_usrcclko,
  startup_usrcclkts,
  startup_usrdoneo,
  startup_usrdonets,

  drp_rdy,
  drp_do,
  drp_clk,
  drp_en,
  drp_we,
  drp_addr,
  drp_di,

  cfg_ext_read_received,
  cfg_ext_write_received,
  cfg_ext_register_number,
  cfg_ext_function_number,
  cfg_ext_write_data,
  cfg_ext_write_byte_enable,
  cfg_ext_read_data,
  cfg_ext_read_data_valid,

  // --- Shared Logic Clock Internal Interface for pcie3_7x
  int_pclk_out_slave,
  int_pipe_rxusrclk_out,
  int_rxoutclk_out,
  int_dclk_out,
  int_userclk1_out,
  int_userclk2_out,
  int_oobclk_out,
  int_qplllock_out,
  int_qplloutclk_out,
  int_qplloutrefclk_out,
  int_pclk_sel_slave,

  // --- Shared Logic Clock External Interface for pcie3_7x
  pipe_pclk_in,
  pipe_rxusrclk_in,
  pipe_rxoutclk_in,
  pipe_dclk_in,
  pipe_userclk1_in,
  pipe_userclk2_in,
  pipe_oobclk_in,
  pipe_mmcm_rst_n,
  pipe_mmcm_lock_in,
  pipe_txoutclk_out,
  pipe_rxoutclk_out,
  pipe_pclk_sel_out,
  pipe_gen3_out,

  // --- Shared Logic External GT COMMON for pcie3_7x
  qpll_drp_crscode,
  qpll_drp_fsm,
  qpll_drp_done,
  qpll_drp_reset,
  qpll_qplllock,
  qpll_qplloutclk,
  qpll_qplloutrefclk,
  qpll_qplld,
  qpll_qpllreset,
  qpll_drp_clk,
  qpll_drp_rst_n,
  qpll_drp_ovrd,
  qpll_drp_gen3,
  qpll_drp_start,

    // --- Shared Logic GT_COMMON Internal Interface for pcie3_us
  int_qpll1lock_out,
  int_qpll1outclk_out,
  int_qpll1outrefclk_out,

  // --- Shared Logic GT_COMMON External Interface for pcie3_us
  ext_qpll1refclk,
  ext_qpll1pd,
  ext_qpll1rate,
  ext_qpll1reset,
  ext_qpll1lock_out,
  ext_qpll1outclk_out,
  ext_qpll1outrefclk_out,

  m_axis_rq_tdata_out,
  m_axis_rq_tlast_out,
  m_axis_rq_tuser_out,
  m_axis_rq_tkeep_out,
  m_axis_rq_tready_out,
  m_axis_rq_tvalid_out,

  s_axis_rc_tdata_out,
  s_axis_rc_tuser_out,
  s_axis_rc_tlast_out,
  s_axis_rc_tkeep_out,
  s_axis_rc_tvalid_out,
  s_axis_rc_tready_out,

  s_axis_cq_tdata_out,
  s_axis_cq_tuser_out,
  s_axis_cq_tlast_out,
  s_axis_cq_tkeep_out,
  s_axis_cq_tvalid_out,
  s_axis_cq_tready_out,

  m_axis_cc_tdata_out,
  m_axis_cc_tuser_out,
  m_axis_cc_tlast_out,
  m_axis_cc_tkeep_out,
  m_axis_cc_tvalid_out,
  m_axis_cc_tready_out,

  gt_qpll0lock,
  gt_gen34_eios_det,
  gt_txoutclk,
  gt_txoutclkfabric,
  gt_rxoutclkfabric,
  gt_txoutclkpcs,
  gt_rxoutclkpcs,
  gt_txpmareset,
  gt_rxpmareset,
  gt_txpcsreset,
  gt_rxpcsreset,
  gt_rxbufreset,
  gt_rxcdrreset,
  gt_rxdfelpmreset,
  gt_txprogdivresetdone,
  gt_txpmaresetdone,
  gt_txsyncdone,
  gt_rxprbslocked,

 //--------------------------------------------------------------------------
 //  GT WIZARD IP is not in the US PCIe core
 //--------------------------------------------------------------------------
  bufgtce_us_out ,
  bufgtcemask_us_out ,
  bufgtdiv_us_out ,
  bufgtreset_us_out ,
  bufgtrstmask_us_out ,
  cplllock_us_out,
  dmonitorout_us_out,
  drpdo_us_out,
  drprdy_us_out,
  eyescandataerror_us_out,
  gthtxn_us_out,
  gthtxp_us_out,
  gtpowergood_us_out,
  pcierategen3_us_out,
  pcierateidle_us_out,
  pcierateqpllpd_us_out,
  pcierateqpllreset_us_out,
  pciesynctxsyncdone_us_out,
  pcieusergen3rdy_us_out,
  pcieuserphystatusrst_us_out,
  pcieuserratestart_us_out,
  pcsrsvdout_us_out,
  phystatus_us_out,
  rxbufstatus_us_out,
  rxbyteisaligned_us_out,
  rxbyterealign_us_out,
  rxcdrlock_us_out,
  rxclkcorcnt_us_out,
  rxcommadet_us_out,
  rxctrl0_us_out,
  rxctrl1_us_out,
  rxctrl2_us_out,
  rxctrl3_us_out,
  rxdata_us_out,
  rxdlysresetdone_us_out,
  rxelecidle_us_out,
  rxoutclk_us_out,
  rxphaligndone_us_out,
  rxpmaresetdone_us_out,
  rxprbserr_us_out,
  rxprbslocked_us_out,
  rxprgdivresetdone_us_out,
  rxratedone_us_out,
  rxresetdone_us_out,
  rxstatus_us_out,
  rxsyncdone_us_out,
  rxvalid_us_out,
  txdlysresetdone_us_out,
  txoutclk_us_out,
  txphaligndone_us_out,
  txphinitdone_us_out,
  txpmaresetdone_us_out,
  txprgdivresetdone_us_out,
  txresetdone_us_out,
  txsyncout_us_out,
  txsyncdone_us_out,

   cpllpd_us_in,
   rxdfeagchold_us_in ,
   rxdfecfokhold_us_in,
   rxdfelfhold_us_in  ,
   rxdfekhhold_us_in  ,
   rxdfetap2hold_us_in,
   rxdfetap3hold_us_in,
   rxdfetap4hold_us_in,
   rxdfetap5hold_us_in,
   rxdfetap6hold_us_in,
   rxdfetap7hold_us_in,
   rxdfetap8hold_us_in,
   rxdfetap9hold_us_in,
   rxdfetap10hold_us_in,
   rxdfetap11hold_us_in,
   rxdfetap12hold_us_in,
   rxdfetap13hold_us_in,
   rxdfetap14hold_us_in,
   rxdfetap15hold_us_in,
   rxdfeuthold_us_in,
   rxdfevphold_us_in,
   rxoshold_us_in   ,
   rxlpmgchold_us_in,
   rxlpmhfhold_us_in,
   rxlpmlfhold_us_in,
   rxlpmoshold_us_in,
   cpllreset_us_in,
   dmonfiforeset_us_in,
   dmonitorclk_us_in,
   drpclk_us_in,
   drpaddr_us_in,
   drpdi_us_in,
   drpen_us_in,
   drpwe_us_in,
   eyescanreset_us_in,
   gthrxn_us_in,
   gthrxp_us_in,
   gtrefclk0_us_in,
   gtrxreset_us_in,
   gttxreset_us_in,
   gtwiz_reset_rx_done_us_in,
   gtwiz_reset_tx_done_us_in,
   gtwiz_userclk_rx_active_us_in ,
   gtwiz_userclk_tx_active_us_in ,
   gtwiz_userclk_tx_reset_us_in,
   loopback_us_in,
   pcieeqrxeqadaptdone_us_in ,
   pcierstidle_us_in,
   pciersttxsyncstart_us_in,
   pcieuserratedone_us_in,
   pcsrsvdin_us_in,
   rx8b10ben_us_in,
   rxbufreset_us_in,
   rxcdrhold_us_in,
   rxcommadeten_us_in,
   rxlpmen_us_in,
   rxmcommaalignen_us_in,
   rxpcommaalignen_us_in,
   rxpd_us_in,
   rxpolarity_us_in,
   rxprbscntreset_us_in,
   rxprbssel_us_in,
   rxprogdivreset_us_in,
   rxrate_us_in,
   rxratemode_us_in,
   rxslide_us_in,
   rxuserrdy_us_in,
   rxusrclk2_us_in,
   rxusrclk_us_in,
   tx8b10ben_us_in,
   txctrl0_us_in,
   txctrl1_us_in,
   txctrl2_us_in,
   txdata_us_in,
   txdeemph_us_in,
   txdetectrx_us_in,
   txdiffctrl_us_in,
   txdlybypass_us_in,
   txdlyen_us_in,
   txdlyhold_us_in,
   txdlyovrden_us_in,
   txdlysreset_us_in,
   txdlyupdown_us_in,
   txelecidle_us_in,
   txinhibit_us_in,
   txmaincursor_us_in,
   txmargin_us_in,
   txoutclksel_us_in,
   txpd_us_in,
   txphalign_us_in,
   txphalignen_us_in,
   txphdlypd_us_in,
   txphdlyreset_us_in,
   txphdlytstclk_us_in ,
   txphinit_us_in,
   txphovrden_us_in,
   txpostcursor_us_in,
   txprbsforceerr_us_in,
   txprbssel_us_in,
   txprecursor_us_in,
   txprogdivreset_us_in,
   txrate_us_in,
   txswing_us_in,
   txsyncallin_us_in,
   txsyncin_us_in,
   txsyncmode_us_in,
   txuserrdy_us_in,
   txusrclk2_us_in,
   txusrclk_us_in,

  qpll0clk_us_in,
  qpll0refclk_us_in,
  qpll1clk_us_in,
  qpll1refclk_us_in,

  gtrefclk01_us_in,
  qpll1pd_us_in,
  qpll1reset_us_in,
  qpllrsvd2_us_in,
  qpllrsvd3_us_in,
  qpll1lock_us_out,
  qpll1outclk_us_out,
  qpll1outrefclk_us_out,

  //--------------------------------------------------------------------------
  //  GT WIZARD IP is not in the US+ PCIe core
  //--------------------------------------------------------------------------

  gtrefclk01_usp_in,
  gtrefclk00_usp_in,
  pcierateqpll0_usp_in,
  pcierateqpll1_usp_in,
  qpll0pd_usp_in,
  qpll0reset_usp_in,
  qpll1pd_usp_in,
  qpll1reset_usp_in,
  qpll0lock_usp_out,
  qpll0outclk_usp_out,
  qpll0outrefclk_usp_out,
  qpll1lock_usp_out,
  qpll1outclk_usp_out,
  qpll1outrefclk_usp_out,
  qpll0freqlock_usp_in,
  qpll1freqlock_usp_in,
  pcierateqpllpd_usp_out,
  pcierateqpllreset_usp_out,

  rcalenb_usp_in,
  txpisopd_usp_in,
  bufgtce_usp_out,
  bufgtcemask_usp_out,
  bufgtdiv_usp_out,
  bufgtreset_usp_out,
  bufgtrstmask_usp_out,
  cpllfreqlock_usp_in,
  cplllock_usp_out,
  cpllpd_usp_in,
  cpllreset_usp_in,
  dmonfiforeset_usp_in,
  dmonitorclk_usp_in,
  dmonitorout_usp_out,
  eyescanreset_usp_in,
  gtpowergood_usp_out,
  gtrefclk0_usp_in,
  gtrxreset_usp_in,
  gttxreset_usp_in,
  gtwiz_reset_rx_done_usp_in,
  gtwiz_reset_tx_done_usp_in,
  gtwiz_userclk_rx_active_usp_in,
  gtwiz_userclk_tx_active_usp_in,

  loopback_usp_in,
  pcieeqrxeqadaptdone_usp_in,
  pcierategen3_usp_out,
  pcierateidle_usp_out,
  pcierstidle_usp_in,
  pciersttxsyncstart_usp_in,
  pciesynctxsyncdone_usp_out,
  pcieusergen3rdy_usp_out,
  pcieuserphystatusrst_usp_out,
  pcieuserratedone_usp_in,
  pcieuserratestart_usp_out,
  phystatus_usp_out,
  resetovrd_usp_in,
  rx8b10ben_usp_in,
  rxbufreset_usp_in,
  rxbufstatus_usp_out,
  rxbyteisaligned_usp_out,
  rxbyterealign_usp_out,
  rxcdrfreqreset_usp_in,
  rxcdrhold_usp_in,
  rxcdrlock_usp_out,
  rxcdrreset_usp_in,
  rxclkcorcnt_usp_out,
  rxcommadet_usp_out,
  rxcommadeten_usp_in,
  rxctrl0_usp_out,
  rxctrl1_usp_out,
  rxctrl2_usp_out,
  rxctrl3_usp_out,
  rxdata_usp_out,
  rxdfeagchold_usp_in,
  rxdfecfokhold_usp_in,
  rxdfekhhold_usp_in,
  rxdfelfhold_usp_in,
  rxdfelpmreset_usp_in,
  rxdfetap10hold_usp_in,
  rxdfetap11hold_usp_in,
  rxdfetap12hold_usp_in,
  rxdfetap13hold_usp_in,
  rxdfetap14hold_usp_in,
  rxdfetap15hold_usp_in,
  rxdfetap2hold_usp_in,
  rxdfetap3hold_usp_in,
  rxdfetap4hold_usp_in,
  rxdfetap5hold_usp_in,
  rxdfetap6hold_usp_in,
  rxdfetap7hold_usp_in,
  rxdfetap8hold_usp_in,
  rxdfetap9hold_usp_in,
  rxdfeuthold_usp_in,
  rxdfevphold_usp_in,
  rxdlysresetdone_usp_out,
  rxelecidle_usp_out,
  rxlpmen_usp_in,
  rxlpmgchold_usp_in,
  rxlpmhfhold_usp_in,
  rxlpmlfhold_usp_in,
  rxlpmoshold_usp_in,
  rxmcommaalignen_usp_in,
  rxoshold_usp_in,
  rxoutclk_usp_out,
  rxoutclkfabric_usp_out,
  rxoutclkpcs_usp_out,
  rxpcommaalignen_usp_in,
  rxpcsreset_usp_in,
  rxpd_usp_in,
  rxphaligndone_usp_out,
  rxpmareset_usp_in,
  rxpmaresetdone_usp_out,
  rxpolarity_usp_in,
  rxprbscntreset_usp_in,
  rxprbserr_usp_out,
  rxprbslocked_usp_out,
  rxprbssel_usp_in,
  rxprogdivreset_usp_in,
  rxrate_usp_in,
  rxratedone_usp_out,
  rxrecclkout_usp_out,
  rxresetdone_usp_out,
  rxslide_usp_in,
  rxstatus_usp_out,
  rxsyncdone_usp_out,
  rxtermination_usp_in,
  rxuserrdy_usp_in,
  rxusrclk2_usp_in,
  rxusrclk_usp_in,
  rxvalid_usp_out,
  tx8b10ben_usp_in,
  txctrl0_usp_in,
  txctrl1_usp_in,
  txctrl2_usp_in,
  txdata_usp_in,
  txdeemph_usp_in,
  txdetectrx_usp_in,
  txdiffctrl_usp_in,
  txdlybypass_usp_in,
  txdlyen_usp_in,
  txdlyhold_usp_in,
  txdlyovrden_usp_in,
  txdlysreset_usp_in,
  txdlysresetdone_usp_out,
  txdlyupdown_usp_in,
  txelecidle_usp_in,
  txmaincursor_usp_in,
  txmargin_usp_in,
  txoutclk_usp_out,
  txoutclkfabric_usp_out,
  txoutclkpcs_usp_out,
  txoutclksel_usp_in,
  txpcsreset_usp_in,
  txpd_usp_in,
  txphalign_usp_in,
  txphaligndone_usp_out,
  txphalignen_usp_in,
  txphdlypd_usp_in,
  txphdlyreset_usp_in,
  txphdlytstclk_usp_in,
  txphinit_usp_in,
  txphinitdone_usp_out,
  txphovrden_usp_in,
  rxratemode_usp_in,
  txpmareset_usp_in,
  txpmaresetdone_usp_out,
  txpostcursor_usp_in,
  txprbsforceerr_usp_in,
  txprbssel_usp_in,
  txprecursor_usp_in,
  txprgdivresetdone_usp_out,
  txprogdivreset_usp_in,
  txrate_usp_in,
  txresetdone_usp_out,
  txswing_usp_in,
  txsyncallin_usp_in,
  txsyncdone_usp_out,
  txsyncin_usp_in,
  txsyncmode_usp_in,
  txsyncout_usp_out,
  txuserrdy_usp_in,
  txusrclk2_usp_in,
  txusrclk_usp_in,
  drpclk_usp_in,
  drpaddr_usp_in,
  drpen_usp_in,
  drprst_usp_in,
  drpwe_usp_in,
  drpdi_usp_in,
  drprdy_usp_out,
  drpdo_usp_out,

  ext_phy_clk_pclk2_gt,
  ext_phy_clk_int_clock,
  ext_phy_clk_pclk,
  ext_phy_clk_phy_pclk2,
  ext_phy_clk_phy_coreclk,
  ext_phy_clk_phy_userclk,
  ext_phy_clk_phy_mcapclk,

  ext_phy_clk_bufg_gt_ce,
  ext_phy_clk_bufg_gt_reset,
  ext_phy_clk_rst_idle,
  ext_phy_clk_txoutclk,
  ext_phy_clk_bufgtcemask,
  ext_phy_clk_gt_bufgtrstmask,
  ext_phy_clk_bufgtdiv,

    //---------- Internal GT COMMON Ports US+ ----------------------
   int_usp_qpll0lock_out,
   int_usp_qpll0outrefclk_out,
   int_usp_qpll0outclk_out,
   int_usp_qpll1lock_out,
   int_usp_qpll1outrefclk_out,
   int_usp_qpll1outclk_out,

   //---------- External GT COMMON Ports US+ ----------------------
   ext_usp_qpllxrefclk,
   ext_usp_qpllxrate,
   ext_usp_qpllxrcalenb,

   ext_usp_qpll0pd,
   ext_usp_qpll0reset,
   ext_usp_qpll0lock_out,
   ext_usp_qpll0outclk_out,
   ext_usp_qpll0outrefclk_out,
   ext_usp_qpll1pd,
   ext_usp_qpll1reset,
   ext_usp_qpll1lock_out,
   ext_usp_qpll1outclk_out,
   ext_usp_qpll1outrefclk_out,

   //--------------------------------------------------------------------------
  cfg_negotiated_width_o,
  cfg_current_speed_o,
  cfg_ltssm_state_o,
  pipe_tx0_rcvr_det,
  pipe_clk,
  sys_clk_bufg,
  pipe_tx0_powerdown,

  //cfg_interrupt_msi_enable,
  cfg_interrupt_msix_enable,
  //cfg_interrupt_msix_mask,
  //cfg_interrupt_msix_data,
  //cfg_interrupt_msix_address,
  //cfg_interrupt_msix_int,
  //cfg_interrupt_msix_sent,
  //cfg_interrupt_msix_fail,
  //cfg_interrupt_msi_sent,
  //cfg_interrupt_msi_fail,

  phy_rdy_out_sd,
  cfg_err_cor_in_sd,
  cfg_config_space_enable_sd,
  cfg_link_training_enable_sd,
  cfg_ltssm_state_sd,
  user_lnk_up_sd,
  s_axis_rq_tdata_sd,
  s_axis_rq_tlast_sd,
  s_axis_rq_tuser_sd,
  s_axis_rq_tkeep_sd,
  s_axis_rq_tvalid_sd,
  s_axis_rq_tready_sd,

  m_axis_rc_tdata_sd,
  m_axis_rc_tuser_sd,
  m_axis_rc_tlast_sd,
  m_axis_rc_tkeep_sd,
  m_axis_rc_tvalid_sd,
  m_axis_rc_tready_sd,

  m_axis_cq_tdata_sd,
  m_axis_cq_tuser_sd,
  m_axis_cq_tlast_sd,
  m_axis_cq_tkeep_sd,
  m_axis_cq_tvalid_sd,
  m_axis_cq_tready_sd,

  s_axis_cc_tdata_sd,
  s_axis_cc_tuser_sd,
  s_axis_cc_tlast_sd,
  s_axis_cc_tkeep_sd,
  s_axis_cc_tvalid_sd,
  s_axis_cc_tready_sd,

  rbar_bar_size_sd,
  rbar_function_number_sd,
  rbar_write_enable_bar0_sd,
  rbar_write_enable_bar1_sd,
  rbar_write_enable_bar2_sd,
  rbar_write_enable_bar3_sd,
  rbar_write_enable_bar4_sd,
  rbar_write_enable_bar5_sd,
  user_clk_sd,
  user_reset_sd,
  pcie_cq_np_req_sd,
  pcie_cq_np_req_count_sd,
  pcie_tfc_nph_av_sd,
  pcie_tfc_npd_av_sd,
  pcie_rq_seq_num_vld0_sd,
  pcie_rq_seq_num0_sd,
  pcie_rq_seq_num_vld1_sd,
  pcie_rq_seq_num1_sd,
  cfg_fc_nph_sd,
  cfg_fc_ph_sd,
  cfg_fc_sel_sd,
  cfg_phy_link_down_sd,
  cfg_phy_link_status_sd,
  cfg_negotiated_width_sd,
  cfg_current_speed_sd,
  cfg_pl_status_change_sd,
  cfg_hot_reset_out_sd,
  cfg_bus_number_sd,
  cfg_ds_port_number_sd,
  cfg_ds_bus_number_sd,
  cfg_ds_device_number_sd,
  cfg_ds_function_number_sd,
  cfg_dsn_sd,
  cfg_function_status_sd,
  cfg_max_read_req_sd,
  cfg_max_payload_sd,
  cfg_err_uncor_in_sd,
  cfg_flr_done_sd,
  cfg_flr_in_process_sd,
  cfg_vf_flr_in_process_sd,
  cfg_vf_status_sd,


  cfg_err_cor_out_sd,
  cfg_err_nonfatal_out_sd,
  cfg_err_fatal_out_sd,
  cfg_local_error_out_sd,

  cfg_msg_received_sd,
  cfg_msg_received_data_sd,
  cfg_msg_received_type_sd,
  cfg_msg_transmit_sd,
  cfg_msg_transmit_type_sd,
  cfg_msg_transmit_data_sd,
  cfg_msg_transmit_done_sd,

  cfg_mgmt_addr_sd,
  cfg_mgmt_write_sd,
  cfg_mgmt_write_data_sd,
  cfg_mgmt_byte_enable_sd,
  cfg_mgmt_read_sd,
  cfg_mgmt_type1_cfg_reg_access_sd,
  cfg_mgmt_read_data_sd,
  cfg_mgmt_read_write_done_sd,
  cfg_mgmt_function_number_sd,

  cfg_interrupt_int_sd,
  cfg_interrupt_sent_sd,
  cfg_interrupt_pending_sd,

  cfg_interrupt_msi_enable_sd,
  cfg_interrupt_msi_mask_update_sd,
  cfg_interrupt_msi_data_sd,
  cfg_interrupt_msi_int_sd,
  cfg_interrupt_msi_pending_status_sd,
  cfg_interrupt_msi_pending_status_data_enable_sd,
  cfg_interrupt_msi_pending_status_function_num_sd,
  cfg_interrupt_msi_attr_sd,
  cfg_interrupt_msi_tph_present_sd,
  cfg_interrupt_msi_tph_type_sd,
  cfg_interrupt_msi_tph_st_tag_sd,
  cfg_interrupt_msi_function_number_sd,

  cfg_interrupt_msi_sent_sd,
  cfg_interrupt_msi_fail_sd,

  cfg_interrupt_msix_enable_sd,
  cfg_interrupt_msix_mask_sd,
  cfg_interrupt_msix_data_sd,
  cfg_interrupt_msix_address_sd,
  cfg_interrupt_msix_int_sd,
  cfg_interrupt_msix_vf_enable_sd,
  cfg_interrupt_msix_vf_mask_sd,
  cfg_interrupt_msix_vec_pending_sd,
  cfg_interrupt_msix_vec_pending_status_sd,

  cfg_tph_requester_enable_sd,
  cfg_vf_tph_requester_enable_sd,

  cfg_ext_read_received_sd,
  cfg_ext_write_received_sd,
  cfg_ext_register_number_sd,
  cfg_ext_function_number_sd,
  cfg_ext_write_data_sd,
  cfg_ext_write_byte_enable_sd,
  cfg_ext_read_data_sd,
  cfg_ext_read_data_valid_sd,



  rd_interrupt,
  wr_interrupt,
  ats_pri_en,
  cfg_fc_vc_sel,
  core_clk,

  // CXS interface
  cxs0_active_req_tx,
  cxs0_active_ack_tx,
  cxs0_deact_hint_tx,
  cxs0_valid_tx,
  cxs0_crdgnt_tx,
  cxs0_crdrtn_tx,
  cxs0_cntl_tx,
  cxs0_data_tx,
  cxs0_valid_chk_tx,
  cxs0_crdgnt_chk_tx,
  cxs0_crdrtn_chk_tx,
  cxs0_cntl_chk_tx,
  cxs0_data_chk_tx,
  cxs0_active_req_rx,
  cxs0_active_ack_rx,
  cxs0_deact_hint_rx,
  cxs0_valid_rx,
  cxs0_crdgnt_rx,
  cxs0_crdrtn_rx,
  cxs0_cntl_rx,
  cxs0_data_rx,
  cxs0_valid_chk_rx,
  cxs0_crdgnt_chk_rx,
  cxs0_crdrtn_chk_rx,
  cxs0_cntl_chk_rx,
  cxs0_data_chk_rx,

  //s_axil_awaddr_ats,
  //s_axil_awvalid_ats,
  //s_axil_awready_ats,
  //s_axil_wdata_ats,
  //s_axil_wstrb_ats,
  //s_axil_wvalid_ats,
  //s_axil_wready_ats,
  //s_axil_bresp_ats,
  //s_axil_bvalid_ats,
  //s_axil_bready_ats,
  //s_axil_araddr_ats,
  //s_axil_arvalid_ats,
  //s_axil_arready_ats,
  //s_axil_rdata_ats,
  //s_axil_rresp_ats,
  //s_axil_rvalid_ats,
  //s_axil_rready_ats,

  sc0_ats_s_axis_rq_tvalid,
  sc0_ats_s_axis_rq_tready,
  sc0_ats_s_axis_rq_tdata,
  sc0_ats_s_axis_rq_tkeep,
  sc0_ats_s_axis_rq_tlast,
  sc0_ats_s_axis_rq_tuser,

  sc0_ats_m_axis_rc_tvalid,
  sc0_ats_m_axis_rc_tready,
  sc0_ats_m_axis_rc_tdata,
  sc0_ats_m_axis_rc_tkeep,
  sc0_ats_m_axis_rc_tlast,
  sc0_ats_m_axis_rc_tuser,

  sc0_ats_s_axis_cc_tvalid,
  sc0_ats_s_axis_cc_tready,
  sc0_ats_s_axis_cc_tdata,
  sc0_ats_s_axis_cc_tkeep,
  sc0_ats_s_axis_cc_tlast,
  sc0_ats_s_axis_cc_tuser,

  sc0_ats_m_axis_cq_tvalid,
  sc0_ats_m_axis_cq_tready,
  sc0_ats_m_axis_cq_tdata,
  sc0_ats_m_axis_cq_tkeep,
  sc0_ats_m_axis_cq_tlast,
  sc0_ats_m_axis_cq_tuser,

  sc1_ats_s_axis_rq_tvalid,
  sc1_ats_s_axis_rq_tready,
  sc1_ats_s_axis_rq_tdata,
  sc1_ats_s_axis_rq_tkeep,
  sc1_ats_s_axis_rq_tlast,
  sc1_ats_s_axis_rq_tuser,

  sc1_ats_m_axis_rc_tvalid,
  sc1_ats_m_axis_rc_tready,
  sc1_ats_m_axis_rc_tdata,
  sc1_ats_m_axis_rc_tkeep,
  sc1_ats_m_axis_rc_tlast,
  sc1_ats_m_axis_rc_tuser,

  sc1_ats_s_axis_cc_tvalid,
  sc1_ats_s_axis_cc_tready,
  sc1_ats_s_axis_cc_tdata,
  sc1_ats_s_axis_cc_tkeep,
  sc1_ats_s_axis_cc_tlast,
  sc1_ats_s_axis_cc_tuser,

  sc1_ats_m_axis_cq_tvalid,
  sc1_ats_m_axis_cq_tready,
  sc1_ats_m_axis_cq_tdata,
  sc1_ats_m_axis_cq_tkeep,
  sc1_ats_m_axis_cq_tlast,
  sc1_ats_m_axis_cq_tuser

   // AXI SLAVE Interface to MicroProcessor
  ,s_aclk
  ,s_aresetn
  ,s_axi_araddr
  ,s_axi_arburst
  ,s_axi_arcache
  ,s_axi_arid
  ,s_axi_arlen
  ,s_axi_arlock
  ,s_axi_arprot
  ,s_axi_arqos
  ,s_axi_arready
  ,s_axi_arsize
  ,s_axi_aruser
  ,s_axi_arvalid
  ,s_axi_awaddr
  ,s_axi_awburst
  ,s_axi_awcache
  ,s_axi_awid
  ,s_axi_awlen
  ,s_axi_awlock
  ,s_axi_awprot
  ,s_axi_awqos
  ,s_axi_awready
  ,s_axi_awsize
  ,s_axi_awuser
  ,s_axi_awvalid
  ,s_axi_bid
  ,s_axi_bready
  ,s_axi_bresp
  ,s_axi_bvalid
  ,s_axi_rdata
  ,s_axi_rid
  ,s_axi_rlast
  ,s_axi_rready
  ,s_axi_rresp
  ,s_axi_rvalid
  ,s_axi_wdata
  ,s_axi_wlast
  ,s_axi_wready
  ,s_axi_wstrb
  ,s_axi_wvalid

  // ATS Signals - Start
  ,atspri_m_axis_cq_tdata
  ,atspri_m_axis_cq_tuser
  ,atspri_m_axis_cq_tlast
  ,atspri_m_axis_cq_tkeep
  ,atspri_m_axis_cq_tvalid
  ,atspri_m_axis_cq_tready
  ,atspri_s_axis_rq_tdata
  ,atspri_s_axis_rq_tuser
  ,atspri_s_axis_rq_tlast
  ,atspri_s_axis_rq_tkeep
  ,atspri_s_axis_rq_tvalid
  ,atspri_s_axis_rq_tready
  ,cfg_status_ats_stu
  ,cfg_status_ats_en
  ,cfg_status_pr_en
  ,cfg_status_pr_rst
  ,cfg_status_pr_uprgi
  ,cfg_status_set_uprgi
  ,cfg_status_pr_rf
  ,cfg_status_set_rf
  ,cfg_status_set_s
  ,cfg_status_clr_s
  ,cfg_status_ost_pr_alloc
  // ATS Signals - End

  // Advanced Interrupt User
  ,numvec_valid
  ,numvec_done
  ,msix_vectors_per_pf0
  ,msix_vectors_per_pf1
  ,msix_vectors_per_pf2
  ,msix_vectors_per_pf3
  ,msix_vectors_per_vfg0
  ,msix_vectors_per_vfg1
  ,msix_vectors_per_vfg2
  ,msix_vectors_per_vfg3


  ,qsts_out_op
  ,qsts_out_data
  ,qsts_out_port_id
//  ,qsts_out_host_target_id
  ,qsts_out_qid
  ,qsts_out_vld
  ,qsts_out_rdy

  ,axi_interrupt_vld
  ,axi_interrupt_vec
  ,axi_interrupt_func_num
  ,axi_interrupt_host_id
  ,axi_interrupt_ack
  ,usr_irq_req_qdma
  ,usr_irq_ack_qdma

);
   //--------------------------------------------------------------------------
   //  GT WIZARD IP is not in the US+ PCIe core
   //--------------------------------------------------------------------------
   output  [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0] gtrefclk01_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0] gtrefclk00_usp_in
   ;output [((((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2)+1)*3)-1:0] pcierateqpll0_usp_in
   ;output [((((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2)+1)*3)-1:0] pcierateqpll1_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2 : 0]   qpll0pd_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2 : 0]   qpll0reset_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2 : 0]   qpll1pd_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2 : 0]   qpll1reset_usp_in
   ;input  [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll0lock_usp_out
   ;input  [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll0outclk_usp_out
   ;input  [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll0outrefclk_usp_out
   ;input  [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll1lock_usp_out
   ;input  [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll1outclk_usp_out
   ;input  [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll1outrefclk_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] qpll0freqlock_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] qpll1freqlock_usp_in
   ;input  [(PL_LINK_CAP_MAX_LINK_WIDTH*2)-1:0]      pcierateqpllpd_usp_out
   ;input  [(PL_LINK_CAP_MAX_LINK_WIDTH*2)-1:0]      pcierateqpllreset_usp_out

   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2 : 0]   rcalenb_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txpisopd_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] bufgtce_usp_out
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0] bufgtcemask_usp_out
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH* 9)-1:0] bufgtdiv_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] bufgtreset_usp_out
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0] bufgtrstmask_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] cpllfreqlock_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] cplllock_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] cpllpd_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] cpllreset_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] dmonfiforeset_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] dmonitorclk_usp_in
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0] dmonitorout_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] eyescanreset_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] gtpowergood_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] gtrefclk0_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] gtrxreset_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] gttxreset_usp_in
   ;output gtwiz_reset_rx_done_usp_in
   ;output gtwiz_reset_tx_done_usp_in
   ;output gtwiz_userclk_rx_active_usp_in
   ;output gtwiz_userclk_tx_active_usp_in

   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0] loopback_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pcieeqrxeqadaptdone_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pcierategen3_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pcierateidle_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pcierstidle_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pciersttxsyncstart_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pciesynctxsyncdone_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pcieusergen3rdy_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pcieuserphystatusrst_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pcieuserratedone_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] pcieuserratestart_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] phystatus_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] resetovrd_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rx8b10ben_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxbufreset_usp_in
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH*3)-1:0] rxbufstatus_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxbyteisaligned_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxbyterealign_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxcdrfreqreset_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxcdrhold_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxcdrlock_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxcdrreset_usp_in
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH * 2)-1 : 0] rxclkcorcnt_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxcommadet_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxcommadeten_usp_in
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0] rxctrl0_usp_out
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0] rxctrl1_usp_out
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH*8)-1:0] rxctrl2_usp_out
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH*8)-1:0] rxctrl3_usp_out
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH*128)-1:0] rxdata_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfeagchold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfecfokhold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfekhhold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfelfhold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxdfelpmreset_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap10hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap11hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap12hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap13hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap14hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap15hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap2hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap3hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap4hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap5hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap6hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap7hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap8hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap9hold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfeuthold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfevphold_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxdlysresetdone_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxelecidle_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxlpmen_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxlpmgchold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxlpmhfhold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxlpmlfhold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxlpmoshold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxmcommaalignen_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxoshold_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxoutclk_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxoutclkfabric_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxoutclkpcs_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxpcommaalignen_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxpcsreset_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 2)-1:0]rxpd_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxphaligndone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxpmareset_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxpmaresetdone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxpolarity_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxprbscntreset_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxprbserr_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxprbslocked_usp_out
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 4)-1:0] rxprbssel_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxprogdivreset_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0] rxrate_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxratedone_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxrecclkout_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxresetdone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxslide_usp_in
   ;input [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0] rxstatus_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxsyncdone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxtermination_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxuserrdy_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxusrclk2_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxusrclk_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxvalid_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] tx8b10ben_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0] txctrl0_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0] txctrl1_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 8)-1:0] txctrl2_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH*128)-1:0] txdata_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 2)-1:0] txdeemph_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txdetectrx_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH*5)-1:0] txdiffctrl_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txdlybypass_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txdlyen_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txdlyhold_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txdlyovrden_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txdlysreset_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txdlysresetdone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txdlyupdown_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txelecidle_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 7)-1:0] txmaincursor_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]txmargin_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txoutclk_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txoutclkfabric_usp_out
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txoutclkpcs_usp_out
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]txoutclksel_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txpcsreset_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 2)-1:0]txpd_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphalign_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphaligndone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphalignen_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphdlypd_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphdlyreset_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphdlytstclk_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphinit_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphinitdone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txphovrden_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] rxratemode_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txpmareset_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] txpmaresetdone_usp_out
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 5)-1:0] txpostcursor_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txprbsforceerr_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 4)-1:0] txprbssel_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 5)-1:0] txprecursor_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txprgdivresetdone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txprogdivreset_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0] txrate_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txresetdone_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txswing_usp_in
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH-1) : 0] txsyncallin_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] txsyncdone_usp_out
   ;output [(PL_LINK_CAP_MAX_LINK_WIDTH-1) : 0] txsyncin_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txsyncmode_usp_in
   ;input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txsyncout_usp_out
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txuserrdy_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txusrclk2_usp_in
   ;output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0] txusrclk_usp_in
   ;output wire                                           drpclk_usp_in
   ;output wire [((PL_LINK_CAP_MAX_LINK_WIDTH * 10)-1):0] drpaddr_usp_in
   ;output wire [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] drpen_usp_in
   ;output wire [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] drprst_usp_in
   ;output wire [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] drpwe_usp_in
   ;output wire [((PL_LINK_CAP_MAX_LINK_WIDTH * 16)-1):0] drpdi_usp_in
   ;input  wire [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] drprdy_usp_out
   ;input  wire [((PL_LINK_CAP_MAX_LINK_WIDTH * 16)-1):0] drpdo_usp_out
   ;input        ext_phy_clk_pclk2_gt
   ;input        ext_phy_clk_int_clock
   ;input        ext_phy_clk_pclk
   ;input        ext_phy_clk_phy_pclk2
   ;input        ext_phy_clk_phy_coreclk
   ;input        ext_phy_clk_phy_userclk
   ;input        ext_phy_clk_phy_mcapclk

   ;output       ext_phy_clk_bufg_gt_ce
   ;output       ext_phy_clk_bufg_gt_reset
   ;output       ext_phy_clk_rst_idle
   ;output       ext_phy_clk_txoutclk
   ;output       ext_phy_clk_bufgtcemask
   ;output       ext_phy_clk_gt_bufgtrstmask
   ;output [8:0] ext_phy_clk_bufgtdiv

   //----- Internal GT COMMON Ports US+ ----------------------
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] int_usp_qpll0lock_out
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] int_usp_qpll0outrefclk_out
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] int_usp_qpll0outclk_out
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] int_usp_qpll1lock_out
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] int_usp_qpll1outrefclk_out
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] int_usp_qpll1outclk_out

   //----- External GT COMMON Ports US+ ----------------------
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpllxrefclk
   ;output [((((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2)+1)*3)-1:0] ext_usp_qpllxrate
   ;output                                                   ext_usp_qpllxrcalenb

   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll0pd
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll0reset
   ;input  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll0lock_out
   ;input  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll0outclk_out
   ;input  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll0outrefclk_out
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll1pd
   ;output [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll1reset
   ;input  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll1lock_out
   ;input  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll1outclk_out
   ;input  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_usp_qpll1outrefclk_out;

 //--------------------------------------------------------------------------
 //  GT WIZARD IP is not in the US PCIe core
 //--------------------------------------------------------------------------

 input [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    bufgtce_us_out ;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    bufgtcemask_us_out ;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH* 9)-1:0]    bufgtdiv_us_out ;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    bufgtreset_us_out ;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    bufgtrstmask_us_out ;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         cplllock_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*17)-1:0]    dmonitorout_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH* 16)-1:0]   drpdo_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH* 1)-1:0]    drprdy_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         eyescandataerror_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         gthtxn_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         gthtxp_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         gtpowergood_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pcierategen3_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pcierateidle_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*2)-1:0]     pcierateqpllpd_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*2)-1:0]     pcierateqpllreset_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pciesynctxsyncdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pcieusergen3rdy_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pcieuserphystatusrst_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pcieuserratestart_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*12)-1:0]    pcsrsvdout_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         phystatus_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*3)-1:0]     rxbufstatus_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       rxbyteisaligned_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       rxbyterealign_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxcdrlock_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH * 2)-1 : 0] rxclkcorcnt_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxcommadet_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0]    rxctrl0_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0]    rxctrl1_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*8)-1:0]     rxctrl2_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*8)-1:0]     rxctrl3_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH*128)-1:0]   rxdata_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxdlysresetdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxelecidle_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       rxoutclk_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxphaligndone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxpmaresetdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxprbserr_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxprbslocked_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxprgdivresetdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxratedone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxresetdone_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    rxstatus_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxsyncdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxvalid_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdlysresetdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txoutclk_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphaligndone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphinitdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       txpmaresetdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txprgdivresetdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txresetdone_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txsyncout_us_out;
 input [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       txsyncdone_us_out;

 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         cpllpd_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]  rxdfeagchold_us_in ;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfecfokhold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   rxdfelfhold_us_in  ;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   rxdfekhhold_us_in  ;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap2hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap3hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap4hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap5hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap6hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap7hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap8hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap9hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap10hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap11hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap12hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap13hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap14hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfetap15hold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfeuthold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxdfevphold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]    rxoshold_us_in   ;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxlpmgchold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxlpmhfhold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxlpmlfhold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0] rxlpmoshold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         cpllreset_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         dmonfiforeset_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         dmonitorclk_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         drpclk_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 9)-1:0]    drpaddr_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 16)-1:0]   drpdi_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 1)-1:0]    drpen_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 1)-1:0]    drpwe_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         eyescanreset_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         gthrxn_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         gthrxp_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         gtrefclk0_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         gtrxreset_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         gttxreset_us_in;
 output                        gtwiz_reset_rx_done_us_in;
 output                        gtwiz_reset_tx_done_us_in;
 output                        gtwiz_userclk_rx_active_us_in ;
 output                        gtwiz_userclk_tx_active_us_in ;
 output                        gtwiz_userclk_tx_reset_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    loopback_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pcieeqrxeqadaptdone_us_in ;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pcierstidle_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pciersttxsyncstart_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         pcieuserratedone_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0]    pcsrsvdin_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rx8b10ben_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxbufreset_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxcdrhold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxcommadeten_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxlpmen_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxmcommaalignen_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxpcommaalignen_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 2)-1:0]    rxpd_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxpolarity_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxprbscntreset_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 4)-1:0]    rxprbssel_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxprogdivreset_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    rxrate_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxratemode_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxslide_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxuserrdy_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxusrclk2_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         rxusrclk_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         tx8b10ben_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0]    txctrl0_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH*16)-1:0]    txctrl1_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 8)-1:0]    txctrl2_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH*128)-1:0]   txdata_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdeemph_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdetectrx_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH*4)-1:0]     txdiffctrl_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdlybypass_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdlyen_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdlyhold_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdlyovrden_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdlysreset_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txdlyupdown_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txelecidle_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txinhibit_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 7)-1:0]    txmaincursor_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    txmargin_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    txoutclksel_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 2)-1:0]    txpd_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphalign_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphalignen_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphdlypd_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphdlyreset_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphdlytstclk_us_in ;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphinit_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txphovrden_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 5)-1:0]    txpostcursor_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txprbsforceerr_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 4)-1:0]    txprbssel_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 5)-1:0]    txprecursor_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txprogdivreset_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH* 3)-1:0]    txrate_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txswing_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH-1) : 0]     txsyncallin_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH-1) : 0]     txsyncin_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txsyncmode_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txuserrdy_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txusrclk2_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]         txusrclk_us_in;

 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       qpll0clk_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       qpll0refclk_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       qpll1clk_us_in;
 output [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]       qpll1refclk_us_in;

 output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]    gtrefclk01_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]    qpll1pd_us_in;
 output [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]    qpll1reset_us_in;
 output [((((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2)+1)* 5)-1:0] qpllrsvd2_us_in;
 output [((((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2)+1)* 5)-1:0] qpllrsvd3_us_in;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll1lock_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll1outclk_us_out;
 input [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0]     qpll1outrefclk_us_out;


   input  wire [25:0] common_commands_in;
   input  wire [83:0] pipe_rx_0_sigs;
   input  wire [83:0] pipe_rx_1_sigs;
   input  wire [83:0] pipe_rx_2_sigs;
   input  wire [83:0] pipe_rx_3_sigs;
   input  wire [83:0] pipe_rx_4_sigs;
   input  wire [83:0] pipe_rx_5_sigs;
   input  wire [83:0] pipe_rx_6_sigs;
   input  wire [83:0] pipe_rx_7_sigs;
   input  wire [83:0] pipe_rx_8_sigs;
   input  wire [83:0] pipe_rx_9_sigs;
   input  wire [83:0] pipe_rx_10_sigs;
   input  wire [83:0] pipe_rx_11_sigs;
   input  wire [83:0] pipe_rx_12_sigs;
   input  wire [83:0] pipe_rx_13_sigs;
   input  wire [83:0] pipe_rx_14_sigs;
   input  wire [83:0] pipe_rx_15_sigs;
   output wire [25:0] common_commands_out;
   output wire [83:0] pipe_tx_0_sigs;
   output wire [83:0] pipe_tx_1_sigs;
   output wire [83:0] pipe_tx_2_sigs;
   output wire [83:0] pipe_tx_3_sigs;
   output wire [83:0] pipe_tx_4_sigs;
   output wire [83:0] pipe_tx_5_sigs;
   output wire [83:0] pipe_tx_6_sigs;
   output wire [83:0] pipe_tx_7_sigs;
   output wire [83:0] pipe_tx_8_sigs;
   output wire [83:0] pipe_tx_9_sigs;
   output wire [83:0] pipe_tx_10_sigs;
   output wire [83:0] pipe_tx_11_sigs;
   output wire [83:0] pipe_tx_12_sigs;
   output wire [83:0] pipe_tx_13_sigs;
   output wire [83:0] pipe_tx_14_sigs;
   output wire [83:0] pipe_tx_15_sigs;
   output             gt_drp_clk ;
   output             axi_aclk;
   output             axi_aresetn;
   output             phy_ready;

   input              soft_reset_n;
   input              axi_ctl_aclk;
   output             axi_ctl_aresetn;
   output [5:0]       cfg_ltssm_state;
   input              config_space_enable;

   input              st_rx_msg_rdy;
   output [31:0]      st_rx_msg_data;
   output             st_rx_msg_valid;
   output             st_rx_msg_last;
   output             st_rx_msg_error;
   input  wire [31:0] single_bit_err_inject_reg;
   input  wire [31:0] double_bit_err_inject_reg;

   input  [XDMA_NUM_USR_IRQ-1:0]   usr_irq_req;
   output [XDMA_NUM_USR_IRQ-1:0]   usr_irq_ack;
   input  [2*XDMA_NUM_USR_IRQ-1:0] usr_irq_function_number;
   output                          msi_enable;
   output [2:0]                    msi_vector_width;

   output  [C_M_AXI_ID_WIDTH-1 : 0]     m_axi_awid;
   output  [C_M_AXI_ADDR_WIDTH-1 : 0]   m_axi_awaddr;
   output  [C_M_AXI_AWUSER_WIDTH-1 : 0] m_axi_awuser;
   output  [7 : 0]                      m_axi_awlen;
   output  [2 : 0]                      m_axi_awsize;
   output  [1 : 0]                      m_axi_awburst;
   output  [2 : 0]                      m_axi_awprot;
   output                               m_axi_awvalid;
   input                                m_axi_awready;
   output                               m_axi_awlock;
   output  [3 : 0]                      m_axi_awcache;
   output  [C_M_AXI_DATA_WIDTH-1 : 0]   m_axi_wdata;
   output  [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axi_wuser;
   output  [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axi_wstrb;
   output                               m_axi_wlast;
   output                               m_axi_wvalid;
   input                                m_axi_wready;
   input  [C_M_AXI_ID_WIDTH-1 : 0]      m_axi_bid;
   input  [1 : 0]                       m_axi_bresp;
   input                                m_axi_bvalid;
   output                               m_axi_bready;
   output  [C_M_AXI_ID_WIDTH-1 : 0]     m_axi_arid;
   output  [C_M_AXI_ADDR_WIDTH-1 : 0]   m_axi_araddr;
   output  [C_M_AXI_ARUSER_WIDTH-1 : 0] m_axi_aruser;
   output  [7 : 0]                      m_axi_arlen;
   output  [2 : 0]                      m_axi_arsize;
   output  [1 : 0]                      m_axi_arburst;
   output  [2 : 0]                      m_axi_arprot;
   output                               m_axi_arvalid;
   input                                m_axi_arready;
   output                               m_axi_arlock;
   output  [3 : 0]                      m_axi_arcache;
   input  [C_M_AXI_ID_WIDTH-1 : 0]      m_axi_rid;
   input  [C_M_AXI_DATA_WIDTH-1 : 0]    m_axi_rdata;
   input  [C_M_AXI_DATA_WIDTH/8-1 : 0]  m_axi_ruser;
   input  [1 : 0]                       m_axi_rresp;
   input                                m_axi_rlast;
   input                                m_axi_rvalid;
   output                               m_axi_rready;
   // Axi bypass
   output  [C_M_AXI_ID_WIDTH-1 : 0]     m_axib_awid;
   output  [C_M_AXI_ADDR_WIDTH-1 : 0]   m_axib_awaddr;
   output  [C_M_AXIB_AWUSER_WIDTH-1 : 0]m_axib_awuser;
   output  [7 : 0]                      m_axib_awlen;
   output  [2 : 0]                      m_axib_awsize;
   output  [1 : 0]                      m_axib_awburst;
   output  [2 : 0]                      m_axib_awprot;
   output                               m_axib_awvalid;
   input                                m_axib_awready;
   output                               m_axib_awlock;
   output  [3 : 0]                      m_axib_awcache;
   output  [C_M_AXI_DATA_WIDTH-1 : 0]   m_axib_wdata ;
   output  [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axib_wuser;
   output  [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axib_wstrb ;
   output                               m_axib_wlast ;
   output                               m_axib_wvalid ;
   input                                m_axib_wready ;
   input  [C_M_AXI_ID_WIDTH-1 : 0]      m_axib_bid ;
   input  [1 : 0]                       m_axib_bresp ;
   input                                m_axib_bvalid ;
   output                               m_axib_bready ;
   output  [C_M_AXI_ID_WIDTH-1 : 0]     m_axib_arid ;
   output  [C_M_AXI_ADDR_WIDTH-1 : 0]   m_axib_araddr ;
   output  [C_M_AXIB_ARUSER_WIDTH-1 : 0]m_axib_aruser ;
   output  [7 : 0]                      m_axib_arlen ;
   output  [2 : 0]                      m_axib_arsize ;
   output  [1 : 0]                      m_axib_arburst ;
   output  [2 : 0]                      m_axib_arprot ;
   output                               m_axib_arvalid ;
   input                                m_axib_arready ;
   output                               m_axib_arlock;
   output  [3 : 0]                      m_axib_arcache;
   input  [C_M_AXI_ID_WIDTH-1 : 0]      m_axib_rid ;
   input  [C_M_AXI_DATA_WIDTH-1 : 0]    m_axib_rdata ;
   input  [C_M_AXI_DATA_WIDTH/8-1 : 0]  m_axib_ruser;
   input  [1 : 0]                       m_axib_rresp ;
   input                                m_axib_rlast ;
   input                                m_axib_rvalid ;
   output                               m_axib_rready ;

   // C2H AXI ST interface to user Channle 0
   input    [C_S_AXIS_DATA_WIDTH-1:0]   s_axis_c2h_tdata_0;
   input                                s_axis_c2h_tlast_0;
   input    [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tuser_0;
   input    [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tkeep_0;
   input                                s_axis_c2h_tvalid_0;
   output                               s_axis_c2h_tready_0;
   // C2H AXI ST interface to user Channle 1
   input    [C_S_AXIS_DATA_WIDTH-1:0]   s_axis_c2h_tdata_1;
   input                                s_axis_c2h_tlast_1;
   input    [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tuser_1;
   input    [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tkeep_1;
   input                                s_axis_c2h_tvalid_1;
   output                               s_axis_c2h_tready_1;
   // C2H AXI ST interface to user Channle 2
   input    [C_S_AXIS_DATA_WIDTH-1:0]   s_axis_c2h_tdata_2;
   input                                s_axis_c2h_tlast_2;
   input    [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tuser_2;
   input    [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tkeep_2;
   input                                s_axis_c2h_tvalid_2;
   output                               s_axis_c2h_tready_2;
   // C2H AXI ST interface to user Channle 3
   input    [C_S_AXIS_DATA_WIDTH-1:0]   s_axis_c2h_tdata_3;
   input                                s_axis_c2h_tlast_3;
   input    [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tuser_3;
   input    [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tkeep_3;
   input                                s_axis_c2h_tvalid_3;
   output                               s_axis_c2h_tready_3;

   // H2C AXI ST interface to user Channel 0
   output   [C_M_AXIS_DATA_WIDTH-1:0]   m_axis_h2c_tdata_0;
   output                               m_axis_h2c_tlast_0;
   output   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tuser_0;
   output   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tkeep_0;
   output                               m_axis_h2c_tvalid_0;
   input                                m_axis_h2c_tready_0;
   // H2C AXI ST interface to user Channel 1
   output   [C_M_AXIS_DATA_WIDTH-1:0]   m_axis_h2c_tdata_1;
   output                               m_axis_h2c_tlast_1;
   output   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tuser_1;
   output   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tkeep_1;
   output                               m_axis_h2c_tvalid_1;
   input                                m_axis_h2c_tready_1;
   // H2C AXI ST interface to user Channel 2
   output   [C_M_AXIS_DATA_WIDTH-1:0]   m_axis_h2c_tdata_2;
   output                               m_axis_h2c_tlast_2;
   output   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tuser_2;
   output   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tkeep_2;
   output                               m_axis_h2c_tvalid_2;
   input                                m_axis_h2c_tready_2;
   // H2C AXI ST interface to user Channel 3
   output   [C_M_AXIS_DATA_WIDTH-1:0]   m_axis_h2c_tdata_3;
   output                               m_axis_h2c_tlast_3;
   output   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tuser_3;
   output   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tkeep_3;
   output                               m_axis_h2c_tvalid_3;
   input                                m_axis_h2c_tready_3;

   output  [31 : 0]                     m_axil_awaddr;
   output  [C_M_AXIL_AWUSER_WIDTH-1: 0] m_axil_awuser;
   output  [2 : 0]                      m_axil_awprot;
   output                               m_axil_awvalid;
   input                                m_axil_awready;
   output  [31 : 0]                     m_axil_wdata;
   output  [3 : 0]                      m_axil_wstrb;
   output                               m_axil_wvalid;
   input                                m_axil_wready;
   input                                m_axil_bvalid;
   input  [1:0]                         m_axil_bresp;
   output                               m_axil_bready;
   output  [31 : 0]                     m_axil_araddr;
   output  [C_M_AXIL_ARUSER_WIDTH-1: 0] m_axil_aruser;
   output  [2 : 0]                      m_axil_arprot;
   output                               m_axil_arvalid;
   input                                m_axil_arready;
   input  [31 : 0]                      m_axil_rdata ;
   input  [1 : 0]                       m_axil_rresp ;
   input                                m_axil_rvalid;
   output                               m_axil_rready;
   input  [31 : 0]                      s_axil_awaddr;
   input  [12: 0]                       s_axil_awuser;
   input  [2 : 0]                       s_axil_awprot;
   input                                s_axil_awvalid;
   output                               s_axil_awready;
   input  [31 : 0]                      s_axil_wdata ;
   input  [3 : 0]                       s_axil_wstrb ;
   input                                s_axil_wvalid;
   output                               s_axil_wready;
   output                               s_axil_bvalid;
   output  [1:0]                        s_axil_bresp;
   input                                s_axil_bready;
   input  [31 : 0]                      s_axil_araddr;
   input  [12 : 0]                      s_axil_aruser;
   input  [2 : 0]                       s_axil_arprot;
   input                                s_axil_arvalid;
   output                               s_axil_arready;
   output  [31 : 0]                     s_axil_rdata ;
   output  [1 : 0]                      s_axil_rresp;
   output                               s_axil_rvalid;
   input                                s_axil_rready;

   output                               csr_prog_done;
   input  [31 : 0]                      s_axil_csr_awaddr;
   input  [2 : 0]                       s_axil_csr_awprot;
   input                                s_axil_csr_awvalid;
   output                               s_axil_csr_awready;
   input  [31 : 0]                      s_axil_csr_wdata ;
   input  [3 : 0]                       s_axil_csr_wstrb ;
   input                                s_axil_csr_wvalid;
   output                               s_axil_csr_wready;
   output                               s_axil_csr_bvalid;
   output  [1:0]                        s_axil_csr_bresp;
   input                                s_axil_csr_bready;
   input  [31 : 0]                      s_axil_csr_araddr;
   input  [2 : 0]                       s_axil_csr_arprot;
   input                                s_axil_csr_arvalid;
   output                               s_axil_csr_arready;
   output  [31 : 0]                     s_axil_csr_rdata ;
   output  [1 : 0]                      s_axil_csr_rresp;
   output                               s_axil_csr_rvalid;
   input                                s_axil_csr_rready;
   //-- AXI Slave Write Address Channel
   input [C_S_AXI_ID_WIDTH-1:0]         s_axib_awid;
   input [C_S_AXI_ADDR_WIDTH-1:0]       s_axib_awaddr;
   input [3:0]                          s_axib_awregion;
   input [C_S_AXIB_AWUSER_WIDTH-1 : 0]  s_axib_awuser;
   input [7:0]                          s_axib_awlen;
   input [2:0]                          s_axib_awsize;
   input [1:0]                          s_axib_awburst;
   input                                s_axib_awvalid;
   output                               s_axib_awready;
   //-- AXI Slave Write Data Channel
   input [C_S_AXI_DATA_WIDTH-1:0]       s_axib_wdata;
   input [C_S_AXI_DATA_WIDTH/8-1:0]     s_axib_wuser;
   input [C_S_AXI_DATA_WIDTH/8-1:0]     s_axib_wstrb;
   input                                s_axib_wlast;
   input                                s_axib_wvalid;
   output                               s_axib_wready;
   //-- AXI Slave Write Response Channel
   output [C_S_AXI_ID_WIDTH-1:0]        s_axib_bid;
   output [1:0]                         s_axib_bresp;
   output                               s_axib_bvalid;
   input                                s_axib_bready;
   //-- AXI Slave Read Address Channel
   input  [C_S_AXI_ID_WIDTH-1:0]        s_axib_arid;
   input  [C_S_AXI_ADDR_WIDTH-1:0]      s_axib_araddr;
   input  [3:0]                         s_axib_arregion;
   input  [C_S_AXIB_ARUSER_WIDTH-1 : 0] s_axib_aruser;
   input  [7:0]                         s_axib_arlen;
   input  [2:0]                         s_axib_arsize;
   input  [1:0]                         s_axib_arburst;
   input                                s_axib_arvalid;
   output                               s_axib_arready;
   //-- AXI Slave Read Data Channel
   output [C_S_AXI_ID_WIDTH-1:0]        s_axib_rid;
   output [1:0]                         s_axib_rresp;
   output                               s_axib_rlast;
   output                               s_axib_rvalid;
   output [C_S_AXI_DATA_WIDTH-1:0]      s_axib_rdata;
   output [(C_S_AXI_DATA_WIDTH/8)-1:0]  s_axib_ruser;
   input                                s_axib_rready;
   // Descriptor Bypass channel 0
   output       wire                    c2h_dsc_byp_ready_0;
   input        wire [63:0]             c2h_dsc_byp_src_addr_0;
   input        wire [63:0]             c2h_dsc_byp_dst_addr_0;
   input        wire [27:0]             c2h_dsc_byp_len_0;
   input        wire [15:0]             c2h_dsc_byp_ctl_0;
   input        wire                    c2h_dsc_byp_load_0;

   output       wire                    h2c_dsc_byp_ready_0;
   input        wire [63:0]             h2c_dsc_byp_src_addr_0;
   input        wire [63:0]             h2c_dsc_byp_dst_addr_0;
   input        wire [27:0]             h2c_dsc_byp_len_0;
   input        wire [15:0]             h2c_dsc_byp_ctl_0;
   input        wire                    h2c_dsc_byp_load_0;

   // Descriptor Bypass channel 1
   output       wire                    c2h_dsc_byp_ready_1;
   input        wire [63:0]             c2h_dsc_byp_src_addr_1;
   input        wire [63:0]             c2h_dsc_byp_dst_addr_1;
   input        wire [27:0]             c2h_dsc_byp_len_1;
   input        wire [15:0]             c2h_dsc_byp_ctl_1;
   input        wire                    c2h_dsc_byp_load_1;

   output       wire                    h2c_dsc_byp_ready_1;
   input        wire [63:0]             h2c_dsc_byp_src_addr_1;
   input        wire [63:0]             h2c_dsc_byp_dst_addr_1;
   input        wire [27:0]             h2c_dsc_byp_len_1;
   input        wire [15:0]             h2c_dsc_byp_ctl_1;
   input        wire                    h2c_dsc_byp_load_1;

   // Descriptor Bypass channel 2
   output       wire                    c2h_dsc_byp_ready_2;
   input        wire [63:0]             c2h_dsc_byp_src_addr_2;
   input        wire [63:0]             c2h_dsc_byp_dst_addr_2;
   input        wire [27:0]             c2h_dsc_byp_len_2;
   input        wire [15:0]             c2h_dsc_byp_ctl_2;
   input        wire                    c2h_dsc_byp_load_2;

   output       wire                    h2c_dsc_byp_ready_2;
   input        wire [63:0]             h2c_dsc_byp_src_addr_2;
   input        wire [63:0]             h2c_dsc_byp_dst_addr_2;
   input        wire [27:0]             h2c_dsc_byp_len_2;
   input        wire [15:0]             h2c_dsc_byp_ctl_2;
   input        wire                    h2c_dsc_byp_load_2;

   // Descriptor Bypass channel 3
   output       wire                    c2h_dsc_byp_ready_3;
   input        wire [63:0]             c2h_dsc_byp_src_addr_3;
   input        wire [63:0]             c2h_dsc_byp_dst_addr_3;
   input        wire [27:0]             c2h_dsc_byp_len_3;
   input        wire [15:0]             c2h_dsc_byp_ctl_3;
   input        wire                    c2h_dsc_byp_load_3;

   output       wire                    h2c_dsc_byp_ready_3;
   input        wire [63:0]             h2c_dsc_byp_src_addr_3;
   input        wire [63:0]             h2c_dsc_byp_dst_addr_3;
   input        wire [27:0]             h2c_dsc_byp_len_3;
   input        wire [15:0]             h2c_dsc_byp_ctl_3;
   input        wire                    h2c_dsc_byp_load_3;

   // Status Channel 0
   output   wire [STS_WIDTH-1:0]        c2h_sts_0;
   output   wire [STS_WIDTH-1:0]        h2c_sts_0;

   // Status Channel 1
   output   wire [STS_WIDTH-1:0]        c2h_sts_1;
   output   wire [STS_WIDTH-1:0]        h2c_sts_1;

   // Status Channel 2
   output   wire [STS_WIDTH-1:0]        c2h_sts_2;
   output   wire [STS_WIDTH-1:0]        h2c_sts_2;

   // Status Channel 3
   output   wire [STS_WIDTH-1:0]        c2h_sts_3;
   output   wire [STS_WIDTH-1:0]        h2c_sts_3;

    // QDMA Streaming Ports
    // QDMA AXIS H2C
    output   wire [C_M_AXIS_DATA_WIDTH-1:0]                                     m_axis_h2c_tdata;
    output   wire [CRC_WIDTH-1 :0]                                              m_axis_h2c_tcrc;
    output   wire [10:0]                                                        m_axis_h2c_tuser_qid;
    output   wire [2:0]                                                         m_axis_h2c_tuser_port_id;
    output   wire                                                               m_axis_h2c_tuser_err;
    output   wire [31:0]                                                        m_axis_h2c_tuser_mdata;
    output   wire [5:0]                                                         m_axis_h2c_tuser_mty;
    output   wire                                                               m_axis_h2c_tuser_zero_byte;
    output   wire                                                               m_axis_h2c_tvalid;
    input    wire                                                               m_axis_h2c_tready;
    output   wire                                                               m_axis_h2c_tlast;

    // AXIS C2H packet input
    input wire [C_M_AXIS_DATA_WIDTH-1:0]                                   s_axis_c2h_tdata;
    input wire [CRC_WIDTH-1 :0]                                            s_axis_c2h_tcrc ;
    input wire [2:0]                                                       s_axis_c2h_ctrl_port_id;
    input wire [15:0]                                                      s_axis_c2h_ctrl_len ;
    input wire [10:0]                                                      s_axis_c2h_ctrl_qid ;
    input wire                                                             s_axis_c2h_ctrl_has_cmpt ;
    input wire                                                             s_axis_c2h_ctrl_marker;
    input wire                                                             s_axis_c2h_tvalid;
    output wire                                                            s_axis_c2h_tready;
    input wire                                                             s_axis_c2h_tlast;
    input wire [5:0]                                                       s_axis_c2h_mty;
    input wire [3:0]                                                       s_axis_c2h_ctrl_host_id;
    input wire                                                             s_axis_c2h_ctrl_num_buf_ov;
    input wire                                                             s_axis_c2h_ctrl_drop_req;
    input wire                                                             s_axis_c2h_ctrl_var_desc;
    input wire [6:0]                                                       s_axis_c2h_ctrl_ecc;


    // AXIS C2H Completion input
    input  wire [511:0]                                                    s_axis_c2h_cmpt_tdata;
    input  logic [1:0]                                                     s_axis_c2h_cmpt_size ;
    input  wire [15:0]                                                     s_axis_c2h_cmpt_dpar ;
    input  wire                                                            s_axis_c2h_cmpt_tvalid;
    output wire [0:0]                                                      s_axis_c2h_cmpt_tready;
    input  wire [10:0]							   s_axis_c2h_cmpt_ctrl_qid;
    input  wire [1:0]							   s_axis_c2h_cmpt_ctrl_cmpt_type;
    input  wire [15:0]							   s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id;
    input  wire [2:0]							   s_axis_c2h_cmpt_ctrl_port_id;
    input  wire 							   s_axis_c2h_cmpt_ctrl_marker;
    input  wire 							   s_axis_c2h_cmpt_ctrl_user_trig;
    input  wire [2:0]                        				   s_axis_c2h_cmpt_ctrl_col_idx;
    input  wire [2:0]							   s_axis_c2h_cmpt_ctrl_err_idx;
    input  wire 							   s_axis_c2h_cmpt_ctrl_pld_virt_ch;
    input  wire                                                            s_axis_c2h_cmpt_ctrl_non_blocking;
    input  wire                                                            s_axis_c2h_cmpt_ctrl_no_wrb_marker;

    // Descriptor Bypass Out for mdma
    output  wire [255:0]                                                   h2c_byp_out_dsc;
    output  wire                                                           h2c_byp_out_st_mm;
    output  wire                                                           h2c_byp_out_mm_chn;
    output  wire                                                           h2c_byp_out_end_rng;
    output  wire [10:0]                                                    h2c_byp_out_qid;
    output  wire [1:0]                                                     h2c_byp_out_dsc_sz;
    output  wire                                                           h2c_byp_out_error;
    output  wire [7:0]                                                    h2c_byp_out_func;
    output  wire [15:0]                                                    h2c_byp_out_cidx;
    output  wire [2:0]                                                     h2c_byp_out_port_id;
    output  wire                                                           h2c_byp_out_vld;
    input   wire                                                           h2c_byp_out_rdy;
    output  wire [3:0]                                                     h2c_byp_out_fmt;
    output  wire [5:0]                                                     h2c_byp_out_cnt;
    output   wire [3:0]                                                     h2c_byp_out_host_id;
    output                                                                  h2c_byp_out_pasid_en;
    output   wire [21:0]                                                    h2c_byp_out_pasid;

    output  wire [255:0]                                                   c2h_byp_out_dsc;
    output  wire                                                           c2h_byp_out_st_mm;
    output  wire [1:0]                                                     c2h_byp_out_dsc_sz;
    output  wire                                                           c2h_byp_out_end_rng;
    output  wire [10:0]                                                    c2h_byp_out_qid;
    output  wire                                                           c2h_byp_out_error;
    output  wire [7:0]                                                     c2h_byp_out_func;
    output  wire [15:0]                                                    c2h_byp_out_cidx;
    output  wire [2:0]                                                     c2h_byp_out_port_id;
    output  wire                                                           c2h_byp_out_mm_chn;
    output  wire                                                           c2h_byp_out_vld;
    input   wire                                                           c2h_byp_out_rdy;
    output  wire [3:0]                                                     c2h_byp_out_fmt;
    output  wire [5:0]                                                     c2h_byp_out_cnt;
    output  wire [3:0]                                                     c2h_byp_out_host_id;
    output                                                                 c2h_byp_out_pasid_en;
    output  wire [21:0]                                                    c2h_byp_out_pasid;
    output  wire                                                           c2h_byp_out_var_desc;
    output  wire [6:0]                                                     c2h_byp_out_pfch_tag;
    output  wire                                                           c2h_byp_out_desc_chain;

    // Desciptor Bypass for mdma
    input   wire [63:0]                                                    h2c_byp_in_mm_radr;
    input   wire [63:0]                                                    h2c_byp_in_mm_wadr;
    input   wire [15:0]                                                    h2c_byp_in_mm_len;
    input   wire                                                           h2c_byp_in_mm_mrkr_req;
    input   wire                                                           h2c_byp_in_mm_err2ctxt;
    input   wire                                                           h2c_byp_in_mm_sdi;
    input   wire                                                           h2c_byp_in_mm_error;
    input   wire [10:0]                                                    h2c_byp_in_mm_qid;
    input   wire [7:0]                                                     h2c_byp_in_mm_func;
    input   wire [15:0]                                                    h2c_byp_in_mm_cidx;
    input   wire [2:0]                                                     h2c_byp_in_mm_port_id;
    input   wire [1:0]                                                     h2c_byp_in_mm_at;
    input   wire                                                           h2c_byp_in_mm_vld;
    input   wire                                                           h2c_byp_in_mm_no_dma;
    output  wire                                                           h2c_byp_in_mm_rdy;
    input   wire [3:0]                                                     h2c_byp_in_mm_host_id;
    input                                                                  h2c_byp_in_mm_pasid_en;
    input   wire [21:0]                                                    h2c_byp_in_mm_pasid;

    input   wire [63:0]                                                    h2c_byp_in_st_addr;
    input   wire [15:0]                                                    h2c_byp_in_st_len;
    input   wire                                                           h2c_byp_in_st_eop;
    input   wire                                                           h2c_byp_in_st_sop;
    input   wire                                                           h2c_byp_in_st_mrkr_req;
    input   wire                                                           h2c_byp_in_st_err2ctxt;
    input   wire                                                           h2c_byp_in_st_sdi;
    input   wire                                                           h2c_byp_in_st_error;
    input   wire [7:0]                                                     h2c_byp_in_st_func;
    input   wire [10:0]                                                    h2c_byp_in_st_qid;
    input   wire [15:0]                                                    h2c_byp_in_st_cidx;
    input   wire [2:0]                                                     h2c_byp_in_st_port_id;
    input   wire [1:0]                                                     h2c_byp_in_st_at;
    input   wire                                                           h2c_byp_in_st_no_dma;
    input   wire                                                           h2c_byp_in_st_vld;
    output  wire                                                           h2c_byp_in_st_rdy;
    input   wire [3:0]                                                     h2c_byp_in_st_host_id;
    input                                                                  h2c_byp_in_st_pasid_en;
    input   wire [21:0]                                                    h2c_byp_in_st_pasid;

    input   wire [63:0]                                                    c2h_byp_in_mm_radr;
    input   wire [63:0]                                                    c2h_byp_in_mm_wadr;
    input   wire [15:0]                                                    c2h_byp_in_mm_len;
    input   wire                                                           c2h_byp_in_mm_mrkr_req;
    input   wire                                                           c2h_byp_in_mm_err2ctxt;
    input   wire                                                           c2h_byp_in_mm_sdi;
    input   wire                                                           c2h_byp_in_mm_error;
    input   wire [10:0]                                                    c2h_byp_in_mm_qid;
    input   wire [7:0]                                                     c2h_byp_in_mm_func;
    input   wire [15:0]                                                    c2h_byp_in_mm_cidx;
    input   wire [2:0]                                                     c2h_byp_in_mm_port_id;
    input   wire [1:0]                                                     c2h_byp_in_mm_at;
    input   wire                                                           c2h_byp_in_mm_no_dma;
    input   wire                                                           c2h_byp_in_mm_vld;
    output  wire                                                           c2h_byp_in_mm_rdy;
    input   wire [3:0]                                                     c2h_byp_in_mm_host_id;
    input                                                                  c2h_byp_in_mm_pasid_en;
    input   wire [21:0]                                                    c2h_byp_in_mm_pasid;

   // input   wire [63:0]                                                    c2h_byp_in_mm1_radr;
   // input   wire [63:0]                                                    c2h_byp_in_mm1_wadr;
   // input   wire [15:0]                                                    c2h_byp_in_mm1_len;
   // input   wire                                                           c2h_byp_in_mm1_mrkr_req;
   // input   wire                                                           c2h_byp_in_mm1_sdi;
   // input   wire [10:0]                                                    c2h_byp_in_mm1_qid;
   // input   wire                                                           c2h_byp_in_mm1_error;
   // input   wire [11:0]                                                    c2h_byp_in_mm1_func;
   // input   wire [15:0]                                                    c2h_byp_in_mm1_cidx;
   // input   wire [2:0]                                                     c2h_byp_in_mm1_port_id;
   // input   wire [1:0]                                                     c2h_byp_in_mm1_at;
   // input   wire                                                           c2h_byp_in_mm1_no_dma;
   // input   wire                                                           c2h_byp_in_mm1_vld;
   // output  wire                                                           c2h_byp_in_mm1_rdy;
   // input   wire [3:0]                                                     c2h_byp_in_mm1_host_id;
   // input                                                                  c2h_byp_in_mm1_pasid_en;
   // input   wire [21:0]                                                    c2h_byp_in_mm1_pasid;

    input   wire [63:0]                                                    c2h_byp_in_st_csh_addr;
    input   wire                                                           c2h_byp_in_st_csh_error;
    input   wire [7:0]                                                     c2h_byp_in_st_csh_func;
    input   wire [10:0]                                                    c2h_byp_in_st_csh_qid;
    input   wire [2:0]                                                     c2h_byp_in_st_csh_port_id;
    input   wire                                                           c2h_byp_in_st_csh_err2ctxt;
    input   wire [1:0]                                                     c2h_byp_in_st_csh_at;
    input   wire                                                           c2h_byp_in_st_csh_vld;
    output  wire                                                           c2h_byp_in_st_csh_rdy;
    input   wire [15:0]                                                    c2h_byp_in_st_csh_cidx;
    input   wire [2:0]                                                     c2h_byp_in_st_csh_fmt;
    input   wire [3:0]                                                     c2h_byp_in_st_csh_host_id;
    input                                                                  c2h_byp_in_st_csh_pasid_en;
    input   wire [21:0]                                                    c2h_byp_in_st_csh_pasid;
    input                                                                  c2h_byp_in_st_csh_var_desc;
    input   wire [6:0]                                                     c2h_byp_in_st_csh_pfch_tag;
    input   wire [15:0]                                                    c2h_byp_in_st_csh_len;

    output                                                                 tm_dsc_sts_vld;
    output                                                                 tm_dsc_sts_byp;
    output                                                                 tm_dsc_sts_qen;
    output                                                                 tm_dsc_sts_dir;
    output                                                                 tm_dsc_sts_mm;
    output                                                                 tm_dsc_sts_error;
    output [10:0]                                                          tm_dsc_sts_qid;

    output [15:0]                                                           tm_dsc_sts_avl;
    output [2:0]                                                           tm_dsc_sts_port_id;
    output                                                                 tm_dsc_sts_qinv;
    output                                                                 tm_dsc_sts_irq_arm;

    input wire                                                             tm_dsc_sts_rdy;
    output [15:0]                                                          tm_dsc_sts_pidx;
    output [11:0]                                                          tm_dsc_sts_func;
    output                                                                 tm_dsc_sts_vio_hw_db;
    output                                                                 tm_dsc_sts_vio_sw_db;
    output                                                                 tm_dsc_sts_vio_avl_flg;
    output                                                                 tm_dsc_sts_vio_dsc_crdt;
    output                                                                 tm_dsc_sts_vio_en;

    // Descriptor credit In
    input                                                                  dsc_crdt_in_vld;
    output                                                                 dsc_crdt_in_rdy;
    input [15:0]                                                           dsc_crdt_in_crdt;
    input                                                                  dsc_crdt_in_dir;
    input                                                                  dsc_crdt_in_fence;
    input [10:0]                                                           dsc_crdt_in_qid;
    input [13:0]                                                           dsc_crdt_in_misc;
    input [02:0]                                                           dsc_crdt_in_op;
//    input [01:0]                                                           dsc_crdt_in_bsel;
//    input                                                                  dsc_crdt_in_var_desc;
//    input [3:0]                                                            dsc_crdt_in_buf_sz_ix;
//    input [5:0]                                                            dsc_crdt_in_pfch_tag;

    // Report the C2H Status case
    output wire                                                            axis_c2h_status_drop;
    output wire                                                            axis_c2h_status_last;
    output wire                                                            axis_c2h_status_cmp;
    output wire                                                            axis_c2h_status_valid;
    output wire                                                            axis_c2h_status_error;
    output wire [10:0]                                                     axis_c2h_status_qid;
    output wire [2:0]                                                      axis_c2h_status_port_id;
    output wire                                                            axis_c2h_status_target_vh;


    output wire                                                            axis_c2h_dmawr_cmp;
    output wire                                                            axis_c2h_dmawr_target_vch;
    output wire [2:0]                                                      axis_c2h_dmawr_port_id;
    output wire [1:0]                                                      mdma_c2h_st_mhost_feedback_qid_fifo_rd_out;
    output wire [1:0]                                                      mdma_c2h_st_mhost_feedback_payload_fifo_rd_out;
    output wire [1:0]                                                      mdma_c2h_st_mhost_feedback_pld_order;
    output wire [2:0]                                                      mdma_c2h_st_mhost_feedback_cmpt_fifo_rd_out;
    output wire [1:0]                                                      mdma_c2h_st_mhost_feedback_smpl_byp_rd_out;


    input wire                                                             cfg_wrreq_flr_vld;
    input wire                                                             cfg_wrreq_msi_vld;
    input wire                                                             cfg_wrreq_msix_vld;
    input wire                                                             cfg_wrreq_bme_vld;
    input wire                                                             cfg_wrreq_vfe_vld;
    input wire  [15:0]                                                     cfg_wrreq_func_num;
    input wire  [3:0]                                                      cfg_wrreq_out_value;
    output wire                                                            cfg_wrreq_flr_done;
    output wire [15:0]                                                     cfg_wrreq_flr_done_func_num;



    // Interrupt
    input wire                                                             usr_irq_in_vld;
    input wire  [USER_INT_VECT_W-1:0]                                      usr_irq_in_vec;
    input wire  [7:0]                                                      usr_irq_in_fnc;
    input wire  [3:0]                                                      usr_irq_in_host_id;
    output wire                                                            usr_irq_out_ack;
    output wire                                                            usr_irq_out_fail;

    // FLR
    output [7:0]         usr_flr_fnc;           // FLR
    output               usr_flr_set;           // FLR
    output               usr_flr_clr;           // FLR
    input  [7:0]         usr_flr_done_fnc;      // FLR
    input                usr_flr_done_vld      // FLR



   ;output wire         rd_interrupt
   ;output wire         wr_interrupt
   ;output wire         ats_pri_en

   // AXI SLAVE Interface to MicroProcessor
   // AXI Lite Slave interface to DVSEC block
   ;input   wire s_aclk
   ;input   wire s_aresetn

   ;input   wire [39:0]s_axi_araddr
   ;input   wire [1:0]s_axi_arburst
   ;input   wire [3:0]s_axi_arcache
   ;input   wire [15:0]s_axi_arid
   ;input   wire [7:0]s_axi_arlen
   ;input   wire [0:0]s_axi_arlock
   ;input   wire [2:0]s_axi_arprot
   ;input   wire [3:0]s_axi_arqos
   ;output  wire  s_axi_arready
   ;input   wire [2:0]s_axi_arsize
   ;input   wire [11 : 0 ]s_axi_aruser
   ;input   wire s_axi_arvalid
   ;input   wire [39:0]s_axi_awaddr
   ;input   wire [1:0]s_axi_awburst
   ;input   wire [3:0]s_axi_awcache
   ;input   wire [15:0]s_axi_awid
   ;input   wire [7:0]s_axi_awlen
   ;input   wire [0:0]s_axi_awlock
   ;input   wire [2:0]s_axi_awprot
   ;input   wire [3:0]s_axi_awqos
   ;output  wire  s_axi_awready
   ;input   wire [2:0]s_axi_awsize
   ;input   wire [11 :0]s_axi_awuser
   ;input   wire s_axi_awvalid
   ;output  wire  [15:0]s_axi_bid
   ;input   wire s_axi_bready
   ;output  wire  [1:0]s_axi_bresp
   ;output  wire  s_axi_bvalid
   ;output  wire  [31:0]s_axi_rdata
   ;output  wire  [15:0]s_axi_rid
   ;output  wire  s_axi_rlast
   ;input   wire s_axi_rready
   ;output  wire  [1:0]s_axi_rresp
   ;output  wire  s_axi_rvalid
   ;input   wire [31:0]s_axi_wdata
   ;input   wire s_axi_wlast
   ;output  wire  s_axi_wready
   ;input   wire [3:0]s_axi_wstrb
   ;input   wire s_axi_wvalid

   ;input wire           cfg_fc_vc_sel
   ;output wire          core_clk;

   // CXS interface
   input           cxs0_active_req_tx;
   output          cxs0_active_ack_tx;
   output          cxs0_deact_hint_tx;
   input           cxs0_valid_tx;
   output          cxs0_crdgnt_tx;
   input           cxs0_crdrtn_tx;
   input  [AXIS_CCIX_TX_TUSER_WIDTH-(AXIS_CCIX_TX_TDATA_WIDTH/8)-2:0]   cxs0_cntl_tx;
   input  [AXIS_CCIX_TX_TDATA_WIDTH-1:0]  cxs0_data_tx;
   input           cxs0_valid_chk_tx;
   output          cxs0_crdgnt_chk_tx;
   input           cxs0_crdrtn_chk_tx;
   input           cxs0_cntl_chk_tx;
   input  [AXIS_CCIX_TX_TDATA_WIDTH/8-1:0]   cxs0_data_chk_tx;
   output          cxs0_active_req_rx;
   input           cxs0_active_ack_rx;
   input           cxs0_deact_hint_rx;
   output          cxs0_valid_rx;
   input           cxs0_crdgnt_rx;
   output          cxs0_crdrtn_rx;
   output [AXIS_CCIX_RX_TUSER_WIDTH-(AXIS_CCIX_RX_TDATA_WIDTH/8)-2:0]   cxs0_cntl_rx;
   output [AXIS_CCIX_RX_TDATA_WIDTH-1:0]  cxs0_data_rx;
   output          cxs0_valid_chk_rx;
   input           cxs0_crdgnt_chk_rx;
   output          cxs0_crdrtn_chk_rx;
   output          cxs0_cntl_chk_rx;
   output [AXIS_CCIX_RX_TDATA_WIDTH/8-1:0]   cxs0_data_chk_rx;

   //input [C_M_AXI_ADDR_WIDTH-1:0]         s_axil_awaddr_ats;
   //input                                  s_axil_awvalid_ats;
   //output                                 s_axil_awready_ats;
   //input [C_S_AXI_DATA_WIDTH-1:0]         s_axil_wdata_ats;
   //input [C_S_AXI_DATA_WIDTH/8-1:0]       s_axil_wstrb_ats;
   //input                                  s_axil_wvalid_ats;
   //output                                 s_axil_wready_ats;
   //output [1:0]                           s_axil_bresp_ats;
   //output                                 s_axil_bvalid_ats;
   //input                                  s_axil_bready_ats;
   //input  [C_M_AXI_ADDR_WIDTH-1:0]        s_axil_araddr_ats;
   //input                                  s_axil_arvalid_ats;
   //output                                 s_axil_arready_ats;
   //output [C_S_AXI_DATA_WIDTH-1:0]        s_axil_rdata_ats;
   //output [1:0]                           s_axil_rresp_ats;
   //output                                 s_axil_rvalid_ats;
   //input                                  s_axil_rready_ats;

   // System Cache1 Interface
   //RQ Interface
   input                                  sc0_ats_s_axis_rq_tvalid;
   output                                 sc0_ats_s_axis_rq_tready;
   input [C_ATS_DATA_WIDTH-1:0]           sc0_ats_s_axis_rq_tdata;
   input [C_ATS_DATA_WIDTH/8-1:0]         sc0_ats_s_axis_rq_tkeep;
   input                                  sc0_ats_s_axis_rq_tlast;
   input [C_ATS_RQ_TUSER_WIDTH-1:0]       sc0_ats_s_axis_rq_tuser;

   //RC Interface
   output                                 sc0_ats_m_axis_rc_tvalid;
   input                                  sc0_ats_m_axis_rc_tready;
   output [C_ATS_DATA_WIDTH-1:0]          sc0_ats_m_axis_rc_tdata;
   output [C_ATS_DATA_WIDTH/8-1:0]        sc0_ats_m_axis_rc_tkeep;
   output                                 sc0_ats_m_axis_rc_tlast;
   output [C_ATS_RC_TUSER_WIDTH-1:0]      sc0_ats_m_axis_rc_tuser;

   //CC Interface
   input                                  sc0_ats_s_axis_cc_tvalid;
   output                                 sc0_ats_s_axis_cc_tready;
   input [C_ATS_DATA_WIDTH-1:0]           sc0_ats_s_axis_cc_tdata;
   input [C_ATS_DATA_WIDTH/8-1:0]         sc0_ats_s_axis_cc_tkeep;
   input                                  sc0_ats_s_axis_cc_tlast;
   input [C_ATS_CC_TUSER_WIDTH-1:0]       sc0_ats_s_axis_cc_tuser;

   //CQ Interface
   output                                 sc0_ats_m_axis_cq_tvalid;
   input                                  sc0_ats_m_axis_cq_tready;
   output [C_ATS_DATA_WIDTH-1:0]          sc0_ats_m_axis_cq_tdata;
   output [C_ATS_DATA_WIDTH/8-1:0]        sc0_ats_m_axis_cq_tkeep;
   output                                 sc0_ats_m_axis_cq_tlast;
   output [C_ATS_CQ_TUSER_WIDTH-1:0]      sc0_ats_m_axis_cq_tuser;


   // System Cache2 Interface
   //RQ Interface
   input                                  sc1_ats_s_axis_rq_tvalid;
   output                                 sc1_ats_s_axis_rq_tready;
   input [C_ATS_DATA_WIDTH-1:0]           sc1_ats_s_axis_rq_tdata;
   input [C_ATS_DATA_WIDTH/8-1:0]         sc1_ats_s_axis_rq_tkeep;
   input                                  sc1_ats_s_axis_rq_tlast;
   input [C_ATS_RQ_TUSER_WIDTH-1:0]       sc1_ats_s_axis_rq_tuser;

   //RC Interface
   output                                 sc1_ats_m_axis_rc_tvalid;
   input                                  sc1_ats_m_axis_rc_tready;
   output [C_ATS_DATA_WIDTH-1:0]          sc1_ats_m_axis_rc_tdata;
   output [C_ATS_DATA_WIDTH/8-1:0]        sc1_ats_m_axis_rc_tkeep;
   output                                 sc1_ats_m_axis_rc_tlast;
   output [C_ATS_RC_TUSER_WIDTH-1:0]      sc1_ats_m_axis_rc_tuser;

   //CC Interface
   input                                  sc1_ats_s_axis_cc_tvalid;
   output                                 sc1_ats_s_axis_cc_tready;
   input [C_ATS_DATA_WIDTH-1:0]           sc1_ats_s_axis_cc_tdata;
   input [C_ATS_DATA_WIDTH/8-1:0]         sc1_ats_s_axis_cc_tkeep;
   input                                  sc1_ats_s_axis_cc_tlast;
   input [C_ATS_CC_TUSER_WIDTH-1:0]       sc1_ats_s_axis_cc_tuser;

    //CQ Interface
   output                                 sc1_ats_m_axis_cq_tvalid;
   input                                  sc1_ats_m_axis_cq_tready;
   output [C_ATS_DATA_WIDTH-1:0]          sc1_ats_m_axis_cq_tdata;
   output [C_ATS_DATA_WIDTH/8-1:0]        sc1_ats_m_axis_cq_tkeep;
   output                                 sc1_ats_m_axis_cq_tlast;
   output [C_ATS_CQ_TUSER_WIDTH-1:0]      sc1_ats_m_axis_cq_tuser;

   output  [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   pci_exp_txp ;
   output  [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   pci_exp_txn ;
   input   [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   pci_exp_rxp ;
   input   [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   pci_exp_rxn ;

   input  wire [15:0]    cfg_dev_id_pf0;
   input  wire [15:0]    cfg_dev_id_pf1;
   input  wire [15:0]    cfg_dev_id_pf2;
   input  wire [15:0]    cfg_dev_id_pf3;
   input  wire [15:0]    cfg_vend_id;
   input  wire [7:0]     cfg_rev_id_pf0;
   input  wire [7:0]     cfg_rev_id_pf1;
   input  wire [7:0]     cfg_rev_id_pf2;
   input  wire [7:0]     cfg_rev_id_pf3;
   input  wire [15:0]    cfg_subsys_id_pf0;
   input  wire [15:0]    cfg_subsys_id_pf1;
   input  wire [15:0]    cfg_subsys_id_pf2;
   input  wire [15:0]    cfg_subsys_id_pf3;
   input  wire [15:0]    cfg_subsys_vend_id;

   input                                sys_clk ;
   output                               sys_clk_ce_out;
   input                                sys_clk_gt ;
   input                                sys_rst_n  ;
   output                               user_lnk_up ;
   input                                user_clk_dma_in;  // gtz: independent clk for DMA
   input                                user_reset_dma_in;// gtz: independent reset for DMA
   output                               user_reset_dma_out;// gtz: synchronized reset out from DMA


  input            free_run_clock;

  //----------------------------------------------------------------------------------------------------------------//
  //  Connectivity for external clocking                                                                            //
  //----------------------------------------------------------------------------------------------------------------//
  output          drp_rdy;
  output   [15:0] drp_do;
  input           drp_clk ;
  input           drp_en ;
  input           drp_we ;
  input    [10:0] drp_addr ;
  input    [15:0] drp_di ;

  output          cfg_ext_read_received;
  output          cfg_ext_write_received;
  output  [9:0]   cfg_ext_register_number;
  output  [7:0]   cfg_ext_function_number;
  output  [31:0]  cfg_ext_write_data;
  output  [3:0]   cfg_ext_write_byte_enable;
  input   [31:0]  cfg_ext_read_data;
  input           cfg_ext_read_data_valid;
  output  wire    interrupt_out;
  output          interrupt_out_msi_vec0to31;
  output          interrupt_out_msi_vec32to63;

  output                                            ext_ch_gt_drpclk ;
  input   [((PL_LINK_CAP_MAX_LINK_WIDTH * 10)-1):0] ext_ch_gt_drpaddr ;
  input   [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] ext_ch_gt_drpen ;
  input   [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] ext_ch_gt_drpwe ;
  input   [((PL_LINK_CAP_MAX_LINK_WIDTH * 16)-1):0] ext_ch_gt_drpdi ;
  output  [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] ext_ch_gt_drprdy ;
  output  [((PL_LINK_CAP_MAX_LINK_WIDTH * 16)-1):0] ext_ch_gt_drpdo ;

  // -----------------------------------------------------------------------
  // Transceiver debug ports for 7 series PCIE gen3 core
  // -----------------------------------------------------------------------
  input   [ 2:0]                                pipe_txprbssel;
  input   [ 2:0]                                pipe_rxprbssel;
  input                                         pipe_txprbsforceerr;
  input                                         pipe_rxprbscntreset;
  input   [ 2:0]                                pipe_loopback;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_rxprbserr;
  input  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]       pipe_txinhibit;
  output  [4:0]                                 pipe_rst_fsm;
  output  [11:0]                                pipe_qrst_fsm;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH*5)-1:0]  pipe_rate_fsm;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH*6)-1:0]  pipe_sync_fsm_tx;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH*7)-1:0]  pipe_sync_fsm_rx;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH*7)-1:0]  pipe_drp_fsm;
  output                                        pipe_rst_idle;
  output                                        pipe_qrst_idle;
  output                                        pipe_rate_idle;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_eyescandataerror;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH*3-1:0]    pipe_rxstatus;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH*15-1:0]   pipe_dmonitorout;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_cpll_lock;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2:0] pipe_qpll_lock;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_rxpmaresetdone;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH*3)-1:0]  pipe_rxbufstatus;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_txphaligndone;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_txphinitdone;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_txdlysresetdone;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_rxphaligndone;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_rxdlysresetdone;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_rxsyncdone;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH*8)-1:0]  pipe_rxdisperr;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH*8)-1:0]  pipe_rxnotintable;
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH)-1:0]    pipe_rxcommadet;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      gt_ch_drp_rdy;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_0;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_1;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_2;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_3;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_4;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_5;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_6;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_7;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_8;
  output  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]      pipe_debug_9;
  output  [31:0]                                pipe_debug;

  // -----------------------------------------------------------------------
  // Transceiver debug ports for Ultrascale PCIE gen3 core
  // -----------------------------------------------------------------------
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_pcieuserratedone ;
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*3)-1):0]  gt_loopback         ;
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_txprbsforceerr   ;
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_txinhibit        ;
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*4)-1):0]  gt_txprbssel        ;
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*4)-1):0]  gt_rxprbssel        ;
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxprbscntreset   ;
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_dmonitorclk      ;
  input wire  [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_dmonfiforeset    ;

  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_txelecidle       ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_txresetdone      ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxresetdone      ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxpmaresetdone   ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_txphaligndone    ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_txphinitdone     ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_txdlysresetdone  ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxphaligndone    ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxdlysresetdone  ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxsyncdone       ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_eyescandataerror ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxprbserr        ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*16)-1):0] gt_dmonitorout      ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxcommadet       ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_phystatus        ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxvalid          ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxcdrlock        ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_pcierateidle     ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_pcieuserratestart;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_gtpowergood      ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_cplllock         ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxoutclk         ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*1)-1):0]  gt_rxrecclkout      ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] gt_qpll1lock        ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*3)-1):0]  gt_rxstatus         ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*3)-1):0]  gt_rxbufstatus      ;
  output wire [8:0]                                   gt_bufgtdiv         ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*2)-1):0]  phy_txeq_ctrl       ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*4)-1):0]  phy_txeq_preset     ;
  output wire [3:0]                                   phy_rst_fsm         ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*3)-1):0]  phy_txeq_fsm        ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH*3)-1):0]  phy_rxeq_fsm        ;
  output wire                                         phy_rst_idle        ;
  output wire                                         phy_rrst_n          ;
  output wire                                         phy_prst_n          ;
  output wire [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] gt_qpll0lock        ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_gen34_eios_det   ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_txoutclk         ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_txoutclkfabric   ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_rxoutclkfabric   ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_txoutclkpcs      ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_rxoutclkpcs      ;
  input  wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_txpmareset       ;
  input  wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_rxpmareset       ;
  input  wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_txpcsreset       ;
  input  wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_rxpcsreset       ;
  input  wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_rxbufreset       ;
  input  wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_rxcdrreset       ;
  input  wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_rxdfelpmreset     ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_txprogdivresetdone;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_txpmaresetdone   ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_txsyncdone       ;
  output wire [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]        gt_rxprbslocked     ;

  // mcap and startup signals.
  output wire                                        mcap_design_switch;
  input  wire                                        mcap_eos_in;
  output wire                                        cap_req;
  input  wire                                        cap_gnt;
  input  wire                                        cap_rel;
  output wire                                        startup_cfgclk;
  output wire                                        startup_cfgmclk;
  output wire [3:0]                                  startup_di;
  output wire                                        startup_eos;
  output wire                                        startup_preq;
  input  wire [3:0]                                  startup_do;
  input  wire [3:0]                                  startup_dts;
  input  wire                                        startup_fcsbo;
  input  wire                                        startup_fcsbts;
  input  wire                                        startup_gsr;
  input  wire                                        startup_gts;
  input  wire                                        startup_keyclearb;
  input  wire                                        startup_pack;
  input  wire                                        startup_usrcclko;
  input  wire                                        startup_usrcclkts;
  input  wire                                        startup_usrdoneo;
  input  wire                                        startup_usrdonets;

  // Shared Logic Internal
  output                                     int_pclk_out_slave;
  output                                     int_pipe_rxusrclk_out;
  output [(PL_LINK_CAP_MAX_LINK_WIDTH-1):0]  int_rxoutclk_out;
  output                                     int_dclk_out;
  output                                     int_userclk1_out;
  output                                     int_userclk2_out;
  output                                     int_oobclk_out;
  output  [1:0]                              int_qplllock_out;
  output  [1:0]                              int_qplloutclk_out;
  output  [1:0]                              int_qplloutrefclk_out;
  input  [(PL_LINK_CAP_MAX_LINK_WIDTH-1):0]  int_pclk_sel_slave;

  // Shared Logic External Clock
  input                                       pipe_pclk_in;
  input                                       pipe_rxusrclk_in;
  input  [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]     pipe_rxoutclk_in;
  input                                       pipe_dclk_in;
  input                                       pipe_userclk1_in;
  input                                       pipe_userclk2_in;
  input                                       pipe_oobclk_in;
  input                                       pipe_mmcm_lock_in;
  input                                       pipe_mmcm_rst_n;
  output                                      pipe_txoutclk_out;
  output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]     pipe_rxoutclk_out;
  output [PL_LINK_CAP_MAX_LINK_WIDTH-1:0]     pipe_pclk_sel_out;
  output                                      pipe_gen3_out;

  // Shared Logic External GT COMMON pcie3_7x
  input  [11:0]   qpll_drp_crscode;
  input  [17:0]   qpll_drp_fsm;
  input  [1:0]    qpll_drp_done;
  input  [1:0]    qpll_drp_reset;
  input  [1:0]    qpll_qplllock;
  input  [1:0]    qpll_qplloutclk;
  input  [1:0]    qpll_qplloutrefclk;
  output          qpll_qplld;
  output [1:0]    qpll_qpllreset;
  output          qpll_drp_clk;
  output          qpll_drp_rst_n;
  output          qpll_drp_ovrd;
  output          qpll_drp_gen3;
  output          qpll_drp_start;

  output  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           int_qpll1lock_out;
  output  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           int_qpll1outclk_out;
  output  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           int_qpll1outrefclk_out;
  output  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           ext_qpll1refclk;
  output  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           ext_qpll1pd;
  output  [((((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2)+1)*3)-1:0] ext_qpll1rate;
  output  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           ext_qpll1reset;
  input   [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           ext_qpll1lock_out;
  input   [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           ext_qpll1outclk_out;
  input   [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0]           ext_qpll1outrefclk_out;

  output [C_S_AXIS_DATA_WIDTH-1:0]    m_axis_rq_tdata_out;
  output                              m_axis_rq_tlast_out;
  output [C_M_AXIS_RQ_USER_WIDTH-1:0] m_axis_rq_tuser_out;
  output [C_S_KEEP_WIDTH-1:0]         m_axis_rq_tkeep_out;
  output [3:0]                        m_axis_rq_tready_out;
  output                              m_axis_rq_tvalid_out;

  output [C_M_AXIS_DATA_WIDTH-1:0]    s_axis_rc_tdata_out;
  output [C_M_AXIS_RC_USER_WIDTH-1:0] s_axis_rc_tuser_out;
  output                              s_axis_rc_tlast_out;
  output [C_M_KEEP_WIDTH-1:0]         s_axis_rc_tkeep_out;
  output                              s_axis_rc_tvalid_out;
  output                              s_axis_rc_tready_out;

  output [C_M_AXIS_DATA_WIDTH-1:0]     s_axis_cq_tdata_out;
  output [C_S_AXIS_CQP_USER_WIDTH-1:0] s_axis_cq_tuser_out;
  output                               s_axis_cq_tlast_out;
  output [C_M_KEEP_WIDTH-1:0]          s_axis_cq_tkeep_out;
  output                               s_axis_cq_tvalid_out;
  output                               s_axis_cq_tready_out;

  output [C_S_AXIS_DATA_WIDTH-1:0]     m_axis_cc_tdata_out;
  output [C_S_AXIS_CC_USER_WIDTH-1:0]  m_axis_cc_tuser_out;
  output                               m_axis_cc_tlast_out;
  output [C_S_KEEP_WIDTH-1:0]          m_axis_cc_tkeep_out;
  output                               m_axis_cc_tvalid_out;
  output [3:0]                         m_axis_cc_tready_out;

  output [3:0]                         cfg_negotiated_width_o;
  output [2:0]                         cfg_current_speed_o;
  output [5:0]                         cfg_ltssm_state_o;
  output                               pipe_tx0_rcvr_det;
  output [1:0]                         pipe_tx0_powerdown;
  output                               pipe_clk;
  output                               sys_clk_bufg;

//  output [3:0]                         cfg_interrupt_msi_enable;

//  output                               cfg_interrupt_msi_sent;
//  output                               cfg_interrupt_msi_fail;
//  output                               cfg_interrupt_msix_sent;
//  output                               cfg_interrupt_msix_fail;
//  input  [63:0]                        cfg_interrupt_msix_address;
//  input  [31:0]                        cfg_interrupt_msix_data;
//  input                                cfg_interrupt_msix_int;
  output [3:0]                         cfg_interrupt_msix_enable;
// output [3:0]                         cfg_interrupt_msix_mask;


  //    ******************************************************************
  //    New ports for split IP
  //    ******************************************************************
  input  [5:0]                         cfg_ltssm_state_sd;
  input                                user_lnk_up_sd;
  input                                phy_rdy_out_sd ;
  output                               cfg_config_space_enable_sd;
  output                               cfg_link_training_enable_sd;
  output [C_S_AXIS_DATA_WIDTH-1:0]     s_axis_rq_tdata_sd;
  output                               s_axis_rq_tlast_sd;
  output [C_M_AXIS_RQ_USER_WIDTH-1:0]  s_axis_rq_tuser_sd;
  output [C_S_KEEP_WIDTH-1:0]          s_axis_rq_tkeep_sd;
  output                               s_axis_rq_tvalid_sd;
  input  [3:0]                         s_axis_rq_tready_sd;

  input  [C_M_AXIS_DATA_WIDTH-1:0]     m_axis_rc_tdata_sd;
  input  [C_M_AXIS_RC_USER_WIDTH-1:0]  m_axis_rc_tuser_sd;
  input                                m_axis_rc_tlast_sd;
  input  [C_M_KEEP_WIDTH-1:0]          m_axis_rc_tkeep_sd;
  input                                m_axis_rc_tvalid_sd;
  output                               m_axis_rc_tready_sd;

  input  [C_M_AXIS_DATA_WIDTH-1:0]     m_axis_cq_tdata_sd;
  input  [C_S_AXIS_CQP_USER_WIDTH-1:0] m_axis_cq_tuser_sd;
  input                                m_axis_cq_tlast_sd;
  input  [C_M_KEEP_WIDTH-1:0]          m_axis_cq_tkeep_sd;
  input                                m_axis_cq_tvalid_sd;
  output                               m_axis_cq_tready_sd;

  output [C_S_AXIS_DATA_WIDTH-1:0]     s_axis_cc_tdata_sd;
  output [C_S_AXIS_CC_USER_WIDTH-1:0]  s_axis_cc_tuser_sd;
  output                               s_axis_cc_tlast_sd;
  output [C_S_KEEP_WIDTH-1:0]          s_axis_cc_tkeep_sd;
  output                               s_axis_cc_tvalid_sd;
  input  [3:0]                         s_axis_cc_tready_sd;

  input  [5:0]                         rbar_bar_size_sd;
  input  [7:0]                         rbar_function_number_sd;
  input                                rbar_write_enable_bar0_sd;
  input                                rbar_write_enable_bar1_sd;
  input                                rbar_write_enable_bar2_sd;
  input                                rbar_write_enable_bar3_sd;
  input                                rbar_write_enable_bar4_sd;
  input                                rbar_write_enable_bar5_sd;
  input                                user_clk_sd;
  input                                user_reset_sd;
  output [1:0]                         pcie_cq_np_req_sd;
  input  [5:0]                         pcie_cq_np_req_count_sd;
  input  [3:0]                         pcie_tfc_nph_av_sd;
  input  [3:0]                         pcie_tfc_npd_av_sd;
  input                                pcie_rq_seq_num_vld0_sd;
  input  [5:0]                         pcie_rq_seq_num0_sd;
  input                                pcie_rq_seq_num_vld1_sd;
  input  [5:0]                         pcie_rq_seq_num1_sd;
  input  [7:0]                         cfg_fc_nph_sd;
  input  [7:0]                         cfg_fc_ph_sd;
  output [2:0]                         cfg_fc_sel_sd;
  input                                cfg_phy_link_down_sd;
  input    [1:0]                       cfg_phy_link_status_sd;
  input     [2:0]                      cfg_negotiated_width_sd;
  input     [1:0]                      cfg_current_speed_sd;
  input                                cfg_pl_status_change_sd;
  input                                cfg_hot_reset_out_sd;
  input  [7:0]                         cfg_bus_number_sd;
  output [7:0]                         cfg_ds_port_number_sd;
  output [7:0]                         cfg_ds_bus_number_sd;
  output [4:0]                         cfg_ds_device_number_sd;
  output [2:0]                         cfg_ds_function_number_sd;
  output  [63:0]                       cfg_dsn_sd;
  input  [15:0]                        cfg_function_status_sd;
  input  [2:0]                         cfg_max_read_req_sd;
  input  [1:0]                         cfg_max_payload_sd;
  output                               cfg_err_cor_in_sd;
  output                               cfg_err_uncor_in_sd;
  output [3:0]                         cfg_flr_done_sd;
  input  [3:0]                         cfg_flr_in_process_sd;
  input  [251:0]                       cfg_vf_flr_in_process_sd;
  input  [503:0] cfg_vf_status_sd;


  // Interrupt Interface Signals
  output [3:0]                         cfg_interrupt_int_sd;
  input                                cfg_interrupt_sent_sd;
  output [3:0]                         cfg_interrupt_pending_sd;

  input  [3:0]                         cfg_interrupt_msi_enable_sd;
  input                                cfg_interrupt_msi_mask_update_sd;
  input  [31:0]                        cfg_interrupt_msi_data_sd;
  output [31:0]                        cfg_interrupt_msi_int_sd;
  output [31:0]                        cfg_interrupt_msi_pending_status_sd;
  output                               cfg_interrupt_msi_pending_status_data_enable_sd;
  output [3:0]                         cfg_interrupt_msi_pending_status_function_num_sd;
  output [2:0]                         cfg_interrupt_msi_attr_sd;
  output                               cfg_interrupt_msi_tph_present_sd;
  output [1:0]                         cfg_interrupt_msi_tph_type_sd;
  output [8:0]                         cfg_interrupt_msi_tph_st_tag_sd;
  output [7:0]                         cfg_interrupt_msi_function_number_sd;

  input                                cfg_interrupt_msi_sent_sd;
  input                                cfg_interrupt_msi_fail_sd;

  output                               cfg_interrupt_msix_int_sd;       // Configuration Interrupt MSI-X Data Valid.
  output    [31:0]                     cfg_interrupt_msix_data_sd;      // Configuration Interrupt MSI-X Data.
  output    [63:0]                     cfg_interrupt_msix_address_sd;   // Configuration Interrupt MSI-X Address.
  input     [3:0]                      cfg_interrupt_msix_enable_sd;    // Configuration Interrupt MSI-X Function Enabled.
  input     [3:0]                      cfg_interrupt_msix_mask_sd;      // Configuration Interrupt MSI-X Function Mask.

  input     [251:0]                    cfg_interrupt_msix_vf_enable_sd; // Configuration Interrupt MSI-X on VF Enabled.
  input     [251:0]                    cfg_interrupt_msix_vf_mask_sd;   // Configuration Interrupt MSI-X VF Mask.
  output    [1:0]                      cfg_interrupt_msix_vec_pending_sd;
  input     [0:0]                      cfg_interrupt_msix_vec_pending_status_sd;
  // Error Reporting Interface
  input                                cfg_err_cor_out_sd;
  input                                cfg_err_nonfatal_out_sd;
  input                                cfg_err_fatal_out_sd;
  input   [4:0]                        cfg_local_error_out_sd;

  input	[3:0]                          cfg_tph_requester_enable_sd;
  input	[251:0]                        cfg_vf_tph_requester_enable_sd;
  input                                cfg_msg_received_sd;
  input    [7:0]                       cfg_msg_received_data_sd;
  input    [4:0]                       cfg_msg_received_type_sd;
  output                               cfg_msg_transmit_sd;
  output   [2:0]                       cfg_msg_transmit_type_sd;
  output   [31:0]                      cfg_msg_transmit_data_sd;
  input                                cfg_msg_transmit_done_sd;


  output  [09:0]  cfg_mgmt_addr_sd;
  output         cfg_mgmt_write_sd;
  output  [31:0] cfg_mgmt_write_data_sd;
  output  [3:0]  cfg_mgmt_byte_enable_sd;
  output         cfg_mgmt_read_sd;
  output  [7:0]  cfg_mgmt_function_number_sd;
  output         cfg_mgmt_type1_cfg_reg_access_sd;
  input  [31:0]  cfg_mgmt_read_data_sd;
  input          cfg_mgmt_read_write_done_sd;

  input          cfg_ext_read_received_sd;
  input          cfg_ext_write_received_sd;
  input  [9:0]   cfg_ext_register_number_sd;
  input  [7:0]   cfg_ext_function_number_sd;
  input  [31:0]  cfg_ext_write_data_sd;
  input  [3:0]   cfg_ext_write_byte_enable_sd;
  output [31:0]  cfg_ext_read_data_sd;
  output         cfg_ext_read_data_valid_sd;




  //-- AXIS RQ Request Inbound Channel for ATS/PRI messages
  input [C_M_AXIS_DATA_WIDTH-1:0]     atspri_s_axis_rq_tdata;
  input [C_M_AXIS_DATA_WIDTH/32-1:0]  atspri_s_axis_rq_tkeep;
  input [C_M_AXIS_RQ_USER_WIDTH-1:0]  atspri_s_axis_rq_tuser;
  input                               atspri_s_axis_rq_tlast;
  input                               atspri_s_axis_rq_tvalid;
  output                              atspri_s_axis_rq_tready;

  //-- AXIS Completer Request Outbound Channel for ATS/PRI messages
  output [C_S_AXIS_DATA_WIDTH-1:0]    atspri_m_axis_cq_tdata;
  output [C_S_AXIS_DATA_WIDTH/32-1:0] atspri_m_axis_cq_tkeep;
  output [C_S_AXIS_CQ_USER_WIDTH-1:0] atspri_m_axis_cq_tuser;
  output                              atspri_m_axis_cq_tlast;
  output                              atspri_m_axis_cq_tvalid;
  input                               atspri_m_axis_cq_tready;

  //--PCIe CFG Status Interface for ATS/PRI messages
  output [4:0]                        cfg_status_ats_stu;
  output                              cfg_status_ats_en;
  output                              cfg_status_pr_en;
  output                              cfg_status_pr_rst;
  output                              cfg_status_pr_uprgi;
  input                               cfg_status_set_uprgi;
  output                              cfg_status_pr_rf;
  input                               cfg_status_set_rf;
  input                               cfg_status_set_s;
  input                               cfg_status_clr_s;
  output [31:0]                       cfg_status_ost_pr_alloc;

 // Vector number update for advanced users
  input numvec_valid ;
  output numvec_done ;
  input [31:0] msix_vectors_per_pf0 ;
  input [31:0] msix_vectors_per_pf1 ;
  input [31:0] msix_vectors_per_pf2 ;
  input [31:0] msix_vectors_per_pf3 ;
  input [31:0] msix_vectors_per_vfg0 ;
  input [31:0] msix_vectors_per_vfg1 ;
  input [31:0] msix_vectors_per_vfg2 ;
  input [31:0] msix_vectors_per_vfg3 ;
  input [15:0] usr_irq_req_qdma ;
  output[15:0] usr_irq_ack_qdma ;

  // eQDMA VirtIO Descriptor Credit Input Ports
  input                virtio_dsc_crdt_in_vld;
  output               virtio_dsc_crdt_in_rdy;
  input [15:0]         virtio_dsc_crdt_in_crdt;
  input [12:0]         virtio_dsc_crdt_in_qid;
  input                virtio_dsc_crdt_in_dir;
  input [15:0]         virtio_dsc_crdt_in_idx;


  // eQDMA Status Output Ports
  output [7:0]         qsts_out_op;
  output [63:0]        qsts_out_data;
  output [2:0]         qsts_out_port_id;
  output [12:0]        qsts_out_qid;
  output               qsts_out_vld;
  input                qsts_out_rdy;

  // AXI Interrupt Ports
  output               axi_interrupt_vld;
  output [31:0]        axi_interrupt_vec;
  output [11:0]        axi_interrupt_func_num;
  output [3:0]         axi_interrupt_host_id;
  input                axi_interrupt_ack;




wire mdma_h2c_byp_in_rdy_temp;
wire mdma_c2h_byp_in_rdy_temp;

  (* keep = "true" *) wire          blk_cfg_ext_read_received;
  (* keep = "true" *) wire          blk_cfg_ext_write_received;
  (* keep = "true" *) wire [9:0]    blk_cfg_ext_register_number;
  (* keep = "true" *) wire [7:0]    blk_cfg_ext_function_number;
  (* keep = "true" *) wire [31:0]   blk_cfg_ext_write_data;
  (* keep = "true" *) wire [3:0]    blk_cfg_ext_write_byte_enable;
  (* keep = "true" *) wire [31:0]   blk_cfg_ext_read_data;
  (* keep = "true" *) wire          blk_cfg_ext_read_data_valid;
  (* keep = "true" *) wire [18:0]   cfg_mgmt_addr;
  (* keep = "true" *) wire          cfg_mgmt_write;
  (* keep = "true" *) wire [31:0]   cfg_mgmt_write_data;
  (* keep = "true" *) wire [3:0]    cfg_mgmt_byte_enable;
  (* keep = "true" *) wire          cfg_mgmt_read;
  (* keep = "true" *) wire [31:0]   cfg_mgmt_read_data;
  (* keep = "true" *) wire          cfg_mgmt_read_write_done;
  (* keep = "true" *) wire          cfg_mgmt_type1_cfg_reg_access;

  (* keep = "true" *) wire          axi_aclk;
  (* keep = "true" *) wire          axi_aresetn;
  (* keep = "true" *) wire          axi_ctl_aclk;
  (* keep = "true" *) wire          axi_ctl_aresetn;
  wire                              axi_aresetn_int;
  (* keep = "true" *) wire  [XDMA_NUM_USR_IRQ-1:0]  usr_irq_req;
  (* keep = "true" *) wire  [XDMA_NUM_USR_IRQ-1:0]  usr_irq_ack;
  (* keep = "true" *) wire  [2*XDMA_NUM_USR_IRQ-1:0] usr_irq_function_number;
  (* keep = "true" *) wire                          msi_enable;
  (* keep = "true" *) wire [2 : 0]                  msi_vector_width;

  (* keep = "true" *) wire [C_M_AXI_ID_WIDTH-1 : 0]     m_axi_awid;
  (* keep = "true" *) wire [C_M_AXI_ADDR_WIDTH-1 : 0]   m_axi_awaddr;
  (* keep = "true" *) wire [7 : 0]                      m_axi_awlen;
  (* keep = "true" *) wire [2 : 0]                      m_axi_awsize;
  (* keep = "true" *) wire [1 : 0]                      m_axi_awburst;
  (* keep = "true" *) wire [2 : 0]                      m_axi_awprot;
  (* keep = "true" *) wire                              m_axi_awvalid;
  (* keep = "true" *) wire                              m_axi_awready;
  (* keep = "true" *) wire                              m_axi_awlock;
  (* keep = "true" *) wire [3 : 0]                      m_axi_awcache;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH-1 : 0]   m_axi_wdata ;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axi_wuser;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axi_wstrb ;
  (* keep = "true" *) wire                              m_axi_wlast ;
  (* keep = "true" *) wire                              m_axi_wvalid ;
  (* keep = "true" *) wire                              m_axi_wready ;
  (* keep = "true" *) wire [C_M_AXI_ID_WIDTH-1 : 0]     m_axi_bid ;
  (* keep = "true" *) wire [1 : 0]                      m_axi_bresp ;
  (* keep = "true" *) wire                              m_axi_bvalid ;
  (* keep = "true" *) wire                              m_axi_bready ;
  (* keep = "true" *) wire [C_M_AXI_ID_WIDTH-1 : 0]     m_axi_arid ;
  (* keep = "true" *) wire [C_M_AXI_ADDR_WIDTH-1 : 0]   m_axi_araddr ;
  (* keep = "true" *) wire [7 : 0]                      m_axi_arlen ;
  (* keep = "true" *) wire [2 : 0]                      m_axi_arsize ;
  (* keep = "true" *) wire [1 : 0]                      m_axi_arburst ;
  (* keep = "true" *) wire [2 : 0]                      m_axi_arprot ;
  (* keep = "true" *) wire                              m_axi_arvalid ;
  (* keep = "true" *) wire                              m_axi_arready ;
  (* keep = "true" *) wire                              m_axi_arlock;
  (* keep = "true" *) wire [3 : 0]                      m_axi_arcache;
  (* keep = "true" *) wire [C_M_AXI_ID_WIDTH-1 : 0]     m_axi_rid ;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH-1 : 0]   m_axi_rdata ;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axi_ruser;
  (* keep = "true" *) wire [1 : 0]                      m_axi_rresp ;
  (* keep = "true" *) wire                              m_axi_rlast ;
  (* keep = "true" *) wire                              m_axi_rvalid ;
  (* keep = "true" *) wire                              m_axi_rready ;
  // Axi bypass
  (* keep = "true" *) wire [C_M_AXI_ID_WIDTH-1 : 0]     m_axib_awid ;
  (* keep = "true" *) wire [C_M_AXI_ADDR_WIDTH-1 : 0]   m_axib_awaddr ;
  (* keep = "true" *) wire [C_M_AXIB_AWUSER_WIDTH-1 : 0]m_axib_awuser ;
  (* keep = "true" *) wire [7 : 0]                      m_axib_awlen ;
  (* keep = "true" *) wire [2 : 0]                      m_axib_awsize ;
  (* keep = "true" *) wire [1 : 0]                      m_axib_awburst ;
  (* keep = "true" *) wire [2 : 0]                      m_axib_awprot ;
  (* keep = "true" *) wire                              m_axib_awvalid ;
  (* keep = "true" *) wire                              m_axib_awready ;
  wire                                                  m_axib_awlock ;
  (* keep = "true" *) wire [3 : 0]                      m_axib_awcache ;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH-1 : 0]   m_axib_wdata ;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axib_wuser;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axib_wstrb ;
  (* keep = "true" *) wire                              m_axib_wlast ;
  (* keep = "true" *) wire                              m_axib_wvalid ;
  (* keep = "true" *) wire                              m_axib_wready ;
  (* keep = "true" *) wire [C_M_AXI_ID_WIDTH-1 : 0]     m_axib_bid ;
  (* keep = "true" *) wire [1 : 0]                      m_axib_bresp ;
  (* keep = "true" *) wire                              m_axib_bvalid ;
  (* keep = "true" *) wire                              m_axib_bready ;
  (* keep = "true" *) wire [C_M_AXI_ID_WIDTH-1 : 0]     m_axib_arid ;
  (* keep = "true" *) wire [C_M_AXI_ADDR_WIDTH-1 : 0]   m_axib_araddr ;
  (* keep = "true" *) wire [C_M_AXIB_ARUSER_WIDTH-1: 0] m_axib_aruser ;
  (* keep = "true" *) wire [7 : 0]                      m_axib_arlen ;
  (* keep = "true" *) wire [2 : 0]                      m_axib_arsize ;
  (* keep = "true" *) wire [1 : 0]                      m_axib_arburst ;
  (* keep = "true" *) wire [2 : 0]                      m_axib_arprot ;
  (* keep = "true" *) wire                              m_axib_arvalid ;
  (* keep = "true" *) wire                              m_axib_arready ;
  wire                                                  m_axib_arlock;
  (* keep = "true" *) wire [3 : 0]                      m_axib_arcache;
  (* keep = "true" *) wire [C_M_AXI_ID_WIDTH-1 : 0]     m_axib_rid ;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH-1 : 0]   m_axib_rdata ;
  (* keep = "true" *) wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axib_ruser;

  (* keep = "true" *) wire [1 : 0]                      m_axib_rresp ;
  (* keep = "true" *) wire                              m_axib_rlast ;
  (* keep = "true" *) wire                              m_axib_rvalid ;
  (* keep = "true" *) wire                              m_axib_rready ;

  (* keep = "true" *) wire [31 : 0]                     m_axil_awaddr ;
  (* keep = "true" *) wire [C_M_AXIL_AWUSER_WIDTH-1: 0] m_axil_awuser ;
  wire [2 : 0]                                          m_axil_awprot ;
  (* keep = "true" *) wire                              m_axil_awvalid ;
  (* keep = "true" *) wire                              m_axil_awready ;
  (* keep = "true" *) wire [31 : 0]                     m_axil_wdata ;
  (* keep = "true" *) wire [3 : 0]                      m_axil_wstrb ;
  (* keep = "true" *) wire                              m_axil_wvalid ;
  (* keep = "true" *) wire                              m_axil_wready ;
  (* keep = "true" *) wire                              m_axil_bvalid ;
  (* keep = "true" *) wire [1:0]                        m_axil_bresp ;
  (* keep = "true" *) wire                              m_axil_bready ;
  (* keep = "true" *) wire [31 : 0]                     m_axil_araddr ;
  (* keep = "true" *) wire [C_M_AXIL_ARUSER_WIDTH-1: 0] m_axil_aruser ;
  wire [2 : 0]                                          m_axil_arprot;
  (* keep = "true" *) wire                              m_axil_arvalid ;
  (* keep = "true" *) wire                              m_axil_arready ;
  (* keep = "true" *) wire [31 : 0]                     m_axil_rdata ;
  (* keep = "true" *) wire [1 : 0]                      m_axil_rresp ;
  (* keep = "true" *) wire                              m_axil_rvalid ;
  (* keep = "true" *) wire                              m_axil_rready ;

  wire [3:0]                         cfg_interrupt_msi_enable;
  wire                                cfg_interrupt_msix_int;


  (* keep = "true" *) wire [31 : 0]                     s_axil_awaddr ;
  wire [2 : 0]                                          s_axil_awprot ;
  (* keep = "true" *) wire                              s_axil_awvalid ;
  (* keep = "true" *) wire                              s_axil_awready ;
  (* keep = "true" *) wire [31 : 0]                     s_axil_wdata ;
  (* keep = "true" *) wire [3 : 0]                      s_axil_wstrb ;
  (* keep = "true" *) wire                              s_axil_wvalid ;
  (* keep = "true" *) wire              s_axil_wready ;
  (* keep = "true" *) wire              s_axil_bvalid ;
  (* keep = "true" *) wire [1:0]            s_axil_bresp ;
  (* keep = "true" *) wire              s_axil_bready ;
  (* keep = "true" *) wire [31 : 0]         s_axil_araddr ;
   wire [2 : 0]                                 s_axil_arprot;
  (* keep = "true" *) wire              s_axil_arvalid ;
  (* keep = "true" *) wire              s_axil_arready ;
  (* keep = "true" *) wire [31 : 0]                     s_axil_rdata ;
  (* keep = "true" *) wire [1 : 0]          s_axil_rresp ;
  (* keep = "true" *) wire              s_axil_rvalid ;
  (* keep = "true" *) wire              s_axil_rready ;
  
  wire [31 : 0]                     s_axil_csr_awaddr ;
  wire [2 : 0]                      s_axil_csr_awprot ;
  wire                              s_axil_csr_awvalid ;
  wire                              s_axil_csr_awready ;
  wire [31 : 0]                     s_axil_csr_wdata ;
  wire [3 : 0]                      s_axil_csr_wstrb ;
  wire                              s_axil_csr_wvalid ;
  wire                              s_axil_csr_wready ;
  wire                              s_axil_csr_bvalid ;
  wire [1:0]                        s_axil_csr_bresp ;
  wire                              s_axil_csr_bready ;
  wire [31 : 0]                     s_axil_csr_araddr ;
  wire [2 : 0]                      s_axil_csr_arprot;
  wire                              s_axil_csr_arvalid ;
  wire                              s_axil_csr_arready ;
  wire [31 : 0]                     s_axil_csr_rdata ;
  wire [1 : 0]                      s_axil_csr_rresp ;
  wire                              s_axil_csr_rvalid ;
  wire                              s_axil_csr_rready ;

  wire [C_S_AXI_ID_WIDTH-1 : 0] s_axib_awid ;
  wire [AXI_ADDR_WIDTH-1 : 0]   s_axib_awaddr ;
  wire [3 : 0]                  s_axib_awregion ;
  wire [7 : 0]                  s_axib_awlen ;
  wire [2 : 0]                  s_axib_awsize ;
  wire [1 : 0]                  s_axib_awburst ;
  wire                          s_axib_awvalid ;
  wire                          s_axib_awready ;
  wire [AXI_DATA_WIDTH-1 : 0]   s_axib_wdata ;
  wire [(AXI_DATA_WIDTH/8)-1 : 0] s_axib_wuser ;
  wire [AXI_DATA_WIDTH/8-1 : 0]   s_axib_wstrb ;
  wire                            s_axib_wlast ;
  wire                            s_axib_wvalid ;
  wire                            s_axib_wready ;
  wire [C_S_AXI_ID_WIDTH-1 : 0]   s_axib_bid ;
  wire [1 : 0]                    s_axib_bresp;
  wire                            s_axib_bvalid;
  wire                            s_axib_bready;
  wire [C_S_AXI_ID_WIDTH-1 : 0]   s_axib_arid;
  wire [AXI_ADDR_WIDTH-1 : 0]     s_axib_araddr;
  wire [3 : 0]                    s_axib_arregion;
  wire [7 : 0]                    s_axib_arlen;
  wire [2 : 0]                    s_axib_arsize;
  wire [1 : 0]                    s_axib_arburst;
  wire                            s_axib_arvalid;
  wire                            s_axib_arready;
  wire [C_S_AXI_ID_WIDTH-1 : 0]   s_axib_rid;
  wire [AXI_DATA_WIDTH-1 : 0]     s_axib_rdata;
  wire [(AXI_DATA_WIDTH/8)-1 : 0] s_axib_ruser;
  wire [1 : 0]                    s_axib_rresp;
  wire                            s_axib_rlast;
  wire                            s_axib_rvalid;
  wire                            s_axib_rready;

  (* keep = "true" *) wire [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   pci_exp_txp ;
  (* keep = "true" *) wire [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   pci_exp_txn ;
  (* keep = "true" *) wire [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   pci_exp_rxp ;
  (* keep = "true" *) wire [PL_LINK_CAP_MAX_LINK_WIDTH-1 : 0]   pci_exp_rxn ;

  (* keep = "true" *) wire      sys_clk ;
  (* keep = "true" *) wire      sys_clk_ce_out;
  (* keep = "true" *) wire      sys_clk_gt ;
  (* keep = "true" *) wire      sys_rst_n  ;
  (* keep = "true" *) wire      user_lnk_up ;

  wire                          free_run_clock;
  (* keep = "true" *) wire          drp_clk ;
  (* keep = "true" *) wire          drp_en ;
  (* keep = "true" *) wire          drp_we ;
  (* keep = "true" *) wire   [10:0] drp_addr ;
  (* keep = "true" *) wire   [15:0] drp_di ;

  (* keep = "true" *) wire                                           ext_ch_gt_drpclk ;
  (* keep = "true" *) wire [((PL_LINK_CAP_MAX_LINK_WIDTH *  10)-1):0] ext_ch_gt_drpaddr ;
  (* keep = "true" *) wire [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] ext_ch_gt_drpen ;
  (* keep = "true" *) wire [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] ext_ch_gt_drpwe ;
  (* keep = "true" *) wire [((PL_LINK_CAP_MAX_LINK_WIDTH * 16)-1):0] ext_ch_gt_drpdi ;
  (* keep = "true" *) wire [((PL_LINK_CAP_MAX_LINK_WIDTH *  1)-1):0] ext_ch_gt_drprdy ;
  (* keep = "true" *) wire [((PL_LINK_CAP_MAX_LINK_WIDTH * 16)-1):0] ext_ch_gt_drpdo ;

  wire           cfg_ext_read_received;
  wire           cfg_ext_write_received;
  wire [9:0]     cfg_ext_register_number;
  wire [7:0]     cfg_ext_function_number;
  wire [31:0]    cfg_ext_write_data;
  wire [3:0]     cfg_ext_write_byte_enable;
  wire [31:0]    cfg_ext_read_data;
  wire [31:0]    pcie_dma_out_cfg_ext_read_data;
  wire           cfg_ext_read_data_valid;
  wire           pcie_dma_out_cfg_ext_read_data_valid;

  wire             cfg_ext_read_received_dma;
  wire             cfg_ext_write_received_dma;
  wire [31:0]      cfg_ext_write_data_dma;
  wire [3:0]       cfg_ext_write_byte_enable_dma;
  wire [7:0]       cfg_ext_function_number_dma;
  wire [9:0]       cfg_ext_register_number_dma;
  wire [31:0]      cfg_ext_read_data_dma;
  wire             cfg_ext_read_data_valid_dma;

  wire [18:0]    cfg_mgmt_addr_int;
  wire           cfg_mgmt_write_int;
  wire [31:0]    cfg_mgmt_write_data_int;
  wire [3:0]     cfg_mgmt_byte_enable_int;
  wire           cfg_mgmt_read_int;
  wire [31:0]    cfg_mgmt_read_data_int;
  wire           cfg_mgmt_read_write_done_int;
  wire           cfg_mgmt_type1_cfg_reg_access_int;
  wire [12:0]     cfg_mgmt_function_number;
  wire [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_qpll1refclk;
  wire [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_qpll1pd;
  wire [((((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2)+1)*3)-1:0] ext_qpll1rate;
  wire [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_qpll1reset;
  wire  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_qpll1lock_out;
  wire  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_qpll1outclk_out;
  wire  [((PL_LINK_CAP_MAX_LINK_WIDTH-1)>>2):0] ext_qpll1outrefclk_out;

  wire config_space_enable_local;
  assign config_space_enable_local = (CFG_SPACE_ENABLE == "TRUE" ) ? config_space_enable : 1'b1; 

  localparam AXI4MM_ULTRA = (C_FAMILY=="kintexu" || C_FAMILY=="virtexu" || C_FAMILY=="virtexuplus" || C_FAMILY=="kintexuplus" || C_FAMILY=="zyncuplus" || C_FAMILY=="zyncuplusrfsoc") ? 1 : 0;
  localparam DAT_WIDTH = C_M_AXIS_DATA_WIDTH;
  //localparam C_H2C_NUM_CHNL = XDMA_RNUM_CHNL;
  //localparam C_C2H_NUM_CHNL = XDMA_WNUM_CHNL;
  localparam C_H2C_NUM_RIDS = XDMA_RNUM_RIDS;
  localparam C_C2H_NUM_RIDS = XDMA_WNUM_RIDS;
  localparam C_NUM_USR_IRQ = XDMA_NUM_USR_IRQ;
  localparam C_GEN2_DEVICES = (ULTRASCALE == "FALSE") && (V7_GEN3 == "FALSE");   // Indicates Gen2 PCIe Hard Block
  localparam C_LEGACY_INT_EN = (PF0_INTERRUPT_PIN == 3'b000) ? "FALSE" : "TRUE"; // Indicates Legacy Interrupt Enabled/Disabled
  localparam C_MAX_CMPT_SIZE_LOCAL = (SOFT_NIC == "TRUE") ? 2 : 3;   // CMPT size limit is set to 512bits (3) for non soft_nic qdma
//  assign pasid_ram.uncor = 0; // HACK
//  assign pasid_ram.cor = 0; // HACK
  wire [2:0] axist_sz;
  wire [2:0] aximm_sz;



  // Configuration outputs ?? hope all of them are outputs....

  wire           cfg_phy_link_down;
  wire    [1:0]  cfg_phy_link_status;
  wire    [2:0]  cfg_max_read_req;

  wire    [1:0]  cfg_link_power_state;

  // Error Reporting Interface
  wire           cfg_err_cor_out;
  wire           cfg_err_nonfatal_out;
  wire           cfg_err_fatal_out;
  wire           cfg_local_error_valid;
  wire   [4:0]   cfg_local_error_out;
  wire           cfg_req_pm_transition_l23_ready = 0;

  wire           cfg_ltr_enable;
  wire   [5:0]   cfg_ltssm_state;
  wire   [3:0]   cfg_interrupt_pending;
  wire           cfg_dbe;
  
  wire    [2:0]  cfg_negotiated_width;
  wire    [1:0]  cfg_current_speed;
  wire    [1:0]  cfg_max_payload;
  assign  cfg_negotiated_width_o = {1'b0,cfg_negotiated_width};
  assign  cfg_current_speed_o = {1'b0,cfg_current_speed};
  assign cfg_ltssm_state_o = cfg_ltssm_state;

  wire   [3:0]   cfg_rcb_status;
  wire   [3:0]   cfg_dpa_substate_change;
  wire   [11:0]  cfg_function_power_state;
  wire   [3:0]   cfg_per_function_number;
  wire   [3:0]   cfg_interrupt_msi_enable_int;
  wire   [11:0]  cfg_interrupt_msi_mmenable;
  wire   [15:0]  cfg_function_status;
  assign cfg_interrupt_msi_enable = cfg_interrupt_msi_enable_int;
  wire    [1:0]  cfg_obff_enable;
  wire           cfg_pl_status_change;

  wire           cfg_msg_received;
  wire    [7:0]  cfg_msg_received_data;
  wire    [4:0]  cfg_msg_received_type;


  wire           cfg_msg_transmit;
  wire     [2:0] cfg_msg_transmit_type;
  wire    [31:0] cfg_msg_transmit_data;
  wire           cfg_msg_transmit_done;

  wire    [7:0]  cfg_fc_ph;
  wire   [11:0]  cfg_fc_pd;
  wire    [7:0]  cfg_fc_nph;
  wire   [11:0]  cfg_fc_npd;
  wire    [7:0]  cfg_fc_cplh;
  wire   [11:0]  cfg_fc_cpld;
  wire    [2:0]  cfg_fc_sel;
  wire    [1:0]  cfg_fc_nph_scale;
  wire   [15:0]  cfg_per_func_status_data;
  wire           cfg_per_function_update_done;

  wire    [63:0] cfg_dsn;
  wire           cfg_err_cor_in;
  wire           cfg_err_uncor_in;
  wire           cfg_power_state_change_ack;
  wire           cfg_power_state_change_interrupt;

  //----------------------------------------------------------------------------------------------------------------//
  // EP Only                                                                                                        //
  //----------------------------------------------------------------------------------------------------------------//

  // Interrupt Interface Signals
  wire [7:0]    cfg_interrupt_int;
  wire          cfg_interrupt_sent;

  wire          cfg_interrupt_msi_mask_update;
  wire [31:0]   cfg_interrupt_msi_data;
  wire [31:0]   cfg_interrupt_msi_int;
  wire          cfg_interrupt_msi_sent;
  wire          cfg_interrupt_msi_fail;
  wire          cfg_hot_reset_out;
  wire [7:0]    cfg_ds_port_number;
  wire [7:0]    cfg_ds_bus_number;
  wire [4:0]    cfg_ds_device_number;
  wire [2:0]    cfg_ds_function_number;

  wire          cfg_interrupt_msix_sent;      // Configuration Interrupt MSI-X Interrupt Sent.
  wire          cfg_interrupt_msix_fail;      // Configuration Interrupt MSI-X Interrupt Operation Failed.
  wire          cfg_interrupt_msix_int_int;       // Configuration Interrupt MSI-X Data Valid.
  wire  [31:0]  cfg_interrupt_msix_data;      // Configuration Interrupt MSI-X Data.
  wire  [63:0]  cfg_interrupt_msix_address;   // Configuration Interrupt MSI-X Address.
  wire  [1:0]   cfg_interrupt_msix_vec_pending;
  wire          cfg_interrupt_msix_vec_pending_status;
  wire  [3:0]   cfg_interrupt_msix_enable;    // Configuration Interrupt MSI-X Function Enabled.
  wire  [3:0]   cfg_interrupt_msix_mask;      // Configuration Interrupt MSI-X Function Mask.
  wire  [251:0] cfg_interrupt_msix_vf_enable; // Configuration Interrupt MSI-X on VF Enabled.
  wire  [251:0] cfg_interrupt_msix_vf_mask;   // Configuration Interrupt MSI-X VF Mask.
  wire [3:0]                axis_rq_tready;
  wire [3:0]                s_axis_cc_tready;
  wire [3:0]                s_axis_rq_tready_ats;
  wire [3:0]                s_axis_cc_tready_ats;


  wire            user_clk;
  wire            user_reset;
 wire            user_clk_async = user_clk_dma_in;
  wire            user_reset_async = user_reset; // = user_reset_dma_in
  wire rst_async_synchronized;

  assign user_reset_dma_out = rst_async_synchronized; 
  
  wire [1:0]              pcie_cq_np_req;
  wire [5:0]          pcie_cq_np_req_count;
  wire [3:0]          pcie_tfc_nph_av;
  wire [3:0]          pcie_tfc_npd_av;
  wire                pcie_rq_seq_num_vld0;
  wire [5:0]              pcie_rq_seq_num0;
  wire                pcie_rq_seq_num_vld1;
  wire [5:0]              pcie_rq_seq_num1;

  wire  [C_S_AXIS_DATA_WIDTH-1:0]    m_axis_rq_tdata_out;
  wire                           m_axis_rq_tlast_out;
  wire [C_M_AXIS_RQ_USER_WIDTH-1:0]  m_axis_rq_tuser_out;
  wire [C_S_KEEP_WIDTH-1:0]          m_axis_rq_tkeep_out;
  wire [3:0]                 m_axis_rq_tready_out;
  wire                       m_axis_rq_tvalid_out;

  wire [C_M_AXIS_DATA_WIDTH-1:0]     s_axis_rc_tdata_out;
  wire [C_M_AXIS_RC_USER_WIDTH-1:0]  s_axis_rc_tuser_out;
  wire                       s_axis_rc_tlast_out;
  wire [C_M_KEEP_WIDTH-1:0]          s_axis_rc_tkeep_out;
  wire                       s_axis_rc_tvalid_out;
  wire                       s_axis_rc_tready_out;

  wire [C_M_AXIS_DATA_WIDTH-1:0]     s_axis_cq_tdata_out;
  wire [C_S_AXIS_CQP_USER_WIDTH-1:0] s_axis_cq_tuser_out;
  wire                       s_axis_cq_tlast_out;
  wire [C_M_KEEP_WIDTH-1:0]          s_axis_cq_tkeep_out;
  wire                       s_axis_cq_tvalid_out;
  wire                   s_axis_cq_tready_out;

  wire [C_S_AXIS_DATA_WIDTH-1:0]     m_axis_cc_tdata_out;
  wire [C_S_AXIS_CC_USER_WIDTH-1:0]  m_axis_cc_tuser_out;
  wire                       m_axis_cc_tlast_out;
  wire [C_S_KEEP_WIDTH-1:0]          m_axis_cc_tkeep_out;
  wire                       m_axis_cc_tvalid_out;
  wire [3:0]                 m_axis_cc_tready_out;

  wire                               pipe_tx0_rcvr_det;
  wire [1:0]                         pipe_tx0_powerdown;
  wire                               pipe_clk;
  wire                               sys_clk_bufg;
  wire cfg_link_training_enable;
  wire  [2:0]  cfg_per_func_status_control;
  wire [2:0] cfg_per_function_output_request;
  wire [6:0] cfg_per_function_logic_request;
  wire  [31:0] cfg_interrupt_msi_pending_status;
  wire cfg_interrupt_msi_pending_status_data_enable;
  wire [3:0] cfg_interrupt_msi_pending_status_function_num;
  wire [2:0] cfg_interrupt_msi_attr;
  wire cfg_interrupt_msi_tph_present;
  wire [1:0] cfg_interrupt_msi_tph_type;
  wire [8:0] cfg_interrupt_msi_tph_st_tag;
  wire [7:0] cfg_interrupt_msi_function_number;
  wire [5:0] pf1_lite_ext;
  wire dma_reset;
 wire phy_ready;
  wire phy_ready_async;

  logic  [3:0]                        cfg_flr_done_int;
  logic [3:0]                         cfg_flr_in_process;
  logic [251:0]                       cfg_vf_flr_in_process;
  logic  [7:0]                        cfg_vf_flr_func_num_int;
  logic  [7:0]                        cfg_vf_flr_func_num_int_0;
  logic                               cfg_vf_flr_done_int;
  logic [3:0]                         cfg_flr_in_process_0, cfg_flr_in_process_1;
  logic [251:0]                       cfg_vf_flr_in_process_0, cfg_vf_flr_in_process_1, cfg_vf_flr_in_process_2;
  wire  [7:0]                        cfg_bus_number;
  wire  [3:0]           cfg_tph_requester_enable;
  wire  [251:0]         cfg_vf_tph_requester_enable;
  logic   [255:0]     cfg_mem_space_enable;
  logic   [255:0]     cfg_bus_master_enable;
  wire    [252*2-1:0] cfg_vf_status;

  wire reset_to_dma_n;
//assign m_axi_wuser = {C_M_AXI_DATA_WIDTH/8{1'b0}};

reg [C_M_AXI_DATA_WIDTH/8-1:0]  m_axi_rdataeccparity;
reg [C_M_AXI_DATA_WIDTH/8-1:0]  m_axi_wdataeccparity;
reg [C_M_AXI_DATA_WIDTH/8-1:0]  m_axib_rdataeccparity;
reg [C_M_AXI_DATA_WIDTH/8-1:0]  m_axib_wdataeccparity;

assign m_axi_rdataeccparity = {C_M_AXI_DATA_WIDTH/8{1'b0}};
assign m_axib_rdataeccparity = {C_M_AXI_DATA_WIDTH/8{1'b0}};

  localparam MM_SLAVE_EN_LOCAL    = MM_SLAVE_EN;

  //----------------------------------------------------------------------------------------------------------------//
  wire                          axi_ctl_aclk_sig;
  
// TODO: 1st for bridge mode, axi_ctl_aclk (input) is not taken of yet
generate
  if (AXI_ACLK_LOOPBACK == "TRUE") begin
    assign axi_ctl_aclk_sig = axi_ctl_aclk;
  end else begin
    assign axi_ctl_aclk_sig = user_clk;
  end
endgenerate
generate
  if (DMA_RESET_SOURCE_SEL == 1) begin
    assign dma_reset = ~phy_ready;
  end else if (DMA_RESET_SOURCE_SEL == 2) begin
    assign dma_reset = ~sys_rst_n;
  end else begin
    assign dma_reset = user_reset ;
  end
endgenerate
  // Synchronize AXI CTL Interface Reset
  wire mmcm_lock;
  reg axi_ctl_aresetn_reg;
  assign axi_ctl_aresetn = axi_ctl_aresetn_reg;
  (* ASYNC_REG = "TRUE" *)  reg sys_rst_n_reg;
  (* ASYNC_REG = "TRUE" *)  reg sys_rst_n_reg2;
  always @ (posedge axi_ctl_aclk_sig or negedge sys_rst_n) begin
      if (!sys_rst_n) begin
          sys_rst_n_reg  <= #TCQ 1'b0;
          sys_rst_n_reg2 <= #TCQ 1'b0;
      end else begin
          sys_rst_n_reg  <= #TCQ 1'b1;
          sys_rst_n_reg2 <= #TCQ sys_rst_n_reg;  
      end
  end
  always @ (posedge axi_ctl_aclk_sig) begin
      if (sys_rst_n_reg2)
          axi_ctl_aresetn_reg <= #TCQ 1'b1; 
      else
          axi_ctl_aresetn_reg <= #TCQ 1'b0;
  end
//   logic m_axis_mdma_h2c_last_pkt;
//   assign m_axis_mdma_h2c_last_pkt =0;
 assign cfg_fc_nph_scale = 0;

  assign m_axis_rq_tready_out  = axis_rq_tready;
  assign m_axis_cc_tready_out  = s_axis_cc_tready;
assign aximm_sz =   ((C_S_AXIS_DATA_WIDTH == 256) ? 3'h2 :
            ((C_S_AXIS_DATA_WIDTH == 128) ?  3'h1 :
            ((C_S_AXIS_DATA_WIDTH == 64) ?  3'h0 : 3'h3)));
assign axist_sz = aximm_sz;

assign axi_aresetn =  ~user_reset ;
assign axi_aclk = user_clk;
assign msi_vector_width = cfg_interrupt_msi_mmenable[2:0];
assign msi_enable = cfg_interrupt_msi_enable_int[0];


assign cfg_ext_write_data_dma                         = blk_cfg_ext_write_data;
assign cfg_ext_write_byte_enable_dma                  = blk_cfg_ext_write_byte_enable;
assign cfg_ext_read_received_dma                      = blk_cfg_ext_read_received;
assign cfg_ext_write_received_dma                     = blk_cfg_ext_write_received;
assign cfg_ext_function_number_dma                    = blk_cfg_ext_function_number;
assign cfg_ext_register_number_dma                    = blk_cfg_ext_register_number;
//wire [255:0] cfg2axi_flr_in_progress        = {256'b0};
wire [255:0] cfg2axi_flr_in_progress;
assign  cfg2axi_flr_in_progress        = {cfg_vf_flr_in_process,cfg_flr_in_process};
wire [255:0] cfg2axi_interrupt_msix_enable  = {cfg_interrupt_msix_vf_enable[251:0], cfg_interrupt_msix_enable[3:0]};
wire [255:0] cfg2axi_interrupt_msix_mask    = {cfg_interrupt_msix_vf_mask[251:0]  , cfg_interrupt_msix_mask[3:0]};
wire [255:0] cfg_command_bus_master_enable_int = cfg_bus_master_enable[255:0];
wire [255:0] cfg2axi_mem_space_enable       =  cfg_mem_space_enable[255:0];
wire [255:0] cfg2axi_tph_requester_enable   = {cfg_vf_tph_requester_enable[251:0]  , cfg_tph_requester_enable[3:0]};

//always_comb
//begin
//  for (int i = 0; i < 4; i = i + 1)
//  begin
//        cfg_mem_space_enable[i] = cfg_function_status[4*i + 1];
//        cfg_bus_master_enable[i]    = cfg_function_status[4*i + 2];
//  end
//  for (int i = 0; i < 252; i = i + 1)
//  begin
//        cfg_mem_space_enable[4+i] = cfg_vf_status[2*i + 0];
//        cfg_bus_master_enable[4+i]    = cfg_vf_status[2*i + 1];
//  end
//end

assign cfg_mgmt_addr_int                                     = cfg_mgmt_addr;
assign cfg_mgmt_write_int                                    = cfg_mgmt_write;
assign cfg_mgmt_write_data_int                               = cfg_mgmt_write_data;
assign cfg_mgmt_byte_enable_int                              = cfg_mgmt_byte_enable;
assign cfg_mgmt_read_int                                     = cfg_mgmt_read;
assign cfg_mgmt_type1_cfg_reg_access_int                     = cfg_mgmt_type1_cfg_reg_access;
assign blk_cfg_ext_read_data                                 = cfg_ext_read_data_dma ; //pcie_dma_out_cfg_ext_read_data_valid ? pcie_dma_out_cfg_ext_read_data : cfg_ext_read_data ;
assign blk_cfg_ext_read_data_valid                           = cfg_ext_read_data_valid_dma; //pcie_dma_out_cfg_ext_read_data_valid  || cfg_ext_read_data_valid ;

//always_ff @ (posedge user_clk) begin
//  if (user_reset) begin
//  	{cfg_flr_in_process_1, cfg_flr_in_process_0} <= '0;
//    {cfg_vf_flr_in_process_2, cfg_vf_flr_in_process_1, cfg_vf_flr_in_process_0} <= '0;
//  end
//  else begin
//  	{cfg_flr_in_process_1, cfg_flr_in_process_0} <= {cfg_flr_in_process_0, cfg_flr_in_process};
//    {cfg_vf_flr_in_process_2, cfg_vf_flr_in_process_1, cfg_vf_flr_in_process_0} <= {cfg_vf_flr_in_process_1, cfg_vf_flr_in_process_0, cfg_vf_flr_in_process};
//  end
//end
////-------------------------------------------
//// GTZ: cut pipeline on vf flr 
////-------------------------------------------
////vf flr done & num
//always_ff @ (posedge user_clk) begin
//  if (user_reset) begin
//  	//cfg_flr_done_int <= '0;
//  	cfg_vf_flr_done_int <= '0;
//  	cfg_vf_flr_func_num_int   <= '0;
//  	cfg_vf_flr_func_num_int_0 <= '0;
//  end
//  else begin
//    if (|cfg_vf_flr_in_process_2) // after pipelined, 1 cycle delayed 
//  	  cfg_vf_flr_done_int <= 1'b1;
//    else
//  	  cfg_vf_flr_done_int <= 1'b0;
//
//    // 1st stage pipeline: look first 126
//    if (|cfg_vf_flr_in_process_1[125:0]) 
//      for (int i = 0; i < 126; i++) begin
//        if (cfg_vf_flr_in_process_1[i])
//      		cfg_vf_flr_func_num_int <= i + 3'd4;
//      end
//    else
//    	cfg_vf_flr_func_num_int <= '0;
//
//    // 2nd stage pipeline: look 2nd half
//    if (|cfg_vf_flr_in_process_2[251:126]) 
//      for (int i = 126; i < 252; i++) begin
//        if (cfg_vf_flr_in_process_2[i])
//      		cfg_vf_flr_func_num_int_0 <= i + 3'd4;
//      end
//    else
//    	cfg_vf_flr_func_num_int_0 <= cfg_vf_flr_func_num_int;
//
//  end
//end


// backup
//always_ff @ (posedge user_clk) begin
//  if (user_reset) begin
//  	//cfg_flr_done_int <= '0;
//  	cfg_vf_flr_done_int <= '0;
//  	cfg_vf_flr_func_num_int <= '0;
//  end
//  else begin
//    for (int i = 0; i < 4; i++) begin
//    	//cfg_flr_done_int <= cfg_flr_in_process_1;
//    end
//
//    if (|cfg_vf_flr_in_process_1) 
//  	cfg_vf_flr_done_int <= 1'b1;
//    else
//  	cfg_vf_flr_done_int <= 1'b0;
//
//    if (|cfg_vf_flr_in_process_1) 
//      for (int i = 0; i < 252; i++) begin
//        if (cfg_vf_flr_in_process_1[i])
//      		cfg_vf_flr_func_num_int <= i + 3'd4;
//      end
//    else
//    	cfg_vf_flr_func_num_int <= '0;
//  end
//end


localparam MULTQ_EN_INT = (DMA_MODE_EN == "TRUE") ? 1'b0 : MULTQ_EN;
assign reset_to_dma_n = ~dma_reset & soft_reset_n;



  qdma_no_sriov_pcie4c_ip  pcie4c_ip_i (


    //---------------------------------------------------------------------------------------//
    //  PCI Express (pci_exp) Interface                                                      //
    //---------------------------------------------------------------------------------------//

    // Tx
    .pci_exp_txn                                    ( pci_exp_txn ),
    .pci_exp_txp                                    ( pci_exp_txp ),

    // Rx
    .pci_exp_rxn                                    ( pci_exp_rxn ),
    .pci_exp_rxp                                    ( pci_exp_rxp ),

    .cfg_subsys_vend_id                             ( 16'h10EE ),
    .cfg_dev_id_pf0                                 ( 16'h903F),
    .cfg_vend_id                                    ( 16'h10EE ),
    .cfg_rev_id_pf0                                 ( 16'h00 ),
    .cfg_subsys_id_pf0                              ( 16'h0007  ),
    .cfg_dev_id_pf1                                 ( 16'h913F ),
    .cfg_rev_id_pf1                                 ( 16'h00 ),
    .cfg_subsys_id_pf1                              ( 16'h0007 ),
    //---------------------------------------------------------------------------------------//
    //  AXI Interface                                                                        //
    //---------------------------------------------------------------------------------------//
    .user_clk                                       ( user_clk),
    .user_reset                                     ( user_reset ),
    .user_lnk_up                                    ( user_lnk_up ),
    .phy_rdy_out                                    ( phy_ready ),
    .s_axis_rq_tlast                                ( m_axis_rq_tlast_out ),
    .s_axis_rq_tdata                                ( m_axis_rq_tdata_out ),
    .s_axis_rq_tuser                                ( m_axis_rq_tuser_out ),
    .s_axis_rq_tkeep                                ( m_axis_rq_tkeep_out ),
    .s_axis_rq_tready                               ( axis_rq_tready ),
    .s_axis_rq_tvalid                               ( m_axis_rq_tvalid_out ),

    .m_axis_rc_tdata                                ( s_axis_rc_tdata_out ),
    .m_axis_rc_tuser                                ( s_axis_rc_tuser_out ),
    .m_axis_rc_tlast                                ( s_axis_rc_tlast_out ),
    .m_axis_rc_tkeep                                ( s_axis_rc_tkeep_out ),
    .m_axis_rc_tvalid                               ( s_axis_rc_tvalid_out ),
    .m_axis_rc_tready                               ( s_axis_rc_tready_out ),

    .m_axis_cq_tdata                                ( s_axis_cq_tdata_out ),
    .m_axis_cq_tuser                                ( s_axis_cq_tuser_out ),
    .m_axis_cq_tlast                                ( s_axis_cq_tlast_out ),
    .m_axis_cq_tkeep                                ( s_axis_cq_tkeep_out ),
    .m_axis_cq_tvalid                               ( s_axis_cq_tvalid_out ),
    .m_axis_cq_tready                               ( s_axis_cq_tready_out ),

    .s_axis_cc_tdata                                ( m_axis_cc_tdata_out ),
    .s_axis_cc_tuser                                ( m_axis_cc_tuser_out ),
    .s_axis_cc_tlast                                ( m_axis_cc_tlast_out ),
    .s_axis_cc_tkeep                                ( m_axis_cc_tkeep_out ),
    .s_axis_cc_tvalid                               ( m_axis_cc_tvalid_out ),
    .s_axis_cc_tready                               ( s_axis_cc_tready ),

    .pcie_rq_seq_num0                               ( pcie_rq_seq_num0 ), //N
    .pcie_rq_seq_num_vld0                           ( pcie_rq_seq_num_vld0 ),//N
    .pcie_rq_seq_num1                               ( pcie_rq_seq_num1 ),//N
    .pcie_rq_seq_num_vld1                           ( pcie_rq_seq_num_vld1 ),//N
    .pcie_rq_tag0                                   ( ),//N
    .pcie_rq_tag1                                   ( ),//N
    .pcie_rq_tag_av                                 ( ),
    .pcie_rq_tag_vld0                               ( ),//N
    .pcie_rq_tag_vld1                               ( ),//N

    .pcie_tfc_nph_av                                ( pcie_tfc_nph_av ),
    .pcie_tfc_npd_av                                ( pcie_tfc_npd_av ),
    .pcie_cq_np_req                                 ( pcie_cq_np_req ),
    .pcie_cq_np_req_count                           ( pcie_cq_np_req_count ),

    //---------------------------------------------------------------------------------------//
    //  Configuration (CFG) Interface                                                        //
    //---------------------------------------------------------------------------------------//

    //-------------------------------------------------------------------------------//
    // EP and RP                                                                     //
    //-------------------------------------------------------------------------------//

    .cfg_phy_link_down                              ( cfg_phy_link_down ),
    .cfg_phy_link_status                            ( cfg_phy_link_status ),
    .cfg_negotiated_width                           ( cfg_negotiated_width ),
    .cfg_current_speed                              ( cfg_current_speed ),
    .cfg_max_payload                                ( cfg_max_payload ),
    .cfg_max_read_req                               ( cfg_max_read_req ),
    .cfg_function_status                            ( cfg_function_status ),
    .cfg_function_power_state                       ( cfg_function_power_state ),
    .cfg_vf_status                                  (cfg_vf_status),
    .cfg_vf_power_state                             (),
    .cfg_link_power_state                           ( cfg_link_power_state ),

    // Management Interface
     .cfg_mgmt_read_data           ( cfg_mgmt_read_data ),
     .cfg_mgmt_read_write_done     ( cfg_mgmt_read_write_done ),
     .cfg_mgmt_addr                ( cfg_mgmt_addr_int[9:0] ),
     .cfg_mgmt_write               ( cfg_mgmt_write_int ),
     .cfg_mgmt_write_data          ( cfg_mgmt_write_data_int ),
     .cfg_mgmt_byte_enable         ( cfg_mgmt_byte_enable_int ),
     .cfg_mgmt_read                ( cfg_mgmt_read_int ),
     .cfg_mgmt_debug_access        ( cfg_mgmt_type1_cfg_reg_access_int ),
     .cfg_mgmt_function_number     ( cfg_mgmt_function_number[7:0] ),
 

    // Error Reporting Interface
    .cfg_err_cor_out                                ( cfg_err_cor_out ),
    .cfg_err_nonfatal_out                           ( cfg_err_nonfatal_out ),
    .cfg_err_fatal_out                              ( cfg_err_fatal_out ),
    .cfg_local_error_valid                          ( cfg_local_error_valid  ), //N
    .cfg_local_error_out                            ( cfg_local_error_out ), //N

    .cfg_ltssm_state                                ( cfg_ltssm_state ),
    .cfg_rx_pm_state                                (  ), //N
    .cfg_tx_pm_state                                (  ), //N
    .cfg_rcb_status                                 ( cfg_rcb_status ),
    .cfg_obff_enable                                ( cfg_obff_enable ),
    .cfg_pl_status_change                           ( cfg_pl_status_change ),

    .cfg_msg_received                               ( cfg_msg_received ),
    .cfg_msg_received_data                          ( cfg_msg_received_data ),
    .cfg_msg_received_type                          ( cfg_msg_received_type ),

    .cfg_msg_transmit                               ( cfg_msg_transmit ),
    .cfg_msg_transmit_type                          ( cfg_msg_transmit_type ),
    .cfg_msg_transmit_data                          ( cfg_msg_transmit_data ),
    .cfg_msg_transmit_done                          ( cfg_msg_transmit_done ),

    .cfg_fc_ph                                      ( cfg_fc_ph ),
    .cfg_fc_pd                                      ( cfg_fc_pd ),
    .cfg_fc_nph                                     ( cfg_fc_nph ),
    .cfg_fc_npd                                     ( cfg_fc_npd ),
    .cfg_fc_cplh                                    ( cfg_fc_cplh ),
    .cfg_fc_cpld                                    ( cfg_fc_cpld ),
    .cfg_fc_sel                                     ( cfg_fc_sel ),

 
    .cfg_bus_number                                 ( cfg_bus_number ), //N
    .cfg_dsn                                        ( cfg_dsn ),
    .cfg_power_state_change_ack                     ( cfg_power_state_change_interrupt ),
    .cfg_power_state_change_interrupt               ( cfg_power_state_change_interrupt ),
    .cfg_err_cor_in                                 ( cfg_err_cor_in ),
    .cfg_err_uncor_in                               ( cfg_err_uncor_in ),

    .cfg_link_training_enable                       ( cfg_link_training_enable ),
    .cfg_tph_requester_enable                       ( cfg_tph_requester_enable ),
    .cfg_tph_st_mode                                (),
    .cfg_vf_tph_requester_enable                    (cfg_vf_tph_requester_enable ),
    .cfg_vf_tph_st_mode                             (),
    .cfg_flr_in_process                             (cfg_flr_in_process),
    .cfg_vf_flr_in_process                          (cfg_vf_flr_in_process),
    .cfg_vf_flr_func_num                            (cfg_vf_flr_func_num_int  ), //N
    .cfg_pm_aspm_l1_entry_reject                    ( 1'b0 ), //N
    .cfg_pm_aspm_tx_l0s_entry_disable               ( 1'b0 ), //N
    //-------------------------------------------------------------------------------//
    // EP Only                                                                       //
    //-------------------------------------------------------------------------------//

    // Interrupt Interface Signals
    .cfg_interrupt_int                              ( cfg_interrupt_int[3:0] ),
    .cfg_interrupt_pending                          ( cfg_interrupt_pending ),
    .cfg_interrupt_sent                             ( cfg_interrupt_sent ),
    .cfg_interrupt_msix_data                        ( cfg_interrupt_msix_data),
    .cfg_interrupt_msix_address                     ( cfg_interrupt_msix_address),
    .cfg_interrupt_msix_int                         ( cfg_interrupt_msix_int_int),
    .cfg_interrupt_msix_enable                      ( cfg_interrupt_msix_enable),
    .cfg_interrupt_msix_mask                        ( cfg_interrupt_msix_mask),
    .cfg_interrupt_msix_vf_enable                   ( cfg_interrupt_msix_vf_enable),
    .cfg_interrupt_msix_vf_mask                     ( cfg_interrupt_msix_vf_mask),
    .cfg_interrupt_msix_vec_pending                 (cfg_interrupt_msix_vec_pending),
    .cfg_interrupt_msix_vec_pending_status          (cfg_interrupt_msix_vec_pending_status), 
    .cfg_interrupt_msi_sent                         ( cfg_interrupt_msi_sent ),
    .cfg_interrupt_msi_fail                         ( cfg_interrupt_msi_fail ),
    .cfg_interrupt_msi_function_number              ( cfg_interrupt_msi_function_number ),

     // EP only
    .cfg_flr_done                                   ( cfg_flr_done_int ),  
    .cfg_vf_flr_done                                ( cfg_vf_flr_done_int ),
    .cfg_hot_reset_out                              ( cfg_hot_reset_out ),
    .cfg_config_space_enable                        ( config_space_enable_local ),
    .cfg_req_pm_transition_l23_ready                ( cfg_req_pm_transition_l23_ready ),

    // RP only
    .cfg_hot_reset_in                               ( 1'b0 ),

    .cfg_ds_bus_number                              ( cfg_ds_bus_number ),
    .cfg_ds_device_number                           ( cfg_ds_device_number ),
    .cfg_ds_port_number                             ( cfg_ds_port_number ),




    //--------------------------------------------------------------------------------------//
    //  System(SYS) Interface                                                               //
    //--------------------------------------------------------------------------------------//
    .sys_clk                                  (sys_clk),
    .sys_clk_gt                               (sys_clk_gt),
    .sys_reset                                (sys_rst_n)    // despite of postfix "_n" in its name - this signal can be active high/low depending on GUI selection
  );

   assign common_commands_out = 26'b0;
   assign pipe_tx_0_sigs      = 84'b0;
   assign pipe_tx_1_sigs      = 84'b0;
   assign pipe_tx_2_sigs      = 84'b0;
   assign pipe_tx_3_sigs      = 84'b0;
   assign pipe_tx_4_sigs      = 84'b0;
   assign pipe_tx_5_sigs      = 84'b0;
   assign pipe_tx_6_sigs      = 84'b0;
   assign pipe_tx_7_sigs      = 84'b0;
   assign pipe_tx_8_sigs      = 84'b0;
   assign pipe_tx_9_sigs      = 84'b0;
   assign pipe_tx_10_sigs      = 84'b0;
   assign pipe_tx_11_sigs      = 84'b0;
   assign pipe_tx_12_sigs      = 84'b0;
   assign pipe_tx_13_sigs      = 84'b0;
   assign pipe_tx_14_sigs      = 84'b0;
   assign pipe_tx_15_sigs      = 84'b0;

   //assign m_axib_wuser = {C_M_AXI_DATA_WIDTH/8{1'b0}};

   assign ext_ch_gt_drpclk = 1'b0;
   assign ext_ch_gt_drprdy = {PL_LINK_CAP_MAX_LINK_WIDTH{1'b0}};
   assign ext_ch_gt_drpdo  = {PL_LINK_CAP_MAX_LINK_WIDTH*16{1'b0}};

   assign drp_rdy = 1'b0;
   assign drp_do  = 16'b0;
   assign  blk_cfg_ext_read_received = 1'b0;
   assign  blk_cfg_ext_write_received = 1'b0;
   assign  blk_cfg_ext_register_number = 10'b0;
   assign  blk_cfg_ext_function_number = 8'b0;
   assign  blk_cfg_ext_write_data = 32'b0;
   assign  blk_cfg_ext_write_byte_enable = 4'b0;
   //  Tie-off unused mcap outputs
   assign mcap_design_switch = 1'b1;
   assign cap_req = 1'b0;

   //  Tie-off unused Startup Signals
   assign startup_cfgclk = 1'b0;
   assign startup_cfgmclk = 1'b0;
   assign startup_di = 4'b0000;
   assign startup_eos = 1'b0;
   assign startup_preq = 1'b0;


   
   

wire [12:0]  m_axis_h2c_tuser_qid_temp;
wire [11:0]  axis_c2h_status_qid_temp;
wire [12:0]  tm_dsc_sts_qid_temp;
wire [12:0]  h2c_byp_out_qid_temp;
wire [12:0]  c2h_byp_out_qid_temp;
wire [11:0]  h2c_byp_out_func_temp;
wire [11:0]  c2h_byp_out_func_temp;
wire [2:0]   interrupt_out_temp;


assign m_axis_h2c_tuser_qid = m_axis_h2c_tuser_qid_temp[10:0];
assign axis_c2h_status_qid  = axis_c2h_status_qid_temp[10:0];
assign tm_dsc_sts_qid       = tm_dsc_sts_qid_temp[10:0];
assign h2c_byp_out_qid      = h2c_byp_out_qid_temp[10:0];
assign c2h_byp_out_qid      = c2h_byp_out_qid_temp[10:0];
assign h2c_byp_out_func     = h2c_byp_out_func_temp[7:0];
assign c2h_byp_out_func     = c2h_byp_out_func_temp[7:0];
assign interrupt_out = interrupt_out_temp[0];
assign interrupt_out_msi_vec0to31 = interrupt_out_temp[1];
assign interrupt_out_msi_vec32to63 = interrupt_out_temp[2];


    wire usr_irq_in_vld_qdma;
    wire [10:0] usr_irq_in_vec_qdma;
    wire [7:0] usr_irq_in_fnc_qdma;
    wire usr_irq_out_ack_qdma ;
generate
  if (USR_IRQ_XDMA_TYPE_INTERFACE == "TRUE") begin

    qdma_v4_0_2_dma5_int_shim interrupt_shim_qdma(
    .clk(user_clk),
    .rst(user_reset),
    .usr_irq_req(usr_irq_req_qdma),
    .usr_irq_ack(usr_irq_ack_qdma),
    .usr_irq_in_vld(usr_irq_in_vld_qdma),
    .usr_irq_in_vec(usr_irq_in_vec_qdma),
    .usr_irq_in_fnc(usr_irq_in_fnc_qdma),
    .usr_irq_out_ack(usr_irq_out_ack_qdma),
    .usr_irq_function_number(usr_irq_function_number)
    );
  end else begin
    assign usr_irq_ack_qdma = 16'h0;
    assign usr_irq_in_vld_qdma = usr_irq_in_vld;
    assign usr_irq_in_vec_qdma = usr_irq_in_vec;
    assign usr_irq_in_fnc_qdma = usr_irq_in_fnc;
    assign usr_irq_out_ack = usr_irq_out_ack_qdma;
  end
endgenerate


qdma_v4_0_2_dma5_rtl_top #(
.PL_UPSTREAM_FACING            (PL_UPSTREAM_FACING          ), 
.PL_LINK_CAP_MAX_LINK_WIDTH    (PL_LINK_CAP_MAX_LINK_WIDTH  ), 
.PL_LINK_CAP_MAX_LINK_SPEED    (PL_LINK_CAP_MAX_LINK_SPEED  ), 
.AXI_ADDR_WIDTH                (AXI_ADDR_WIDTH              ), 
.AXI_DATA_WIDTH                (AXI_DATA_WIDTH              ), 
.PF0_INTERRUPT_PIN             (PF0_INTERRUPT_PIN           ), 
.C_COMP_TIMEOUT                (C_COMP_TIMEOUT              ), 
.ULTRASCALE                    (ULTRASCALE                  ), 
.ULTRASCALE_PLUS               (ULTRASCALE_PLUS             ), 
.V7_GEN3                       (V7_GEN3                     ),  
.MSI_ENABLED                   (MSI_ENABLED                 ), 
.XDMA_NUM_USR_IRQ              (XDMA_NUM_USR_IRQ            ), 
.XDMA_RNUM_RIDS                (XDMA_RNUM_RIDS              ), 
.XDMA_WNUM_RIDS                (XDMA_WNUM_RIDS              ), 
.C_M_AXI_ID_WIDTH              (C_M_AXI_ID_WIDTH            ), 
.C_FAMILY                      (C_FAMILY                    ), 
.C_METERING_ON                 (C_METERING_ON               ), 
.C_DBG_EN                      (C_DBG_EN                    ),
.C_DSC_BYP_MODE                (C_DSC_BYP_MODE              ),
.IEP_EN                        (IEP_EN                      ),
.INT_SLV_BRD_R0_ADDR           (C_AXIBAR_0                  ),
.INT_SLV_BRD_R1_ADDR           (C_AXIBAR_1                  ),
.INT_SLV_BRD_R2_ADDR           (C_AXIBAR_2                  ),
.RX_DETECT                     (RX_DETECT                   ), 
.DSC_BYPASS_RD                 (DSC_BYPASS_RD               ), 
.DSC_BYPASS_WR                 (DSC_BYPASS_WR               ), 
.DSC_BYPASS_RD_OUT             (DSC_BYPASS_RD_OUT           ), 
.DSC_BYPASS_WR_OUT             (DSC_BYPASS_WR_OUT           ), 
.DSC_BYPASS_RD_CSR             (DSC_BYPASS_RD_CSR           ), 
.DSC_BYPASS_WR_CSR             (DSC_BYPASS_WR_CSR           ), 
.MSIX_ENABLED                  (MSIX_ENABLED                ), 
.CFG_MGMT_IF                   (CFG_MGMT_IF                 ), 
.C_PCIE_MSG_EN                 ("TRUE"                      ),
.RQ_SEQ_NUM_IGNORE             (RQ_SEQ_NUM_IGNORE           ), 
.CFG_EXT_IF                    (CFG_EXT_IF                  ), 
.LEGACY_CFG_EXT_IF             (LEGACY_CFG_EXT_IF           ), 
.C_DATA_PROT                   (C_PARITY_PROP               ), 
.EN_DEBUG_PORTS                (EN_DEBUG_PORTS              ), 
.VU9P_BOARD                    (VU9P_BOARD                  ), 
.ENABLE_JTAG_DBG               (ENABLE_JTAG_DBG             ), 
.ENABLE_IBERT                  (ENABLE_IBERT                ), 
.MM_SLAVE_EN                   (MM_SLAVE_EN_LOCAL           ), 
.DMA_EN                        (SHELL_BRIDGE ? 0 : DMA_EN   ),
.SHELL_BRIDGE                  (SHELL_BRIDGE                ),
.MSIX_PCIE_INTERNAL            (MSIX_PCIE_INTERNAL          ),
.C_M_AXIB_EN                   (C_M_AXIB_EN                 ),
.C_SOFT_IP_BDF_LOOKUP_EN       (MM_SLAVE_EN_LOCAL ? (C_AXIBAR_NOTRANSLATE == 1 ? 0 : 1) : 0 ),
.BRIDGE_BURST                  (BRIDGE_BURST                ), 
.RQ_RCFG_EN                    (RQ_RCFG_EN                  ), 
.FUNC_MODE                     (FUNC_MODE                   ), 
.PF1_ENABLED                   (PF1_ENABLED                 ), 
.PF2_ENABLED                   (PF2_ENABLED                 ), 
.PF3_ENABLED                   (PF3_ENABLED                 ), 
.C_AXIBAR_NUM                  (C_AXIBAR_NUM                ), 
.C_AXIBAR_0                    (C_AXIBAR_0                  ), 
.C_AXIBAR_HIGHADDR_0           (C_AXIBAR_HIGHADDR_0         ), 
.C_AXIBAR_1                    (C_AXIBAR_1                  ), 
.C_AXIBAR_HIGHADDR_1           (C_AXIBAR_HIGHADDR_1         ), 
.C_AXIBAR_2                    (C_AXIBAR_2                  ), 
.C_AXIBAR_HIGHADDR_2           (C_AXIBAR_HIGHADDR_2         ), 
.C_AXIBAR_3                    (C_AXIBAR_3                  ), 
.C_AXIBAR_HIGHADDR_3           (C_AXIBAR_HIGHADDR_3         ), 
.C_AXIBAR_4                    (C_AXIBAR_4                  ), 
.C_AXIBAR_HIGHADDR_4           (C_AXIBAR_HIGHADDR_4         ), 
.C_AXIBAR_5                    (C_AXIBAR_5                  ), 
.C_AXIBAR_HIGHADDR_5           (C_AXIBAR_HIGHADDR_5         ), 
.C_AXIBAR2PCIEBAR_0            (C_AXIBAR2PCIEBAR_0          ), 
.C_AXIBAR2PCIEBAR_1            (C_AXIBAR2PCIEBAR_1          ), 
.C_AXIBAR2PCIEBAR_2            (C_AXIBAR2PCIEBAR_2          ), 
.C_AXIBAR2PCIEBAR_3            (C_AXIBAR2PCIEBAR_3          ), 
.C_AXIBAR2PCIEBAR_4            (C_AXIBAR2PCIEBAR_4          ), 
.C_AXIBAR2PCIEBAR_5            (C_AXIBAR2PCIEBAR_5          ), 
.EN_AXI_SLAVE_IF               (EN_AXI_SLAVE_IF             ), 
.EN_AXI_MASTER_IF              (EN_AXI_MASTER_IF            ), 
.C_INCLUDE_BAROFFSET_REG       (C_INCLUDE_BAROFFSET_REG     ), 
.C_BASEADDR                    (C_BASEADDR                  ), 
.C_HIGHADDR                    (C_HIGHADDR                  ), 
.C_S_AXI_NUM_READ              (C_S_AXI_NUM_READ            ), 
.C_M_AXI_NUM_READ              (C_M_AXI_NUM_READ            ), 
.C_S_AXI_NUM_WRITE             (C_S_AXI_NUM_WRITE           ), 
.C_M_AXI_NUM_WRITE             (C_M_AXI_NUM_WRITE           ), 
.MSIX_IMPL_EXT                 (MSIX_IMPL_EXT               ), 
.AXI_ACLK_LOOPBACK             (AXI_ACLK_LOOPBACK           ), 
.PL_DISABLE_UPCONFIG_CAPABLE   (PL_DISABLE_UPCONFIG_CAPABLE ), 
.PF0_BAR0_APERTURE_SIZE        (PF0_BAR0_APERTURE_SIZE      ), 
.PF0_BAR1_APERTURE_SIZE        (PF0_BAR1_APERTURE_SIZE      ), 
.PF0_BAR2_APERTURE_SIZE        (PF0_BAR2_APERTURE_SIZE      ), 
.PF0_BAR3_APERTURE_SIZE        (PF0_BAR3_APERTURE_SIZE      ), 
.PF0_BAR4_APERTURE_SIZE        (PF0_BAR4_APERTURE_SIZE      ), 
.PF0_BAR5_APERTURE_SIZE        (PF0_BAR5_APERTURE_SIZE      ), 
.PF0_BAR6_APERTURE_SIZE        (PF0_BAR6_APERTURE_SIZE      ), 
.PF0_BAR0_CONTROL              (PF0_BAR0_CONTROL            ), 
.PF0_BAR1_CONTROL              (PF0_BAR1_CONTROL            ), 
.PF0_BAR2_CONTROL              (PF0_BAR2_CONTROL            ), 
.PF0_BAR3_CONTROL              (PF0_BAR3_CONTROL            ), 
.PF0_BAR4_CONTROL              (PF0_BAR4_CONTROL            ), 
.PF0_BAR5_CONTROL              (PF0_BAR5_CONTROL            ), 
.PF0_BAR6_CONTROL              (PF0_BAR6_CONTROL            ), 
.PF0_SRIOV_BAR0_CONTROL        (PF0_SRIOV_BAR0_CONTROL      ), 
.PF0_SRIOV_BAR1_CONTROL        (PF0_SRIOV_BAR1_CONTROL      ), 
.PF0_SRIOV_BAR2_CONTROL        (PF0_SRIOV_BAR2_CONTROL      ), 
.PF0_SRIOV_BAR3_CONTROL        (PF0_SRIOV_BAR3_CONTROL      ), 
.PF0_SRIOV_BAR4_CONTROL        (PF0_SRIOV_BAR4_CONTROL      ), 
.PF0_SRIOV_BAR5_CONTROL        (PF0_SRIOV_BAR5_CONTROL      ), 
.C_PCIEBAR2AXIBAR_0            (C_PCIEBAR2AXIBAR_0          ), 
.C_PCIEBAR2AXIBAR_1            (C_PCIEBAR2AXIBAR_1          ), 
.C_PCIEBAR2AXIBAR_2            (C_PCIEBAR2AXIBAR_2          ), 
.C_PCIEBAR2AXIBAR_3            (C_PCIEBAR2AXIBAR_3          ), 
.C_PCIEBAR2AXIBAR_4            (C_PCIEBAR2AXIBAR_4          ), 
.C_PCIEBAR2AXIBAR_5            (C_PCIEBAR2AXIBAR_5          ), 
.C_PCIEBAR2AXIBAR_6            (C_PCIEBAR2AXIBAR_6          ), 
.PF0_VF_PCIEBAR2AXIBAR_0       (PF0_VF_PCIEBAR2AXIBAR_0     ),  
.PF0_VF_PCIEBAR2AXIBAR_1       (PF0_VF_PCIEBAR2AXIBAR_1     ),  
.PF0_VF_PCIEBAR2AXIBAR_2       (PF0_VF_PCIEBAR2AXIBAR_2     ),  
.PF0_VF_PCIEBAR2AXIBAR_3       (PF0_VF_PCIEBAR2AXIBAR_3     ),  
.PF0_VF_PCIEBAR2AXIBAR_4       (PF0_VF_PCIEBAR2AXIBAR_4     ),  
.PF0_VF_PCIEBAR2AXIBAR_5       (PF0_VF_PCIEBAR2AXIBAR_5     ),  
.PF0_VF_PCIEBAR2AXIBAR_6       (PF0_VF_PCIEBAR2AXIBAR_6     ),  
.PF1_BAR0_APERTURE_SIZE        (PF1_BAR0_APERTURE_SIZE      ), 
.PF1_BAR1_APERTURE_SIZE        (PF1_BAR1_APERTURE_SIZE      ), 
.PF1_BAR2_APERTURE_SIZE        (PF1_BAR2_APERTURE_SIZE      ), 
.PF1_BAR3_APERTURE_SIZE        (PF1_BAR3_APERTURE_SIZE      ), 
.PF1_BAR4_APERTURE_SIZE        (PF1_BAR4_APERTURE_SIZE      ), 
.PF1_BAR5_APERTURE_SIZE        (PF1_BAR5_APERTURE_SIZE      ), 
.PF1_BAR6_APERTURE_SIZE        (PF1_BAR6_APERTURE_SIZE      ), 
.PF1_BAR0_CONTROL              (PF1_BAR0_CONTROL            ), 
.PF1_BAR1_CONTROL              (PF1_BAR1_CONTROL            ), 
.PF1_BAR2_CONTROL              (PF1_BAR2_CONTROL            ), 
.PF1_BAR3_CONTROL              (PF1_BAR3_CONTROL            ), 
.PF1_BAR4_CONTROL              (PF1_BAR4_CONTROL            ), 
.PF1_BAR5_CONTROL              (PF1_BAR5_CONTROL            ), 
.PF1_BAR6_CONTROL              (PF1_BAR6_CONTROL            ), 
.PF1_SRIOV_BAR0_CONTROL        (PF1_SRIOV_BAR0_CONTROL      ), 
.PF1_SRIOV_BAR1_CONTROL        (PF1_SRIOV_BAR1_CONTROL      ), 
.PF1_SRIOV_BAR2_CONTROL        (PF1_SRIOV_BAR2_CONTROL      ), 
.PF1_SRIOV_BAR3_CONTROL        (PF1_SRIOV_BAR3_CONTROL      ), 
.PF1_SRIOV_BAR4_CONTROL        (PF1_SRIOV_BAR4_CONTROL      ), 
.PF1_SRIOV_BAR5_CONTROL        (PF1_SRIOV_BAR5_CONTROL      ), 
.PF1_PCIEBAR2AXIBAR_0          (PF1_PCIEBAR2AXIBAR_0        ), 
.PF1_PCIEBAR2AXIBAR_1          (PF1_PCIEBAR2AXIBAR_1        ), 
.PF1_PCIEBAR2AXIBAR_2          (PF1_PCIEBAR2AXIBAR_2        ), 
.PF1_PCIEBAR2AXIBAR_3          (PF1_PCIEBAR2AXIBAR_3        ), 
.PF1_PCIEBAR2AXIBAR_4          (PF1_PCIEBAR2AXIBAR_4        ), 
.PF1_PCIEBAR2AXIBAR_5          (PF1_PCIEBAR2AXIBAR_5        ), 
.PF1_PCIEBAR2AXIBAR_6          (PF1_PCIEBAR2AXIBAR_6        ), 
.PF1_VF_PCIEBAR2AXIBAR_0       (PF1_VF_PCIEBAR2AXIBAR_0     ),
.PF1_VF_PCIEBAR2AXIBAR_1       (PF1_VF_PCIEBAR2AXIBAR_1     ),
.PF1_VF_PCIEBAR2AXIBAR_2       (PF1_VF_PCIEBAR2AXIBAR_2     ),
.PF1_VF_PCIEBAR2AXIBAR_3       (PF1_VF_PCIEBAR2AXIBAR_3     ),
.PF1_VF_PCIEBAR2AXIBAR_4       (PF1_VF_PCIEBAR2AXIBAR_4     ),
.PF1_VF_PCIEBAR2AXIBAR_5       (PF1_VF_PCIEBAR2AXIBAR_5     ),
.PF1_VF_PCIEBAR2AXIBAR_6       (PF1_VF_PCIEBAR2AXIBAR_6     ),
.PF2_BAR0_APERTURE_SIZE        (PF2_BAR0_APERTURE_SIZE      ), 
.PF2_BAR1_APERTURE_SIZE        (PF2_BAR1_APERTURE_SIZE      ), 
.PF2_BAR2_APERTURE_SIZE        (PF2_BAR2_APERTURE_SIZE      ), 
.PF2_BAR3_APERTURE_SIZE        (PF2_BAR3_APERTURE_SIZE      ), 
.PF2_BAR4_APERTURE_SIZE        (PF2_BAR4_APERTURE_SIZE      ), 
.PF2_BAR5_APERTURE_SIZE        (PF2_BAR5_APERTURE_SIZE      ), 
.PF2_BAR6_APERTURE_SIZE        (PF2_BAR6_APERTURE_SIZE      ), 
.PF2_BAR0_CONTROL              (PF2_BAR0_CONTROL            ), 
.PF2_BAR1_CONTROL              (PF2_BAR1_CONTROL            ), 
.PF2_BAR2_CONTROL              (PF2_BAR2_CONTROL            ), 
.PF2_BAR3_CONTROL              (PF2_BAR3_CONTROL            ), 
.PF2_BAR4_CONTROL              (PF2_BAR4_CONTROL            ), 
.PF2_BAR5_CONTROL              (PF2_BAR5_CONTROL            ), 
.PF2_BAR6_CONTROL              (PF2_BAR6_CONTROL            ), 
.PF2_SRIOV_BAR0_CONTROL        (PF2_SRIOV_BAR0_CONTROL      ), 
.PF2_SRIOV_BAR1_CONTROL        (PF2_SRIOV_BAR1_CONTROL      ), 
.PF2_SRIOV_BAR2_CONTROL        (PF2_SRIOV_BAR2_CONTROL      ), 
.PF2_SRIOV_BAR3_CONTROL        (PF2_SRIOV_BAR3_CONTROL      ), 
.PF2_SRIOV_BAR4_CONTROL        (PF2_SRIOV_BAR4_CONTROL      ), 
.PF2_SRIOV_BAR5_CONTROL        (PF2_SRIOV_BAR5_CONTROL      ), 
.PF2_PCIEBAR2AXIBAR_0          (PF2_PCIEBAR2AXIBAR_0        ), 
.PF2_PCIEBAR2AXIBAR_1          (PF2_PCIEBAR2AXIBAR_1        ), 
.PF2_PCIEBAR2AXIBAR_2          (PF2_PCIEBAR2AXIBAR_2        ), 
.PF2_PCIEBAR2AXIBAR_3          (PF2_PCIEBAR2AXIBAR_3        ), 
.PF2_PCIEBAR2AXIBAR_4          (PF2_PCIEBAR2AXIBAR_4        ), 
.PF2_PCIEBAR2AXIBAR_5          (PF2_PCIEBAR2AXIBAR_5        ), 
.PF2_PCIEBAR2AXIBAR_6          (PF2_PCIEBAR2AXIBAR_6        ), 
.PF2_VF_PCIEBAR2AXIBAR_0       (PF2_VF_PCIEBAR2AXIBAR_0     ),  
.PF2_VF_PCIEBAR2AXIBAR_1       (PF2_VF_PCIEBAR2AXIBAR_1     ),   
.PF2_VF_PCIEBAR2AXIBAR_2       (PF2_VF_PCIEBAR2AXIBAR_2     ),  
.PF2_VF_PCIEBAR2AXIBAR_3       (PF2_VF_PCIEBAR2AXIBAR_3     ),  
.PF2_VF_PCIEBAR2AXIBAR_4       (PF2_VF_PCIEBAR2AXIBAR_4     ),  
.PF2_VF_PCIEBAR2AXIBAR_5       (PF2_VF_PCIEBAR2AXIBAR_5     ),  
.PF2_VF_PCIEBAR2AXIBAR_6       (PF2_VF_PCIEBAR2AXIBAR_6     ),  
.PF3_BAR0_APERTURE_SIZE        (PF3_BAR0_APERTURE_SIZE      ), 
.PF3_BAR1_APERTURE_SIZE        (PF3_BAR1_APERTURE_SIZE      ), 
.PF3_BAR2_APERTURE_SIZE        (PF3_BAR2_APERTURE_SIZE      ), 
.PF3_BAR3_APERTURE_SIZE        (PF3_BAR3_APERTURE_SIZE      ), 
.PF3_BAR4_APERTURE_SIZE        (PF3_BAR4_APERTURE_SIZE      ), 
.PF3_BAR5_APERTURE_SIZE        (PF3_BAR5_APERTURE_SIZE      ), 
.PF3_BAR6_APERTURE_SIZE        (PF3_BAR6_APERTURE_SIZE      ), 
.PF3_BAR0_CONTROL              (PF3_BAR0_CONTROL            ), 
.PF3_BAR1_CONTROL              (PF3_BAR1_CONTROL            ), 
.PF3_BAR2_CONTROL              (PF3_BAR2_CONTROL            ), 
.PF3_BAR3_CONTROL              (PF3_BAR3_CONTROL            ), 
.PF3_BAR4_CONTROL              (PF3_BAR4_CONTROL            ), 
.PF3_BAR5_CONTROL              (PF3_BAR5_CONTROL            ), 
.PF3_BAR6_CONTROL              (PF3_BAR6_CONTROL            ), 
.PF3_SRIOV_BAR0_CONTROL        (PF3_SRIOV_BAR0_CONTROL      ), 
.PF3_SRIOV_BAR1_CONTROL        (PF3_SRIOV_BAR1_CONTROL      ), 
.PF3_SRIOV_BAR2_CONTROL        (PF3_SRIOV_BAR2_CONTROL      ), 
.PF3_SRIOV_BAR3_CONTROL        (PF3_SRIOV_BAR3_CONTROL      ), 
.PF3_SRIOV_BAR4_CONTROL        (PF3_SRIOV_BAR4_CONTROL      ), 
.PF3_SRIOV_BAR5_CONTROL        (PF3_SRIOV_BAR5_CONTROL      ), 
.PF3_PCIEBAR2AXIBAR_0          (PF3_PCIEBAR2AXIBAR_0        ), 
.PF3_PCIEBAR2AXIBAR_1          (PF3_PCIEBAR2AXIBAR_1        ), 
.PF3_PCIEBAR2AXIBAR_2          (PF3_PCIEBAR2AXIBAR_2        ), 
.PF3_PCIEBAR2AXIBAR_3          (PF3_PCIEBAR2AXIBAR_3        ), 
.PF3_PCIEBAR2AXIBAR_4          (PF3_PCIEBAR2AXIBAR_4        ), 
.PF3_PCIEBAR2AXIBAR_5          (PF3_PCIEBAR2AXIBAR_5        ), 
.PF3_PCIEBAR2AXIBAR_6          (PF3_PCIEBAR2AXIBAR_6        ), 
.PF3_VF_PCIEBAR2AXIBAR_0       (PF3_VF_PCIEBAR2AXIBAR_0     ),  
.PF3_VF_PCIEBAR2AXIBAR_1       (PF3_VF_PCIEBAR2AXIBAR_1     ),  
.PF3_VF_PCIEBAR2AXIBAR_2       (PF3_VF_PCIEBAR2AXIBAR_2     ),  
.PF3_VF_PCIEBAR2AXIBAR_3       (PF3_VF_PCIEBAR2AXIBAR_3     ),  
.PF3_VF_PCIEBAR2AXIBAR_4       (PF3_VF_PCIEBAR2AXIBAR_4     ),  
.PF3_VF_PCIEBAR2AXIBAR_5       (PF3_VF_PCIEBAR2AXIBAR_5     ),  
.PF3_VF_PCIEBAR2AXIBAR_6       (PF3_VF_PCIEBAR2AXIBAR_6     ),  
.PCIEBAR_NUM                   (PCIEBAR_NUM                 ), 
.BARLITE1                      (BARLITE1                    ), 
.BARLITE2                      (BARLITE2                    ), 
.BARLITE_MB_PF0                (BARLITE_MB_PF0              ), 
.BARLITE_MB_PF1                (BARLITE_MB_PF1              ), 
.BARLITE_MB_PF2                (BARLITE_MB_PF2              ), 
.BARLITE_MB_PF3                (BARLITE_MB_PF3              ), 
.C_MSIX_INT_TABLE_EN           (C_MSIX_INT_TABLE_EN         ), 
.VCU118_BOARD                  (VCU118_BOARD                ), 
.TCQ                           (TCQ                         ), 
.C_AXIBAR_AS_0                 (C_AXIBAR_AS_0               ), 
.C_AXIBAR_AS_1                 (C_AXIBAR_AS_1               ), 
.C_AXIBAR_AS_2                 (C_AXIBAR_AS_2               ), 
.C_AXIBAR_AS_3                 (C_AXIBAR_AS_3               ), 
.C_AXIBAR_AS_4                 (C_AXIBAR_AS_4               ), 
.C_AXIBAR_AS_5                 (C_AXIBAR_AS_5               ), 
.C_MSI_ENABLED                 (C_MSI_ENABLED               ), 
.C_NUM_DSC_PCIE_RID            (C_NUM_DSC_PCIE_RID          ), 
.C_NUM_PCIE_DSC_CPL_DID        (C_NUM_PCIE_DSC_CPL_DID      ), 
.C_NUM_AXI_DSC_CPL_DID         (C_NUM_AXI_DSC_CPL_DID       ), 
.MULTQ_CHNL                    (MULTQ_CHNL                  ), 
.IMPL_TARGET                   (IMPL_TARGET                 ), 
.C_M_AXI_DATA_WIDTH            (C_M_AXI_DATA_WIDTH          ), 
.C_M_AXI_WUSER_WIDTH           (C_M_AXI_WUSER_WIDTH         ),
.C_M_AXI_BUSER_WIDTH           (C_M_AXI_BUSER_WIDTH         ), 
.C_M_AXI_RUSER_WIDTH           (C_M_AXI_RUSER_WIDTH         ), 
.USE_ATTR                      (USE_ATTR                    ),  
.C_H2C_TUSER_WIDTH             (C_H2C_TUSER_WIDTH           ), 
.C_H2C_DATA_WIDTH              (C_H2C_DATA_WIDTH            ), 
.C_C2H_DATA_WIDTH              (C_C2H_DATA_WIDTH            ), 
.C_C2H_CTRL_WIDTH              (C_C2H_CTRL_WIDTH            ), 
.C_C2H_TUSER_WIDTH             (C_C2H_TUSER_WIDTH           ), 
.C_AXIBAR_REGIONEN             (C_AXIBAR_REGIONEN           ), 
.C_AXIBAR_NOXLATE              (C_AXIBAR_NOXLATE            ), 
.C_AXIBAR2PCIEATTR_0           (C_AXIBAR2PCIEATTR_0         ), 
.C_AXIBAR2PCIEATTR_1           (C_AXIBAR2PCIEATTR_1         ), 
.C_AXIBAR2PCIEATTR_2           (C_AXIBAR2PCIEATTR_2         ), 
.C_AXIBAR2PCIEATTR_3           (C_AXIBAR2PCIEATTR_3         ), 
.C_AXIBAR2PCIEATTR_4           (C_AXIBAR2PCIEATTR_4         ), 
.C_AXIBAR2PCIEATTR_5           (C_AXIBAR2PCIEATTR_5         ),   
.C_IGNORE_SIZE_AXI_SLAVE       (C_IGNORE_SIZE_AXI_SLAVE     ), 
.C_TIMEOUT0_SEL                (C_TIMEOUT0_SEL              ), 
.C_TIMEOUT1_SEL                (C_TIMEOUT1_SEL              ), 
.C_TIMEOUT_MULT                (C_TIMEOUT_MULT              ), 
.C_OLD_BRIDGE_TIMEOUT          (C_OLD_BRIDGE_TIMEOUT        ), 
.C_M_AXI_AXCACHE_EN            (0),
.C_LAST_CORE_CAP_ADDR          (C_LAST_CORE_CAP_ADDR        ), 
.C_VSEC_CAP_ADDR               (C_VSEC_CAP_ADDR             ), 
.C_VSEC_CAP_LAST               (C_VSEC_CAP_LAST             ), 
.C_VSEC_ID                     (C_VSEC_ID                   ), 
.C_NUM_USER_INTR               (C_NUM_USER_INTR             ), 
.C_NUM_USER_NEW_INTR           (C_NUM_USER_NEW_INTR         ), 
.C_USER_PTR                    (C_USER_PTR                  ), 
.C_S_AXI_SUPPORTS_NARROW_BURST (C_S_AXI_SUPPORTS_NARROW_BURST), 
.C_S_AXI_ID_WIDTH              (C_S_AXI_ID_WIDTH            ), 
.C_S_AXI_ADDR_WIDTH            (C_S_AXI_ADDR_WIDTH          ), 
.C_S_AXI_DATA_WIDTH            (C_S_AXI_DATA_WIDTH          ), 
.C_M_AXI_ADDR_WIDTH            (C_M_AXI_ADDR_WIDTH          ), 
.C_S_AXIS_DATA_WIDTH           (C_S_AXIS_DATA_WIDTH         ), 
.C_M_AXIS_DATA_WIDTH           (C_M_AXIS_DATA_WIDTH         ), 
.C_M_AXIS_RQ_USER_WIDTH        (C_M_AXIS_RQ_USER_WIDTH      ), 
.C_S_AXIS_CQP_USER_WIDTH       (C_S_AXIS_CQP_USER_WIDTH     ), 
.C_S_AXIS_CQ_USER_WIDTH        (C_S_AXIS_CQ_USER_WIDTH      ), 
.C_M_AXIS_RC_USER_WIDTH        (C_M_AXIS_RC_USER_WIDTH      ), 
.C_S_AXIS_CC_USER_WIDTH        (C_S_AXIS_CC_USER_WIDTH      ), 
.C_M_AXIL_AWUSER_WIDTH         (C_M_AXIL_AWUSER_WIDTH       ), 
.C_M_AXIL_ARUSER_WIDTH         (C_M_AXIL_ARUSER_WIDTH       ), 
.C_M_AXI_AWUSER_WIDTH          (C_M_AXI_AWUSER_WIDTH        ), 
.C_M_AXI_ARUSER_WIDTH          (C_M_AXI_ARUSER_WIDTH        ), 
.C_M_AXIB_ARUSER_WIDTH         (C_M_AXIB_ARUSER_WIDTH       ), 
.C_M_AXIB_AWUSER_WIDTH         (C_M_AXIB_AWUSER_WIDTH       ), 
.C_S_KEEP_WIDTH                (C_S_KEEP_WIDTH              ), 
.C_M_KEEP_WIDTH                (C_M_KEEP_WIDTH              ), 
.C_KEEP_WIDTH                  (C_KEEP_WIDTH                ), 
.C_S_AXIS_USER_WIDTH           (C_S_AXIS_USER_WIDTH         ), 
.C_M_AXIS_USER_WIDTH           (C_M_AXIS_USER_WIDTH         ), 
.C_ADDR_ALGN                   (C_ADDR_ALGN                 ), 
.C_ECC_ENABLE                  (C_ECC_ENABLE                ), 
.C_DSC_MAGIC_EN                (C_DSC_MAGIC_EN              ), 
.C_NUMQ_PER_CHNL               (C_NUMQ_PER_CHNL             ), 
.C_RD_BUFFER_ADDR_SIZE         (C_RD_BUFFER_ADDR_SIZE       ), 
.C_RD_BUFFER_SIZE_BITS         (C_RD_BUFFER_SIZE_BITS       ), 
.C_PCIEBAR_NUM                 (C_PCIEBAR_NUM               ), 
.C_PCIEBAR_AS                  (C_PCIEBAR_AS                ), 
.C_NUM_MSIX_VECTORS            (C_NUM_MSIX_VECTORS          ), 
.DMA_SP                        (DMA_SP                      ), 
.DMA_MM                        (DMA_MM                      ), 
.DMA_ST                        (DMA_ST                      ), 
//.DMA_COMPLETION                (DMA_COMPLETION              ),
.DMA_RESET_SOURCE_SEL          (DMA_RESET_SOURCE_SEL        ), 
.C_ADDR_BITS                   (C_ADDR_BITS                 ), 
.STS_WIDTH                     (STS_WIDTH                   ), 
.BACKPRESSURE                  (BACKPRESSURE                ), 
.USR_MPL_SIZE                  (USR_MPL_SIZE                ), 
.USR_MRS_SIZE                  (USR_MRS_SIZE                ), 
.PMON_EN                       (PMON_EN                     ), 
.C_MDMA_DSC_IN_NUM_CHNL        (C_MDMA_DSC_IN_NUM_CHNL      ), 
.MULT_PF_DES                   (MULT_PF_DES                 ), 
.SPLIT_DMA                     (SPLIT_DMA                   ), 
.PIPE_LINE_STAGE               (PIPE_LINE_STAGE             ), 
.VU9P_TUL_EX                   (VU9P_TUL_EX                 ), 
.PCIE_BLK_TYPE                 (PCIE_BLK_TYPE               ), 
.GEN4_EIEOS_0S7                (GEN4_EIEOS_0S7              ), 
.CCIX_ENABLE                   (CCIX_ENABLE                 ), 
.CCIX_DVSEC	               (CCIX_DVSEC	            ),  
.ENABLE_ATS_SWITCH             (ENABLE_ATS_SWITCH           ), 
.CDC_WB_EN                     (CDC_WB_EN                   ), 
.AXIS_CCIX_RX_TDATA_WIDTH      (AXIS_CCIX_RX_TDATA_WIDTH    ), 
.AXIS_CCIX_TX_TDATA_WIDTH      (AXIS_CCIX_TX_TDATA_WIDTH    ), 
.AXIS_CCIX_RX_TUSER_WIDTH      (AXIS_CCIX_RX_TUSER_WIDTH    ), 
.AXIS_CCIX_TX_TUSER_WIDTH      (AXIS_CCIX_TX_TUSER_WIDTH    ), 
.C_ATS_DATA_WIDTH              (C_ATS_DATA_WIDTH            ), 
.C_ATS_CQ_TUSER_WIDTH          (C_ATS_CQ_TUSER_WIDTH        ), 
.C_ATS_CC_TUSER_WIDTH          (C_ATS_CC_TUSER_WIDTH        ), 
.C_ATS_RQ_TUSER_WIDTH          (C_ATS_RQ_TUSER_WIDTH        ), 
.C_ATS_RC_TUSER_WIDTH          (C_ATS_RC_TUSER_WIDTH        ), 
.EXT_SYS_CLK_BUFG              (EXT_SYS_CLK_BUFG            ), 
.GTCOM_IN_CORE                 (GTCOM_IN_CORE               ), 
.C_NUM_OF_SC                   (C_NUM_OF_SC                 ), 
.USR_IRQ_EXDES                 (USR_IRQ_EXDES               ), 
.AXI_VIP_IN_EXDES              (AXI_VIP_IN_EXDES            ), 
.ACS_EXT_CAP_ENABLE            (ACS_EXT_CAP_ENABLE          ), 
.EXT_XVC_VSEC_ENABLE           (EXT_XVC_VSEC_ENABLE         ), 
.EN_PCIE_DEBUG_PORTS           (EN_PCIE_DEBUG_PORTS         ), 
.C_MAX_NUM_QUEUE               (C_MAX_NUM_QUEUE             ), 
.DMA_MODE_EN                   (DMA_MODE_EN                 ), 
.MULTQ_EN                      (MULTQ_EN                    ), 
.C_PCIE_PFS_SUPPORTED          (C_PCIE_PFS_SUPPORTED        ), 
.C_SRIOV_EN                    (C_SRIOV_EN                  ), 
.BARLITE_EXT_PF0               (BARLITE_EXT_PF0             ), 
.BARLITE_EXT_PF1               (BARLITE_EXT_PF1             ), 
.BARLITE_EXT_PF2               (BARLITE_EXT_PF2             ), 
.BARLITE_EXT_PF3               (BARLITE_EXT_PF3             ), 
.BARLITE_INT_PF0               (BARLITE_INT_PF0             ), 
.BARLITE_INT_PF1               (BARLITE_INT_PF1             ), 
.BARLITE_INT_PF2               (BARLITE_INT_PF2             ), 
.BARLITE_INT_PF3               (BARLITE_INT_PF3             ), 
.BARLITE_MSIX_PF0              (BARLITE_MSIX_PF0            ), 
.BARLITE_MSIX_PF1              (BARLITE_MSIX_PF1            ), 
.BARLITE_MSIX_PF2              (BARLITE_MSIX_PF2            ), 
.BARLITE_MSIX_PF3              (BARLITE_MSIX_PF3            ), 
.NUM_VFS_PF0                   (NUM_VFS_PF0                 ), 
.NUM_VFS_PF1                   (NUM_VFS_PF1                 ), 
.NUM_VFS_PF2                   (NUM_VFS_PF2                 ), 
.NUM_VFS_PF3                   (NUM_VFS_PF3                 ), 
.FIRSTVF_OFFSET_PF0            (FIRSTVF_OFFSET_PF0          ), 
.FIRSTVF_OFFSET_PF1            (FIRSTVF_OFFSET_PF1          ), 
.FIRSTVF_OFFSET_PF2            (FIRSTVF_OFFSET_PF2          ), 
.FIRSTVF_OFFSET_PF3            (FIRSTVF_OFFSET_PF3          ), 
.VF_BARLITE_EXT_PF0            (VF_BARLITE_EXT_PF0          ), 
.VF_BARLITE_EXT_PF1            (VF_BARLITE_EXT_PF1          ), 
.VF_BARLITE_EXT_PF2            (VF_BARLITE_EXT_PF2          ), 
.VF_BARLITE_EXT_PF3            (VF_BARLITE_EXT_PF3          ), 
.VF_BARLITE_INT_PF0            (VF_BARLITE_INT_PF0          ), 
.VF_BARLITE_INT_PF1            (VF_BARLITE_INT_PF1          ), 
.VF_BARLITE_INT_PF2            (VF_BARLITE_INT_PF2          ), 
.VF_BARLITE_INT_PF3            (VF_BARLITE_INT_PF3          ), 
.C_C2H_NUM_CHNL                (C_C2H_NUM_CHNL              ), 
.C_H2C_NUM_CHNL                (C_H2C_NUM_CHNL              ), 
.AXISTEN_IF_ENABLE_MSG_ROUTE   (AXISTEN_IF_ENABLE_MSG_ROUTE ),
.ENABLE_MORE                   (ENABLE_MORE                 ),
.DISABLE_BRAM_PIPELINE         (DISABLE_BRAM_PIPELINE       ),
.DISABLE_EQ_SYNCHRONIZER       (DISABLE_EQ_SYNCHRONIZER     ),
.C_ENABLE_RESOURCE_REDUCTION   (C_ENABLE_RESOURCE_REDUCTION ),
.C_ATS_ENABLE                  (C_ATS_ENABLE                ),
.C_PRI_ENABLE                  (C_PRI_ENABLE                ),
.C_FF_ON_INT_IF                (C_FF_ON_INT_IF              ),
.C_ATS_OFFSET                  (C_ATS_OFFSET                ),
.C_PR_OFFSET                   (C_PR_OFFSET                 ),
.C_ATS_CAP_NEXTPTR             (C_ATS_CAP_NEXTPTR           ),
.C_PR_CAP_NEXTPTR              (C_PR_CAP_NEXTPTR            ),
.C_INV_QUEUE_DEPTH             (C_INV_QUEUE_DEPTH           ),
.PF0_VF_BAR0_APERTURE_SIZE     (PF0_VF_BAR0_APERTURE_SIZE   ),
.PF0_VF_BAR1_APERTURE_SIZE     (PF0_VF_BAR1_APERTURE_SIZE   ),
.PF0_VF_BAR2_APERTURE_SIZE     (PF0_VF_BAR2_APERTURE_SIZE   ),
.PF0_VF_BAR3_APERTURE_SIZE     (PF0_VF_BAR3_APERTURE_SIZE   ),
.PF0_VF_BAR4_APERTURE_SIZE     (PF0_VF_BAR4_APERTURE_SIZE   ),
.PF0_VF_BAR5_APERTURE_SIZE     (PF0_VF_BAR5_APERTURE_SIZE   ),
.PF0_VF_BAR6_APERTURE_SIZE     (PF0_VF_BAR6_APERTURE_SIZE   ),
.PF1_VF_BAR0_APERTURE_SIZE     (PF1_VF_BAR0_APERTURE_SIZE   ),
.PF1_VF_BAR1_APERTURE_SIZE     (PF1_VF_BAR1_APERTURE_SIZE   ),
.PF1_VF_BAR2_APERTURE_SIZE     (PF1_VF_BAR2_APERTURE_SIZE   ),
.PF1_VF_BAR3_APERTURE_SIZE     (PF1_VF_BAR3_APERTURE_SIZE   ),
.PF1_VF_BAR4_APERTURE_SIZE     (PF1_VF_BAR4_APERTURE_SIZE   ),
.PF1_VF_BAR5_APERTURE_SIZE     (PF1_VF_BAR5_APERTURE_SIZE   ),
.PF1_VF_BAR6_APERTURE_SIZE     (PF1_VF_BAR6_APERTURE_SIZE   ),
.PF2_VF_BAR0_APERTURE_SIZE     (PF2_VF_BAR0_APERTURE_SIZE   ),
.PF2_VF_BAR1_APERTURE_SIZE     (PF2_VF_BAR1_APERTURE_SIZE   ),
.PF2_VF_BAR2_APERTURE_SIZE     (PF2_VF_BAR2_APERTURE_SIZE   ),
.PF2_VF_BAR3_APERTURE_SIZE     (PF2_VF_BAR3_APERTURE_SIZE   ),
.PF2_VF_BAR4_APERTURE_SIZE     (PF2_VF_BAR4_APERTURE_SIZE   ),
.PF2_VF_BAR5_APERTURE_SIZE     (PF2_VF_BAR5_APERTURE_SIZE   ),
.PF2_VF_BAR6_APERTURE_SIZE     (PF2_VF_BAR6_APERTURE_SIZE   ),
.PF3_VF_BAR0_APERTURE_SIZE     (PF3_VF_BAR0_APERTURE_SIZE   ),
.PF3_VF_BAR1_APERTURE_SIZE     (PF3_VF_BAR1_APERTURE_SIZE   ),
.PF3_VF_BAR2_APERTURE_SIZE     (PF3_VF_BAR2_APERTURE_SIZE   ),
.PF3_VF_BAR3_APERTURE_SIZE     (PF3_VF_BAR3_APERTURE_SIZE   ),
.PF3_VF_BAR4_APERTURE_SIZE     (PF3_VF_BAR4_APERTURE_SIZE   ),
.PF3_VF_BAR5_APERTURE_SIZE     (PF3_VF_BAR5_APERTURE_SIZE   ),
.PF3_VF_BAR6_APERTURE_SIZE     (PF3_VF_BAR6_APERTURE_SIZE   ),
.PF0_ADDR_MASK                 (PF0_ADDR_MASK               ),
.PF1_ADDR_MASK                 (PF1_ADDR_MASK               ),
.PF2_ADDR_MASK                 (PF2_ADDR_MASK               ),
.PF3_ADDR_MASK                 (PF3_ADDR_MASK               ),
.PF0_VF_ADDR_MASK              (PF0_VF_ADDR_MASK            ),
.PF1_VF_ADDR_MASK              (PF1_VF_ADDR_MASK            ),
.PF2_VF_ADDR_MASK              (PF2_VF_ADDR_MASK            ),
.PF3_VF_ADDR_MASK              (PF3_VF_ADDR_MASK            ),
.C_FLR_EN                      (FLR_ENABLE                  ),
.CSR_MODULE                    (CSR_MODULE                  ),
.C_MBX_EN                      (MAILBOX_ENABLE              ),
.CFG_SPACE_ENABLE              (CFG_SPACE_ENABLE            ),
.DSC_SZ_64_EN                  (1'b1                        ),
.C_OST_PR_CAP                  (C_OST_PR_CAP                ),
.C_WRB_COAL_MAX_BUF            (WRB_COAL_MAX_BUF            ),
.C_MDMA_PFCH_CACHE_DEPTH       (MDMA_PFCH_CACHE_DEPTH       ),
.WRB_COAL_LOOP_FIX_DISABLE     (WRB_COAL_LOOP_FIX_DISABLE   ),
.ENABLE_AT_PORTS               (ENABLE_AT_PORTS             ),
.USER_INT_VECT_W               (USER_INT_VECT_W),
.CMP_COL_REG_0                 (CMP_COL_REG_0),
.CMP_COL_REG_1                 (CMP_COL_REG_1),
.CMP_COL_REG_2                 (CMP_COL_REG_2),
.CMP_COL_REG_3                 (CMP_COL_REG_3),
.CMP_COL_REG_4                 (CMP_COL_REG_4),
.CMP_COL_REG_5                 (CMP_COL_REG_5),
.CMP_COL_REG_6                 (CMP_COL_REG_6),
.CMP_ERR_REG_0                 (CMP_ERR_REG_0),
.CMP_ERR_REG_1                 (CMP_ERR_REG_1),
.CMP_ERR_REG_2                 (CMP_ERR_REG_2),
.CMP_ERR_REG_3                 (CMP_ERR_REG_3),
.CMP_ERR_REG_4                 (CMP_ERR_REG_4),
.CMP_ERR_REG_5                 (CMP_ERR_REG_5),
.CMP_ERR_REG_6                 (CMP_ERR_REG_6),
.ARI_CAP_ENABLE (ARI_CAP_ENABLE),
.AXISTEN_IF_MSIX_RX_PARITY_EN (AXISTEN_IF_MSIX_RX_PARITY_EN),
.AXISTEN_IF_MSIX_TO_RAM_PIPELINE (AXISTEN_IF_MSIX_TO_RAM_PIPELINE),
.AXISTEN_IF_MSIX_FROM_RAM_PIPELINE (AXISTEN_IF_MSIX_FROM_RAM_PIPELINE),

.PF0_MSIX_CAP_TABLE_OFFSET(PF0_MSIX_CAP_TABLE_OFFSET),
.PF1_MSIX_CAP_TABLE_OFFSET (PF1_MSIX_CAP_TABLE_OFFSET),
.PF2_MSIX_CAP_TABLE_OFFSET (PF2_MSIX_CAP_TABLE_OFFSET),
.PF3_MSIX_CAP_TABLE_OFFSET (PF3_MSIX_CAP_TABLE_OFFSET),

.VFG0_MSIX_CAP_TABLE_OFFSET (VFG0_MSIX_CAP_TABLE_OFFSET),
.VFG1_MSIX_CAP_TABLE_OFFSET (VFG1_MSIX_CAP_TABLE_OFFSET),
.VFG2_MSIX_CAP_TABLE_OFFSET (VFG2_MSIX_CAP_TABLE_OFFSET),
.VFG3_MSIX_CAP_TABLE_OFFSET (VFG3_MSIX_CAP_TABLE_OFFSET),

.AXISTEN_IF_ENABLE_INTERNAL_MSIX_TABLE(MSIX_IMPL_EXT),

.PF0_MSIX_CAP_TABLE_SIZE(PF0_MSIX_CAP_TABLE_SIZE),
.PF1_MSIX_CAP_TABLE_SIZE(PF1_MSIX_CAP_TABLE_SIZE),
.PF2_MSIX_CAP_TABLE_SIZE(PF2_MSIX_CAP_TABLE_SIZE),
.PF3_MSIX_CAP_TABLE_SIZE(PF3_MSIX_CAP_TABLE_SIZE),
.VFG0_MSIX_CAP_TABLE_SIZE(VFG0_MSIX_CAP_TABLE_SIZE),
.VFG1_MSIX_CAP_TABLE_SIZE(VFG1_MSIX_CAP_TABLE_SIZE),
.VFG2_MSIX_CAP_TABLE_SIZE(VFG2_MSIX_CAP_TABLE_SIZE),
.VFG3_MSIX_CAP_TABLE_SIZE(VFG3_MSIX_CAP_TABLE_SIZE),
.PF0_MSIX_VECTORS         (PF0_MSIX_VECTORS),
.PF1_MSIX_VECTORS         (PF1_MSIX_VECTORS),
.PF2_MSIX_VECTORS         (PF2_MSIX_VECTORS),
.PF3_MSIX_VECTORS         (PF3_MSIX_VECTORS),
.TL_PF_ENABLE_REG         (C_PCIE_PFS_SUPPORTED - 1),
.C_VIRTIO_EN              (VIRTIO_EN),
.C_MHOST_EN               (MHOST_EN),
.C_ECAM_EN                (VDM_EN),
.C_VAR_DESC_EN            ("FALSE"),
.SOFT_NIC                 (SOFT_NIC),
.SOFT_NIC_BRIDGE          (SOFT_NIC_BRIDGE),
.ADV_INT_USR              (ADV_INT_USR),
.ALF_CAP_ENABLE           (ALF_CAP_ENABLE),
.ASYNC_CLK_ENABLE         (ASYNC_CLK_ENABLE),
.C_MAX_CMPT_SIZE          (C_MAX_CMPT_SIZE_LOCAL),
.ALF_CAP_NEXTPTR          (CFG_EXT_IF == "TRUE"? 'hEA0 : 'h0),
.ENABLE_ERROR_INJECTION(ENABLE_ERROR_INJECTION)

  ) rtl_wrapper_inst (
    .user_clk								        ((ASYNC_CLK_ENABLE == "FALSE")? user_clk : user_clk_async),
    .user_lnk_up								(user_lnk_up),
    .user_reset									((ASYNC_CLK_ENABLE == "FALSE") ? user_reset: rst_async_synchronized),
    .dma_reset									(dma_reset),
    .rst_dma_synchronized                                                       (rst_async_synchronized   ),
    .program_done                                                               (csr_prog_done),
    .user_clk_pcie                                                              (user_clk               ),
    .user_reset_pcie                                                            (user_reset             ),
    .phy_ready_pcie                                                             (phy_ready              ),
    .phy_ready_dma                                                              (phy_ready_async          ),
    .single_bit_err_inject_reg                                                  (single_bit_err_inject_reg),
    .double_bit_err_inject_reg                                                  (double_bit_err_inject_reg),
    .sys_rst_n                                                                  (sys_rst_n              ),
    .config_space_enable                                                        (config_space_enable_rtl),
    .usr_irq_req                                                                (usr_irq_req            ),
    .usr_irq_ack                                                                (usr_irq_ack            ),
    .usr_irq_in_vld                                                             (usr_irq_in_vld_qdma    ),
    .usr_irq_in_vec                                                             (usr_irq_in_vec_qdma    ),
    .usr_irq_in_fnc                                                             (usr_irq_in_fnc_qdma    ),
    .usr_irq_in_host_id                                                         (usr_irq_in_host_id     ),
    .usr_irq_out_ack                                                            (usr_irq_out_ack_qdma   ),
    .usr_irq_out_fail                                                           (usr_irq_out_fail       ),
    .rbar_bar_size                                                              ( 6'h0 ),
    .rbar_function_number                                                       ( 8'h0 ),
    .rbar_write_enable_bar0                                                     ( 1'b0 ),
    .rbar_write_enable_bar1                                                     ( 1'b0 ),
    .rbar_write_enable_bar2                                                     ( 1'b0 ),
    .rbar_write_enable_bar3                                                     ( 1'b0 ),
    .rbar_write_enable_bar4                                                     ( 1'b0 ),
    .rbar_write_enable_bar5                                                     ( 1'b0 ),
    .usr_flr_fnc                                                                (usr_flr_fnc            ),
    .usr_flr_done_fnc                                                           (usr_flr_done_fnc       ),
    .usr_flr_set                                                                (usr_flr_set            ),
    .usr_flr_clr                                                                (usr_flr_clr            ),
    .usr_flr_done_vld                                                           (usr_flr_done_vld       ),
    .st_rx_msg_rdy                                                             (st_rx_msg_rdy        ),
    .st_rx_msg_valid                                                           (st_rx_msg_valid      ),
    .st_rx_msg_last                                                            (st_rx_msg_last       ),
    .st_rx_msg_error                                                           (st_rx_msg_error      ),
    .st_rx_msg_data                                                            (st_rx_msg_data       ),
    .h2c_byp_out_dsc                                                           (h2c_byp_out_dsc      ),
    .h2c_byp_out_mm_chn                                                        (h2c_byp_out_mm_chn   ),
    .h2c_byp_out_st_mm                                                         (h2c_byp_out_st_mm    ),
    .h2c_byp_out_dsc_sz                                                        (h2c_byp_out_dsc_sz   ),
    .h2c_byp_out_qid                                                           (h2c_byp_out_qid_temp ),
    .h2c_byp_out_func                                                          (h2c_byp_out_func_temp),
    .h2c_byp_out_error                                                         (h2c_byp_out_error    ),
    .h2c_byp_out_cidx                                                          (h2c_byp_out_cidx     ),
    .h2c_byp_out_port_id                                                       (h2c_byp_out_port_id  ),
    .h2c_byp_out_vld                                                           (h2c_byp_out_vld      ),
    .h2c_byp_out_rdy                                                           (h2c_byp_out_rdy      ),
    .h2c_byp_out_fmt                                                           (h2c_byp_out_fmt      ),
    .h2c_byp_out_cnt                                                           (h2c_byp_out_cnt      ),
    .h2c_byp_out_host_id                                                       (h2c_byp_out_host_id  ),
    .h2c_byp_out_pasid_en                                                      (h2c_byp_out_pasid_en ),
    .h2c_byp_out_pasid                                                         (h2c_byp_out_pasid    ),
    .h2c_byp_out_end_rng                                                       (h2c_byp_out_end_rng  ),

    .c2h_byp_out_dsc                                                           (c2h_byp_out_dsc      ),
    .c2h_byp_out_st_mm                                                         (c2h_byp_out_st_mm    ),
    .c2h_byp_out_qid                                                           (c2h_byp_out_qid_temp ),
    .c2h_byp_out_func                                                          (c2h_byp_out_func_temp),

    .c2h_byp_out_dsc_sz                                                        (c2h_byp_out_dsc_sz   ),
    .c2h_byp_out_error                                                         (c2h_byp_out_error    ),
    .c2h_byp_out_cidx                                                          (c2h_byp_out_cidx     ),
    .c2h_byp_out_port_id                                                       (c2h_byp_out_port_id  ),
    .c2h_byp_out_mm_chn                                                        (c2h_byp_out_mm_chn   ),
//    .c2h_byp_out_last                                                          (c2h_byp_out_last     ),
    .c2h_byp_out_vld                                                           (c2h_byp_out_vld      ),
    .c2h_byp_out_rdy                                                           (c2h_byp_out_rdy      ),
    .c2h_byp_out_fmt                                                           (c2h_byp_out_fmt      ),
    .c2h_byp_out_cnt                                                           (c2h_byp_out_cnt      ),
    .c2h_byp_out_host_id                                                       (c2h_byp_out_host_id  ),
    .c2h_byp_out_pasid_en                                                      (c2h_byp_out_pasid_en ),
    .c2h_byp_out_pasid                                                         (c2h_byp_out_pasid    ),
    .c2h_byp_out_var_desc                                                      (c2h_byp_out_var_desc ),
    .c2h_byp_out_pfch_tag                                                      (c2h_byp_out_pfch_tag ),
    .c2h_byp_out_desc_chain                                                    (c2h_byp_out_desc_chain),
    .c2h_byp_out_end_rng                                                       (c2h_byp_out_end_rng  ),

    .c2h_byp_in_mm_radr                                                        (c2h_byp_in_mm_radr   ),
    .c2h_byp_in_mm_wadr                                                        (c2h_byp_in_mm_wadr   ),
    .c2h_byp_in_mm_len                                                         (c2h_byp_in_mm_len    ),
    .c2h_byp_in_mm_mrkr_req                                                    (c2h_byp_in_mm_mrkr_req ),
    .c2h_byp_in_mm_err2ctxt                                                    (c2h_byp_in_mm_err2ctxt),
    .c2h_byp_in_mm_port_id                                                     (c2h_byp_in_mm_port_id  ),
    .c2h_byp_in_mm_at                                                          (c2h_byp_in_mm_at       ),
    .c2h_byp_in_mm_sdi                                                         (c2h_byp_in_mm_sdi      ),
    .c2h_byp_in_mm_qid                                                         ({1'b0,c2h_byp_in_mm_qid}),
    .c2h_byp_in_mm_func                                                        ({4'b0,c2h_byp_in_mm_func}),
    .c2h_byp_in_mm_error                                                       (c2h_byp_in_mm_error    ),
    .c2h_byp_in_mm_cidx                                                        (c2h_byp_in_mm_cidx     ),
    .c2h_byp_in_mm_no_dma                                                      (c2h_byp_in_mm_no_dma   ),
    .c2h_byp_in_mm_vld                                                         (c2h_byp_in_mm_vld      ),
    .c2h_byp_in_mm_rdy                                                         (c2h_byp_in_mm_rdy      ),
    .c2h_byp_in_mm_host_id                                                     (c2h_byp_in_mm_host_id  ),
    .c2h_byp_in_mm_pasid_en                                                    (c2h_byp_in_mm_pasid_en ),
    .c2h_byp_in_mm_pasid                                                       (c2h_byp_in_mm_pasid    ),

    //.c2h_byp_in_mm1_radr                                                        (c2h_byp_in_mm1_radr   ),
    //.c2h_byp_in_mm1_wadr                                                        (c2h_byp_in_mm1_wadr   ),
    //.c2h_byp_in_mm1_len                                                         (c2h_byp_in_mm1_len      ),
    //.c2h_byp_in_mm1_mrkr_req                                                    (c2h_byp_in_mm1_mrkr_req ),
    //.c2h_byp_in_mm1_port_id                                                     (c2h_byp_in_mm1_port_id  ),
    //.c2h_byp_in_mm1_at                                                          (c2h_byp_in_mm1_at       ),
    //.c2h_byp_in_mm1_sdi                                                         (c2h_byp_in_mm1_sdi      ),
    //.c2h_byp_in_mm1_qid                                                         (c2h_byp_in_mm1_qid      ),
    //.c2h_byp_in_mm1_error                                                       (c2h_byp_in_mm1_error    ),
    //.c2h_byp_in_mm1_func                                                        (c2h_byp_in_mm1_func     ),
    //.c2h_byp_in_mm1_cidx                                                        (c2h_byp_in_mm1_cidx     ),
    //.c2h_byp_in_mm1_no_dma                                                      (c2h_byp_in_mm1_no_dma   ),
    //.c2h_byp_in_mm1_vld                                                         (c2h_byp_in_mm1_vld      ),
    //.c2h_byp_in_mm1_rdy                                                         (c2h_byp_in_mm1_rdy      ),
    //.c2h_byp_in_mm1_host_id                                                     (c2h_byp_in_mm1_host_id  ),
    //.c2h_byp_in_mm1_pasid_en                                                    (c2h_byp_in_mm1_pasid_en ),
    //.c2h_byp_in_mm1_pasid                                                       (c2h_byp_in_mm1_pasid    ),


    .c2h_byp_in_st_csh_addr                                                            (c2h_byp_in_st_csh_addr   ),
    .c2h_byp_in_st_csh_port_id                                                         (c2h_byp_in_st_csh_port_id),
    .c2h_byp_in_st_csh_err2ctxt                                                        (c2h_byp_in_st_csh_err2ctxt),
    .c2h_byp_in_st_csh_at                                                              (c2h_byp_in_st_csh_at     ),
    .c2h_byp_in_st_csh_qid                                                             ({1'b0,c2h_byp_in_st_csh_qid}),
    .c2h_byp_in_st_csh_func                                                            ({4'b0,c2h_byp_in_st_csh_func}),
    .c2h_byp_in_st_csh_error                                                           (c2h_byp_in_st_csh_error  ),
    .c2h_byp_in_st_csh_vld                                                             (c2h_byp_in_st_csh_vld    ),
    .c2h_byp_in_st_csh_rdy                                                             (c2h_byp_in_st_csh_rdy    ),
    .c2h_byp_in_st_csh_cidx                                                            (c2h_byp_in_st_csh_cidx   ),
    .c2h_byp_in_st_csh_fmt                                                             (c2h_byp_in_st_csh_fmt    ),
    .c2h_byp_in_st_csh_host_id                                                         (c2h_byp_in_st_csh_host_id),
    .c2h_byp_in_st_csh_pasid_en                                                        (c2h_byp_in_st_csh_pasid_en),
    .c2h_byp_in_st_csh_pasid                                                           (c2h_byp_in_st_csh_pasid  ),
    .c2h_byp_in_st_csh_var_desc                                                        (c2h_byp_in_st_csh_var_desc),
    .c2h_byp_in_st_csh_pfch_tag                                                        (c2h_byp_in_st_csh_pfch_tag),
    .c2h_byp_in_st_csh_len                                                             (c2h_byp_in_st_csh_len    ),
    .c2h_byp_in_st_csh_desc_chain                                                      (1'h0                      ),
    .c2h_byp_in_st_csh_desc_chain_flag                                                 (3'h0                      ),
    .c2h_byp_in_st_csh_desc_chain_idx                                                  (16'h0                      ),
    .h2c_byp_in_mm_radr                                                            (h2c_byp_in_mm_radr    ),
    .h2c_byp_in_mm_wadr                                                            (h2c_byp_in_mm_wadr    ),
    .h2c_byp_in_mm_len                                                             (h2c_byp_in_mm_len),
    .h2c_byp_in_mm_mrkr_req                                                        (h2c_byp_in_mm_mrkr_req),
    .h2c_byp_in_mm_err2ctxt                                                        (h2c_byp_in_mm_err2ctxt),
    .h2c_byp_in_mm_port_id                                                         (h2c_byp_in_mm_port_id ),
    .h2c_byp_in_mm_at                                                              (h2c_byp_in_mm_at      ),
    .h2c_byp_in_mm_sdi                                                             (h2c_byp_in_mm_sdi     ),
    .h2c_byp_in_mm_qid                                                             ({1'b0,h2c_byp_in_mm_qid}),
    .h2c_byp_in_mm_func                                                            ({4'b0,h2c_byp_in_mm_func}),
    .h2c_byp_in_mm_error                                                           (h2c_byp_in_mm_error   ),
    .h2c_byp_in_mm_cidx                                                            (h2c_byp_in_mm_cidx    ),
    .h2c_byp_in_mm_no_dma                                                          (h2c_byp_in_mm_no_dma   ),
    .h2c_byp_in_mm_vld                                                             (h2c_byp_in_mm_vld     ),
    .h2c_byp_in_mm_rdy                                                             (h2c_byp_in_mm_rdy     ),
    .h2c_byp_in_mm_host_id                                                         (h2c_byp_in_mm_host_id ),
    .h2c_byp_in_mm_pasid_en                                                        (h2c_byp_in_mm_pasid_en),
    .h2c_byp_in_mm_pasid                                                           (h2c_byp_in_mm_pasid   ),

    .h2c_byp_in_st_addr                                                            (h2c_byp_in_st_addr    ),
    .h2c_byp_in_st_len                                                             (h2c_byp_in_st_len     ),
    .h2c_byp_in_st_eop                                                             (h2c_byp_in_st_eop     ),
    .h2c_byp_in_st_sop                                                             (h2c_byp_in_st_sop     ),
    .h2c_byp_in_st_mrkr_req                                                        (h2c_byp_in_st_mrkr_req),
    .h2c_byp_in_st_err2ctxt                                                        (h2c_byp_in_st_err2ctxt),
    .h2c_byp_in_st_port_id                                                         (h2c_byp_in_st_port_id ),
    .h2c_byp_in_st_at                                                              (h2c_byp_in_st_at      ),
    .h2c_byp_in_st_sdi                                                             (h2c_byp_in_st_sdi     ),
    .h2c_byp_in_st_qid                                                             ({1'b0,h2c_byp_in_st_qid}),
    .h2c_byp_in_st_func                                                            ({4'b0,h2c_byp_in_st_func}),
    .h2c_byp_in_st_error                                                           (h2c_byp_in_st_error   ),
    .h2c_byp_in_st_cidx                                                            (h2c_byp_in_st_cidx    ),
    .h2c_byp_in_st_no_dma                                                          (3'h0 | h2c_byp_in_st_no_dma  ),
    .h2c_byp_in_st_vld                                                             (h2c_byp_in_st_vld     ),
    .h2c_byp_in_st_rdy                                                             (h2c_byp_in_st_rdy     ),
    .h2c_byp_in_st_host_id                                                         (h2c_byp_in_st_host_id ),
    .h2c_byp_in_st_pasid_en                                                        (h2c_byp_in_st_pasid_en),
    .h2c_byp_in_st_pasid                                                           (h2c_byp_in_st_pasid   ),

    .tm_dsc_sts_vld                                                             (tm_dsc_sts_vld      ),
    .tm_dsc_sts_port_id                                                         (tm_dsc_sts_port_id  ),
    .tm_dsc_sts_qen                                                             (tm_dsc_sts_qen      ),
    .tm_dsc_sts_byp                                                             (tm_dsc_sts_byp      ),
    .tm_dsc_sts_dir                                                             (tm_dsc_sts_dir      ),
    .tm_dsc_sts_mm                                                              (tm_dsc_sts_mm       ),
    .tm_dsc_sts_error                                                           (tm_dsc_sts_error    ),
    .tm_dsc_sts_qid                                                             (tm_dsc_sts_qid_temp ),

    .tm_dsc_sts_avl                                                             (tm_dsc_sts_avl      ),
    .tm_dsc_sts_qinv                                                            (tm_dsc_sts_qinv     ),
    .tm_dsc_sts_irq_arm                                                         (tm_dsc_sts_irq_arm  ),
    .tm_dsc_sts_rdy                                                             (tm_dsc_sts_rdy      ),
    .tm_dsc_sts_pidx                                                            (tm_dsc_sts_pidx     ),
    .tm_dsc_sts_fnid                                                            (tm_dsc_sts_func     ),
    .tm_dsc_sts_vio_hw_db                                                       (tm_dsc_sts_vio_hw_db),
    .tm_dsc_sts_vio_sw_db                                                       (tm_dsc_sts_vio_sw_db),
    .tm_dsc_sts_vio_avl_flg                                                     (tm_dsc_sts_vio_avl_flg),
    .tm_dsc_sts_vio_dsc_crdt                                                    (tm_dsc_sts_vio_dsc_crdt),
    .tm_dsc_sts_vio_en                                                          (tm_dsc_sts_vio_en   ),
    .dsc_crdt_in_crdt                                                           (dsc_crdt_in_crdt    ),
    .dsc_crdt_in_qid                                                            ({2'b0,dsc_crdt_in_qid}),
    .dsc_crdt_in_misc                                                           (dsc_crdt_in_misc    ),
    .dsc_crdt_in_dir                                                            (dsc_crdt_in_dir     ),
    .dsc_crdt_in_fence                                                          (dsc_crdt_in_fence   ),
    .dsc_crdt_in_vld                                                            (dsc_crdt_in_vld     ),
    .dsc_crdt_in_rdy                                                            (dsc_crdt_in_rdy     ),
    .dsc_crdt_in_op                                                             (dsc_crdt_in_op      ),
    //.dsc_crdt_in_bsel                                                           (dsc_crdt_in_bsel    ),
    //.dsc_crdt_in_var_desc                                                       (dsc_crdt_in_var_desc ),
    //.dsc_crdt_in_buf_sz_ix                                                      (dsc_crdt_in_buf_sz_ix), 
    //.dsc_crdt_in_pfch_tag                                                       (dsc_crdt_in_pfch_tag ),

    //.msi_enable                                                                 (msi_enable          ),
    //.msi_vector_width                                                           (msi_vector_width    ),
    .m_axi_awready                                                              (m_axi_awready       ),
    .m_axi_wready                                                               (m_axi_wready        ),
    .m_axi_bid                                                                  (m_axi_bid           ),
    .m_axi_bresp                                                                (m_axi_bresp         ),
    .m_axi_bvalid                                                               (m_axi_bvalid        ),
    .m_axi_arready                                                              (m_axi_arready       ),
    .m_axi_rid                                                                  (m_axi_rid           ),
    .m_axi_rdata                                                                (m_axi_rdata         ),
    .m_axi_ruser                                                                (m_axi_ruser         ),
    .m_axi_rresp                                                                (m_axi_rresp         ),
    .m_axi_rlast                                                                (m_axi_rlast         ),
    .m_axi_rvalid                                                               (m_axi_rvalid        ),
    .m_axi_awid                                                                 (m_axi_awid          ),
    .m_axi_awaddr                                                               (m_axi_awaddr        ),
    .m_axi_awuser                                                               (m_axi_awuser ),
    .m_axi_awlen                                                                (m_axi_awlen  ),
    .m_axi_awsize                                                               (m_axi_awsize ),
    .m_axi_awburst                                                              (m_axi_awburst),
    .m_axi_awprot                                                               (m_axi_awprot ),
    .m_axi_awvalid                                                              (m_axi_awvalid),
    .m_axi_awlock                                                               (m_axi_awlock ),
    .m_axi_awcache                                                              (m_axi_awcache),
    .m_axi_wdata                                                                (m_axi_wdata  ),
    .m_axi_wuser                                                                (m_axi_wuser  ),
    .m_axi_wstrb                                                                (m_axi_wstrb  ),
    .m_axi_wlast                                                                (m_axi_wlast  ),
    .m_axi_wvalid                                                               (m_axi_wvalid ),
    .m_axi_bready                                                               (m_axi_bready ),
    .m_axi_arid                                                                 (m_axi_arid   ),
    .m_axi_araddr                                                               (m_axi_araddr ),
    .m_axi_aruser                                                               (m_axi_aruser ),
    .m_axi_arlen                                                                (m_axi_arlen  ),
    .m_axi_arsize                                                               (m_axi_arsize ),
    .m_axi_arburst                                                            (m_axi_arburst ),
    .m_axi_arprot                                                             (m_axi_arprot  ),
    .m_axi_arvalid                                                            (m_axi_arvalid ),
    .m_axi_arlock                                                             (m_axi_arlock  ),
    .m_axi_arcache                                                            (m_axi_arcache ),
    .m_axi_rready                                                             (m_axi_rready  ),
    .m_axil_awaddr                                                            (m_axil_awaddr ),
    .m_axil_awuser                                                            (m_axil_awuser ),
    .m_axil_awprot                                                            (m_axil_awprot ),
    .m_axil_awvalid                                                           (m_axil_awvalid),
    .m_axil_awready                                                           (m_axil_awready),
    .m_axil_wdata                                                             (m_axil_wdata  ),
    .m_axil_wstrb                                                             (m_axil_wstrb  ),
    .m_axil_wvalid                                                            (m_axil_wvalid ),
    .m_axil_wready                                                            (m_axil_wready ),
    .m_axil_bvalid                                                            (m_axil_bvalid ),
    .m_axil_bresp                                                             (m_axil_bresp  ),
    .m_axil_bready                                                            (m_axil_bready ),
    .m_axil_araddr                                                            (m_axil_araddr ),
    .m_axil_aruser                                                            (m_axil_aruser ),
    .m_axil_arprot                                                            (m_axil_arprot ),
    .m_axil_arvalid                                                           (m_axil_arvalid),
    .m_axil_arready                                                           (m_axil_arready),
    .m_axil_rdata                                                             (m_axil_rdata  ),
    .m_axil_rresp                                                             (m_axil_rresp  ),
    .m_axil_rvalid                                                            (m_axil_rvalid ),
    .m_axil_rready                                                            (m_axil_rready ),
    .m_axib_awid                                                                  (m_axib_awid   ),
    .m_axib_awaddr                                                                (m_axib_awaddr ),
    .m_axib_awlen                                                                 (m_axib_awlen  ),
    .m_axib_awuser                                                                (m_axib_awuser ),
    .m_axib_awsize                                                                (m_axib_awsize ),
    .m_axib_awburst                                                               (m_axib_awburst),
    .m_axib_awprot                                                                (m_axib_awprot ),
    .m_axib_awvalid                                                               (m_axib_awvalid),
    .m_axib_awready                                                               (m_axib_awready),
    .m_axib_awlock                                                                (m_axib_awlock ),
    .m_axib_awcache                                                               (m_axib_awcache),
    .m_axib_wdata                                                                 (m_axib_wdata  ),
    .m_axib_wstrb                                                                 (m_axib_wstrb  ),
    .m_axib_wlast                                                                 (m_axib_wlast  ),
    .m_axib_wvalid                                                                (m_axib_wvalid ),
    .m_axib_wready                                                                (m_axib_wready ),
    .m_axib_wuser                                                                 (m_axib_wuser  ),
    .m_axib_bid                                                                   (m_axib_bid    ),
    .m_axib_bresp                                                                 (m_axib_bresp  ),
    .m_axib_bvalid                                                                (m_axib_bvalid ),
    .m_axib_bready                                                                (m_axib_bready ),
    .m_axib_arid                                                                  (m_axib_arid   ),
    .m_axib_araddr                                                                (m_axib_araddr ),
    .m_axib_arlen                                                                 (m_axib_arlen  ),
    .m_axib_aruser                                                                (m_axib_aruser ),
    .m_axib_arsize                                                                (m_axib_arsize ),
    .m_axib_arburst                                                               (m_axib_arburst),
    .m_axib_arprot                                                                (m_axib_arprot ),
    .m_axib_arvalid                                                               (m_axib_arvalid),
    .m_axib_arready                                                               (m_axib_arready),
    .m_axib_arlock                                                                (m_axib_arlock ),
    .m_axib_arcache                                                               (m_axib_arcache),
    .m_axib_rid                                                                   (m_axib_rid    ),
    .m_axib_rdata                                                                 (m_axib_rdata  ),
    .m_axib_ruser                                                                 (m_axib_ruser  ),
    .m_axib_rresp                                                                 (m_axib_rresp  ),
    .m_axib_rlast                                                                 (m_axib_rlast  ),
    .m_axib_rvalid                                                                (m_axib_rvalid ),
    .m_axib_rready                                                                (m_axib_rready ),
     .s_axis_c2h_tdata_udma         ({s_axis_c2h_tdata_3,s_axis_c2h_tdata_2,s_axis_c2h_tdata_1,s_axis_c2h_tdata_0}),
     .s_axis_c2h_tlast_udma         ({s_axis_c2h_tlast_3,s_axis_c2h_tlast_2,s_axis_c2h_tlast_1,s_axis_c2h_tlast_0}),
     .s_axis_c2h_tvalid_udma        ({s_axis_c2h_tvalid_3,s_axis_c2h_tvalid_2,s_axis_c2h_tvalid_1,s_axis_c2h_tvalid_0}),
     .s_axis_c2h_tready_udma        ({s_axis_c2h_tready_3,s_axis_c2h_tready_2,s_axis_c2h_tready_1,s_axis_c2h_tready_0}),
     .s_axis_c2h_tkeep_udma         ({s_axis_c2h_tkeep_3, s_axis_c2h_tkeep_2, s_axis_c2h_tkeep_1, s_axis_c2h_tkeep_0}),
     .s_axis_c2h_tparity_udma       ({s_axis_c2h_tuser_3,s_axis_c2h_tuser_2,s_axis_c2h_tuser_1,s_axis_c2h_tuser_0}),
    .s_axis_c2h_tuser_udma   ('h0),
     .m_axis_h2c_tdata_udma         ({m_axis_h2c_tdata_3,m_axis_h2c_tdata_2,m_axis_h2c_tdata_1,m_axis_h2c_tdata_0}),
     .m_axis_h2c_tlast_udma         ({m_axis_h2c_tlast_3,m_axis_h2c_tlast_2,m_axis_h2c_tlast_1,m_axis_h2c_tlast_0}),
     .m_axis_h2c_tvalid_udma        ({m_axis_h2c_tvalid_3,m_axis_h2c_tvalid_2,m_axis_h2c_tvalid_1,m_axis_h2c_tvalid_0}),
     .m_axis_h2c_tkeep_udma         ({m_axis_h2c_tkeep_3,m_axis_h2c_tkeep_2,m_axis_h2c_tkeep_1,m_axis_h2c_tkeep_0}),
     .m_axis_h2c_tready_udma        ({m_axis_h2c_tready_3,m_axis_h2c_tready_2,m_axis_h2c_tready_1,m_axis_h2c_tready_0}),
     .m_axis_h2c_tparity_udma       ({m_axis_h2c_tuser_3,m_axis_h2c_tuser_2,m_axis_h2c_tuser_1,m_axis_h2c_tuser_0}),
    .m_axis_h2c_tuser_udma   (),
    
//MDMA Ports
    .m_axis_h2c_tdata                                                                (m_axis_h2c_tdata             ),
    .m_axis_h2c_tcrc                                                                 (m_axis_h2c_tcrc              ),
    .m_axis_h2c_tuser_qid                                                            (m_axis_h2c_tuser_qid_temp    ),
    .m_axis_h2c_tuser_port_id                                                        (m_axis_h2c_tuser_port_id     ),
    .m_axis_h2c_tuser_err                                                            (m_axis_h2c_tuser_err         ),
    .m_axis_h2c_tuser_mdata                                                          (m_axis_h2c_tuser_mdata       ),
    .m_axis_h2c_tuser_mty                                                            (m_axis_h2c_tuser_mty         ),
    .m_axis_h2c_tuser_zero_byte                                                      (m_axis_h2c_tuser_zero_byte   ),
    .m_axis_h2c_tvalid                                                               (m_axis_h2c_tvalid            ),
    .m_axis_h2c_tlast                                                                (m_axis_h2c_tlast             ),
    .m_axis_h2c_tready                                                               (m_axis_h2c_tready            ),
    .s_axis_c2h_tdata                                                                (s_axis_c2h_tdata             ),
    .s_axis_c2h_tcrc                                                                 (s_axis_c2h_tcrc              ),
    .s_axis_c2h_ctrl_marker                                                          (s_axis_c2h_ctrl_marker       ),
    .s_axis_c2h_ctrl_port_id                                                         (s_axis_c2h_ctrl_port_id      ),
    .s_axis_c2h_ctrl_len                                                             (s_axis_c2h_ctrl_len          ),
    .s_axis_c2h_ctrl_qid                                                             ({1'b0,s_axis_c2h_ctrl_qid}   ),
    .s_axis_c2h_ctrl_has_cmpt                                                        (s_axis_c2h_ctrl_has_cmpt     ),
    .s_axis_c2h_ctrl_host_id                                                         (s_axis_c2h_ctrl_host_id      ),
    .s_axis_c2h_ctrl_num_buf_ov                                                      (s_axis_c2h_ctrl_num_buf_ov   ),
    .s_axis_c2h_ctrl_drop_req                                                        (s_axis_c2h_ctrl_drop_req     ),
    .s_axis_c2h_ctrl_var_desc                                                        (s_axis_c2h_ctrl_var_desc     ),
    .s_axis_c2h_ctrl_ecc                                                             (s_axis_c2h_ctrl_ecc          ),
    .s_axis_c2h_mty                                                                  (s_axis_c2h_mty               ),
    .s_axis_c2h_tvalid                                                               (s_axis_c2h_tvalid            ),
    .s_axis_c2h_tlast                                                                (s_axis_c2h_tlast             ),
    .s_axis_c2h_tready                                                               (s_axis_c2h_tready            ),
    .s_axis_c2h_cmpt_tdata                                                           (s_axis_c2h_cmpt_tdata        ),
    .s_axis_c2h_cmpt_size                                                            (s_axis_c2h_cmpt_size         ),
    .s_axis_c2h_cmpt_dpar                                                            (s_axis_c2h_cmpt_dpar         ),
    .s_axis_c2h_cmpt_tvalid                                                          (s_axis_c2h_cmpt_tvalid       ),
    .s_axis_c2h_cmpt_tready                                                          (s_axis_c2h_cmpt_tready       ),
//    .s_axis_c2h_cmpt_rd_out                                                          (s_axis_c2h_cmpt_rd_out       ),
    .s_axis_c2h_cmpt_ctrl_qid                                                        ({2'b0,s_axis_c2h_cmpt_ctrl_qid} ),
    .s_axis_c2h_cmpt_ctrl_cmpt_type                                                  (s_axis_c2h_cmpt_ctrl_cmpt_type       ),
    .s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id                                            (s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id ),
    .s_axis_c2h_cmpt_ctrl_port_id                                                    (s_axis_c2h_cmpt_ctrl_port_id         ),
    .s_axis_c2h_cmpt_ctrl_marker                                                     (s_axis_c2h_cmpt_ctrl_marker          ),
    .s_axis_c2h_cmpt_ctrl_user_trig                                                  (s_axis_c2h_cmpt_ctrl_user_trig       ),
    .s_axis_c2h_cmpt_ctrl_col_idx                                                    (s_axis_c2h_cmpt_ctrl_col_idx      ),
    .s_axis_c2h_cmpt_ctrl_err_idx                                                    (s_axis_c2h_cmpt_ctrl_err_idx      ),
    .s_axis_c2h_cmpt_ctrl_pld_virt_ch                                                (s_axis_c2h_cmpt_ctrl_pld_virt_ch  ),
    .s_axis_c2h_cmpt_ctrl_non_blocking                                               (s_axis_c2h_cmpt_ctrl_non_blocking  ),
    .s_axis_c2h_cmpt_ctrl_no_wrb_marker                                              (s_axis_c2h_cmpt_ctrl_no_wrb_marker ),
    .axis_c2h_status_drop                                                            (axis_c2h_status_drop         ),
    .axis_c2h_status_valid                                                           (axis_c2h_status_valid        ),
    .axis_c2h_status_cmp                                                             (axis_c2h_status_cmp          ),
    .axis_c2h_status_last                                                            (axis_c2h_status_last         ),
    .axis_c2h_status_qid                                                             (axis_c2h_status_qid_temp     ),
    .axis_c2h_status_error                                                           (axis_c2h_status_error        ),
    .axis_c2h_status_port_id                                                         (axis_c2h_status_port_id      ),
    .axis_c2h_status_host_target_id                                                  (axis_c2h_status_target_vh    ),
    .axis_c2h_dmawr_cmp                                                              (axis_c2h_dmawr_cmp           ),
    .axis_c2h_dmawr_target_vch                                                       (axis_c2h_dmawr_target_vch    ),
    .axis_c2h_dmawr_port_id                                                          (axis_c2h_dmawr_port_id       ),

    .mhost_feedback_qid_fifo_rd_out                                                  (mdma_c2h_st_mhost_feedback_qid_fifo_rd_out),
    .mhost_feedback_payload_fifo_rd_out                                              (mdma_c2h_st_mhost_feedback_payload_fifo_rd_out),
    .mhost_feedback_pld_order                                                        (mdma_c2h_st_mhost_feedback_pld_order),
    .mhost_feedback_cmpt_fifo_rd_out                                                 (mdma_c2h_st_mhost_feedback_cmpt_fifo_rd_out),
    .mhost_feedback_smpl_byp_rd_out                                                  (mdma_c2h_st_mhost_feedback_smpl_byp_rd_out ),



    .s_axil_awaddr                                                               (s_axil_awaddr             ),
    .s_axil_awuser                                                               (s_axil_awuser             ),
    .s_axil_awprot                                                               (s_axil_awprot             ),
    .s_axil_awvalid                                                              (s_axil_awvalid            ),
    .s_axil_awready                                                              (s_axil_awready            ),
    .s_axil_wdata                                                                (s_axil_wdata              ),
    .s_axil_wstrb                                                                (s_axil_wstrb              ),
    .s_axil_wvalid                                                               (s_axil_wvalid             ),
    .s_axil_wready                                                               (s_axil_wready             ),
    .s_axil_bvalid                                                               (s_axil_bvalid             ),
    .s_axil_bresp                                                                (s_axil_bresp              ),
    .s_axil_bready                                                               (s_axil_bready             ),
    .s_axil_araddr                                                               (s_axil_araddr             ),
    .s_axil_aruser                                                               (s_axil_aruser             ),
    .s_axil_arprot                                                               (s_axil_arprot             ),
    .s_axil_arvalid                                                              (s_axil_arvalid            ),
    .s_axil_arready                                                              (s_axil_arready            ),
    .s_axil_rdata                                                                (s_axil_rdata              ),
    .s_axil_rresp                                                                (s_axil_rresp              ),
    .s_axil_rvalid                                                               (s_axil_rvalid             ),
    .s_axil_rready                                                               (s_axil_rready             ),

    .s_axil_csr_awaddr                                                           (s_axil_csr_awaddr             ),
    .s_axil_csr_awprot                                                           (s_axil_csr_awprot             ),
    .s_axil_csr_awvalid                                                          (s_axil_csr_awvalid            ),
    .s_axil_csr_awready                                                          (s_axil_csr_awready            ),
    .s_axil_csr_wdata                                                            (s_axil_csr_wdata              ),
    .s_axil_csr_wstrb                                                            (s_axil_csr_wstrb              ),
    .s_axil_csr_wvalid                                                           (s_axil_csr_wvalid             ),
    .s_axil_csr_wready                                                           (s_axil_csr_wready             ),
    .s_axil_csr_bvalid                                                           (s_axil_csr_bvalid             ),
    .s_axil_csr_bresp                                                            (s_axil_csr_bresp              ),
    .s_axil_csr_bready                                                           (s_axil_csr_bready             ),
    .s_axil_csr_araddr                                                           (s_axil_csr_araddr             ),
    .s_axil_csr_arprot                                                           (s_axil_csr_arprot             ),
    .s_axil_csr_arvalid                                                          (s_axil_csr_arvalid            ),
    .s_axil_csr_arready                                                          (s_axil_csr_arready            ),
    .s_axil_csr_rdata                                                            (s_axil_csr_rdata              ),
    .s_axil_csr_rresp                                                            (s_axil_csr_rresp              ),
    .s_axil_csr_rvalid                                                           (s_axil_csr_rvalid             ),
    .s_axil_csr_rready                                                           (s_axil_csr_rready             ),
    .m_axis_rq_tdata_out                                                         (m_axis_rq_tdata_out       ),
    .m_axis_rq_tlast_out                                                         (m_axis_rq_tlast_out       ),
    .m_axis_rq_tuser_out                                                         (m_axis_rq_tuser_out       ),
    .m_axis_rq_tkeep_out                                                         (m_axis_rq_tkeep_out       ),
    .m_axis_rq_tready_out                                                        (m_axis_rq_tready_out[0]   ),
    .m_axis_rq_tvalid_out                                                        (m_axis_rq_tvalid_out      ),
    .s_axis_rc_tdata_out                                                         (s_axis_rc_tdata_out       ),
    .s_axis_rc_tuser_out                                                         (s_axis_rc_tuser_out       ),
    .s_axis_rc_tlast_out                                                         (s_axis_rc_tlast_out       ),
    .s_axis_rc_tkeep_out                                                         (s_axis_rc_tkeep_out       ),
    .s_axis_rc_tvalid_out                                                        (s_axis_rc_tvalid_out      ),
    .s_axis_rc_tready_out                                                        (s_axis_rc_tready_out      ),
    .s_axis_cq_tdata_out                                                         (s_axis_cq_tdata_out       ),
    .s_axis_cq_tuser_out                                                         (s_axis_cq_tuser_out       ),
    .s_axis_cq_tlast_out                                                         (s_axis_cq_tlast_out       ),
    .s_axis_cq_tkeep_out                                                         (s_axis_cq_tkeep_out       ),
    .s_axis_cq_tvalid_out                                                        (s_axis_cq_tvalid_out      ),
    .s_axis_cq_tready_out                                                        (s_axis_cq_tready_out      ),
    .m_axis_cc_tdata_out                                                         (m_axis_cc_tdata_out       ),
    .m_axis_cc_tuser_out                                                         (m_axis_cc_tuser_out       ),
    .m_axis_cc_tlast_out                                                         (m_axis_cc_tlast_out       ),
    .m_axis_cc_tkeep_out                                                         (m_axis_cc_tkeep_out       ),
    .m_axis_cc_tvalid_out                                                        (m_axis_cc_tvalid_out      ),
    .m_axis_cc_tready_out                                                        (m_axis_cc_tready_out[0]   ),
    .interrupt_out                                                               (interrupt_out_temp        ),
    .s_axi_awid                                                                  (s_axib_awid               ),
    .s_axi_awaddr                                                                (s_axib_awaddr             ),
    .s_axi_awregion                                                              (s_axib_awregion           ),
    .s_axi_awlen                                                                 (s_axib_awlen              ),
    .s_axi_awsize                                                                (s_axib_awsize             ),
    .s_axi_awburst                                                               (s_axib_awburst            ),
    .s_axi_awvalid                                                               (s_axib_awvalid            ),
    .s_axi_wdata                                                                 (s_axib_wdata              ),
    .s_axi_wstrb                                                                 (s_axib_wstrb              ),
    .s_axi_wlast                                                                 (s_axib_wlast              ),
    .s_axi_wvalid                                                                (s_axib_wvalid             ),
    .s_axi_wuser                                                                 (s_axib_wuser              ),
    .s_axi_ruser                                                                 (s_axib_ruser              ),
    .s_axi_bready                                                                (s_axib_bready             ),
    .s_axi_arid                                                                  (s_axib_arid               ),
    .s_axi_araddr                                                                (s_axib_araddr             ),
    .s_axi_aruser                                                                (s_axib_aruser             ),
    .s_axi_awuser                                                                (s_axib_awuser             ),
    .s_axi_arregion                                                              (s_axib_arregion           ),
    .s_axi_arlen                                                                 (s_axib_arlen              ),
    .s_axi_arsize                                                                (s_axib_arsize             ),
    .s_axi_arburst                                                               (s_axib_arburst            ),
    .s_axi_arvalid                                                               (s_axib_arvalid            ),
    .s_axi_rready                                                                (s_axib_rready             ),
    .s_axi_awready                                                               (s_axib_awready            ),
    .s_axi_wready                                                                (s_axib_wready             ),
    .s_axi_bid                                                                   (s_axib_bid                ),
    .s_axi_bresp                                                                 (s_axib_bresp              ),
    .s_axi_bvalid                                                                (s_axib_bvalid             ),
    .s_axi_arready                                                               (s_axib_arready            ),
    .s_axi_rid                                                                   (s_axib_rid                ),
    .s_axi_rdata                                                                 (s_axib_rdata              ),
    .s_axi_rresp                                                                 (s_axib_rresp              ),
    .s_axi_rlast                                                                 (s_axib_rlast              ),
    .s_axi_rvalid                                                                (s_axib_rvalid             ),
    .soft_reset_n                                                                        (soft_reset_n            ),
    .s_aclk                                                                              (s_aclk                  ),
    .s_aresetn                                                                           (s_aresetn               ),

/*  Do we need this ports ???
    .s_axi_araddr                                                                        (s_axi_araddr            ),
    .s_axi_arburst                                                                       (s_axi_arburst           ),
    .s_axi_arcache                                                                       (s_axi_arcache           ),
    .s_axi_arid                                                                          (s_axi_arid              ),
    .s_axi_arlen                                                                         (s_axi_arlen             ),
    .s_axi_arlock                                                                        (s_axi_arlock            ),
    .s_axi_arprot                                                                        (s_axi_arprot            ),
    .s_axi_arqos                                                                         (s_axi_arqos             ),
    .s_axi_arready                                                                       (s_axi_arready           ),
    .s_axi_arsize                                                                        (s_axi_arsize            ),
    .s_axi_aruser                                                                        (s_axi_aruser            ),
    .s_axi_arvalid                                                                       (s_axi_arvalid           ),
    .s_axi_awaddr                                                                        (s_axi_awaddr            ),
    .s_axi_awburst                                                                       (s_axi_awburst           ),
    .s_axi_awcache                                                                       (s_axi_awcache           ),
    .s_axi_awid                                                                          (s_axi_awid              ),
    .s_axi_awlen                                                                         (s_axi_awlen             ),
    .s_axi_awlock                                                                        (s_axi_awlock            ),
    .s_axi_awprot                                                                        (s_axi_awprot            ),
    .s_axi_awqos                                                                         (s_axi_awqos             ),
    .s_axi_awready                                                                       (s_axi_awready           ),
    .s_axi_awsize                                                                        (s_axi_awsize            ),
    .s_axi_awuser                                                                        (s_axi_awuser            ),
    .s_axi_awvalid                                                                       (s_axi_awvalid           ),
    .s_axi_bid                                                                           (s_axi_bid               ),
    .s_axi_bready                                                                        (s_axi_bready            ),
    .s_axi_bresp                                                                         (s_axi_bresp             ),
    .s_axi_bvalid                                                                        (s_axi_bvalid            ),
    .s_axi_rdata                                                                         (s_axi_rdata             ),
    .s_axi_rid                                                                           (s_axi_rid               ),
    .s_axi_rlast                                                                         (s_axi_rlast             ),
    .s_axi_rready                                                                        (s_axi_rready            ),
    .s_axi_rresp                                                                         (s_axi_rresp             ),
    .s_axi_rvalid                                                                        (s_axi_rvalid),
    .s_axi_wdata                                                                         (s_axi_wdata ),
    .s_axi_wlast                                                                         (s_axi_wlast ),
    .s_axi_wready                                                                        (s_axi_wready),
    .s_axi_wstrb                                                                         (s_axi_wstrb ),
    .s_axi_wvalid                                                                        (s_axi_wvalid),
*/
 // ports that are not needed for soft ip
    .fw_dma_ctl                                                                          ('h0 ),
    .fw_dma_sts                                                                          (    ), 
    .dma_err_out                                                                         (    ),
    .dma_irq_out                                                                         (    ),

    .mgmt_req                                                                            ('h0 ),
    .mgmt_req_vld                                                                        (1'b0 ),
    .mgmt_req_rdy                                                                        (    ),

    .mgmt_cpl                                                                            (    ),
    .mgmt_cpl_vld                                                                        (    ),
    .mgmt_cpl_rdy                                                                        (1'b0 ),

 // PCIE DMA CFG IN
.cfg_bus_number                                                                             (cfg_bus_number                   ),
.cfg_interrupt_msi_mask_update                                                              (cfg_interrupt_msi_mask_update    ),
.cfg_err_cor_out                                                                            (cfg_err_cor_out                  ),
.cfg_err_fatal_out                                                                          (cfg_err_fatal_out                ),
.cfg_err_nonfatal_out                                                                       (cfg_err_nonfatal_out             ),
.cfg_hot_reset_out                                                                          (cfg_hot_reset_out                ),
.cfg_interrupt_msi_enable                                                                   (cfg_interrupt_msi_enable         ),
.cfg_interrupt_msi_fail                                                                     (cfg_interrupt_msi_fail           ),
.cfg_interrupt_msi_sent                                                                     (cfg_interrupt_msi_sent           ),
.cfg_interrupt_msix_fail                                                                    (cfg_interrupt_msix_fail          ),
.cfg_interrupt_msix_sent                                                                    (cfg_interrupt_msix_sent          ),
.cfg_interrupt_sent                                                                         (cfg_interrupt_sent               ),
.cfg_local_error_valid                                                                      (cfg_local_error_valid            ),
.cfg_local_error_out                                                                        (cfg_local_error_out              ),
.cfg_mgmt_read_write_done                                                                   (cfg_mgmt_read_write_done         ),
.cfg_msg_received                                                                           (cfg_msg_received                 ),
.cfg_msg_transmit_done                                                                      (cfg_msg_transmit_done            ),
.cfg_per_function_update_done                                                               (cfg_per_function_update_done     ),
.cfg_phy_link_down                                                                          (cfg_phy_link_down                ),
.pcie_cq_np_req_count                                                                       (pcie_cq_np_req_count             ),
.pcie_rq_seq_num_vld0                                                                       (pcie_rq_seq_num_vld0             ),
.pcie_rq_seq_num_vld1                                                                       (pcie_rq_seq_num_vld1             ),
.cfg_function_status                                                                        (cfg_function_status              ),
.cfg_vf_status                                                                              (cfg_vf_status              ),
.cfg_per_func_status_data                                                                   (cfg_per_func_status_data         ),
.cfg_interrupt_msix_enable                                                                  (cfg_interrupt_msix_enable        ),
.cfg_interrupt_msix_mask                                                                    (cfg_interrupt_msix_mask          ),
.cfg_interrupt_msix_vf_enable                                                               (cfg_interrupt_msix_vf_enable        ),
.cfg_interrupt_msix_vf_mask                                                                 (cfg_interrupt_msix_vf_mask          ),
.cfg_phy_link_status                                                                        (cfg_phy_link_status              ),
.cfg_current_speed                                                                          (cfg_current_speed_o                ),
.cfg_max_payload                                                                            ({1'b0,cfg_max_payload}           ),
.cfg_max_read_req                                                                           (cfg_max_read_req                 ),
.cfg_mgmt_read_data                                                                         (cfg_mgmt_read_data               ),
.cfg_flr_in_process                                                                         (cfg_flr_in_process               ),
.cfg_vf_flr_in_process                                                                      (cfg_vf_flr_in_process               ),
.cfg_negotiated_width                                                                       (cfg_negotiated_width_o             ),
.pcie_rq_seq_num0                                                                           (pcie_rq_seq_num0                 ),
.pcie_rq_seq_num1                                                                           (pcie_rq_seq_num1                 ),
.pcie_tfc_nph_av                                                                            (pcie_tfc_nph_av                  ),
.cfg_msg_received_type                                                                      (cfg_msg_received_type            ),
.cfg_ltssm_state                                                                            (cfg_ltssm_state                  ),
.cfg_pl_status_change                                                                       (cfg_pl_status_change             ),
.cfg_msg_received_data                                                                      (cfg_msg_received_data            ),
.cfg_fc_nph                                                                                 (cfg_fc_nph                       ),
.cfg_fc_ph                                                                                  ( cfg_fc_ph ),
.cfg_fc_nph_scale                                                                           (cfg_fc_nph_scale                 ),
.cfg2axi_flr_in_progress                                                                    (cfg2axi_flr_in_progress          ),
.cfg2axi_interrupt_msix_enable                                                              (cfg2axi_interrupt_msix_enable    ),
.cfg2axi_interrupt_msix_mask                                                                (cfg2axi_interrupt_msix_mask      ),
.cfg_command_bus_master_enable_int                                                          (cfg_command_bus_master_enable_int),
.cfg2axi_mem_space_enable                                                                   (cfg2axi_mem_space_enable         ),
.cfg2axi_tph_requester_enable                                                               (cfg2axi_tph_requester_enable     ),
// PCIE DMA CFG OUT 

.cfg_fc_sel                                                                                 (cfg_fc_sel                                   ), 
.pcie_cq_np_req                                                                             (pcie_cq_np_req                               ), 
.cfg_mgmt_addr                                                                              (cfg_mgmt_addr                                ), 
.cfg_mgmt_write                                                                             (cfg_mgmt_write                               ), 
.cfg_mgmt_write_data                                                                        (cfg_mgmt_write_data                          ), 
.cfg_mgmt_byte_enable                                                                       (cfg_mgmt_byte_enable                         ), 
.cfg_mgmt_read                                                                              (cfg_mgmt_read                                ), 
.cfg_mgmt_function_number                                                                   (cfg_mgmt_function_number                     ), 
.cfg_mgmt_type1_cfg_reg_access                                                              (cfg_mgmt_type1_cfg_reg_access                ), 
.cfg_ds_port_number                                                                         (cfg_ds_port_number                           ), 
.cfg_ds_bus_number                                                                          (cfg_ds_bus_number                            ), 
.cfg_ds_device_number                                                                       (cfg_ds_device_number                         ), 
.cfg_ds_function_number                                                                     (cfg_ds_function_number                       ), 
.cfg_per_function_output_request                                                            (cfg_per_function_output_request              ), 
.cfg_per_function_logic_request                                                             (cfg_per_function_logic_request               ), 
.cfg_per_func_status_control                                                                (cfg_per_func_status_control                  ), 
.cfg_per_function_number                                                                    (cfg_per_function_number                      ), 
.cfg_msg_transmit                                                                           (cfg_msg_transmit                             ), 
.cfg_msg_transmit_type                                                                      (cfg_msg_transmit_type                        ), 
.cfg_msg_transmit_data                                                                      (cfg_msg_transmit_data                        ), 
.cfg_dsn                                                                                    (cfg_dsn                                      ), 
.cfg_err_cor_in                                                                             (cfg_err_cor_in                               ), 
.cfg_err_uncor_in                                                                           (cfg_err_uncor_in                             ), 
.cfg_link_training_enable                                                                   (cfg_link_training_enable                     ), 
.cfg_flr_done                                                                               (cfg_flr_done_int                                 ), 
.cfg_vf_flr_done                                                                            (cfg_vf_flr_done_int                              ), 
.cfg_vf_flr_func_num                                                                        (cfg_vf_flr_func_num_int                          ), 
.cfg_config_space_enable                                                                    (cfg_config_space_enable                      ), 
.cfg_hot_reset_in                                                                           (cfg_hot_reset_in                             ), 
.cfg_interrupt_msi_int                                                                      (cfg_interrupt_msi_int                        ), 
.cfg_interrupt_msi_pending_status                                                           (cfg_interrupt_msi_pending_status             ), 
.cfg_interrupt_msi_pending_status_data_enable                                               (cfg_interrupt_msi_pending_status_data_enable ), 
.cfg_interrupt_msi_pending_status_function_num                                              (cfg_interrupt_msi_pending_status_function_num), 
.cfg_interrupt_msi_attr                                                                     (cfg_interrupt_msi_attr                       ), 
.cfg_interrupt_msi_tph_present                                                              (cfg_interrupt_msi_tph_present                ), 
.cfg_interrupt_msi_tph_type                                                                 (cfg_interrupt_msi_tph_type                   ), 
.cfg_interrupt_msi_tph_st_tag                                                               (cfg_interrupt_msi_tph_st_tag                 ), 
.cfg_interrupt_msi_function_number                                                          (cfg_interrupt_msi_function_number            ), 
.cfg_interrupt_msix_int                                                                     (cfg_interrupt_msix_int_int                   ), 
.cfg_interrupt_msix_data                                                                    (cfg_interrupt_msix_data                      ), 
.cfg_interrupt_msix_address                                                                 (cfg_interrupt_msix_address                   ), 
.cfg_interrupt_msix_vec_pending                                                             (cfg_interrupt_msix_vec_pending               ), 
.cfg_interrupt_int                                                                          (cfg_interrupt_int[3:0]                       ), 
.cfg_interrupt_pending                                                                      (cfg_interrupt_pending                        ),
.numvec_valid										    (numvec_valid),
.numvec_done										    (numvec_done),
.msix_vectors_per_pf0									    (msix_vectors_per_pf0),
.msix_vectors_per_pf1									    (msix_vectors_per_pf1),
.msix_vectors_per_pf2									    (msix_vectors_per_pf2),
.msix_vectors_per_pf3								            (msix_vectors_per_pf3),
.msix_vectors_per_vfg0									    (msix_vectors_per_vfg0),
.msix_vectors_per_vfg1									    (msix_vectors_per_vfg1),
.msix_vectors_per_vfg2									    (msix_vectors_per_vfg2),
.msix_vectors_per_vfg3									    (msix_vectors_per_vfg3),

.cfg_ext_write_data_dma                                                                     (cfg_ext_write_data_dma               ),
.cfg_ext_write_byte_enable_dma                                                              (cfg_ext_write_byte_enable_dma        ),
.cfg_ext_register_number_dma                                                                (cfg_ext_register_number_dma          ),
.cfg_ext_function_number_dma                                                                (cfg_ext_function_number_dma          ),
.cfg_ext_read_received_dma                                                                  (cfg_ext_read_received_dma            ),
.cfg_ext_write_received_dma                                                                 (cfg_ext_write_received_dma           ),
.cfg_ext_read_data_dma                                                                      (cfg_ext_read_data_dma                ),//pcie_dma_out_cfg_ext_read_data       ), 
.cfg_ext_read_data_valid_dma                                                                (cfg_ext_read_data_valid_dma          )//pcie_dma_out_cfg_ext_read_data_valid )

,.imm_dsc_crdt_in_vld                                                                       (virtio_dsc_crdt_in_vld ) 
,.imm_dsc_crdt_in_rdy                                                                       (virtio_dsc_crdt_in_rdy )
,.imm_dsc_crdt_in_crdt                                                                      (virtio_dsc_crdt_in_crdt) 
,.imm_dsc_crdt_in_qid                                                                       (virtio_dsc_crdt_in_qid )   
,.imm_dsc_crdt_in_dir                                                                       (virtio_dsc_crdt_in_dir )
,.imm_dsc_crdt_in_idx                                                                       (virtio_dsc_crdt_in_idx )
,.qsts_out_op                                                                       (qsts_out_op       ) 
,.qsts_out_data                                                                     (qsts_out_data     )      
,.qsts_out_port_id                                                                  (qsts_out_port_id  )   
//,.qsts_out_host_target_id                                                           (qsts_out_host_target_id  )      
,.qsts_out_qid                                                                      (qsts_out_qid      )            
,.qsts_out_vld                                                                      (qsts_out_vld      )            
,.qsts_out_rdy                                                                      (qsts_out_rdy      )            
 
,.axi_interrupt_vld                                                                         (axi_interrupt_vld        )      
,.axi_interrupt_vec                                                                         (axi_interrupt_vec        )      
,.axi_interrupt_func_num                                                                    (axi_interrupt_func_num   )          
,.axi_interrupt_host_id                                                                     (axi_interrupt_host_id    )          
,.axi_interrupt_ack                                                                         (axi_interrupt_ack        )        

,.cfg_ext_write_data                                                                        (cfg_ext_write_data               )
,.cfg_ext_write_byte_enable                                                                 (cfg_ext_write_byte_enable        )
,.cfg_ext_register_number                                                                   (cfg_ext_register_number          )
,.cfg_ext_function_number                                                                   (cfg_ext_function_number          )
,.cfg_ext_read_received                                                                     (cfg_ext_read_received            )
,.cfg_ext_write_received                                                                    (cfg_ext_write_received           )
,.cfg_ext_read_data                                                                         (cfg_ext_read_data                )
,.cfg_ext_read_data_valid                                                                   (cfg_ext_read_data_valid          )




);

endmodule

