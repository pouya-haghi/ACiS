// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Aug 17 18:41:02 2022
// Host        : caadlab-01 running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ pfm_dynamic_hmss_0_0_sim_netlist.v
// Design      : pfm_dynamic_hmss_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* HW_HANDOFF = "pfm_dynamic_hmss_0_0.hwdef" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca
   (DRAM_0_STAT_TEMP,
    DRAM_1_STAT_TEMP,
    DRAM_STAT_CATTRIP,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    S01_AXI_araddr,
    S01_AXI_arburst,
    S01_AXI_arcache,
    S01_AXI_arlen,
    S01_AXI_arlock,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arready,
    S01_AXI_arsize,
    S01_AXI_arvalid,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awlen,
    S01_AXI_awlock,
    S01_AXI_awprot,
    S01_AXI_awqos,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awvalid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_rdata,
    S01_AXI_rlast,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_rvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid,
    S02_AXI_araddr,
    S02_AXI_arburst,
    S02_AXI_arcache,
    S02_AXI_arlen,
    S02_AXI_arlock,
    S02_AXI_arprot,
    S02_AXI_arqos,
    S02_AXI_arready,
    S02_AXI_arsize,
    S02_AXI_arvalid,
    S02_AXI_awaddr,
    S02_AXI_awburst,
    S02_AXI_awcache,
    S02_AXI_awlen,
    S02_AXI_awlock,
    S02_AXI_awprot,
    S02_AXI_awqos,
    S02_AXI_awready,
    S02_AXI_awsize,
    S02_AXI_awvalid,
    S02_AXI_bready,
    S02_AXI_bresp,
    S02_AXI_bvalid,
    S02_AXI_rdata,
    S02_AXI_rlast,
    S02_AXI_rready,
    S02_AXI_rresp,
    S02_AXI_rvalid,
    S02_AXI_wdata,
    S02_AXI_wlast,
    S02_AXI_wready,
    S02_AXI_wstrb,
    S02_AXI_wvalid,
    S03_AXI_araddr,
    S03_AXI_arburst,
    S03_AXI_arcache,
    S03_AXI_arlen,
    S03_AXI_arlock,
    S03_AXI_arprot,
    S03_AXI_arqos,
    S03_AXI_arready,
    S03_AXI_arsize,
    S03_AXI_arvalid,
    S03_AXI_awaddr,
    S03_AXI_awburst,
    S03_AXI_awcache,
    S03_AXI_awlen,
    S03_AXI_awlock,
    S03_AXI_awprot,
    S03_AXI_awqos,
    S03_AXI_awready,
    S03_AXI_awsize,
    S03_AXI_awvalid,
    S03_AXI_bready,
    S03_AXI_bresp,
    S03_AXI_bvalid,
    S03_AXI_rdata,
    S03_AXI_rlast,
    S03_AXI_rready,
    S03_AXI_rresp,
    S03_AXI_rvalid,
    S03_AXI_wdata,
    S03_AXI_wlast,
    S03_AXI_wready,
    S03_AXI_wstrb,
    S03_AXI_wvalid,
    S04_AXI_araddr,
    S04_AXI_arburst,
    S04_AXI_arcache,
    S04_AXI_arlen,
    S04_AXI_arlock,
    S04_AXI_arprot,
    S04_AXI_arqos,
    S04_AXI_arready,
    S04_AXI_arsize,
    S04_AXI_arvalid,
    S04_AXI_awaddr,
    S04_AXI_awburst,
    S04_AXI_awcache,
    S04_AXI_awlen,
    S04_AXI_awlock,
    S04_AXI_awprot,
    S04_AXI_awqos,
    S04_AXI_awready,
    S04_AXI_awsize,
    S04_AXI_awvalid,
    S04_AXI_bready,
    S04_AXI_bresp,
    S04_AXI_bvalid,
    S04_AXI_rdata,
    S04_AXI_rlast,
    S04_AXI_rready,
    S04_AXI_rresp,
    S04_AXI_rvalid,
    S04_AXI_wdata,
    S04_AXI_wlast,
    S04_AXI_wready,
    S04_AXI_wstrb,
    S04_AXI_wvalid,
    S05_AXI_araddr,
    S05_AXI_arburst,
    S05_AXI_arcache,
    S05_AXI_arlen,
    S05_AXI_arlock,
    S05_AXI_arprot,
    S05_AXI_arqos,
    S05_AXI_arready,
    S05_AXI_arsize,
    S05_AXI_arvalid,
    S05_AXI_awaddr,
    S05_AXI_awburst,
    S05_AXI_awcache,
    S05_AXI_awlen,
    S05_AXI_awlock,
    S05_AXI_awprot,
    S05_AXI_awqos,
    S05_AXI_awready,
    S05_AXI_awsize,
    S05_AXI_awvalid,
    S05_AXI_bready,
    S05_AXI_bresp,
    S05_AXI_bvalid,
    S05_AXI_rdata,
    S05_AXI_rlast,
    S05_AXI_rready,
    S05_AXI_rresp,
    S05_AXI_rvalid,
    S05_AXI_wdata,
    S05_AXI_wlast,
    S05_AXI_wready,
    S05_AXI_wstrb,
    S05_AXI_wvalid,
    S_AXI_CTRL_araddr,
    S_AXI_CTRL_arready,
    S_AXI_CTRL_arvalid,
    S_AXI_CTRL_awaddr,
    S_AXI_CTRL_awready,
    S_AXI_CTRL_awvalid,
    S_AXI_CTRL_bready,
    S_AXI_CTRL_bresp,
    S_AXI_CTRL_bvalid,
    S_AXI_CTRL_rdata,
    S_AXI_CTRL_rready,
    S_AXI_CTRL_rresp,
    S_AXI_CTRL_rvalid,
    S_AXI_CTRL_wdata,
    S_AXI_CTRL_wready,
    S_AXI_CTRL_wvalid,
    aclk,
    aclk1,
    aresetn,
    aresetn1,
    ctrl_aclk,
    ctrl_aresetn,
    hbm_aclk,
    hbm_aresetn,
    hbm_mc_init_seq_complete,
    hbm_ref_clk);
  output [6:0]DRAM_0_STAT_TEMP;
  output [6:0]DRAM_1_STAT_TEMP;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.DRAM_STAT_CATTRIP INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.DRAM_STAT_CATTRIP, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output DRAM_STAT_CATTRIP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, ADDR_WIDTH 33, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pfm_dynamic_dma_pcie_axi_aclk, DATA_WIDTH 512, FREQ_HZ 250000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 3, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SLR_ASSIGNMENT SLR2, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [39:0]S00_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARBURST" *) input [1:0]S00_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARCACHE" *) input [3:0]S00_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARID" *) input [2:0]S00_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLEN" *) input [7:0]S00_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLOCK" *) input [0:0]S00_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]S00_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARQOS" *) input [3:0]S00_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output [0:0]S00_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARSIZE" *) input [2:0]S00_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input [0:0]S00_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [39:0]S00_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWBURST" *) input [1:0]S00_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWCACHE" *) input [3:0]S00_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWID" *) input [2:0]S00_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLEN" *) input [7:0]S00_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLOCK" *) input [0:0]S00_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]S00_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWQOS" *) input [3:0]S00_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output [0:0]S00_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWSIZE" *) input [2:0]S00_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input [0:0]S00_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BID" *) output [2:0]S00_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input [0:0]S00_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]S00_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output [0:0]S00_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [511:0]S00_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RID" *) output [2:0]S00_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RLAST" *) output [0:0]S00_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input [0:0]S00_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]S00_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output [0:0]S00_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [511:0]S00_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WLAST" *) input [0:0]S00_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output [0:0]S00_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [63:0]S00_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input [0:0]S00_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXI, ADDR_WIDTH 28, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, DATA_WIDTH 512, FREQ_HZ 300000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [63:0]S01_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARBURST" *) input [1:0]S01_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARCACHE" *) input [3:0]S01_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLEN" *) input [7:0]S01_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLOCK" *) input [0:0]S01_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARPROT" *) input [2:0]S01_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARQOS" *) input [3:0]S01_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARREADY" *) output [0:0]S01_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARSIZE" *) input [2:0]S01_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARVALID" *) input [0:0]S01_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWADDR" *) input [63:0]S01_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWBURST" *) input [1:0]S01_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWCACHE" *) input [3:0]S01_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWLEN" *) input [7:0]S01_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWLOCK" *) input [0:0]S01_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWPROT" *) input [2:0]S01_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWQOS" *) input [3:0]S01_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWREADY" *) output [0:0]S01_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWSIZE" *) input [2:0]S01_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWVALID" *) input [0:0]S01_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BREADY" *) input [0:0]S01_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BRESP" *) output [1:0]S01_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BVALID" *) output [0:0]S01_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RDATA" *) output [511:0]S01_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RLAST" *) output [0:0]S01_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RREADY" *) input [0:0]S01_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RRESP" *) output [1:0]S01_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RVALID" *) output [0:0]S01_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WDATA" *) input [511:0]S01_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WLAST" *) input [0:0]S01_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WREADY" *) output [0:0]S01_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WSTRB" *) input [63:0]S01_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WVALID" *) input [0:0]S01_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S02_AXI, ADDR_WIDTH 28, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, DATA_WIDTH 512, FREQ_HZ 300000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [63:0]S02_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARBURST" *) input [1:0]S02_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARCACHE" *) input [3:0]S02_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARLEN" *) input [7:0]S02_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARLOCK" *) input [0:0]S02_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARPROT" *) input [2:0]S02_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARQOS" *) input [3:0]S02_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARREADY" *) output [0:0]S02_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARSIZE" *) input [2:0]S02_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARVALID" *) input [0:0]S02_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWADDR" *) input [63:0]S02_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWBURST" *) input [1:0]S02_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWCACHE" *) input [3:0]S02_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWLEN" *) input [7:0]S02_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWLOCK" *) input [0:0]S02_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWPROT" *) input [2:0]S02_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWQOS" *) input [3:0]S02_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWREADY" *) output [0:0]S02_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWSIZE" *) input [2:0]S02_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWVALID" *) input [0:0]S02_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BREADY" *) input [0:0]S02_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BRESP" *) output [1:0]S02_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BVALID" *) output [0:0]S02_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RDATA" *) output [511:0]S02_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RLAST" *) output [0:0]S02_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RREADY" *) input [0:0]S02_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RRESP" *) output [1:0]S02_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RVALID" *) output [0:0]S02_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WDATA" *) input [511:0]S02_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WLAST" *) input [0:0]S02_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WREADY" *) output [0:0]S02_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WSTRB" *) input [63:0]S02_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WVALID" *) input [0:0]S02_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S03_AXI, ADDR_WIDTH 28, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, DATA_WIDTH 512, FREQ_HZ 300000000, HAS_BRESP 0, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 0, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 64, NUM_READ_OUTSTANDING 32, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [63:0]S03_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARBURST" *) input [1:0]S03_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARCACHE" *) input [3:0]S03_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARLEN" *) input [7:0]S03_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARLOCK" *) input [0:0]S03_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARPROT" *) input [2:0]S03_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARQOS" *) input [3:0]S03_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARREADY" *) output [0:0]S03_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARSIZE" *) input [2:0]S03_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARVALID" *) input [0:0]S03_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWADDR" *) input [63:0]S03_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWBURST" *) input [1:0]S03_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWCACHE" *) input [3:0]S03_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWLEN" *) input [7:0]S03_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWLOCK" *) input [0:0]S03_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWPROT" *) input [2:0]S03_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWQOS" *) input [3:0]S03_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWREADY" *) output [0:0]S03_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWSIZE" *) input [2:0]S03_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWVALID" *) input [0:0]S03_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BREADY" *) input [0:0]S03_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BRESP" *) output [1:0]S03_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BVALID" *) output [0:0]S03_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RDATA" *) output [511:0]S03_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RLAST" *) output [0:0]S03_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RREADY" *) input [0:0]S03_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RRESP" *) output [1:0]S03_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RVALID" *) output [0:0]S03_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WDATA" *) input [511:0]S03_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WLAST" *) input [0:0]S03_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WREADY" *) output [0:0]S03_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WSTRB" *) input [63:0]S03_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WVALID" *) input [0:0]S03_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S04_AXI, ADDR_WIDTH 28, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, DATA_WIDTH 512, FREQ_HZ 300000000, HAS_BRESP 0, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 0, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 64, NUM_READ_OUTSTANDING 32, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [63:0]S04_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARBURST" *) input [1:0]S04_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARCACHE" *) input [3:0]S04_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARLEN" *) input [7:0]S04_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARLOCK" *) input [0:0]S04_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARPROT" *) input [2:0]S04_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARQOS" *) input [3:0]S04_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARREADY" *) output [0:0]S04_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARSIZE" *) input [2:0]S04_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARVALID" *) input [0:0]S04_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWADDR" *) input [63:0]S04_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWBURST" *) input [1:0]S04_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWCACHE" *) input [3:0]S04_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWLEN" *) input [7:0]S04_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWLOCK" *) input [0:0]S04_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWPROT" *) input [2:0]S04_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWQOS" *) input [3:0]S04_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWREADY" *) output [0:0]S04_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWSIZE" *) input [2:0]S04_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWVALID" *) input [0:0]S04_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI BREADY" *) input [0:0]S04_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI BRESP" *) output [1:0]S04_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI BVALID" *) output [0:0]S04_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RDATA" *) output [511:0]S04_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RLAST" *) output [0:0]S04_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RREADY" *) input [0:0]S04_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RRESP" *) output [1:0]S04_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RVALID" *) output [0:0]S04_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WDATA" *) input [511:0]S04_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WLAST" *) input [0:0]S04_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WREADY" *) output [0:0]S04_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WSTRB" *) input [63:0]S04_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WVALID" *) input [0:0]S04_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S05_AXI, ADDR_WIDTH 28, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, DATA_WIDTH 512, FREQ_HZ 300000000, HAS_BRESP 0, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 0, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 64, NUM_READ_OUTSTANDING 32, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [63:0]S05_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARBURST" *) input [1:0]S05_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARCACHE" *) input [3:0]S05_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARLEN" *) input [7:0]S05_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARLOCK" *) input [0:0]S05_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARPROT" *) input [2:0]S05_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARQOS" *) input [3:0]S05_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARREADY" *) output [0:0]S05_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARSIZE" *) input [2:0]S05_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARVALID" *) input [0:0]S05_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWADDR" *) input [63:0]S05_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWBURST" *) input [1:0]S05_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWCACHE" *) input [3:0]S05_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWLEN" *) input [7:0]S05_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWLOCK" *) input [0:0]S05_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWPROT" *) input [2:0]S05_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWQOS" *) input [3:0]S05_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWREADY" *) output [0:0]S05_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWSIZE" *) input [2:0]S05_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWVALID" *) input [0:0]S05_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI BREADY" *) input [0:0]S05_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI BRESP" *) output [1:0]S05_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI BVALID" *) output [0:0]S05_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RDATA" *) output [511:0]S05_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RLAST" *) output [0:0]S05_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RREADY" *) input [0:0]S05_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RRESP" *) output [1:0]S05_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RVALID" *) output [0:0]S05_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WDATA" *) input [511:0]S05_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WLAST" *) input [0:0]S05_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WREADY" *) output [0:0]S05_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WSTRB" *) input [63:0]S05_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WVALID" *) input [0:0]S05_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CTRL, ADDR_WIDTH 22, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pfm_dynamic_s_axi_aclk, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 0, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [21:0]S_AXI_CTRL_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL ARREADY" *) output [0:0]S_AXI_CTRL_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL ARVALID" *) input [0:0]S_AXI_CTRL_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL AWADDR" *) input [21:0]S_AXI_CTRL_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL AWREADY" *) output [0:0]S_AXI_CTRL_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL AWVALID" *) input [0:0]S_AXI_CTRL_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL BREADY" *) input [0:0]S_AXI_CTRL_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL BRESP" *) output [1:0]S_AXI_CTRL_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL BVALID" *) output [0:0]S_AXI_CTRL_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL RDATA" *) output [31:0]S_AXI_CTRL_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL RREADY" *) input [0:0]S_AXI_CTRL_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL RRESP" *) output [1:0]S_AXI_CTRL_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL RVALID" *) output [0:0]S_AXI_CTRL_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL WDATA" *) input [31:0]S_AXI_CTRL_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL WREADY" *) output [0:0]S_AXI_CTRL_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL WVALID" *) input [0:0]S_AXI_CTRL_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_CLKEN m_sc_aclken, CLK_DOMAIN pfm_dynamic_dma_pcie_axi_aclk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK1 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK1, ASSOCIATED_BUSIF S01_AXI:S02_AXI:S03_AXI:S04_AXI:S05_AXI, ASSOCIATED_CLKEN m_sc_aclken, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, FREQ_HZ 300000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input aclk1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN1 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN1, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input aresetn1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CTRL_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CTRL_ACLK, ASSOCIATED_BUSIF S_AXI_CTRL, ASSOCIATED_RESET ctrl_aresetn, CLK_DOMAIN pfm_dynamic_s_axi_aclk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input ctrl_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CTRL_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CTRL_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ctrl_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.HBM_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.HBM_ACLK, ASSOCIATED_CLKEN s_sc_aclken, CLK_DOMAIN pfm_dynamic_clk_out1_pfm_top_clkwiz_hbm_aclk_0, FREQ_HZ 450000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input hbm_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.HBM_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.HBM_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input hbm_aresetn;
  output hbm_mc_init_seq_complete;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.HBM_REF_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.HBM_REF_CLK, CLK_DOMAIN pfm_dynamic_hbm_ref_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input hbm_ref_clk;

  wire [6:0]DRAM_1_STAT_TEMP;
  wire DRAM_STAT_CATTRIP;
  wire [39:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [2:0]S00_AXI_arid;
  wire [7:0]S00_AXI_arlen;
  wire [0:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire [0:0]S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire [0:0]S00_AXI_arvalid;
  wire [39:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [2:0]S00_AXI_awid;
  wire [7:0]S00_AXI_awlen;
  wire [0:0]S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire [0:0]S00_AXI_awready;
  wire [2:0]S00_AXI_awsize;
  wire [0:0]S00_AXI_awvalid;
  wire [2:0]S00_AXI_bid;
  wire [0:0]S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire [0:0]S00_AXI_bvalid;
  wire [511:0]S00_AXI_rdata;
  wire [2:0]S00_AXI_rid;
  wire [0:0]S00_AXI_rlast;
  wire [0:0]S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire [0:0]S00_AXI_rvalid;
  wire [511:0]S00_AXI_wdata;
  wire [0:0]S00_AXI_wlast;
  wire [0:0]S00_AXI_wready;
  wire [63:0]S00_AXI_wstrb;
  wire [0:0]S00_AXI_wvalid;
  wire [63:0]S01_AXI_araddr;
  wire [1:0]S01_AXI_arburst;
  wire [3:0]S01_AXI_arcache;
  wire [7:0]S01_AXI_arlen;
  wire [0:0]S01_AXI_arlock;
  wire [2:0]S01_AXI_arprot;
  wire [3:0]S01_AXI_arqos;
  wire [0:0]S01_AXI_arready;
  wire [2:0]S01_AXI_arsize;
  wire [0:0]S01_AXI_arvalid;
  wire [63:0]S01_AXI_awaddr;
  wire [1:0]S01_AXI_awburst;
  wire [3:0]S01_AXI_awcache;
  wire [7:0]S01_AXI_awlen;
  wire [0:0]S01_AXI_awlock;
  wire [2:0]S01_AXI_awprot;
  wire [3:0]S01_AXI_awqos;
  wire [0:0]S01_AXI_awready;
  wire [2:0]S01_AXI_awsize;
  wire [0:0]S01_AXI_awvalid;
  wire [0:0]S01_AXI_bready;
  wire [1:0]S01_AXI_bresp;
  wire [0:0]S01_AXI_bvalid;
  wire [511:0]S01_AXI_rdata;
  wire [0:0]S01_AXI_rlast;
  wire [0:0]S01_AXI_rready;
  wire [1:0]S01_AXI_rresp;
  wire [0:0]S01_AXI_rvalid;
  wire [511:0]S01_AXI_wdata;
  wire [0:0]S01_AXI_wlast;
  wire [0:0]S01_AXI_wready;
  wire [63:0]S01_AXI_wstrb;
  wire [0:0]S01_AXI_wvalid;
  wire [63:0]S02_AXI_araddr;
  wire [1:0]S02_AXI_arburst;
  wire [3:0]S02_AXI_arcache;
  wire [7:0]S02_AXI_arlen;
  wire [0:0]S02_AXI_arlock;
  wire [2:0]S02_AXI_arprot;
  wire [3:0]S02_AXI_arqos;
  wire [0:0]S02_AXI_arready;
  wire [2:0]S02_AXI_arsize;
  wire [0:0]S02_AXI_arvalid;
  wire [63:0]S02_AXI_awaddr;
  wire [1:0]S02_AXI_awburst;
  wire [3:0]S02_AXI_awcache;
  wire [7:0]S02_AXI_awlen;
  wire [0:0]S02_AXI_awlock;
  wire [2:0]S02_AXI_awprot;
  wire [3:0]S02_AXI_awqos;
  wire [0:0]S02_AXI_awready;
  wire [2:0]S02_AXI_awsize;
  wire [0:0]S02_AXI_awvalid;
  wire [0:0]S02_AXI_bready;
  wire [1:0]S02_AXI_bresp;
  wire [0:0]S02_AXI_bvalid;
  wire [511:0]S02_AXI_rdata;
  wire [0:0]S02_AXI_rlast;
  wire [0:0]S02_AXI_rready;
  wire [1:0]S02_AXI_rresp;
  wire [0:0]S02_AXI_rvalid;
  wire [511:0]S02_AXI_wdata;
  wire [0:0]S02_AXI_wlast;
  wire [0:0]S02_AXI_wready;
  wire [63:0]S02_AXI_wstrb;
  wire [0:0]S02_AXI_wvalid;
  wire [63:0]S03_AXI_araddr;
  wire [1:0]S03_AXI_arburst;
  wire [3:0]S03_AXI_arcache;
  wire [7:0]S03_AXI_arlen;
  wire [0:0]S03_AXI_arlock;
  wire [2:0]S03_AXI_arprot;
  wire [3:0]S03_AXI_arqos;
  wire [0:0]S03_AXI_arready;
  wire [2:0]S03_AXI_arsize;
  wire [0:0]S03_AXI_arvalid;
  wire [63:0]S03_AXI_awaddr;
  wire [1:0]S03_AXI_awburst;
  wire [3:0]S03_AXI_awcache;
  wire [7:0]S03_AXI_awlen;
  wire [0:0]S03_AXI_awlock;
  wire [2:0]S03_AXI_awprot;
  wire [3:0]S03_AXI_awqos;
  wire [0:0]S03_AXI_awready;
  wire [2:0]S03_AXI_awsize;
  wire [0:0]S03_AXI_awvalid;
  wire [0:0]S03_AXI_bready;
  wire [1:0]S03_AXI_bresp;
  wire [0:0]S03_AXI_bvalid;
  wire [511:0]S03_AXI_rdata;
  wire [0:0]S03_AXI_rlast;
  wire [0:0]S03_AXI_rready;
  wire [1:0]S03_AXI_rresp;
  wire [0:0]S03_AXI_rvalid;
  wire [511:0]S03_AXI_wdata;
  wire [0:0]S03_AXI_wlast;
  wire [0:0]S03_AXI_wready;
  wire [63:0]S03_AXI_wstrb;
  wire [0:0]S03_AXI_wvalid;
  wire [63:0]S04_AXI_araddr;
  wire [1:0]S04_AXI_arburst;
  wire [3:0]S04_AXI_arcache;
  wire [7:0]S04_AXI_arlen;
  wire [0:0]S04_AXI_arlock;
  wire [2:0]S04_AXI_arprot;
  wire [3:0]S04_AXI_arqos;
  wire [0:0]S04_AXI_arready;
  wire [2:0]S04_AXI_arsize;
  wire [0:0]S04_AXI_arvalid;
  wire [63:0]S04_AXI_awaddr;
  wire [1:0]S04_AXI_awburst;
  wire [3:0]S04_AXI_awcache;
  wire [7:0]S04_AXI_awlen;
  wire [0:0]S04_AXI_awlock;
  wire [2:0]S04_AXI_awprot;
  wire [3:0]S04_AXI_awqos;
  wire [0:0]S04_AXI_awready;
  wire [2:0]S04_AXI_awsize;
  wire [0:0]S04_AXI_awvalid;
  wire [0:0]S04_AXI_bready;
  wire [1:0]S04_AXI_bresp;
  wire [0:0]S04_AXI_bvalid;
  wire [511:0]S04_AXI_rdata;
  wire [0:0]S04_AXI_rlast;
  wire [0:0]S04_AXI_rready;
  wire [1:0]S04_AXI_rresp;
  wire [0:0]S04_AXI_rvalid;
  wire [511:0]S04_AXI_wdata;
  wire [0:0]S04_AXI_wlast;
  wire [0:0]S04_AXI_wready;
  wire [63:0]S04_AXI_wstrb;
  wire [0:0]S04_AXI_wvalid;
  wire [63:0]S05_AXI_araddr;
  wire [1:0]S05_AXI_arburst;
  wire [3:0]S05_AXI_arcache;
  wire [7:0]S05_AXI_arlen;
  wire [0:0]S05_AXI_arlock;
  wire [2:0]S05_AXI_arprot;
  wire [3:0]S05_AXI_arqos;
  wire [0:0]S05_AXI_arready;
  wire [2:0]S05_AXI_arsize;
  wire [0:0]S05_AXI_arvalid;
  wire [63:0]S05_AXI_awaddr;
  wire [1:0]S05_AXI_awburst;
  wire [3:0]S05_AXI_awcache;
  wire [7:0]S05_AXI_awlen;
  wire [0:0]S05_AXI_awlock;
  wire [2:0]S05_AXI_awprot;
  wire [3:0]S05_AXI_awqos;
  wire [0:0]S05_AXI_awready;
  wire [2:0]S05_AXI_awsize;
  wire [0:0]S05_AXI_awvalid;
  wire [0:0]S05_AXI_bready;
  wire [1:0]S05_AXI_bresp;
  wire [0:0]S05_AXI_bvalid;
  wire [511:0]S05_AXI_rdata;
  wire [0:0]S05_AXI_rlast;
  wire [0:0]S05_AXI_rready;
  wire [1:0]S05_AXI_rresp;
  wire [0:0]S05_AXI_rvalid;
  wire [511:0]S05_AXI_wdata;
  wire [0:0]S05_AXI_wlast;
  wire [0:0]S05_AXI_wready;
  wire [63:0]S05_AXI_wstrb;
  wire [0:0]S05_AXI_wvalid;
  wire [21:0]S_AXI_CTRL_araddr;
  wire [0:0]S_AXI_CTRL_arready;
  wire [0:0]S_AXI_CTRL_arvalid;
  wire [21:0]S_AXI_CTRL_awaddr;
  wire [0:0]S_AXI_CTRL_awready;
  wire [0:0]S_AXI_CTRL_awvalid;
  wire [0:0]S_AXI_CTRL_bready;
  wire [1:0]S_AXI_CTRL_bresp;
  wire [0:0]S_AXI_CTRL_bvalid;
  wire [31:0]S_AXI_CTRL_rdata;
  wire [0:0]S_AXI_CTRL_rready;
  wire [1:0]S_AXI_CTRL_rresp;
  wire [0:0]S_AXI_CTRL_rvalid;
  wire [31:0]S_AXI_CTRL_wdata;
  wire [0:0]S_AXI_CTRL_wready;
  wire [0:0]S_AXI_CTRL_wvalid;
  wire aclk;
  wire aclk1;
  wire aresetn;
  wire aresetn1;
  wire [21:0]axi_apb_bridge_inst_APB_M_PADDR;
  wire axi_apb_bridge_inst_APB_M_PENABLE;
  wire [31:0]axi_apb_bridge_inst_APB_M_PRDATA;
  wire axi_apb_bridge_inst_APB_M_PREADY;
  wire axi_apb_bridge_inst_APB_M_PSEL;
  wire axi_apb_bridge_inst_APB_M_PSLVERR;
  wire [31:0]axi_apb_bridge_inst_APB_M_PWDATA;
  wire axi_apb_bridge_inst_APB_M_PWRITE;
  wire ctrl_aclk;
  wire ctrl_aresetn;
  wire hbm_aclk;
  wire hbm_aresetn;
  wire hbm_inst_apb_complete_0;
  wire hbm_mc_init_seq_complete;
  wire hbm_ref_clk;
  wire hbm_reset_sync_SLR0_interconnect_aresetn;
  wire hbm_reset_sync_SLR2_interconnect_aresetn;
  wire [32:0]slice0_6_M_AXI_ARADDR;
  wire [1:0]slice0_6_M_AXI_ARBURST;
  wire [3:0]slice0_6_M_AXI_ARCACHE;
  wire [3:0]slice0_6_M_AXI_ARLEN;
  wire [1:0]slice0_6_M_AXI_ARLOCK;
  wire [2:0]slice0_6_M_AXI_ARPROT;
  wire [3:0]slice0_6_M_AXI_ARQOS;
  wire slice0_6_M_AXI_ARREADY;
  wire slice0_6_M_AXI_ARVALID;
  wire [32:0]slice0_6_M_AXI_AWADDR;
  wire [1:0]slice0_6_M_AXI_AWBURST;
  wire [3:0]slice0_6_M_AXI_AWCACHE;
  wire [3:0]slice0_6_M_AXI_AWLEN;
  wire [1:0]slice0_6_M_AXI_AWLOCK;
  wire [2:0]slice0_6_M_AXI_AWPROT;
  wire [3:0]slice0_6_M_AXI_AWQOS;
  wire slice0_6_M_AXI_AWREADY;
  wire slice0_6_M_AXI_AWVALID;
  wire slice0_6_M_AXI_BREADY;
  wire [1:0]slice0_6_M_AXI_BRESP;
  wire slice0_6_M_AXI_BVALID;
  wire [255:0]slice0_6_M_AXI_RDATA;
  wire slice0_6_M_AXI_RLAST;
  wire slice0_6_M_AXI_RREADY;
  wire [1:0]slice0_6_M_AXI_RRESP;
  wire slice0_6_M_AXI_RVALID;
  wire [255:0]slice0_6_M_AXI_WDATA;
  wire slice0_6_M_AXI_WLAST;
  wire slice0_6_M_AXI_WREADY;
  wire [31:0]slice0_6_M_AXI_WSTRB;
  wire slice0_6_M_AXI_WVALID;
  wire [32:0]slice1_0_M_AXI_ARADDR;
  wire [1:0]slice1_0_M_AXI_ARBURST;
  wire [3:0]slice1_0_M_AXI_ARCACHE;
  wire [3:0]slice1_0_M_AXI_ARLEN;
  wire [1:0]slice1_0_M_AXI_ARLOCK;
  wire [2:0]slice1_0_M_AXI_ARPROT;
  wire [3:0]slice1_0_M_AXI_ARQOS;
  wire slice1_0_M_AXI_ARREADY;
  wire slice1_0_M_AXI_ARVALID;
  wire [32:0]slice1_0_M_AXI_AWADDR;
  wire [1:0]slice1_0_M_AXI_AWBURST;
  wire [3:0]slice1_0_M_AXI_AWCACHE;
  wire [3:0]slice1_0_M_AXI_AWLEN;
  wire [1:0]slice1_0_M_AXI_AWLOCK;
  wire [2:0]slice1_0_M_AXI_AWPROT;
  wire [3:0]slice1_0_M_AXI_AWQOS;
  wire slice1_0_M_AXI_AWREADY;
  wire slice1_0_M_AXI_AWVALID;
  wire slice1_0_M_AXI_BREADY;
  wire [1:0]slice1_0_M_AXI_BRESP;
  wire slice1_0_M_AXI_BVALID;
  wire [255:0]slice1_0_M_AXI_RDATA;
  wire slice1_0_M_AXI_RLAST;
  wire slice1_0_M_AXI_RREADY;
  wire [1:0]slice1_0_M_AXI_RRESP;
  wire slice1_0_M_AXI_RVALID;
  wire [255:0]slice1_0_M_AXI_WDATA;
  wire slice1_0_M_AXI_WLAST;
  wire slice1_0_M_AXI_WREADY;
  wire [31:0]slice1_0_M_AXI_WSTRB;
  wire slice1_0_M_AXI_WVALID;
  wire [32:0]slice2_1_M_AXI_ARADDR;
  wire [1:0]slice2_1_M_AXI_ARBURST;
  wire [3:0]slice2_1_M_AXI_ARCACHE;
  wire [3:0]slice2_1_M_AXI_ARLEN;
  wire [1:0]slice2_1_M_AXI_ARLOCK;
  wire [2:0]slice2_1_M_AXI_ARPROT;
  wire [3:0]slice2_1_M_AXI_ARQOS;
  wire slice2_1_M_AXI_ARREADY;
  wire slice2_1_M_AXI_ARVALID;
  wire [32:0]slice2_1_M_AXI_AWADDR;
  wire [1:0]slice2_1_M_AXI_AWBURST;
  wire [3:0]slice2_1_M_AXI_AWCACHE;
  wire [3:0]slice2_1_M_AXI_AWLEN;
  wire [1:0]slice2_1_M_AXI_AWLOCK;
  wire [2:0]slice2_1_M_AXI_AWPROT;
  wire [3:0]slice2_1_M_AXI_AWQOS;
  wire slice2_1_M_AXI_AWREADY;
  wire slice2_1_M_AXI_AWVALID;
  wire slice2_1_M_AXI_BREADY;
  wire [1:0]slice2_1_M_AXI_BRESP;
  wire slice2_1_M_AXI_BVALID;
  wire [255:0]slice2_1_M_AXI_RDATA;
  wire slice2_1_M_AXI_RLAST;
  wire slice2_1_M_AXI_RREADY;
  wire [1:0]slice2_1_M_AXI_RRESP;
  wire slice2_1_M_AXI_RVALID;
  wire [255:0]slice2_1_M_AXI_WDATA;
  wire slice2_1_M_AXI_WLAST;
  wire slice2_1_M_AXI_WREADY;
  wire [31:0]slice2_1_M_AXI_WSTRB;
  wire slice2_1_M_AXI_WVALID;
  wire [32:0]slice3_2_M_AXI_ARADDR;
  wire [1:0]slice3_2_M_AXI_ARBURST;
  wire [3:0]slice3_2_M_AXI_ARCACHE;
  wire [3:0]slice3_2_M_AXI_ARLEN;
  wire [1:0]slice3_2_M_AXI_ARLOCK;
  wire [2:0]slice3_2_M_AXI_ARPROT;
  wire [3:0]slice3_2_M_AXI_ARQOS;
  wire slice3_2_M_AXI_ARREADY;
  wire slice3_2_M_AXI_ARVALID;
  wire [32:0]slice3_2_M_AXI_AWADDR;
  wire [1:0]slice3_2_M_AXI_AWBURST;
  wire [3:0]slice3_2_M_AXI_AWCACHE;
  wire [3:0]slice3_2_M_AXI_AWLEN;
  wire [1:0]slice3_2_M_AXI_AWLOCK;
  wire [2:0]slice3_2_M_AXI_AWPROT;
  wire [3:0]slice3_2_M_AXI_AWQOS;
  wire slice3_2_M_AXI_AWREADY;
  wire slice3_2_M_AXI_AWVALID;
  wire slice3_2_M_AXI_BREADY;
  wire [1:0]slice3_2_M_AXI_BRESP;
  wire slice3_2_M_AXI_BVALID;
  wire [255:0]slice3_2_M_AXI_RDATA;
  wire slice3_2_M_AXI_RLAST;
  wire slice3_2_M_AXI_RREADY;
  wire [1:0]slice3_2_M_AXI_RRESP;
  wire slice3_2_M_AXI_RVALID;
  wire [255:0]slice3_2_M_AXI_WDATA;
  wire slice3_2_M_AXI_WLAST;
  wire slice3_2_M_AXI_WREADY;
  wire [31:0]slice3_2_M_AXI_WSTRB;
  wire slice3_2_M_AXI_WVALID;
  wire [32:0]slice4_3_M_AXI_ARADDR;
  wire [1:0]slice4_3_M_AXI_ARBURST;
  wire [3:0]slice4_3_M_AXI_ARCACHE;
  wire [3:0]slice4_3_M_AXI_ARLEN;
  wire [1:0]slice4_3_M_AXI_ARLOCK;
  wire [2:0]slice4_3_M_AXI_ARPROT;
  wire [3:0]slice4_3_M_AXI_ARQOS;
  wire slice4_3_M_AXI_ARREADY;
  wire slice4_3_M_AXI_ARVALID;
  wire [32:0]slice4_3_M_AXI_AWADDR;
  wire [1:0]slice4_3_M_AXI_AWBURST;
  wire [3:0]slice4_3_M_AXI_AWCACHE;
  wire [3:0]slice4_3_M_AXI_AWLEN;
  wire [1:0]slice4_3_M_AXI_AWLOCK;
  wire [2:0]slice4_3_M_AXI_AWPROT;
  wire [3:0]slice4_3_M_AXI_AWQOS;
  wire slice4_3_M_AXI_AWREADY;
  wire slice4_3_M_AXI_AWVALID;
  wire slice4_3_M_AXI_BREADY;
  wire [1:0]slice4_3_M_AXI_BRESP;
  wire slice4_3_M_AXI_BVALID;
  wire [255:0]slice4_3_M_AXI_RDATA;
  wire slice4_3_M_AXI_RLAST;
  wire slice4_3_M_AXI_RREADY;
  wire [1:0]slice4_3_M_AXI_RRESP;
  wire slice4_3_M_AXI_RVALID;
  wire [255:0]slice4_3_M_AXI_WDATA;
  wire slice4_3_M_AXI_WLAST;
  wire slice4_3_M_AXI_WREADY;
  wire [31:0]slice4_3_M_AXI_WSTRB;
  wire slice4_3_M_AXI_WVALID;
  wire [32:0]slice5_4_M_AXI_ARADDR;
  wire [1:0]slice5_4_M_AXI_ARBURST;
  wire [3:0]slice5_4_M_AXI_ARCACHE;
  wire [3:0]slice5_4_M_AXI_ARLEN;
  wire [1:0]slice5_4_M_AXI_ARLOCK;
  wire [2:0]slice5_4_M_AXI_ARPROT;
  wire [3:0]slice5_4_M_AXI_ARQOS;
  wire slice5_4_M_AXI_ARREADY;
  wire slice5_4_M_AXI_ARVALID;
  wire [32:0]slice5_4_M_AXI_AWADDR;
  wire [1:0]slice5_4_M_AXI_AWBURST;
  wire [3:0]slice5_4_M_AXI_AWCACHE;
  wire [3:0]slice5_4_M_AXI_AWLEN;
  wire [1:0]slice5_4_M_AXI_AWLOCK;
  wire [2:0]slice5_4_M_AXI_AWPROT;
  wire [3:0]slice5_4_M_AXI_AWQOS;
  wire slice5_4_M_AXI_AWREADY;
  wire slice5_4_M_AXI_AWVALID;
  wire slice5_4_M_AXI_BREADY;
  wire [1:0]slice5_4_M_AXI_BRESP;
  wire slice5_4_M_AXI_BVALID;
  wire [255:0]slice5_4_M_AXI_RDATA;
  wire slice5_4_M_AXI_RLAST;
  wire slice5_4_M_AXI_RREADY;
  wire [1:0]slice5_4_M_AXI_RRESP;
  wire slice5_4_M_AXI_RVALID;
  wire [255:0]slice5_4_M_AXI_WDATA;
  wire slice5_4_M_AXI_WLAST;
  wire slice5_4_M_AXI_WREADY;
  wire [31:0]slice5_4_M_AXI_WSTRB;
  wire slice5_4_M_AXI_WVALID;
  wire [32:0]vip_S00_M_AXI_ARADDR;
  wire [1:0]vip_S00_M_AXI_ARBURST;
  wire [3:0]vip_S00_M_AXI_ARLEN;
  wire vip_S00_M_AXI_ARREADY;
  wire vip_S00_M_AXI_ARVALID;
  wire [32:0]vip_S00_M_AXI_AWADDR;
  wire [1:0]vip_S00_M_AXI_AWBURST;
  wire [3:0]vip_S00_M_AXI_AWLEN;
  wire vip_S00_M_AXI_AWREADY;
  wire vip_S00_M_AXI_AWVALID;
  wire vip_S00_M_AXI_BREADY;
  wire [1:0]vip_S00_M_AXI_BRESP;
  wire vip_S00_M_AXI_BVALID;
  wire [255:0]vip_S00_M_AXI_RDATA;
  wire vip_S00_M_AXI_RLAST;
  wire vip_S00_M_AXI_RREADY;
  wire [1:0]vip_S00_M_AXI_RRESP;
  wire vip_S00_M_AXI_RVALID;
  wire [255:0]vip_S00_M_AXI_WDATA;
  wire vip_S00_M_AXI_WLAST;
  wire vip_S00_M_AXI_WREADY;
  wire [31:0]vip_S00_M_AXI_WSTRB;
  wire vip_S00_M_AXI_WVALID;
  wire [32:0]vip_S01_M_AXI_ARADDR;
  wire [1:0]vip_S01_M_AXI_ARBURST;
  wire [3:0]vip_S01_M_AXI_ARLEN;
  wire vip_S01_M_AXI_ARREADY;
  wire vip_S01_M_AXI_ARVALID;
  wire [32:0]vip_S01_M_AXI_AWADDR;
  wire [1:0]vip_S01_M_AXI_AWBURST;
  wire [3:0]vip_S01_M_AXI_AWLEN;
  wire vip_S01_M_AXI_AWREADY;
  wire vip_S01_M_AXI_AWVALID;
  wire vip_S01_M_AXI_BREADY;
  wire [1:0]vip_S01_M_AXI_BRESP;
  wire vip_S01_M_AXI_BVALID;
  wire [255:0]vip_S01_M_AXI_RDATA;
  wire vip_S01_M_AXI_RLAST;
  wire vip_S01_M_AXI_RREADY;
  wire [1:0]vip_S01_M_AXI_RRESP;
  wire vip_S01_M_AXI_RVALID;
  wire [255:0]vip_S01_M_AXI_WDATA;
  wire vip_S01_M_AXI_WLAST;
  wire vip_S01_M_AXI_WREADY;
  wire [31:0]vip_S01_M_AXI_WSTRB;
  wire vip_S01_M_AXI_WVALID;
  wire [32:0]vip_S02_M_AXI_ARADDR;
  wire [1:0]vip_S02_M_AXI_ARBURST;
  wire [3:0]vip_S02_M_AXI_ARLEN;
  wire vip_S02_M_AXI_ARREADY;
  wire vip_S02_M_AXI_ARVALID;
  wire [32:0]vip_S02_M_AXI_AWADDR;
  wire [1:0]vip_S02_M_AXI_AWBURST;
  wire [3:0]vip_S02_M_AXI_AWLEN;
  wire vip_S02_M_AXI_AWREADY;
  wire vip_S02_M_AXI_AWVALID;
  wire vip_S02_M_AXI_BREADY;
  wire [1:0]vip_S02_M_AXI_BRESP;
  wire vip_S02_M_AXI_BVALID;
  wire [255:0]vip_S02_M_AXI_RDATA;
  wire vip_S02_M_AXI_RLAST;
  wire vip_S02_M_AXI_RREADY;
  wire [1:0]vip_S02_M_AXI_RRESP;
  wire vip_S02_M_AXI_RVALID;
  wire [255:0]vip_S02_M_AXI_WDATA;
  wire vip_S02_M_AXI_WLAST;
  wire vip_S02_M_AXI_WREADY;
  wire [31:0]vip_S02_M_AXI_WSTRB;
  wire vip_S02_M_AXI_WVALID;
  wire [32:0]vip_S03_M_AXI_ARADDR;
  wire [1:0]vip_S03_M_AXI_ARBURST;
  wire [3:0]vip_S03_M_AXI_ARLEN;
  wire vip_S03_M_AXI_ARREADY;
  wire vip_S03_M_AXI_ARVALID;
  wire [32:0]vip_S03_M_AXI_AWADDR;
  wire [1:0]vip_S03_M_AXI_AWBURST;
  wire [3:0]vip_S03_M_AXI_AWLEN;
  wire vip_S03_M_AXI_AWREADY;
  wire vip_S03_M_AXI_AWVALID;
  wire vip_S03_M_AXI_BREADY;
  wire [1:0]vip_S03_M_AXI_BRESP;
  wire vip_S03_M_AXI_BVALID;
  wire [255:0]vip_S03_M_AXI_RDATA;
  wire vip_S03_M_AXI_RLAST;
  wire vip_S03_M_AXI_RREADY;
  wire [1:0]vip_S03_M_AXI_RRESP;
  wire vip_S03_M_AXI_RVALID;
  wire [255:0]vip_S03_M_AXI_WDATA;
  wire vip_S03_M_AXI_WLAST;
  wire vip_S03_M_AXI_WREADY;
  wire [31:0]vip_S03_M_AXI_WSTRB;
  wire vip_S03_M_AXI_WVALID;
  wire [32:0]vip_S04_M_AXI_ARADDR;
  wire [1:0]vip_S04_M_AXI_ARBURST;
  wire [3:0]vip_S04_M_AXI_ARLEN;
  wire vip_S04_M_AXI_ARREADY;
  wire vip_S04_M_AXI_ARVALID;
  wire [32:0]vip_S04_M_AXI_AWADDR;
  wire [1:0]vip_S04_M_AXI_AWBURST;
  wire [3:0]vip_S04_M_AXI_AWLEN;
  wire vip_S04_M_AXI_AWREADY;
  wire vip_S04_M_AXI_AWVALID;
  wire vip_S04_M_AXI_BREADY;
  wire [1:0]vip_S04_M_AXI_BRESP;
  wire vip_S04_M_AXI_BVALID;
  wire [255:0]vip_S04_M_AXI_RDATA;
  wire vip_S04_M_AXI_RLAST;
  wire vip_S04_M_AXI_RREADY;
  wire [1:0]vip_S04_M_AXI_RRESP;
  wire vip_S04_M_AXI_RVALID;
  wire [255:0]vip_S04_M_AXI_WDATA;
  wire vip_S04_M_AXI_WLAST;
  wire vip_S04_M_AXI_WREADY;
  wire [31:0]vip_S04_M_AXI_WSTRB;
  wire vip_S04_M_AXI_WVALID;
  wire [32:0]vip_S05_M_AXI_ARADDR;
  wire [1:0]vip_S05_M_AXI_ARBURST;
  wire [3:0]vip_S05_M_AXI_ARLEN;
  wire vip_S05_M_AXI_ARREADY;
  wire vip_S05_M_AXI_ARVALID;
  wire [32:0]vip_S05_M_AXI_AWADDR;
  wire [1:0]vip_S05_M_AXI_AWBURST;
  wire [3:0]vip_S05_M_AXI_AWLEN;
  wire vip_S05_M_AXI_AWREADY;
  wire vip_S05_M_AXI_AWVALID;
  wire vip_S05_M_AXI_BREADY;
  wire [1:0]vip_S05_M_AXI_BRESP;
  wire vip_S05_M_AXI_BVALID;
  wire [255:0]vip_S05_M_AXI_RDATA;
  wire vip_S05_M_AXI_RLAST;
  wire vip_S05_M_AXI_RREADY;
  wire [1:0]vip_S05_M_AXI_RRESP;
  wire vip_S05_M_AXI_RVALID;
  wire [255:0]vip_S05_M_AXI_WDATA;
  wire vip_S05_M_AXI_WLAST;
  wire vip_S05_M_AXI_WREADY;
  wire [31:0]vip_S05_M_AXI_WSTRB;
  wire vip_S05_M_AXI_WVALID;
  wire [5:0]NLW_hbm_inst_AXI_00_BID_UNCONNECTED;
  wire [31:0]NLW_hbm_inst_AXI_00_RDATA_PARITY_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_00_RID_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_01_BID_UNCONNECTED;
  wire [31:0]NLW_hbm_inst_AXI_01_RDATA_PARITY_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_01_RID_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_02_BID_UNCONNECTED;
  wire [31:0]NLW_hbm_inst_AXI_02_RDATA_PARITY_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_02_RID_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_03_BID_UNCONNECTED;
  wire [31:0]NLW_hbm_inst_AXI_03_RDATA_PARITY_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_03_RID_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_04_BID_UNCONNECTED;
  wire [31:0]NLW_hbm_inst_AXI_04_RDATA_PARITY_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_04_RID_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_06_BID_UNCONNECTED;
  wire [31:0]NLW_hbm_inst_AXI_06_RDATA_PARITY_UNCONNECTED;
  wire [5:0]NLW_hbm_inst_AXI_06_RID_UNCONNECTED;
  wire NLW_hbm_reset_sync_SLR0_mb_reset_UNCONNECTED;
  wire [0:0]NLW_hbm_reset_sync_SLR0_bus_struct_reset_UNCONNECTED;
  wire [0:0]NLW_hbm_reset_sync_SLR0_peripheral_aresetn_UNCONNECTED;
  wire [0:0]NLW_hbm_reset_sync_SLR0_peripheral_reset_UNCONNECTED;
  wire NLW_hbm_reset_sync_SLR2_mb_reset_UNCONNECTED;
  wire [0:0]NLW_hbm_reset_sync_SLR2_bus_struct_reset_UNCONNECTED;
  wire [0:0]NLW_hbm_reset_sync_SLR2_peripheral_aresetn_UNCONNECTED;
  wire [0:0]NLW_hbm_reset_sync_SLR2_peripheral_reset_UNCONNECTED;
  wire [3:0]NLW_vip_S00_m_axi_arcache_UNCONNECTED;
  wire [1:0]NLW_vip_S00_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_vip_S00_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_vip_S00_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_vip_S00_m_axi_awcache_UNCONNECTED;
  wire [1:0]NLW_vip_S00_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_vip_S00_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_vip_S00_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_vip_S01_m_axi_arcache_UNCONNECTED;
  wire [1:0]NLW_vip_S01_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_vip_S01_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_vip_S01_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_vip_S01_m_axi_awcache_UNCONNECTED;
  wire [1:0]NLW_vip_S01_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_vip_S01_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_vip_S01_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_vip_S02_m_axi_arcache_UNCONNECTED;
  wire [1:0]NLW_vip_S02_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_vip_S02_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_vip_S02_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_vip_S02_m_axi_awcache_UNCONNECTED;
  wire [1:0]NLW_vip_S02_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_vip_S02_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_vip_S02_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_vip_S03_m_axi_arcache_UNCONNECTED;
  wire [1:0]NLW_vip_S03_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_vip_S03_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_vip_S03_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_vip_S03_m_axi_awcache_UNCONNECTED;
  wire [1:0]NLW_vip_S03_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_vip_S03_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_vip_S03_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_vip_S04_m_axi_arcache_UNCONNECTED;
  wire [1:0]NLW_vip_S04_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_vip_S04_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_vip_S04_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_vip_S04_m_axi_awcache_UNCONNECTED;
  wire [1:0]NLW_vip_S04_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_vip_S04_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_vip_S04_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_vip_S05_m_axi_arcache_UNCONNECTED;
  wire [1:0]NLW_vip_S05_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_vip_S05_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_vip_S05_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_vip_S05_m_axi_awcache_UNCONNECTED;
  wire [1:0]NLW_vip_S05_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_vip_S05_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_vip_S05_m_axi_awqos_UNCONNECTED;

  assign DRAM_0_STAT_TEMP[6:0] = DRAM_1_STAT_TEMP;
  (* X_CORE_INFO = "axi_apb_bridge,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_axi_apb_bridge_inst_0 axi_apb_bridge_inst
       (.m_apb_paddr(axi_apb_bridge_inst_APB_M_PADDR),
        .m_apb_penable(axi_apb_bridge_inst_APB_M_PENABLE),
        .m_apb_prdata(axi_apb_bridge_inst_APB_M_PRDATA),
        .m_apb_pready(axi_apb_bridge_inst_APB_M_PREADY),
        .m_apb_psel(axi_apb_bridge_inst_APB_M_PSEL),
        .m_apb_pslverr(axi_apb_bridge_inst_APB_M_PSLVERR),
        .m_apb_pwdata(axi_apb_bridge_inst_APB_M_PWDATA),
        .m_apb_pwrite(axi_apb_bridge_inst_APB_M_PWRITE),
        .s_axi_aclk(ctrl_aclk),
        .s_axi_araddr(S_AXI_CTRL_araddr),
        .s_axi_aresetn(ctrl_aresetn),
        .s_axi_arready(S_AXI_CTRL_arready),
        .s_axi_arvalid(S_AXI_CTRL_arvalid),
        .s_axi_awaddr(S_AXI_CTRL_awaddr),
        .s_axi_awready(S_AXI_CTRL_awready),
        .s_axi_awvalid(S_AXI_CTRL_awvalid),
        .s_axi_bready(S_AXI_CTRL_bready),
        .s_axi_bresp(S_AXI_CTRL_bresp),
        .s_axi_bvalid(S_AXI_CTRL_bvalid),
        .s_axi_rdata(S_AXI_CTRL_rdata),
        .s_axi_rready(S_AXI_CTRL_rready),
        .s_axi_rresp(S_AXI_CTRL_rresp),
        .s_axi_rvalid(S_AXI_CTRL_rvalid),
        .s_axi_wdata(S_AXI_CTRL_wdata),
        .s_axi_wready(S_AXI_CTRL_wready),
        .s_axi_wvalid(S_AXI_CTRL_wvalid));
  (* X_CORE_INFO = "hbm_v1_0_11,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_hbm_inst_0 hbm_inst
       (.APB_0_PADDR(axi_apb_bridge_inst_APB_M_PADDR),
        .APB_0_PCLK(ctrl_aclk),
        .APB_0_PENABLE(axi_apb_bridge_inst_APB_M_PENABLE),
        .APB_0_PRDATA(axi_apb_bridge_inst_APB_M_PRDATA),
        .APB_0_PREADY(axi_apb_bridge_inst_APB_M_PREADY),
        .APB_0_PRESET_N(ctrl_aresetn),
        .APB_0_PSEL(axi_apb_bridge_inst_APB_M_PSEL),
        .APB_0_PSLVERR(axi_apb_bridge_inst_APB_M_PSLVERR),
        .APB_0_PWDATA(axi_apb_bridge_inst_APB_M_PWDATA),
        .APB_0_PWRITE(axi_apb_bridge_inst_APB_M_PWRITE),
        .AXI_00_ACLK(hbm_aclk),
        .AXI_00_ARADDR(vip_S01_M_AXI_ARADDR),
        .AXI_00_ARBURST(vip_S01_M_AXI_ARBURST),
        .AXI_00_ARESET_N(hbm_reset_sync_SLR0_interconnect_aresetn),
        .AXI_00_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_00_ARLEN(vip_S01_M_AXI_ARLEN),
        .AXI_00_ARREADY(vip_S01_M_AXI_ARREADY),
        .AXI_00_ARSIZE({1'b1,1'b0,1'b1}),
        .AXI_00_ARVALID(vip_S01_M_AXI_ARVALID),
        .AXI_00_AWADDR(vip_S01_M_AXI_AWADDR),
        .AXI_00_AWBURST(vip_S01_M_AXI_AWBURST),
        .AXI_00_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_00_AWLEN(vip_S01_M_AXI_AWLEN),
        .AXI_00_AWREADY(vip_S01_M_AXI_AWREADY),
        .AXI_00_AWSIZE({1'b1,1'b0,1'b1}),
        .AXI_00_AWVALID(vip_S01_M_AXI_AWVALID),
        .AXI_00_BID(NLW_hbm_inst_AXI_00_BID_UNCONNECTED[5:0]),
        .AXI_00_BREADY(vip_S01_M_AXI_BREADY),
        .AXI_00_BRESP(vip_S01_M_AXI_BRESP),
        .AXI_00_BVALID(vip_S01_M_AXI_BVALID),
        .AXI_00_RDATA(vip_S01_M_AXI_RDATA),
        .AXI_00_RDATA_PARITY(NLW_hbm_inst_AXI_00_RDATA_PARITY_UNCONNECTED[31:0]),
        .AXI_00_RID(NLW_hbm_inst_AXI_00_RID_UNCONNECTED[5:0]),
        .AXI_00_RLAST(vip_S01_M_AXI_RLAST),
        .AXI_00_RREADY(vip_S01_M_AXI_RREADY),
        .AXI_00_RRESP(vip_S01_M_AXI_RRESP),
        .AXI_00_RVALID(vip_S01_M_AXI_RVALID),
        .AXI_00_WDATA(vip_S01_M_AXI_WDATA),
        .AXI_00_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_00_WLAST(vip_S01_M_AXI_WLAST),
        .AXI_00_WREADY(vip_S01_M_AXI_WREADY),
        .AXI_00_WSTRB(vip_S01_M_AXI_WSTRB),
        .AXI_00_WVALID(vip_S01_M_AXI_WVALID),
        .AXI_01_ACLK(hbm_aclk),
        .AXI_01_ARADDR(vip_S02_M_AXI_ARADDR),
        .AXI_01_ARBURST(vip_S02_M_AXI_ARBURST),
        .AXI_01_ARESET_N(hbm_reset_sync_SLR0_interconnect_aresetn),
        .AXI_01_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_01_ARLEN(vip_S02_M_AXI_ARLEN),
        .AXI_01_ARREADY(vip_S02_M_AXI_ARREADY),
        .AXI_01_ARSIZE({1'b1,1'b0,1'b1}),
        .AXI_01_ARVALID(vip_S02_M_AXI_ARVALID),
        .AXI_01_AWADDR(vip_S02_M_AXI_AWADDR),
        .AXI_01_AWBURST(vip_S02_M_AXI_AWBURST),
        .AXI_01_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_01_AWLEN(vip_S02_M_AXI_AWLEN),
        .AXI_01_AWREADY(vip_S02_M_AXI_AWREADY),
        .AXI_01_AWSIZE({1'b1,1'b0,1'b1}),
        .AXI_01_AWVALID(vip_S02_M_AXI_AWVALID),
        .AXI_01_BID(NLW_hbm_inst_AXI_01_BID_UNCONNECTED[5:0]),
        .AXI_01_BREADY(vip_S02_M_AXI_BREADY),
        .AXI_01_BRESP(vip_S02_M_AXI_BRESP),
        .AXI_01_BVALID(vip_S02_M_AXI_BVALID),
        .AXI_01_RDATA(vip_S02_M_AXI_RDATA),
        .AXI_01_RDATA_PARITY(NLW_hbm_inst_AXI_01_RDATA_PARITY_UNCONNECTED[31:0]),
        .AXI_01_RID(NLW_hbm_inst_AXI_01_RID_UNCONNECTED[5:0]),
        .AXI_01_RLAST(vip_S02_M_AXI_RLAST),
        .AXI_01_RREADY(vip_S02_M_AXI_RREADY),
        .AXI_01_RRESP(vip_S02_M_AXI_RRESP),
        .AXI_01_RVALID(vip_S02_M_AXI_RVALID),
        .AXI_01_WDATA(vip_S02_M_AXI_WDATA),
        .AXI_01_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_01_WLAST(vip_S02_M_AXI_WLAST),
        .AXI_01_WREADY(vip_S02_M_AXI_WREADY),
        .AXI_01_WSTRB(vip_S02_M_AXI_WSTRB),
        .AXI_01_WVALID(vip_S02_M_AXI_WVALID),
        .AXI_02_ACLK(hbm_aclk),
        .AXI_02_ARADDR(vip_S03_M_AXI_ARADDR),
        .AXI_02_ARBURST(vip_S03_M_AXI_ARBURST),
        .AXI_02_ARESET_N(hbm_reset_sync_SLR0_interconnect_aresetn),
        .AXI_02_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_02_ARLEN(vip_S03_M_AXI_ARLEN),
        .AXI_02_ARREADY(vip_S03_M_AXI_ARREADY),
        .AXI_02_ARSIZE({1'b1,1'b0,1'b1}),
        .AXI_02_ARVALID(vip_S03_M_AXI_ARVALID),
        .AXI_02_AWADDR(vip_S03_M_AXI_AWADDR),
        .AXI_02_AWBURST(vip_S03_M_AXI_AWBURST),
        .AXI_02_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_02_AWLEN(vip_S03_M_AXI_AWLEN),
        .AXI_02_AWREADY(vip_S03_M_AXI_AWREADY),
        .AXI_02_AWSIZE({1'b1,1'b0,1'b1}),
        .AXI_02_AWVALID(vip_S03_M_AXI_AWVALID),
        .AXI_02_BID(NLW_hbm_inst_AXI_02_BID_UNCONNECTED[5:0]),
        .AXI_02_BREADY(vip_S03_M_AXI_BREADY),
        .AXI_02_BRESP(vip_S03_M_AXI_BRESP),
        .AXI_02_BVALID(vip_S03_M_AXI_BVALID),
        .AXI_02_RDATA(vip_S03_M_AXI_RDATA),
        .AXI_02_RDATA_PARITY(NLW_hbm_inst_AXI_02_RDATA_PARITY_UNCONNECTED[31:0]),
        .AXI_02_RID(NLW_hbm_inst_AXI_02_RID_UNCONNECTED[5:0]),
        .AXI_02_RLAST(vip_S03_M_AXI_RLAST),
        .AXI_02_RREADY(vip_S03_M_AXI_RREADY),
        .AXI_02_RRESP(vip_S03_M_AXI_RRESP),
        .AXI_02_RVALID(vip_S03_M_AXI_RVALID),
        .AXI_02_WDATA(vip_S03_M_AXI_WDATA),
        .AXI_02_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_02_WLAST(vip_S03_M_AXI_WLAST),
        .AXI_02_WREADY(vip_S03_M_AXI_WREADY),
        .AXI_02_WSTRB(vip_S03_M_AXI_WSTRB),
        .AXI_02_WVALID(vip_S03_M_AXI_WVALID),
        .AXI_03_ACLK(hbm_aclk),
        .AXI_03_ARADDR(vip_S04_M_AXI_ARADDR),
        .AXI_03_ARBURST(vip_S04_M_AXI_ARBURST),
        .AXI_03_ARESET_N(hbm_reset_sync_SLR0_interconnect_aresetn),
        .AXI_03_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_03_ARLEN(vip_S04_M_AXI_ARLEN),
        .AXI_03_ARREADY(vip_S04_M_AXI_ARREADY),
        .AXI_03_ARSIZE({1'b1,1'b0,1'b1}),
        .AXI_03_ARVALID(vip_S04_M_AXI_ARVALID),
        .AXI_03_AWADDR(vip_S04_M_AXI_AWADDR),
        .AXI_03_AWBURST(vip_S04_M_AXI_AWBURST),
        .AXI_03_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_03_AWLEN(vip_S04_M_AXI_AWLEN),
        .AXI_03_AWREADY(vip_S04_M_AXI_AWREADY),
        .AXI_03_AWSIZE({1'b1,1'b0,1'b1}),
        .AXI_03_AWVALID(vip_S04_M_AXI_AWVALID),
        .AXI_03_BID(NLW_hbm_inst_AXI_03_BID_UNCONNECTED[5:0]),
        .AXI_03_BREADY(vip_S04_M_AXI_BREADY),
        .AXI_03_BRESP(vip_S04_M_AXI_BRESP),
        .AXI_03_BVALID(vip_S04_M_AXI_BVALID),
        .AXI_03_RDATA(vip_S04_M_AXI_RDATA),
        .AXI_03_RDATA_PARITY(NLW_hbm_inst_AXI_03_RDATA_PARITY_UNCONNECTED[31:0]),
        .AXI_03_RID(NLW_hbm_inst_AXI_03_RID_UNCONNECTED[5:0]),
        .AXI_03_RLAST(vip_S04_M_AXI_RLAST),
        .AXI_03_RREADY(vip_S04_M_AXI_RREADY),
        .AXI_03_RRESP(vip_S04_M_AXI_RRESP),
        .AXI_03_RVALID(vip_S04_M_AXI_RVALID),
        .AXI_03_WDATA(vip_S04_M_AXI_WDATA),
        .AXI_03_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_03_WLAST(vip_S04_M_AXI_WLAST),
        .AXI_03_WREADY(vip_S04_M_AXI_WREADY),
        .AXI_03_WSTRB(vip_S04_M_AXI_WSTRB),
        .AXI_03_WVALID(vip_S04_M_AXI_WVALID),
        .AXI_04_ACLK(hbm_aclk),
        .AXI_04_ARADDR(vip_S05_M_AXI_ARADDR),
        .AXI_04_ARBURST(vip_S05_M_AXI_ARBURST),
        .AXI_04_ARESET_N(hbm_reset_sync_SLR0_interconnect_aresetn),
        .AXI_04_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_04_ARLEN(vip_S05_M_AXI_ARLEN),
        .AXI_04_ARREADY(vip_S05_M_AXI_ARREADY),
        .AXI_04_ARSIZE({1'b1,1'b0,1'b1}),
        .AXI_04_ARVALID(vip_S05_M_AXI_ARVALID),
        .AXI_04_AWADDR(vip_S05_M_AXI_AWADDR),
        .AXI_04_AWBURST(vip_S05_M_AXI_AWBURST),
        .AXI_04_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_04_AWLEN(vip_S05_M_AXI_AWLEN),
        .AXI_04_AWREADY(vip_S05_M_AXI_AWREADY),
        .AXI_04_AWSIZE({1'b1,1'b0,1'b1}),
        .AXI_04_AWVALID(vip_S05_M_AXI_AWVALID),
        .AXI_04_BID(NLW_hbm_inst_AXI_04_BID_UNCONNECTED[5:0]),
        .AXI_04_BREADY(vip_S05_M_AXI_BREADY),
        .AXI_04_BRESP(vip_S05_M_AXI_BRESP),
        .AXI_04_BVALID(vip_S05_M_AXI_BVALID),
        .AXI_04_RDATA(vip_S05_M_AXI_RDATA),
        .AXI_04_RDATA_PARITY(NLW_hbm_inst_AXI_04_RDATA_PARITY_UNCONNECTED[31:0]),
        .AXI_04_RID(NLW_hbm_inst_AXI_04_RID_UNCONNECTED[5:0]),
        .AXI_04_RLAST(vip_S05_M_AXI_RLAST),
        .AXI_04_RREADY(vip_S05_M_AXI_RREADY),
        .AXI_04_RRESP(vip_S05_M_AXI_RRESP),
        .AXI_04_RVALID(vip_S05_M_AXI_RVALID),
        .AXI_04_WDATA(vip_S05_M_AXI_WDATA),
        .AXI_04_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_04_WLAST(vip_S05_M_AXI_WLAST),
        .AXI_04_WREADY(vip_S05_M_AXI_WREADY),
        .AXI_04_WSTRB(vip_S05_M_AXI_WSTRB),
        .AXI_04_WVALID(vip_S05_M_AXI_WVALID),
        .AXI_06_ACLK(hbm_aclk),
        .AXI_06_ARADDR(vip_S00_M_AXI_ARADDR),
        .AXI_06_ARBURST(vip_S00_M_AXI_ARBURST),
        .AXI_06_ARESET_N(hbm_reset_sync_SLR0_interconnect_aresetn),
        .AXI_06_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_06_ARLEN(vip_S00_M_AXI_ARLEN),
        .AXI_06_ARREADY(vip_S00_M_AXI_ARREADY),
        .AXI_06_ARSIZE({1'b1,1'b0,1'b1}),
        .AXI_06_ARVALID(vip_S00_M_AXI_ARVALID),
        .AXI_06_AWADDR(vip_S00_M_AXI_AWADDR),
        .AXI_06_AWBURST(vip_S00_M_AXI_AWBURST),
        .AXI_06_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_06_AWLEN(vip_S00_M_AXI_AWLEN),
        .AXI_06_AWREADY(vip_S00_M_AXI_AWREADY),
        .AXI_06_AWSIZE({1'b1,1'b0,1'b1}),
        .AXI_06_AWVALID(vip_S00_M_AXI_AWVALID),
        .AXI_06_BID(NLW_hbm_inst_AXI_06_BID_UNCONNECTED[5:0]),
        .AXI_06_BREADY(vip_S00_M_AXI_BREADY),
        .AXI_06_BRESP(vip_S00_M_AXI_BRESP),
        .AXI_06_BVALID(vip_S00_M_AXI_BVALID),
        .AXI_06_RDATA(vip_S00_M_AXI_RDATA),
        .AXI_06_RDATA_PARITY(NLW_hbm_inst_AXI_06_RDATA_PARITY_UNCONNECTED[31:0]),
        .AXI_06_RID(NLW_hbm_inst_AXI_06_RID_UNCONNECTED[5:0]),
        .AXI_06_RLAST(vip_S00_M_AXI_RLAST),
        .AXI_06_RREADY(vip_S00_M_AXI_RREADY),
        .AXI_06_RRESP(vip_S00_M_AXI_RRESP),
        .AXI_06_RVALID(vip_S00_M_AXI_RVALID),
        .AXI_06_WDATA(vip_S00_M_AXI_WDATA),
        .AXI_06_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_06_WLAST(vip_S00_M_AXI_WLAST),
        .AXI_06_WREADY(vip_S00_M_AXI_WREADY),
        .AXI_06_WSTRB(vip_S00_M_AXI_WSTRB),
        .AXI_06_WVALID(vip_S00_M_AXI_WVALID),
        .DRAM_0_STAT_CATTRIP(DRAM_STAT_CATTRIP),
        .DRAM_0_STAT_TEMP(DRAM_1_STAT_TEMP),
        .HBM_REF_CLK_0(hbm_ref_clk),
        .apb_complete_0(hbm_inst_apb_complete_0));
  (* X_CORE_INFO = "proc_sys_reset,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_hbm_reset_sync_SLR0_0 hbm_reset_sync_SLR0
       (.aux_reset_in(DRAM_STAT_CATTRIP),
        .bus_struct_reset(NLW_hbm_reset_sync_SLR0_bus_struct_reset_UNCONNECTED[0]),
        .dcm_locked(1'b1),
        .ext_reset_in(hbm_aresetn),
        .interconnect_aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .mb_reset(NLW_hbm_reset_sync_SLR0_mb_reset_UNCONNECTED),
        .peripheral_aresetn(NLW_hbm_reset_sync_SLR0_peripheral_aresetn_UNCONNECTED[0]),
        .peripheral_reset(NLW_hbm_reset_sync_SLR0_peripheral_reset_UNCONNECTED[0]),
        .slowest_sync_clk(hbm_aclk));
  (* X_CORE_INFO = "proc_sys_reset,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_hbm_reset_sync_SLR2_0 hbm_reset_sync_SLR2
       (.aux_reset_in(DRAM_STAT_CATTRIP),
        .bus_struct_reset(NLW_hbm_reset_sync_SLR2_bus_struct_reset_UNCONNECTED[0]),
        .dcm_locked(1'b1),
        .ext_reset_in(hbm_aresetn),
        .interconnect_aresetn(hbm_reset_sync_SLR2_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .mb_reset(NLW_hbm_reset_sync_SLR2_mb_reset_UNCONNECTED),
        .peripheral_aresetn(NLW_hbm_reset_sync_SLR2_peripheral_aresetn_UNCONNECTED[0]),
        .peripheral_reset(NLW_hbm_reset_sync_SLR2_peripheral_reset_UNCONNECTED[0]),
        .slowest_sync_clk(hbm_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_init_logic_imp_156LN22 init_logic
       (.In0(hbm_inst_apb_complete_0),
        .hbm_mc_init_seq_complete(hbm_mc_init_seq_complete));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_0_imp_D0DQII path_0
       (.M_AXI_araddr(slice1_0_M_AXI_ARADDR),
        .M_AXI_arburst(slice1_0_M_AXI_ARBURST),
        .M_AXI_arcache(slice1_0_M_AXI_ARCACHE),
        .M_AXI_arlen(slice1_0_M_AXI_ARLEN),
        .M_AXI_arlock(slice1_0_M_AXI_ARLOCK),
        .M_AXI_arprot(slice1_0_M_AXI_ARPROT),
        .M_AXI_arqos(slice1_0_M_AXI_ARQOS),
        .M_AXI_arready(slice1_0_M_AXI_ARREADY),
        .M_AXI_arvalid(slice1_0_M_AXI_ARVALID),
        .M_AXI_awaddr(slice1_0_M_AXI_AWADDR),
        .M_AXI_awburst(slice1_0_M_AXI_AWBURST),
        .M_AXI_awcache(slice1_0_M_AXI_AWCACHE),
        .M_AXI_awlen(slice1_0_M_AXI_AWLEN),
        .M_AXI_awlock(slice1_0_M_AXI_AWLOCK),
        .M_AXI_awprot(slice1_0_M_AXI_AWPROT),
        .M_AXI_awqos(slice1_0_M_AXI_AWQOS),
        .M_AXI_awready(slice1_0_M_AXI_AWREADY),
        .M_AXI_awvalid(slice1_0_M_AXI_AWVALID),
        .M_AXI_bready(slice1_0_M_AXI_BREADY),
        .M_AXI_bresp(slice1_0_M_AXI_BRESP),
        .M_AXI_bvalid(slice1_0_M_AXI_BVALID),
        .M_AXI_rdata(slice1_0_M_AXI_RDATA),
        .M_AXI_rlast(slice1_0_M_AXI_RLAST),
        .M_AXI_rready(slice1_0_M_AXI_RREADY),
        .M_AXI_rresp(slice1_0_M_AXI_RRESP),
        .M_AXI_rvalid(slice1_0_M_AXI_RVALID),
        .M_AXI_wdata(slice1_0_M_AXI_WDATA),
        .M_AXI_wlast(slice1_0_M_AXI_WLAST),
        .M_AXI_wready(slice1_0_M_AXI_WREADY),
        .M_AXI_wstrb(slice1_0_M_AXI_WSTRB),
        .M_AXI_wvalid(slice1_0_M_AXI_WVALID),
        .S01_AXI_araddr(S01_AXI_araddr),
        .S01_AXI_arburst(S01_AXI_arburst),
        .S01_AXI_arcache(S01_AXI_arcache),
        .S01_AXI_arlen(S01_AXI_arlen),
        .S01_AXI_arlock(S01_AXI_arlock),
        .S01_AXI_arprot(S01_AXI_arprot),
        .S01_AXI_arqos(S01_AXI_arqos),
        .S01_AXI_arready(S01_AXI_arready),
        .S01_AXI_arsize(S01_AXI_arsize),
        .S01_AXI_arvalid(S01_AXI_arvalid),
        .S01_AXI_awaddr(S01_AXI_awaddr),
        .S01_AXI_awburst(S01_AXI_awburst),
        .S01_AXI_awcache(S01_AXI_awcache),
        .S01_AXI_awlen(S01_AXI_awlen),
        .S01_AXI_awlock(S01_AXI_awlock),
        .S01_AXI_awprot(S01_AXI_awprot),
        .S01_AXI_awqos(S01_AXI_awqos),
        .S01_AXI_awready(S01_AXI_awready),
        .S01_AXI_awsize(S01_AXI_awsize),
        .S01_AXI_awvalid(S01_AXI_awvalid),
        .S01_AXI_bready(S01_AXI_bready),
        .S01_AXI_bresp(S01_AXI_bresp),
        .S01_AXI_bvalid(S01_AXI_bvalid),
        .S01_AXI_rdata(S01_AXI_rdata),
        .S01_AXI_rlast(S01_AXI_rlast),
        .S01_AXI_rready(S01_AXI_rready),
        .S01_AXI_rresp(S01_AXI_rresp),
        .S01_AXI_rvalid(S01_AXI_rvalid),
        .S01_AXI_wdata(S01_AXI_wdata),
        .S01_AXI_wlast(S01_AXI_wlast),
        .S01_AXI_wready(S01_AXI_wready),
        .S01_AXI_wstrb(S01_AXI_wstrb),
        .S01_AXI_wvalid(S01_AXI_wvalid),
        .aclk1(aclk1),
        .aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .aresetn1(aresetn1),
        .hbm_aclk(hbm_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_1_imp_1QSHYAS path_1
       (.M_AXI_araddr(slice2_1_M_AXI_ARADDR),
        .M_AXI_arburst(slice2_1_M_AXI_ARBURST),
        .M_AXI_arcache(slice2_1_M_AXI_ARCACHE),
        .M_AXI_arlen(slice2_1_M_AXI_ARLEN),
        .M_AXI_arlock(slice2_1_M_AXI_ARLOCK),
        .M_AXI_arprot(slice2_1_M_AXI_ARPROT),
        .M_AXI_arqos(slice2_1_M_AXI_ARQOS),
        .M_AXI_arready(slice2_1_M_AXI_ARREADY),
        .M_AXI_arvalid(slice2_1_M_AXI_ARVALID),
        .M_AXI_awaddr(slice2_1_M_AXI_AWADDR),
        .M_AXI_awburst(slice2_1_M_AXI_AWBURST),
        .M_AXI_awcache(slice2_1_M_AXI_AWCACHE),
        .M_AXI_awlen(slice2_1_M_AXI_AWLEN),
        .M_AXI_awlock(slice2_1_M_AXI_AWLOCK),
        .M_AXI_awprot(slice2_1_M_AXI_AWPROT),
        .M_AXI_awqos(slice2_1_M_AXI_AWQOS),
        .M_AXI_awready(slice2_1_M_AXI_AWREADY),
        .M_AXI_awvalid(slice2_1_M_AXI_AWVALID),
        .M_AXI_bready(slice2_1_M_AXI_BREADY),
        .M_AXI_bresp(slice2_1_M_AXI_BRESP),
        .M_AXI_bvalid(slice2_1_M_AXI_BVALID),
        .M_AXI_rdata(slice2_1_M_AXI_RDATA),
        .M_AXI_rlast(slice2_1_M_AXI_RLAST),
        .M_AXI_rready(slice2_1_M_AXI_RREADY),
        .M_AXI_rresp(slice2_1_M_AXI_RRESP),
        .M_AXI_rvalid(slice2_1_M_AXI_RVALID),
        .M_AXI_wdata(slice2_1_M_AXI_WDATA),
        .M_AXI_wlast(slice2_1_M_AXI_WLAST),
        .M_AXI_wready(slice2_1_M_AXI_WREADY),
        .M_AXI_wstrb(slice2_1_M_AXI_WSTRB),
        .M_AXI_wvalid(slice2_1_M_AXI_WVALID),
        .S02_AXI_araddr(S02_AXI_araddr),
        .S02_AXI_arburst(S02_AXI_arburst),
        .S02_AXI_arcache(S02_AXI_arcache),
        .S02_AXI_arlen(S02_AXI_arlen),
        .S02_AXI_arlock(S02_AXI_arlock),
        .S02_AXI_arprot(S02_AXI_arprot),
        .S02_AXI_arqos(S02_AXI_arqos),
        .S02_AXI_arready(S02_AXI_arready),
        .S02_AXI_arsize(S02_AXI_arsize),
        .S02_AXI_arvalid(S02_AXI_arvalid),
        .S02_AXI_awaddr(S02_AXI_awaddr),
        .S02_AXI_awburst(S02_AXI_awburst),
        .S02_AXI_awcache(S02_AXI_awcache),
        .S02_AXI_awlen(S02_AXI_awlen),
        .S02_AXI_awlock(S02_AXI_awlock),
        .S02_AXI_awprot(S02_AXI_awprot),
        .S02_AXI_awqos(S02_AXI_awqos),
        .S02_AXI_awready(S02_AXI_awready),
        .S02_AXI_awsize(S02_AXI_awsize),
        .S02_AXI_awvalid(S02_AXI_awvalid),
        .S02_AXI_bready(S02_AXI_bready),
        .S02_AXI_bresp(S02_AXI_bresp),
        .S02_AXI_bvalid(S02_AXI_bvalid),
        .S02_AXI_rdata(S02_AXI_rdata),
        .S02_AXI_rlast(S02_AXI_rlast),
        .S02_AXI_rready(S02_AXI_rready),
        .S02_AXI_rresp(S02_AXI_rresp),
        .S02_AXI_rvalid(S02_AXI_rvalid),
        .S02_AXI_wdata(S02_AXI_wdata),
        .S02_AXI_wlast(S02_AXI_wlast),
        .S02_AXI_wready(S02_AXI_wready),
        .S02_AXI_wstrb(S02_AXI_wstrb),
        .S02_AXI_wvalid(S02_AXI_wvalid),
        .aclk1(aclk1),
        .aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .aresetn1(aresetn1),
        .hbm_aclk(hbm_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_2_imp_U6BEH3 path_2
       (.M_AXI_araddr(slice3_2_M_AXI_ARADDR),
        .M_AXI_arburst(slice3_2_M_AXI_ARBURST),
        .M_AXI_arcache(slice3_2_M_AXI_ARCACHE),
        .M_AXI_arlen(slice3_2_M_AXI_ARLEN),
        .M_AXI_arlock(slice3_2_M_AXI_ARLOCK),
        .M_AXI_arprot(slice3_2_M_AXI_ARPROT),
        .M_AXI_arqos(slice3_2_M_AXI_ARQOS),
        .M_AXI_arready(slice3_2_M_AXI_ARREADY),
        .M_AXI_arvalid(slice3_2_M_AXI_ARVALID),
        .M_AXI_awaddr(slice3_2_M_AXI_AWADDR),
        .M_AXI_awburst(slice3_2_M_AXI_AWBURST),
        .M_AXI_awcache(slice3_2_M_AXI_AWCACHE),
        .M_AXI_awlen(slice3_2_M_AXI_AWLEN),
        .M_AXI_awlock(slice3_2_M_AXI_AWLOCK),
        .M_AXI_awprot(slice3_2_M_AXI_AWPROT),
        .M_AXI_awqos(slice3_2_M_AXI_AWQOS),
        .M_AXI_awready(slice3_2_M_AXI_AWREADY),
        .M_AXI_awvalid(slice3_2_M_AXI_AWVALID),
        .M_AXI_bready(slice3_2_M_AXI_BREADY),
        .M_AXI_bresp(slice3_2_M_AXI_BRESP),
        .M_AXI_bvalid(slice3_2_M_AXI_BVALID),
        .M_AXI_rdata(slice3_2_M_AXI_RDATA),
        .M_AXI_rlast(slice3_2_M_AXI_RLAST),
        .M_AXI_rready(slice3_2_M_AXI_RREADY),
        .M_AXI_rresp(slice3_2_M_AXI_RRESP),
        .M_AXI_rvalid(slice3_2_M_AXI_RVALID),
        .M_AXI_wdata(slice3_2_M_AXI_WDATA),
        .M_AXI_wlast(slice3_2_M_AXI_WLAST),
        .M_AXI_wready(slice3_2_M_AXI_WREADY),
        .M_AXI_wstrb(slice3_2_M_AXI_WSTRB),
        .M_AXI_wvalid(slice3_2_M_AXI_WVALID),
        .S03_AXI_araddr(S03_AXI_araddr),
        .S03_AXI_arburst(S03_AXI_arburst),
        .S03_AXI_arcache(S03_AXI_arcache),
        .S03_AXI_arlen(S03_AXI_arlen),
        .S03_AXI_arlock(S03_AXI_arlock),
        .S03_AXI_arprot(S03_AXI_arprot),
        .S03_AXI_arqos(S03_AXI_arqos),
        .S03_AXI_arready(S03_AXI_arready),
        .S03_AXI_arsize(S03_AXI_arsize),
        .S03_AXI_arvalid(S03_AXI_arvalid),
        .S03_AXI_awaddr(S03_AXI_awaddr),
        .S03_AXI_awburst(S03_AXI_awburst),
        .S03_AXI_awcache(S03_AXI_awcache),
        .S03_AXI_awlen(S03_AXI_awlen),
        .S03_AXI_awlock(S03_AXI_awlock),
        .S03_AXI_awprot(S03_AXI_awprot),
        .S03_AXI_awqos(S03_AXI_awqos),
        .S03_AXI_awready(S03_AXI_awready),
        .S03_AXI_awsize(S03_AXI_awsize),
        .S03_AXI_awvalid(S03_AXI_awvalid),
        .S03_AXI_bready(S03_AXI_bready),
        .S03_AXI_bresp(S03_AXI_bresp),
        .S03_AXI_bvalid(S03_AXI_bvalid),
        .S03_AXI_rdata(S03_AXI_rdata),
        .S03_AXI_rlast(S03_AXI_rlast),
        .S03_AXI_rready(S03_AXI_rready),
        .S03_AXI_rresp(S03_AXI_rresp),
        .S03_AXI_rvalid(S03_AXI_rvalid),
        .S03_AXI_wdata(S03_AXI_wdata),
        .S03_AXI_wlast(S03_AXI_wlast),
        .S03_AXI_wready(S03_AXI_wready),
        .S03_AXI_wstrb(S03_AXI_wstrb),
        .S03_AXI_wvalid(S03_AXI_wvalid),
        .aclk1(aclk1),
        .aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .aresetn1(aresetn1),
        .hbm_aclk(hbm_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_3_imp_18IDHND path_3
       (.M_AXI_araddr(slice4_3_M_AXI_ARADDR),
        .M_AXI_arburst(slice4_3_M_AXI_ARBURST),
        .M_AXI_arcache(slice4_3_M_AXI_ARCACHE),
        .M_AXI_arlen(slice4_3_M_AXI_ARLEN),
        .M_AXI_arlock(slice4_3_M_AXI_ARLOCK),
        .M_AXI_arprot(slice4_3_M_AXI_ARPROT),
        .M_AXI_arqos(slice4_3_M_AXI_ARQOS),
        .M_AXI_arready(slice4_3_M_AXI_ARREADY),
        .M_AXI_arvalid(slice4_3_M_AXI_ARVALID),
        .M_AXI_awaddr(slice4_3_M_AXI_AWADDR),
        .M_AXI_awburst(slice4_3_M_AXI_AWBURST),
        .M_AXI_awcache(slice4_3_M_AXI_AWCACHE),
        .M_AXI_awlen(slice4_3_M_AXI_AWLEN),
        .M_AXI_awlock(slice4_3_M_AXI_AWLOCK),
        .M_AXI_awprot(slice4_3_M_AXI_AWPROT),
        .M_AXI_awqos(slice4_3_M_AXI_AWQOS),
        .M_AXI_awready(slice4_3_M_AXI_AWREADY),
        .M_AXI_awvalid(slice4_3_M_AXI_AWVALID),
        .M_AXI_bready(slice4_3_M_AXI_BREADY),
        .M_AXI_bresp(slice4_3_M_AXI_BRESP),
        .M_AXI_bvalid(slice4_3_M_AXI_BVALID),
        .M_AXI_rdata(slice4_3_M_AXI_RDATA),
        .M_AXI_rlast(slice4_3_M_AXI_RLAST),
        .M_AXI_rready(slice4_3_M_AXI_RREADY),
        .M_AXI_rresp(slice4_3_M_AXI_RRESP),
        .M_AXI_rvalid(slice4_3_M_AXI_RVALID),
        .M_AXI_wdata(slice4_3_M_AXI_WDATA),
        .M_AXI_wlast(slice4_3_M_AXI_WLAST),
        .M_AXI_wready(slice4_3_M_AXI_WREADY),
        .M_AXI_wstrb(slice4_3_M_AXI_WSTRB),
        .M_AXI_wvalid(slice4_3_M_AXI_WVALID),
        .S04_AXI_araddr(S04_AXI_araddr),
        .S04_AXI_arburst(S04_AXI_arburst),
        .S04_AXI_arcache(S04_AXI_arcache),
        .S04_AXI_arlen(S04_AXI_arlen),
        .S04_AXI_arlock(S04_AXI_arlock),
        .S04_AXI_arprot(S04_AXI_arprot),
        .S04_AXI_arqos(S04_AXI_arqos),
        .S04_AXI_arready(S04_AXI_arready),
        .S04_AXI_arsize(S04_AXI_arsize),
        .S04_AXI_arvalid(S04_AXI_arvalid),
        .S04_AXI_awaddr(S04_AXI_awaddr),
        .S04_AXI_awburst(S04_AXI_awburst),
        .S04_AXI_awcache(S04_AXI_awcache),
        .S04_AXI_awlen(S04_AXI_awlen),
        .S04_AXI_awlock(S04_AXI_awlock),
        .S04_AXI_awprot(S04_AXI_awprot),
        .S04_AXI_awqos(S04_AXI_awqos),
        .S04_AXI_awready(S04_AXI_awready),
        .S04_AXI_awsize(S04_AXI_awsize),
        .S04_AXI_awvalid(S04_AXI_awvalid),
        .S04_AXI_bready(S04_AXI_bready),
        .S04_AXI_bresp(S04_AXI_bresp),
        .S04_AXI_bvalid(S04_AXI_bvalid),
        .S04_AXI_rdata(S04_AXI_rdata),
        .S04_AXI_rlast(S04_AXI_rlast),
        .S04_AXI_rready(S04_AXI_rready),
        .S04_AXI_rresp(S04_AXI_rresp),
        .S04_AXI_rvalid(S04_AXI_rvalid),
        .S04_AXI_wdata(S04_AXI_wdata),
        .S04_AXI_wlast(S04_AXI_wlast),
        .S04_AXI_wready(S04_AXI_wready),
        .S04_AXI_wstrb(S04_AXI_wstrb),
        .S04_AXI_wvalid(S04_AXI_wvalid),
        .aclk1(aclk1),
        .aresetn1(aresetn1),
        .hbm_aclk(hbm_aclk),
        .interconnect_aresetn(hbm_reset_sync_SLR0_interconnect_aresetn));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_4_imp_1BCVI4G path_4
       (.M_AXI_araddr(slice5_4_M_AXI_ARADDR),
        .M_AXI_arburst(slice5_4_M_AXI_ARBURST),
        .M_AXI_arcache(slice5_4_M_AXI_ARCACHE),
        .M_AXI_arlen(slice5_4_M_AXI_ARLEN),
        .M_AXI_arlock(slice5_4_M_AXI_ARLOCK),
        .M_AXI_arprot(slice5_4_M_AXI_ARPROT),
        .M_AXI_arqos(slice5_4_M_AXI_ARQOS),
        .M_AXI_arready(slice5_4_M_AXI_ARREADY),
        .M_AXI_arvalid(slice5_4_M_AXI_ARVALID),
        .M_AXI_awaddr(slice5_4_M_AXI_AWADDR),
        .M_AXI_awburst(slice5_4_M_AXI_AWBURST),
        .M_AXI_awcache(slice5_4_M_AXI_AWCACHE),
        .M_AXI_awlen(slice5_4_M_AXI_AWLEN),
        .M_AXI_awlock(slice5_4_M_AXI_AWLOCK),
        .M_AXI_awprot(slice5_4_M_AXI_AWPROT),
        .M_AXI_awqos(slice5_4_M_AXI_AWQOS),
        .M_AXI_awready(slice5_4_M_AXI_AWREADY),
        .M_AXI_awvalid(slice5_4_M_AXI_AWVALID),
        .M_AXI_bready(slice5_4_M_AXI_BREADY),
        .M_AXI_bresp(slice5_4_M_AXI_BRESP),
        .M_AXI_bvalid(slice5_4_M_AXI_BVALID),
        .M_AXI_rdata(slice5_4_M_AXI_RDATA),
        .M_AXI_rlast(slice5_4_M_AXI_RLAST),
        .M_AXI_rready(slice5_4_M_AXI_RREADY),
        .M_AXI_rresp(slice5_4_M_AXI_RRESP),
        .M_AXI_rvalid(slice5_4_M_AXI_RVALID),
        .M_AXI_wdata(slice5_4_M_AXI_WDATA),
        .M_AXI_wlast(slice5_4_M_AXI_WLAST),
        .M_AXI_wready(slice5_4_M_AXI_WREADY),
        .M_AXI_wstrb(slice5_4_M_AXI_WSTRB),
        .M_AXI_wvalid(slice5_4_M_AXI_WVALID),
        .S05_AXI_araddr(S05_AXI_araddr),
        .S05_AXI_arburst(S05_AXI_arburst),
        .S05_AXI_arcache(S05_AXI_arcache),
        .S05_AXI_arlen(S05_AXI_arlen),
        .S05_AXI_arlock(S05_AXI_arlock),
        .S05_AXI_arprot(S05_AXI_arprot),
        .S05_AXI_arqos(S05_AXI_arqos),
        .S05_AXI_arready(S05_AXI_arready),
        .S05_AXI_arsize(S05_AXI_arsize),
        .S05_AXI_arvalid(S05_AXI_arvalid),
        .S05_AXI_awaddr(S05_AXI_awaddr),
        .S05_AXI_awburst(S05_AXI_awburst),
        .S05_AXI_awcache(S05_AXI_awcache),
        .S05_AXI_awlen(S05_AXI_awlen),
        .S05_AXI_awlock(S05_AXI_awlock),
        .S05_AXI_awprot(S05_AXI_awprot),
        .S05_AXI_awqos(S05_AXI_awqos),
        .S05_AXI_awready(S05_AXI_awready),
        .S05_AXI_awsize(S05_AXI_awsize),
        .S05_AXI_awvalid(S05_AXI_awvalid),
        .S05_AXI_bready(S05_AXI_bready),
        .S05_AXI_bresp(S05_AXI_bresp),
        .S05_AXI_bvalid(S05_AXI_bvalid),
        .S05_AXI_rdata(S05_AXI_rdata),
        .S05_AXI_rlast(S05_AXI_rlast),
        .S05_AXI_rready(S05_AXI_rready),
        .S05_AXI_rresp(S05_AXI_rresp),
        .S05_AXI_rvalid(S05_AXI_rvalid),
        .S05_AXI_wdata(S05_AXI_wdata),
        .S05_AXI_wlast(S05_AXI_wlast),
        .S05_AXI_wready(S05_AXI_wready),
        .S05_AXI_wstrb(S05_AXI_wstrb),
        .S05_AXI_wvalid(S05_AXI_wvalid),
        .aclk1(aclk1),
        .aresetn1(aresetn1),
        .hbm_aclk(hbm_aclk),
        .interconnect_aresetn(hbm_reset_sync_SLR0_interconnect_aresetn));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_6_imp_1SIT5H9 path_6
       (.M_AXI_araddr(slice0_6_M_AXI_ARADDR),
        .M_AXI_arburst(slice0_6_M_AXI_ARBURST),
        .M_AXI_arcache(slice0_6_M_AXI_ARCACHE),
        .M_AXI_arlen(slice0_6_M_AXI_ARLEN),
        .M_AXI_arlock(slice0_6_M_AXI_ARLOCK),
        .M_AXI_arprot(slice0_6_M_AXI_ARPROT),
        .M_AXI_arqos(slice0_6_M_AXI_ARQOS),
        .M_AXI_arready(slice0_6_M_AXI_ARREADY),
        .M_AXI_arvalid(slice0_6_M_AXI_ARVALID),
        .M_AXI_awaddr(slice0_6_M_AXI_AWADDR),
        .M_AXI_awburst(slice0_6_M_AXI_AWBURST),
        .M_AXI_awcache(slice0_6_M_AXI_AWCACHE),
        .M_AXI_awlen(slice0_6_M_AXI_AWLEN),
        .M_AXI_awlock(slice0_6_M_AXI_AWLOCK),
        .M_AXI_awprot(slice0_6_M_AXI_AWPROT),
        .M_AXI_awqos(slice0_6_M_AXI_AWQOS),
        .M_AXI_awready(slice0_6_M_AXI_AWREADY),
        .M_AXI_awvalid(slice0_6_M_AXI_AWVALID),
        .M_AXI_bready(slice0_6_M_AXI_BREADY),
        .M_AXI_bresp(slice0_6_M_AXI_BRESP),
        .M_AXI_bvalid(slice0_6_M_AXI_BVALID),
        .M_AXI_rdata(slice0_6_M_AXI_RDATA),
        .M_AXI_rlast(slice0_6_M_AXI_RLAST),
        .M_AXI_rready(slice0_6_M_AXI_RREADY),
        .M_AXI_rresp(slice0_6_M_AXI_RRESP),
        .M_AXI_rvalid(slice0_6_M_AXI_RVALID),
        .M_AXI_wdata(slice0_6_M_AXI_WDATA),
        .M_AXI_wlast(slice0_6_M_AXI_WLAST),
        .M_AXI_wready(slice0_6_M_AXI_WREADY),
        .M_AXI_wstrb(slice0_6_M_AXI_WSTRB),
        .M_AXI_wvalid(slice0_6_M_AXI_WVALID),
        .S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arburst(S00_AXI_arburst),
        .S00_AXI_arcache(S00_AXI_arcache),
        .S00_AXI_arid(S00_AXI_arid),
        .S00_AXI_arlen(S00_AXI_arlen),
        .S00_AXI_arlock(S00_AXI_arlock),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arqos(S00_AXI_arqos),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arsize(S00_AXI_arsize),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awburst(S00_AXI_awburst),
        .S00_AXI_awcache(S00_AXI_awcache),
        .S00_AXI_awid(S00_AXI_awid),
        .S00_AXI_awlen(S00_AXI_awlen),
        .S00_AXI_awlock(S00_AXI_awlock),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awqos(S00_AXI_awqos),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awsize(S00_AXI_awsize),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bid(S00_AXI_bid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rid(S00_AXI_rid),
        .S00_AXI_rlast(S00_AXI_rlast),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wlast(S00_AXI_wlast),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid),
        .aclk(aclk),
        .aresetn(aresetn),
        .aresetn1(hbm_reset_sync_SLR2_interconnect_aresetn),
        .hbm_aclk(hbm_aclk));
  (* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S00_0 vip_S00
       (.aclk(hbm_aclk),
        .aresetn(hbm_reset_sync_SLR2_interconnect_aresetn),
        .m_axi_araddr(vip_S00_M_AXI_ARADDR),
        .m_axi_arburst(vip_S00_M_AXI_ARBURST),
        .m_axi_arcache(NLW_vip_S00_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arlen(vip_S00_M_AXI_ARLEN),
        .m_axi_arlock(NLW_vip_S00_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_vip_S00_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_vip_S00_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(vip_S00_M_AXI_ARREADY),
        .m_axi_arvalid(vip_S00_M_AXI_ARVALID),
        .m_axi_awaddr(vip_S00_M_AXI_AWADDR),
        .m_axi_awburst(vip_S00_M_AXI_AWBURST),
        .m_axi_awcache(NLW_vip_S00_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awlen(vip_S00_M_AXI_AWLEN),
        .m_axi_awlock(NLW_vip_S00_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_vip_S00_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_vip_S00_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(vip_S00_M_AXI_AWREADY),
        .m_axi_awvalid(vip_S00_M_AXI_AWVALID),
        .m_axi_bready(vip_S00_M_AXI_BREADY),
        .m_axi_bresp(vip_S00_M_AXI_BRESP),
        .m_axi_bvalid(vip_S00_M_AXI_BVALID),
        .m_axi_rdata(vip_S00_M_AXI_RDATA),
        .m_axi_rlast(vip_S00_M_AXI_RLAST),
        .m_axi_rready(vip_S00_M_AXI_RREADY),
        .m_axi_rresp(vip_S00_M_AXI_RRESP),
        .m_axi_rvalid(vip_S00_M_AXI_RVALID),
        .m_axi_wdata(vip_S00_M_AXI_WDATA),
        .m_axi_wlast(vip_S00_M_AXI_WLAST),
        .m_axi_wready(vip_S00_M_AXI_WREADY),
        .m_axi_wstrb(vip_S00_M_AXI_WSTRB),
        .m_axi_wvalid(vip_S00_M_AXI_WVALID),
        .s_axi_araddr(slice0_6_M_AXI_ARADDR),
        .s_axi_arburst(slice0_6_M_AXI_ARBURST),
        .s_axi_arcache(slice0_6_M_AXI_ARCACHE),
        .s_axi_arlen(slice0_6_M_AXI_ARLEN),
        .s_axi_arlock(slice0_6_M_AXI_ARLOCK),
        .s_axi_arprot(slice0_6_M_AXI_ARPROT),
        .s_axi_arqos(slice0_6_M_AXI_ARQOS),
        .s_axi_arready(slice0_6_M_AXI_ARREADY),
        .s_axi_arvalid(slice0_6_M_AXI_ARVALID),
        .s_axi_awaddr(slice0_6_M_AXI_AWADDR),
        .s_axi_awburst(slice0_6_M_AXI_AWBURST),
        .s_axi_awcache(slice0_6_M_AXI_AWCACHE),
        .s_axi_awlen(slice0_6_M_AXI_AWLEN),
        .s_axi_awlock(slice0_6_M_AXI_AWLOCK),
        .s_axi_awprot(slice0_6_M_AXI_AWPROT),
        .s_axi_awqos(slice0_6_M_AXI_AWQOS),
        .s_axi_awready(slice0_6_M_AXI_AWREADY),
        .s_axi_awvalid(slice0_6_M_AXI_AWVALID),
        .s_axi_bready(slice0_6_M_AXI_BREADY),
        .s_axi_bresp(slice0_6_M_AXI_BRESP),
        .s_axi_bvalid(slice0_6_M_AXI_BVALID),
        .s_axi_rdata(slice0_6_M_AXI_RDATA),
        .s_axi_rlast(slice0_6_M_AXI_RLAST),
        .s_axi_rready(slice0_6_M_AXI_RREADY),
        .s_axi_rresp(slice0_6_M_AXI_RRESP),
        .s_axi_rvalid(slice0_6_M_AXI_RVALID),
        .s_axi_wdata(slice0_6_M_AXI_WDATA),
        .s_axi_wlast(slice0_6_M_AXI_WLAST),
        .s_axi_wready(slice0_6_M_AXI_WREADY),
        .s_axi_wstrb(slice0_6_M_AXI_WSTRB),
        .s_axi_wvalid(slice0_6_M_AXI_WVALID));
  (* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S01_0 vip_S01
       (.aclk(hbm_aclk),
        .aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .m_axi_araddr(vip_S01_M_AXI_ARADDR),
        .m_axi_arburst(vip_S01_M_AXI_ARBURST),
        .m_axi_arcache(NLW_vip_S01_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arlen(vip_S01_M_AXI_ARLEN),
        .m_axi_arlock(NLW_vip_S01_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_vip_S01_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_vip_S01_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(vip_S01_M_AXI_ARREADY),
        .m_axi_arvalid(vip_S01_M_AXI_ARVALID),
        .m_axi_awaddr(vip_S01_M_AXI_AWADDR),
        .m_axi_awburst(vip_S01_M_AXI_AWBURST),
        .m_axi_awcache(NLW_vip_S01_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awlen(vip_S01_M_AXI_AWLEN),
        .m_axi_awlock(NLW_vip_S01_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_vip_S01_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_vip_S01_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(vip_S01_M_AXI_AWREADY),
        .m_axi_awvalid(vip_S01_M_AXI_AWVALID),
        .m_axi_bready(vip_S01_M_AXI_BREADY),
        .m_axi_bresp(vip_S01_M_AXI_BRESP),
        .m_axi_bvalid(vip_S01_M_AXI_BVALID),
        .m_axi_rdata(vip_S01_M_AXI_RDATA),
        .m_axi_rlast(vip_S01_M_AXI_RLAST),
        .m_axi_rready(vip_S01_M_AXI_RREADY),
        .m_axi_rresp(vip_S01_M_AXI_RRESP),
        .m_axi_rvalid(vip_S01_M_AXI_RVALID),
        .m_axi_wdata(vip_S01_M_AXI_WDATA),
        .m_axi_wlast(vip_S01_M_AXI_WLAST),
        .m_axi_wready(vip_S01_M_AXI_WREADY),
        .m_axi_wstrb(vip_S01_M_AXI_WSTRB),
        .m_axi_wvalid(vip_S01_M_AXI_WVALID),
        .s_axi_araddr(slice1_0_M_AXI_ARADDR),
        .s_axi_arburst(slice1_0_M_AXI_ARBURST),
        .s_axi_arcache(slice1_0_M_AXI_ARCACHE),
        .s_axi_arlen(slice1_0_M_AXI_ARLEN),
        .s_axi_arlock(slice1_0_M_AXI_ARLOCK),
        .s_axi_arprot(slice1_0_M_AXI_ARPROT),
        .s_axi_arqos(slice1_0_M_AXI_ARQOS),
        .s_axi_arready(slice1_0_M_AXI_ARREADY),
        .s_axi_arvalid(slice1_0_M_AXI_ARVALID),
        .s_axi_awaddr(slice1_0_M_AXI_AWADDR),
        .s_axi_awburst(slice1_0_M_AXI_AWBURST),
        .s_axi_awcache(slice1_0_M_AXI_AWCACHE),
        .s_axi_awlen(slice1_0_M_AXI_AWLEN),
        .s_axi_awlock(slice1_0_M_AXI_AWLOCK),
        .s_axi_awprot(slice1_0_M_AXI_AWPROT),
        .s_axi_awqos(slice1_0_M_AXI_AWQOS),
        .s_axi_awready(slice1_0_M_AXI_AWREADY),
        .s_axi_awvalid(slice1_0_M_AXI_AWVALID),
        .s_axi_bready(slice1_0_M_AXI_BREADY),
        .s_axi_bresp(slice1_0_M_AXI_BRESP),
        .s_axi_bvalid(slice1_0_M_AXI_BVALID),
        .s_axi_rdata(slice1_0_M_AXI_RDATA),
        .s_axi_rlast(slice1_0_M_AXI_RLAST),
        .s_axi_rready(slice1_0_M_AXI_RREADY),
        .s_axi_rresp(slice1_0_M_AXI_RRESP),
        .s_axi_rvalid(slice1_0_M_AXI_RVALID),
        .s_axi_wdata(slice1_0_M_AXI_WDATA),
        .s_axi_wlast(slice1_0_M_AXI_WLAST),
        .s_axi_wready(slice1_0_M_AXI_WREADY),
        .s_axi_wstrb(slice1_0_M_AXI_WSTRB),
        .s_axi_wvalid(slice1_0_M_AXI_WVALID));
  (* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S02_0 vip_S02
       (.aclk(hbm_aclk),
        .aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .m_axi_araddr(vip_S02_M_AXI_ARADDR),
        .m_axi_arburst(vip_S02_M_AXI_ARBURST),
        .m_axi_arcache(NLW_vip_S02_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arlen(vip_S02_M_AXI_ARLEN),
        .m_axi_arlock(NLW_vip_S02_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_vip_S02_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_vip_S02_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(vip_S02_M_AXI_ARREADY),
        .m_axi_arvalid(vip_S02_M_AXI_ARVALID),
        .m_axi_awaddr(vip_S02_M_AXI_AWADDR),
        .m_axi_awburst(vip_S02_M_AXI_AWBURST),
        .m_axi_awcache(NLW_vip_S02_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awlen(vip_S02_M_AXI_AWLEN),
        .m_axi_awlock(NLW_vip_S02_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_vip_S02_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_vip_S02_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(vip_S02_M_AXI_AWREADY),
        .m_axi_awvalid(vip_S02_M_AXI_AWVALID),
        .m_axi_bready(vip_S02_M_AXI_BREADY),
        .m_axi_bresp(vip_S02_M_AXI_BRESP),
        .m_axi_bvalid(vip_S02_M_AXI_BVALID),
        .m_axi_rdata(vip_S02_M_AXI_RDATA),
        .m_axi_rlast(vip_S02_M_AXI_RLAST),
        .m_axi_rready(vip_S02_M_AXI_RREADY),
        .m_axi_rresp(vip_S02_M_AXI_RRESP),
        .m_axi_rvalid(vip_S02_M_AXI_RVALID),
        .m_axi_wdata(vip_S02_M_AXI_WDATA),
        .m_axi_wlast(vip_S02_M_AXI_WLAST),
        .m_axi_wready(vip_S02_M_AXI_WREADY),
        .m_axi_wstrb(vip_S02_M_AXI_WSTRB),
        .m_axi_wvalid(vip_S02_M_AXI_WVALID),
        .s_axi_araddr(slice2_1_M_AXI_ARADDR),
        .s_axi_arburst(slice2_1_M_AXI_ARBURST),
        .s_axi_arcache(slice2_1_M_AXI_ARCACHE),
        .s_axi_arlen(slice2_1_M_AXI_ARLEN),
        .s_axi_arlock(slice2_1_M_AXI_ARLOCK),
        .s_axi_arprot(slice2_1_M_AXI_ARPROT),
        .s_axi_arqos(slice2_1_M_AXI_ARQOS),
        .s_axi_arready(slice2_1_M_AXI_ARREADY),
        .s_axi_arvalid(slice2_1_M_AXI_ARVALID),
        .s_axi_awaddr(slice2_1_M_AXI_AWADDR),
        .s_axi_awburst(slice2_1_M_AXI_AWBURST),
        .s_axi_awcache(slice2_1_M_AXI_AWCACHE),
        .s_axi_awlen(slice2_1_M_AXI_AWLEN),
        .s_axi_awlock(slice2_1_M_AXI_AWLOCK),
        .s_axi_awprot(slice2_1_M_AXI_AWPROT),
        .s_axi_awqos(slice2_1_M_AXI_AWQOS),
        .s_axi_awready(slice2_1_M_AXI_AWREADY),
        .s_axi_awvalid(slice2_1_M_AXI_AWVALID),
        .s_axi_bready(slice2_1_M_AXI_BREADY),
        .s_axi_bresp(slice2_1_M_AXI_BRESP),
        .s_axi_bvalid(slice2_1_M_AXI_BVALID),
        .s_axi_rdata(slice2_1_M_AXI_RDATA),
        .s_axi_rlast(slice2_1_M_AXI_RLAST),
        .s_axi_rready(slice2_1_M_AXI_RREADY),
        .s_axi_rresp(slice2_1_M_AXI_RRESP),
        .s_axi_rvalid(slice2_1_M_AXI_RVALID),
        .s_axi_wdata(slice2_1_M_AXI_WDATA),
        .s_axi_wlast(slice2_1_M_AXI_WLAST),
        .s_axi_wready(slice2_1_M_AXI_WREADY),
        .s_axi_wstrb(slice2_1_M_AXI_WSTRB),
        .s_axi_wvalid(slice2_1_M_AXI_WVALID));
  (* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S03_0 vip_S03
       (.aclk(hbm_aclk),
        .aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .m_axi_araddr(vip_S03_M_AXI_ARADDR),
        .m_axi_arburst(vip_S03_M_AXI_ARBURST),
        .m_axi_arcache(NLW_vip_S03_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arlen(vip_S03_M_AXI_ARLEN),
        .m_axi_arlock(NLW_vip_S03_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_vip_S03_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_vip_S03_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(vip_S03_M_AXI_ARREADY),
        .m_axi_arvalid(vip_S03_M_AXI_ARVALID),
        .m_axi_awaddr(vip_S03_M_AXI_AWADDR),
        .m_axi_awburst(vip_S03_M_AXI_AWBURST),
        .m_axi_awcache(NLW_vip_S03_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awlen(vip_S03_M_AXI_AWLEN),
        .m_axi_awlock(NLW_vip_S03_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_vip_S03_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_vip_S03_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(vip_S03_M_AXI_AWREADY),
        .m_axi_awvalid(vip_S03_M_AXI_AWVALID),
        .m_axi_bready(vip_S03_M_AXI_BREADY),
        .m_axi_bresp(vip_S03_M_AXI_BRESP),
        .m_axi_bvalid(vip_S03_M_AXI_BVALID),
        .m_axi_rdata(vip_S03_M_AXI_RDATA),
        .m_axi_rlast(vip_S03_M_AXI_RLAST),
        .m_axi_rready(vip_S03_M_AXI_RREADY),
        .m_axi_rresp(vip_S03_M_AXI_RRESP),
        .m_axi_rvalid(vip_S03_M_AXI_RVALID),
        .m_axi_wdata(vip_S03_M_AXI_WDATA),
        .m_axi_wlast(vip_S03_M_AXI_WLAST),
        .m_axi_wready(vip_S03_M_AXI_WREADY),
        .m_axi_wstrb(vip_S03_M_AXI_WSTRB),
        .m_axi_wvalid(vip_S03_M_AXI_WVALID),
        .s_axi_araddr(slice3_2_M_AXI_ARADDR),
        .s_axi_arburst(slice3_2_M_AXI_ARBURST),
        .s_axi_arcache(slice3_2_M_AXI_ARCACHE),
        .s_axi_arlen(slice3_2_M_AXI_ARLEN),
        .s_axi_arlock(slice3_2_M_AXI_ARLOCK),
        .s_axi_arprot(slice3_2_M_AXI_ARPROT),
        .s_axi_arqos(slice3_2_M_AXI_ARQOS),
        .s_axi_arready(slice3_2_M_AXI_ARREADY),
        .s_axi_arvalid(slice3_2_M_AXI_ARVALID),
        .s_axi_awaddr(slice3_2_M_AXI_AWADDR),
        .s_axi_awburst(slice3_2_M_AXI_AWBURST),
        .s_axi_awcache(slice3_2_M_AXI_AWCACHE),
        .s_axi_awlen(slice3_2_M_AXI_AWLEN),
        .s_axi_awlock(slice3_2_M_AXI_AWLOCK),
        .s_axi_awprot(slice3_2_M_AXI_AWPROT),
        .s_axi_awqos(slice3_2_M_AXI_AWQOS),
        .s_axi_awready(slice3_2_M_AXI_AWREADY),
        .s_axi_awvalid(slice3_2_M_AXI_AWVALID),
        .s_axi_bready(slice3_2_M_AXI_BREADY),
        .s_axi_bresp(slice3_2_M_AXI_BRESP),
        .s_axi_bvalid(slice3_2_M_AXI_BVALID),
        .s_axi_rdata(slice3_2_M_AXI_RDATA),
        .s_axi_rlast(slice3_2_M_AXI_RLAST),
        .s_axi_rready(slice3_2_M_AXI_RREADY),
        .s_axi_rresp(slice3_2_M_AXI_RRESP),
        .s_axi_rvalid(slice3_2_M_AXI_RVALID),
        .s_axi_wdata(slice3_2_M_AXI_WDATA),
        .s_axi_wlast(slice3_2_M_AXI_WLAST),
        .s_axi_wready(slice3_2_M_AXI_WREADY),
        .s_axi_wstrb(slice3_2_M_AXI_WSTRB),
        .s_axi_wvalid(slice3_2_M_AXI_WVALID));
  (* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S04_0 vip_S04
       (.aclk(hbm_aclk),
        .aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .m_axi_araddr(vip_S04_M_AXI_ARADDR),
        .m_axi_arburst(vip_S04_M_AXI_ARBURST),
        .m_axi_arcache(NLW_vip_S04_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arlen(vip_S04_M_AXI_ARLEN),
        .m_axi_arlock(NLW_vip_S04_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_vip_S04_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_vip_S04_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(vip_S04_M_AXI_ARREADY),
        .m_axi_arvalid(vip_S04_M_AXI_ARVALID),
        .m_axi_awaddr(vip_S04_M_AXI_AWADDR),
        .m_axi_awburst(vip_S04_M_AXI_AWBURST),
        .m_axi_awcache(NLW_vip_S04_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awlen(vip_S04_M_AXI_AWLEN),
        .m_axi_awlock(NLW_vip_S04_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_vip_S04_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_vip_S04_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(vip_S04_M_AXI_AWREADY),
        .m_axi_awvalid(vip_S04_M_AXI_AWVALID),
        .m_axi_bready(vip_S04_M_AXI_BREADY),
        .m_axi_bresp(vip_S04_M_AXI_BRESP),
        .m_axi_bvalid(vip_S04_M_AXI_BVALID),
        .m_axi_rdata(vip_S04_M_AXI_RDATA),
        .m_axi_rlast(vip_S04_M_AXI_RLAST),
        .m_axi_rready(vip_S04_M_AXI_RREADY),
        .m_axi_rresp(vip_S04_M_AXI_RRESP),
        .m_axi_rvalid(vip_S04_M_AXI_RVALID),
        .m_axi_wdata(vip_S04_M_AXI_WDATA),
        .m_axi_wlast(vip_S04_M_AXI_WLAST),
        .m_axi_wready(vip_S04_M_AXI_WREADY),
        .m_axi_wstrb(vip_S04_M_AXI_WSTRB),
        .m_axi_wvalid(vip_S04_M_AXI_WVALID),
        .s_axi_araddr(slice4_3_M_AXI_ARADDR),
        .s_axi_arburst(slice4_3_M_AXI_ARBURST),
        .s_axi_arcache(slice4_3_M_AXI_ARCACHE),
        .s_axi_arlen(slice4_3_M_AXI_ARLEN),
        .s_axi_arlock(slice4_3_M_AXI_ARLOCK),
        .s_axi_arprot(slice4_3_M_AXI_ARPROT),
        .s_axi_arqos(slice4_3_M_AXI_ARQOS),
        .s_axi_arready(slice4_3_M_AXI_ARREADY),
        .s_axi_arvalid(slice4_3_M_AXI_ARVALID),
        .s_axi_awaddr(slice4_3_M_AXI_AWADDR),
        .s_axi_awburst(slice4_3_M_AXI_AWBURST),
        .s_axi_awcache(slice4_3_M_AXI_AWCACHE),
        .s_axi_awlen(slice4_3_M_AXI_AWLEN),
        .s_axi_awlock(slice4_3_M_AXI_AWLOCK),
        .s_axi_awprot(slice4_3_M_AXI_AWPROT),
        .s_axi_awqos(slice4_3_M_AXI_AWQOS),
        .s_axi_awready(slice4_3_M_AXI_AWREADY),
        .s_axi_awvalid(slice4_3_M_AXI_AWVALID),
        .s_axi_bready(slice4_3_M_AXI_BREADY),
        .s_axi_bresp(slice4_3_M_AXI_BRESP),
        .s_axi_bvalid(slice4_3_M_AXI_BVALID),
        .s_axi_rdata(slice4_3_M_AXI_RDATA),
        .s_axi_rlast(slice4_3_M_AXI_RLAST),
        .s_axi_rready(slice4_3_M_AXI_RREADY),
        .s_axi_rresp(slice4_3_M_AXI_RRESP),
        .s_axi_rvalid(slice4_3_M_AXI_RVALID),
        .s_axi_wdata(slice4_3_M_AXI_WDATA),
        .s_axi_wlast(slice4_3_M_AXI_WLAST),
        .s_axi_wready(slice4_3_M_AXI_WREADY),
        .s_axi_wstrb(slice4_3_M_AXI_WSTRB),
        .s_axi_wvalid(slice4_3_M_AXI_WVALID));
  (* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S05_0 vip_S05
       (.aclk(hbm_aclk),
        .aresetn(hbm_reset_sync_SLR0_interconnect_aresetn),
        .m_axi_araddr(vip_S05_M_AXI_ARADDR),
        .m_axi_arburst(vip_S05_M_AXI_ARBURST),
        .m_axi_arcache(NLW_vip_S05_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arlen(vip_S05_M_AXI_ARLEN),
        .m_axi_arlock(NLW_vip_S05_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_vip_S05_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_vip_S05_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(vip_S05_M_AXI_ARREADY),
        .m_axi_arvalid(vip_S05_M_AXI_ARVALID),
        .m_axi_awaddr(vip_S05_M_AXI_AWADDR),
        .m_axi_awburst(vip_S05_M_AXI_AWBURST),
        .m_axi_awcache(NLW_vip_S05_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awlen(vip_S05_M_AXI_AWLEN),
        .m_axi_awlock(NLW_vip_S05_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_vip_S05_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_vip_S05_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(vip_S05_M_AXI_AWREADY),
        .m_axi_awvalid(vip_S05_M_AXI_AWVALID),
        .m_axi_bready(vip_S05_M_AXI_BREADY),
        .m_axi_bresp(vip_S05_M_AXI_BRESP),
        .m_axi_bvalid(vip_S05_M_AXI_BVALID),
        .m_axi_rdata(vip_S05_M_AXI_RDATA),
        .m_axi_rlast(vip_S05_M_AXI_RLAST),
        .m_axi_rready(vip_S05_M_AXI_RREADY),
        .m_axi_rresp(vip_S05_M_AXI_RRESP),
        .m_axi_rvalid(vip_S05_M_AXI_RVALID),
        .m_axi_wdata(vip_S05_M_AXI_WDATA),
        .m_axi_wlast(vip_S05_M_AXI_WLAST),
        .m_axi_wready(vip_S05_M_AXI_WREADY),
        .m_axi_wstrb(vip_S05_M_AXI_WSTRB),
        .m_axi_wvalid(vip_S05_M_AXI_WVALID),
        .s_axi_araddr(slice5_4_M_AXI_ARADDR),
        .s_axi_arburst(slice5_4_M_AXI_ARBURST),
        .s_axi_arcache(slice5_4_M_AXI_ARCACHE),
        .s_axi_arlen(slice5_4_M_AXI_ARLEN),
        .s_axi_arlock(slice5_4_M_AXI_ARLOCK),
        .s_axi_arprot(slice5_4_M_AXI_ARPROT),
        .s_axi_arqos(slice5_4_M_AXI_ARQOS),
        .s_axi_arready(slice5_4_M_AXI_ARREADY),
        .s_axi_arvalid(slice5_4_M_AXI_ARVALID),
        .s_axi_awaddr(slice5_4_M_AXI_AWADDR),
        .s_axi_awburst(slice5_4_M_AXI_AWBURST),
        .s_axi_awcache(slice5_4_M_AXI_AWCACHE),
        .s_axi_awlen(slice5_4_M_AXI_AWLEN),
        .s_axi_awlock(slice5_4_M_AXI_AWLOCK),
        .s_axi_awprot(slice5_4_M_AXI_AWPROT),
        .s_axi_awqos(slice5_4_M_AXI_AWQOS),
        .s_axi_awready(slice5_4_M_AXI_AWREADY),
        .s_axi_awvalid(slice5_4_M_AXI_AWVALID),
        .s_axi_bready(slice5_4_M_AXI_BREADY),
        .s_axi_bresp(slice5_4_M_AXI_BRESP),
        .s_axi_bvalid(slice5_4_M_AXI_BVALID),
        .s_axi_rdata(slice5_4_M_AXI_RDATA),
        .s_axi_rlast(slice5_4_M_AXI_RLAST),
        .s_axi_rready(slice5_4_M_AXI_RREADY),
        .s_axi_rresp(slice5_4_M_AXI_RRESP),
        .s_axi_rvalid(slice5_4_M_AXI_RVALID),
        .s_axi_wdata(slice5_4_M_AXI_WDATA),
        .s_axi_wlast(slice5_4_M_AXI_WLAST),
        .s_axi_wready(slice5_4_M_AXI_WREADY),
        .s_axi_wstrb(slice5_4_M_AXI_WSTRB),
        .s_axi_wvalid(slice5_4_M_AXI_WVALID));
endmodule

(* X_CORE_INFO = "axi_apb_bridge,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_axi_apb_bridge_inst_0
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    m_apb_paddr,
    m_apb_psel,
    m_apb_penable,
    m_apb_pwrite,
    m_apb_pwdata,
    m_apb_pready,
    m_apb_prdata,
    m_apb_pslverr);
  input s_axi_aclk;
  input s_axi_aresetn;
  input [21:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [21:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  output [21:0]m_apb_paddr;
  output [0:0]m_apb_psel;
  output m_apb_penable;
  output m_apb_pwrite;
  output [31:0]m_apb_pwdata;
  input [0:0]m_apb_pready;
  input [31:0]m_apb_prdata;
  input [0:0]m_apb_pslverr;


endmodule

(* X_CORE_INFO = "hbm_v1_0_11,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_hbm_inst_0
   (HBM_REF_CLK_0,
    AXI_00_ACLK,
    AXI_00_ARESET_N,
    AXI_00_ARADDR,
    AXI_00_ARBURST,
    AXI_00_ARID,
    AXI_00_ARLEN,
    AXI_00_ARSIZE,
    AXI_00_ARVALID,
    AXI_00_AWADDR,
    AXI_00_AWBURST,
    AXI_00_AWID,
    AXI_00_AWLEN,
    AXI_00_AWSIZE,
    AXI_00_AWVALID,
    AXI_00_RREADY,
    AXI_00_BREADY,
    AXI_00_WDATA,
    AXI_00_WLAST,
    AXI_00_WSTRB,
    AXI_00_WDATA_PARITY,
    AXI_00_WVALID,
    AXI_01_ACLK,
    AXI_01_ARESET_N,
    AXI_01_ARADDR,
    AXI_01_ARBURST,
    AXI_01_ARID,
    AXI_01_ARLEN,
    AXI_01_ARSIZE,
    AXI_01_ARVALID,
    AXI_01_AWADDR,
    AXI_01_AWBURST,
    AXI_01_AWID,
    AXI_01_AWLEN,
    AXI_01_AWSIZE,
    AXI_01_AWVALID,
    AXI_01_RREADY,
    AXI_01_BREADY,
    AXI_01_WDATA,
    AXI_01_WLAST,
    AXI_01_WSTRB,
    AXI_01_WDATA_PARITY,
    AXI_01_WVALID,
    AXI_02_ACLK,
    AXI_02_ARESET_N,
    AXI_02_ARADDR,
    AXI_02_ARBURST,
    AXI_02_ARID,
    AXI_02_ARLEN,
    AXI_02_ARSIZE,
    AXI_02_ARVALID,
    AXI_02_AWADDR,
    AXI_02_AWBURST,
    AXI_02_AWID,
    AXI_02_AWLEN,
    AXI_02_AWSIZE,
    AXI_02_AWVALID,
    AXI_02_RREADY,
    AXI_02_BREADY,
    AXI_02_WDATA,
    AXI_02_WLAST,
    AXI_02_WSTRB,
    AXI_02_WDATA_PARITY,
    AXI_02_WVALID,
    AXI_03_ACLK,
    AXI_03_ARESET_N,
    AXI_03_ARADDR,
    AXI_03_ARBURST,
    AXI_03_ARID,
    AXI_03_ARLEN,
    AXI_03_ARSIZE,
    AXI_03_ARVALID,
    AXI_03_AWADDR,
    AXI_03_AWBURST,
    AXI_03_AWID,
    AXI_03_AWLEN,
    AXI_03_AWSIZE,
    AXI_03_AWVALID,
    AXI_03_RREADY,
    AXI_03_BREADY,
    AXI_03_WDATA,
    AXI_03_WLAST,
    AXI_03_WSTRB,
    AXI_03_WDATA_PARITY,
    AXI_03_WVALID,
    AXI_04_ACLK,
    AXI_04_ARESET_N,
    AXI_04_ARADDR,
    AXI_04_ARBURST,
    AXI_04_ARID,
    AXI_04_ARLEN,
    AXI_04_ARSIZE,
    AXI_04_ARVALID,
    AXI_04_AWADDR,
    AXI_04_AWBURST,
    AXI_04_AWID,
    AXI_04_AWLEN,
    AXI_04_AWSIZE,
    AXI_04_AWVALID,
    AXI_04_RREADY,
    AXI_04_BREADY,
    AXI_04_WDATA,
    AXI_04_WLAST,
    AXI_04_WSTRB,
    AXI_04_WDATA_PARITY,
    AXI_04_WVALID,
    AXI_06_ACLK,
    AXI_06_ARESET_N,
    AXI_06_ARADDR,
    AXI_06_ARBURST,
    AXI_06_ARID,
    AXI_06_ARLEN,
    AXI_06_ARSIZE,
    AXI_06_ARVALID,
    AXI_06_AWADDR,
    AXI_06_AWBURST,
    AXI_06_AWID,
    AXI_06_AWLEN,
    AXI_06_AWSIZE,
    AXI_06_AWVALID,
    AXI_06_RREADY,
    AXI_06_BREADY,
    AXI_06_WDATA,
    AXI_06_WLAST,
    AXI_06_WSTRB,
    AXI_06_WDATA_PARITY,
    AXI_06_WVALID,
    APB_0_PWDATA,
    APB_0_PADDR,
    APB_0_PCLK,
    APB_0_PENABLE,
    APB_0_PRESET_N,
    APB_0_PSEL,
    APB_0_PWRITE,
    AXI_00_ARREADY,
    AXI_00_AWREADY,
    AXI_00_RDATA_PARITY,
    AXI_00_RDATA,
    AXI_00_RID,
    AXI_00_RLAST,
    AXI_00_RRESP,
    AXI_00_RVALID,
    AXI_00_WREADY,
    AXI_00_BID,
    AXI_00_BRESP,
    AXI_00_BVALID,
    AXI_01_ARREADY,
    AXI_01_AWREADY,
    AXI_01_RDATA_PARITY,
    AXI_01_RDATA,
    AXI_01_RID,
    AXI_01_RLAST,
    AXI_01_RRESP,
    AXI_01_RVALID,
    AXI_01_WREADY,
    AXI_01_BID,
    AXI_01_BRESP,
    AXI_01_BVALID,
    AXI_02_ARREADY,
    AXI_02_AWREADY,
    AXI_02_RDATA_PARITY,
    AXI_02_RDATA,
    AXI_02_RID,
    AXI_02_RLAST,
    AXI_02_RRESP,
    AXI_02_RVALID,
    AXI_02_WREADY,
    AXI_02_BID,
    AXI_02_BRESP,
    AXI_02_BVALID,
    AXI_03_ARREADY,
    AXI_03_AWREADY,
    AXI_03_RDATA_PARITY,
    AXI_03_RDATA,
    AXI_03_RID,
    AXI_03_RLAST,
    AXI_03_RRESP,
    AXI_03_RVALID,
    AXI_03_WREADY,
    AXI_03_BID,
    AXI_03_BRESP,
    AXI_03_BVALID,
    AXI_04_ARREADY,
    AXI_04_AWREADY,
    AXI_04_RDATA_PARITY,
    AXI_04_RDATA,
    AXI_04_RID,
    AXI_04_RLAST,
    AXI_04_RRESP,
    AXI_04_RVALID,
    AXI_04_WREADY,
    AXI_04_BID,
    AXI_04_BRESP,
    AXI_04_BVALID,
    AXI_06_ARREADY,
    AXI_06_AWREADY,
    AXI_06_RDATA_PARITY,
    AXI_06_RDATA,
    AXI_06_RID,
    AXI_06_RLAST,
    AXI_06_RRESP,
    AXI_06_RVALID,
    AXI_06_WREADY,
    AXI_06_BID,
    AXI_06_BRESP,
    AXI_06_BVALID,
    APB_0_PRDATA,
    APB_0_PREADY,
    APB_0_PSLVERR,
    apb_complete_0,
    DRAM_0_STAT_CATTRIP,
    DRAM_0_STAT_TEMP);
  input HBM_REF_CLK_0;
  input AXI_00_ACLK;
  input AXI_00_ARESET_N;
  input [32:0]AXI_00_ARADDR;
  input [1:0]AXI_00_ARBURST;
  input [5:0]AXI_00_ARID;
  input [3:0]AXI_00_ARLEN;
  input [2:0]AXI_00_ARSIZE;
  input AXI_00_ARVALID;
  input [32:0]AXI_00_AWADDR;
  input [1:0]AXI_00_AWBURST;
  input [5:0]AXI_00_AWID;
  input [3:0]AXI_00_AWLEN;
  input [2:0]AXI_00_AWSIZE;
  input AXI_00_AWVALID;
  input AXI_00_RREADY;
  input AXI_00_BREADY;
  input [255:0]AXI_00_WDATA;
  input AXI_00_WLAST;
  input [31:0]AXI_00_WSTRB;
  input [31:0]AXI_00_WDATA_PARITY;
  input AXI_00_WVALID;
  input AXI_01_ACLK;
  input AXI_01_ARESET_N;
  input [32:0]AXI_01_ARADDR;
  input [1:0]AXI_01_ARBURST;
  input [5:0]AXI_01_ARID;
  input [3:0]AXI_01_ARLEN;
  input [2:0]AXI_01_ARSIZE;
  input AXI_01_ARVALID;
  input [32:0]AXI_01_AWADDR;
  input [1:0]AXI_01_AWBURST;
  input [5:0]AXI_01_AWID;
  input [3:0]AXI_01_AWLEN;
  input [2:0]AXI_01_AWSIZE;
  input AXI_01_AWVALID;
  input AXI_01_RREADY;
  input AXI_01_BREADY;
  input [255:0]AXI_01_WDATA;
  input AXI_01_WLAST;
  input [31:0]AXI_01_WSTRB;
  input [31:0]AXI_01_WDATA_PARITY;
  input AXI_01_WVALID;
  input AXI_02_ACLK;
  input AXI_02_ARESET_N;
  input [32:0]AXI_02_ARADDR;
  input [1:0]AXI_02_ARBURST;
  input [5:0]AXI_02_ARID;
  input [3:0]AXI_02_ARLEN;
  input [2:0]AXI_02_ARSIZE;
  input AXI_02_ARVALID;
  input [32:0]AXI_02_AWADDR;
  input [1:0]AXI_02_AWBURST;
  input [5:0]AXI_02_AWID;
  input [3:0]AXI_02_AWLEN;
  input [2:0]AXI_02_AWSIZE;
  input AXI_02_AWVALID;
  input AXI_02_RREADY;
  input AXI_02_BREADY;
  input [255:0]AXI_02_WDATA;
  input AXI_02_WLAST;
  input [31:0]AXI_02_WSTRB;
  input [31:0]AXI_02_WDATA_PARITY;
  input AXI_02_WVALID;
  input AXI_03_ACLK;
  input AXI_03_ARESET_N;
  input [32:0]AXI_03_ARADDR;
  input [1:0]AXI_03_ARBURST;
  input [5:0]AXI_03_ARID;
  input [3:0]AXI_03_ARLEN;
  input [2:0]AXI_03_ARSIZE;
  input AXI_03_ARVALID;
  input [32:0]AXI_03_AWADDR;
  input [1:0]AXI_03_AWBURST;
  input [5:0]AXI_03_AWID;
  input [3:0]AXI_03_AWLEN;
  input [2:0]AXI_03_AWSIZE;
  input AXI_03_AWVALID;
  input AXI_03_RREADY;
  input AXI_03_BREADY;
  input [255:0]AXI_03_WDATA;
  input AXI_03_WLAST;
  input [31:0]AXI_03_WSTRB;
  input [31:0]AXI_03_WDATA_PARITY;
  input AXI_03_WVALID;
  input AXI_04_ACLK;
  input AXI_04_ARESET_N;
  input [32:0]AXI_04_ARADDR;
  input [1:0]AXI_04_ARBURST;
  input [5:0]AXI_04_ARID;
  input [3:0]AXI_04_ARLEN;
  input [2:0]AXI_04_ARSIZE;
  input AXI_04_ARVALID;
  input [32:0]AXI_04_AWADDR;
  input [1:0]AXI_04_AWBURST;
  input [5:0]AXI_04_AWID;
  input [3:0]AXI_04_AWLEN;
  input [2:0]AXI_04_AWSIZE;
  input AXI_04_AWVALID;
  input AXI_04_RREADY;
  input AXI_04_BREADY;
  input [255:0]AXI_04_WDATA;
  input AXI_04_WLAST;
  input [31:0]AXI_04_WSTRB;
  input [31:0]AXI_04_WDATA_PARITY;
  input AXI_04_WVALID;
  input AXI_06_ACLK;
  input AXI_06_ARESET_N;
  input [32:0]AXI_06_ARADDR;
  input [1:0]AXI_06_ARBURST;
  input [5:0]AXI_06_ARID;
  input [3:0]AXI_06_ARLEN;
  input [2:0]AXI_06_ARSIZE;
  input AXI_06_ARVALID;
  input [32:0]AXI_06_AWADDR;
  input [1:0]AXI_06_AWBURST;
  input [5:0]AXI_06_AWID;
  input [3:0]AXI_06_AWLEN;
  input [2:0]AXI_06_AWSIZE;
  input AXI_06_AWVALID;
  input AXI_06_RREADY;
  input AXI_06_BREADY;
  input [255:0]AXI_06_WDATA;
  input AXI_06_WLAST;
  input [31:0]AXI_06_WSTRB;
  input [31:0]AXI_06_WDATA_PARITY;
  input AXI_06_WVALID;
  input [31:0]APB_0_PWDATA;
  input [21:0]APB_0_PADDR;
  input APB_0_PCLK;
  input APB_0_PENABLE;
  input APB_0_PRESET_N;
  input APB_0_PSEL;
  input APB_0_PWRITE;
  output AXI_00_ARREADY;
  output AXI_00_AWREADY;
  output [31:0]AXI_00_RDATA_PARITY;
  output [255:0]AXI_00_RDATA;
  output [5:0]AXI_00_RID;
  output AXI_00_RLAST;
  output [1:0]AXI_00_RRESP;
  output AXI_00_RVALID;
  output AXI_00_WREADY;
  output [5:0]AXI_00_BID;
  output [1:0]AXI_00_BRESP;
  output AXI_00_BVALID;
  output AXI_01_ARREADY;
  output AXI_01_AWREADY;
  output [31:0]AXI_01_RDATA_PARITY;
  output [255:0]AXI_01_RDATA;
  output [5:0]AXI_01_RID;
  output AXI_01_RLAST;
  output [1:0]AXI_01_RRESP;
  output AXI_01_RVALID;
  output AXI_01_WREADY;
  output [5:0]AXI_01_BID;
  output [1:0]AXI_01_BRESP;
  output AXI_01_BVALID;
  output AXI_02_ARREADY;
  output AXI_02_AWREADY;
  output [31:0]AXI_02_RDATA_PARITY;
  output [255:0]AXI_02_RDATA;
  output [5:0]AXI_02_RID;
  output AXI_02_RLAST;
  output [1:0]AXI_02_RRESP;
  output AXI_02_RVALID;
  output AXI_02_WREADY;
  output [5:0]AXI_02_BID;
  output [1:0]AXI_02_BRESP;
  output AXI_02_BVALID;
  output AXI_03_ARREADY;
  output AXI_03_AWREADY;
  output [31:0]AXI_03_RDATA_PARITY;
  output [255:0]AXI_03_RDATA;
  output [5:0]AXI_03_RID;
  output AXI_03_RLAST;
  output [1:0]AXI_03_RRESP;
  output AXI_03_RVALID;
  output AXI_03_WREADY;
  output [5:0]AXI_03_BID;
  output [1:0]AXI_03_BRESP;
  output AXI_03_BVALID;
  output AXI_04_ARREADY;
  output AXI_04_AWREADY;
  output [31:0]AXI_04_RDATA_PARITY;
  output [255:0]AXI_04_RDATA;
  output [5:0]AXI_04_RID;
  output AXI_04_RLAST;
  output [1:0]AXI_04_RRESP;
  output AXI_04_RVALID;
  output AXI_04_WREADY;
  output [5:0]AXI_04_BID;
  output [1:0]AXI_04_BRESP;
  output AXI_04_BVALID;
  output AXI_06_ARREADY;
  output AXI_06_AWREADY;
  output [31:0]AXI_06_RDATA_PARITY;
  output [255:0]AXI_06_RDATA;
  output [5:0]AXI_06_RID;
  output AXI_06_RLAST;
  output [1:0]AXI_06_RRESP;
  output AXI_06_RVALID;
  output AXI_06_WREADY;
  output [5:0]AXI_06_BID;
  output [1:0]AXI_06_BRESP;
  output AXI_06_BVALID;
  output [31:0]APB_0_PRDATA;
  output APB_0_PREADY;
  output APB_0_PSLVERR;
  output apb_complete_0;
  output DRAM_0_STAT_CATTRIP;
  output [6:0]DRAM_0_STAT_TEMP;


endmodule

(* X_CORE_INFO = "proc_sys_reset,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_hbm_reset_sync_SLR0_0
   (slowest_sync_clk,
    ext_reset_in,
    aux_reset_in,
    mb_debug_sys_rst,
    dcm_locked,
    mb_reset,
    bus_struct_reset,
    peripheral_reset,
    interconnect_aresetn,
    peripheral_aresetn);
  input slowest_sync_clk;
  input ext_reset_in;
  input aux_reset_in;
  input mb_debug_sys_rst;
  input dcm_locked;
  output mb_reset;
  output [0:0]bus_struct_reset;
  output [0:0]peripheral_reset;
  output [0:0]interconnect_aresetn;
  output [0:0]peripheral_aresetn;


endmodule

(* X_CORE_INFO = "proc_sys_reset,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_hbm_reset_sync_SLR2_0
   (slowest_sync_clk,
    ext_reset_in,
    aux_reset_in,
    mb_debug_sys_rst,
    dcm_locked,
    mb_reset,
    bus_struct_reset,
    peripheral_reset,
    interconnect_aresetn,
    peripheral_aresetn);
  input slowest_sync_clk;
  input ext_reset_in;
  input aux_reset_in;
  input mb_debug_sys_rst;
  input dcm_locked;
  output mb_reset;
  output [0:0]bus_struct_reset;
  output [0:0]peripheral_reset;
  output [0:0]interconnect_aresetn;
  output [0:0]peripheral_aresetn;


endmodule

(* CHECK_LICENSE_TYPE = "bd_5dca_init_concat_0,xlconcat_v2_1_4_xlconcat,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "xlconcat_v2_1_4_xlconcat,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_init_concat_0
   (In0,
    dout);
  input [0:0]In0;
  output [0:0]dout;

  wire [0:0]In0;

  assign dout[0] = In0;
endmodule

(* X_CORE_INFO = "util_reduced_logic_v2_0_4_util_reduced_logic,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_init_reduce_0
   (Op1,
    Res);
  input [0:0]Op1;
  output Res;


endmodule

(* X_CORE_INFO = "bd_b7e7,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect0_6_0
   (aclk,
    aclk1,
    aresetn,
    S00_AXI_awid,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awlock,
    S00_AXI_awcache,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awvalid,
    S00_AXI_awready,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wlast,
    S00_AXI_wvalid,
    S00_AXI_wready,
    S00_AXI_bid,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_bready,
    S00_AXI_arid,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arlock,
    S00_AXI_arcache,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arvalid,
    S00_AXI_arready,
    S00_AXI_rid,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    S00_AXI_rready,
    M00_AXI_awaddr,
    M00_AXI_awlen,
    M00_AXI_awsize,
    M00_AXI_awburst,
    M00_AXI_awlock,
    M00_AXI_awcache,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awvalid,
    M00_AXI_awready,
    M00_AXI_wdata,
    M00_AXI_wstrb,
    M00_AXI_wlast,
    M00_AXI_wvalid,
    M00_AXI_wready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_bready,
    M00_AXI_araddr,
    M00_AXI_arlen,
    M00_AXI_arsize,
    M00_AXI_arburst,
    M00_AXI_arlock,
    M00_AXI_arcache,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arvalid,
    M00_AXI_arready,
    M00_AXI_rdata,
    M00_AXI_rresp,
    M00_AXI_rlast,
    M00_AXI_rvalid,
    M00_AXI_rready);
  input aclk;
  input aclk1;
  input aresetn;
  input [2:0]S00_AXI_awid;
  input [39:0]S00_AXI_awaddr;
  input [7:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input [0:0]S00_AXI_awlock;
  input [3:0]S00_AXI_awcache;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  input S00_AXI_awvalid;
  output S00_AXI_awready;
  input [511:0]S00_AXI_wdata;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wlast;
  input S00_AXI_wvalid;
  output S00_AXI_wready;
  output [2:0]S00_AXI_bid;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  input S00_AXI_bready;
  input [2:0]S00_AXI_arid;
  input [39:0]S00_AXI_araddr;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input [0:0]S00_AXI_arlock;
  input [3:0]S00_AXI_arcache;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  input S00_AXI_arvalid;
  output S00_AXI_arready;
  output [2:0]S00_AXI_rid;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rlast;
  output S00_AXI_rvalid;
  input S00_AXI_rready;
  output [32:0]M00_AXI_awaddr;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awsize;
  output [1:0]M00_AXI_awburst;
  output [1:0]M00_AXI_awlock;
  output [3:0]M00_AXI_awcache;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  output M00_AXI_awvalid;
  input M00_AXI_awready;
  output [255:0]M00_AXI_wdata;
  output [31:0]M00_AXI_wstrb;
  output M00_AXI_wlast;
  output M00_AXI_wvalid;
  input M00_AXI_wready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output M00_AXI_bready;
  output [32:0]M00_AXI_araddr;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arsize;
  output [1:0]M00_AXI_arburst;
  output [1:0]M00_AXI_arlock;
  output [3:0]M00_AXI_arcache;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  output M00_AXI_arvalid;
  input M00_AXI_arready;
  input [255:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rlast;
  input M00_AXI_rvalid;
  output M00_AXI_rready;


endmodule

(* X_CORE_INFO = "bd_763a,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect1_0_0
   (aclk,
    aclk1,
    aresetn,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awlock,
    S00_AXI_awcache,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awvalid,
    S00_AXI_awready,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wlast,
    S00_AXI_wvalid,
    S00_AXI_wready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_bready,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arlock,
    S00_AXI_arcache,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arvalid,
    S00_AXI_arready,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    S00_AXI_rready,
    M00_AXI_awaddr,
    M00_AXI_awlen,
    M00_AXI_awsize,
    M00_AXI_awburst,
    M00_AXI_awlock,
    M00_AXI_awcache,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awvalid,
    M00_AXI_awready,
    M00_AXI_wdata,
    M00_AXI_wstrb,
    M00_AXI_wlast,
    M00_AXI_wvalid,
    M00_AXI_wready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_bready,
    M00_AXI_araddr,
    M00_AXI_arlen,
    M00_AXI_arsize,
    M00_AXI_arburst,
    M00_AXI_arlock,
    M00_AXI_arcache,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arvalid,
    M00_AXI_arready,
    M00_AXI_rdata,
    M00_AXI_rresp,
    M00_AXI_rlast,
    M00_AXI_rvalid,
    M00_AXI_rready);
  input aclk;
  input aclk1;
  input aresetn;
  input [63:0]S00_AXI_awaddr;
  input [7:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input [0:0]S00_AXI_awlock;
  input [3:0]S00_AXI_awcache;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  input S00_AXI_awvalid;
  output S00_AXI_awready;
  input [511:0]S00_AXI_wdata;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wlast;
  input S00_AXI_wvalid;
  output S00_AXI_wready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  input S00_AXI_bready;
  input [63:0]S00_AXI_araddr;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input [0:0]S00_AXI_arlock;
  input [3:0]S00_AXI_arcache;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  input S00_AXI_arvalid;
  output S00_AXI_arready;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rlast;
  output S00_AXI_rvalid;
  input S00_AXI_rready;
  output [32:0]M00_AXI_awaddr;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awsize;
  output [1:0]M00_AXI_awburst;
  output [1:0]M00_AXI_awlock;
  output [3:0]M00_AXI_awcache;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  output M00_AXI_awvalid;
  input M00_AXI_awready;
  output [255:0]M00_AXI_wdata;
  output [31:0]M00_AXI_wstrb;
  output M00_AXI_wlast;
  output M00_AXI_wvalid;
  input M00_AXI_wready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output M00_AXI_bready;
  output [32:0]M00_AXI_araddr;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arsize;
  output [1:0]M00_AXI_arburst;
  output [1:0]M00_AXI_arlock;
  output [3:0]M00_AXI_arcache;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  output M00_AXI_arvalid;
  input M00_AXI_arready;
  input [255:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rlast;
  input M00_AXI_rvalid;
  output M00_AXI_rready;


endmodule

(* X_CORE_INFO = "bd_b62f,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect2_1_0
   (aclk,
    aclk1,
    aresetn,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awlock,
    S00_AXI_awcache,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awvalid,
    S00_AXI_awready,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wlast,
    S00_AXI_wvalid,
    S00_AXI_wready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_bready,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arlock,
    S00_AXI_arcache,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arvalid,
    S00_AXI_arready,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    S00_AXI_rready,
    M00_AXI_awaddr,
    M00_AXI_awlen,
    M00_AXI_awsize,
    M00_AXI_awburst,
    M00_AXI_awlock,
    M00_AXI_awcache,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awvalid,
    M00_AXI_awready,
    M00_AXI_wdata,
    M00_AXI_wstrb,
    M00_AXI_wlast,
    M00_AXI_wvalid,
    M00_AXI_wready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_bready,
    M00_AXI_araddr,
    M00_AXI_arlen,
    M00_AXI_arsize,
    M00_AXI_arburst,
    M00_AXI_arlock,
    M00_AXI_arcache,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arvalid,
    M00_AXI_arready,
    M00_AXI_rdata,
    M00_AXI_rresp,
    M00_AXI_rlast,
    M00_AXI_rvalid,
    M00_AXI_rready);
  input aclk;
  input aclk1;
  input aresetn;
  input [63:0]S00_AXI_awaddr;
  input [7:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input [0:0]S00_AXI_awlock;
  input [3:0]S00_AXI_awcache;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  input S00_AXI_awvalid;
  output S00_AXI_awready;
  input [511:0]S00_AXI_wdata;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wlast;
  input S00_AXI_wvalid;
  output S00_AXI_wready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  input S00_AXI_bready;
  input [63:0]S00_AXI_araddr;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input [0:0]S00_AXI_arlock;
  input [3:0]S00_AXI_arcache;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  input S00_AXI_arvalid;
  output S00_AXI_arready;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rlast;
  output S00_AXI_rvalid;
  input S00_AXI_rready;
  output [32:0]M00_AXI_awaddr;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awsize;
  output [1:0]M00_AXI_awburst;
  output [1:0]M00_AXI_awlock;
  output [3:0]M00_AXI_awcache;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  output M00_AXI_awvalid;
  input M00_AXI_awready;
  output [255:0]M00_AXI_wdata;
  output [31:0]M00_AXI_wstrb;
  output M00_AXI_wlast;
  output M00_AXI_wvalid;
  input M00_AXI_wready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output M00_AXI_bready;
  output [32:0]M00_AXI_araddr;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arsize;
  output [1:0]M00_AXI_arburst;
  output [1:0]M00_AXI_arlock;
  output [3:0]M00_AXI_arcache;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  output M00_AXI_arvalid;
  input M00_AXI_arready;
  input [255:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rlast;
  input M00_AXI_rvalid;
  output M00_AXI_rready;


endmodule

(* X_CORE_INFO = "bd_76e2,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect3_2_0
   (aclk,
    aclk1,
    aresetn,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awlock,
    S00_AXI_awcache,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awvalid,
    S00_AXI_awready,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wlast,
    S00_AXI_wvalid,
    S00_AXI_wready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_bready,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arlock,
    S00_AXI_arcache,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arvalid,
    S00_AXI_arready,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    S00_AXI_rready,
    M00_AXI_awaddr,
    M00_AXI_awlen,
    M00_AXI_awsize,
    M00_AXI_awburst,
    M00_AXI_awlock,
    M00_AXI_awcache,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awvalid,
    M00_AXI_awready,
    M00_AXI_wdata,
    M00_AXI_wstrb,
    M00_AXI_wlast,
    M00_AXI_wvalid,
    M00_AXI_wready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_bready,
    M00_AXI_araddr,
    M00_AXI_arlen,
    M00_AXI_arsize,
    M00_AXI_arburst,
    M00_AXI_arlock,
    M00_AXI_arcache,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arvalid,
    M00_AXI_arready,
    M00_AXI_rdata,
    M00_AXI_rresp,
    M00_AXI_rlast,
    M00_AXI_rvalid,
    M00_AXI_rready);
  input aclk;
  input aclk1;
  input aresetn;
  input [63:0]S00_AXI_awaddr;
  input [7:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input [0:0]S00_AXI_awlock;
  input [3:0]S00_AXI_awcache;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  input S00_AXI_awvalid;
  output S00_AXI_awready;
  input [511:0]S00_AXI_wdata;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wlast;
  input S00_AXI_wvalid;
  output S00_AXI_wready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  input S00_AXI_bready;
  input [63:0]S00_AXI_araddr;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input [0:0]S00_AXI_arlock;
  input [3:0]S00_AXI_arcache;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  input S00_AXI_arvalid;
  output S00_AXI_arready;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rlast;
  output S00_AXI_rvalid;
  input S00_AXI_rready;
  output [32:0]M00_AXI_awaddr;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awsize;
  output [1:0]M00_AXI_awburst;
  output [1:0]M00_AXI_awlock;
  output [3:0]M00_AXI_awcache;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  output M00_AXI_awvalid;
  input M00_AXI_awready;
  output [255:0]M00_AXI_wdata;
  output [31:0]M00_AXI_wstrb;
  output M00_AXI_wlast;
  output M00_AXI_wvalid;
  input M00_AXI_wready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output M00_AXI_bready;
  output [32:0]M00_AXI_araddr;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arsize;
  output [1:0]M00_AXI_arburst;
  output [1:0]M00_AXI_arlock;
  output [3:0]M00_AXI_arcache;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  output M00_AXI_arvalid;
  input M00_AXI_arready;
  input [255:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rlast;
  input M00_AXI_rvalid;
  output M00_AXI_rready;


endmodule

(* X_CORE_INFO = "bd_7606,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect4_3_0
   (aclk,
    aclk1,
    aresetn,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awlock,
    S00_AXI_awcache,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awvalid,
    S00_AXI_awready,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wlast,
    S00_AXI_wvalid,
    S00_AXI_wready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_bready,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arlock,
    S00_AXI_arcache,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arvalid,
    S00_AXI_arready,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    S00_AXI_rready,
    M00_AXI_awaddr,
    M00_AXI_awlen,
    M00_AXI_awsize,
    M00_AXI_awburst,
    M00_AXI_awlock,
    M00_AXI_awcache,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awvalid,
    M00_AXI_awready,
    M00_AXI_wdata,
    M00_AXI_wstrb,
    M00_AXI_wlast,
    M00_AXI_wvalid,
    M00_AXI_wready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_bready,
    M00_AXI_araddr,
    M00_AXI_arlen,
    M00_AXI_arsize,
    M00_AXI_arburst,
    M00_AXI_arlock,
    M00_AXI_arcache,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arvalid,
    M00_AXI_arready,
    M00_AXI_rdata,
    M00_AXI_rresp,
    M00_AXI_rlast,
    M00_AXI_rvalid,
    M00_AXI_rready);
  input aclk;
  input aclk1;
  input aresetn;
  input [63:0]S00_AXI_awaddr;
  input [7:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input [0:0]S00_AXI_awlock;
  input [3:0]S00_AXI_awcache;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  input S00_AXI_awvalid;
  output S00_AXI_awready;
  input [511:0]S00_AXI_wdata;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wlast;
  input S00_AXI_wvalid;
  output S00_AXI_wready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  input S00_AXI_bready;
  input [63:0]S00_AXI_araddr;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input [0:0]S00_AXI_arlock;
  input [3:0]S00_AXI_arcache;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  input S00_AXI_arvalid;
  output S00_AXI_arready;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rlast;
  output S00_AXI_rvalid;
  input S00_AXI_rready;
  output [32:0]M00_AXI_awaddr;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awsize;
  output [1:0]M00_AXI_awburst;
  output [1:0]M00_AXI_awlock;
  output [3:0]M00_AXI_awcache;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  output M00_AXI_awvalid;
  input M00_AXI_awready;
  output [255:0]M00_AXI_wdata;
  output [31:0]M00_AXI_wstrb;
  output M00_AXI_wlast;
  output M00_AXI_wvalid;
  input M00_AXI_wready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output M00_AXI_bready;
  output [32:0]M00_AXI_araddr;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arsize;
  output [1:0]M00_AXI_arburst;
  output [1:0]M00_AXI_arlock;
  output [3:0]M00_AXI_arcache;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  output M00_AXI_arvalid;
  input M00_AXI_arready;
  input [255:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rlast;
  input M00_AXI_rvalid;
  output M00_AXI_rready;


endmodule

(* X_CORE_INFO = "bd_778a,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect5_4_0
   (aclk,
    aclk1,
    aresetn,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awlock,
    S00_AXI_awcache,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awvalid,
    S00_AXI_awready,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wlast,
    S00_AXI_wvalid,
    S00_AXI_wready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_bready,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arlock,
    S00_AXI_arcache,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arvalid,
    S00_AXI_arready,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    S00_AXI_rready,
    M00_AXI_awaddr,
    M00_AXI_awlen,
    M00_AXI_awsize,
    M00_AXI_awburst,
    M00_AXI_awlock,
    M00_AXI_awcache,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awvalid,
    M00_AXI_awready,
    M00_AXI_wdata,
    M00_AXI_wstrb,
    M00_AXI_wlast,
    M00_AXI_wvalid,
    M00_AXI_wready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_bready,
    M00_AXI_araddr,
    M00_AXI_arlen,
    M00_AXI_arsize,
    M00_AXI_arburst,
    M00_AXI_arlock,
    M00_AXI_arcache,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arvalid,
    M00_AXI_arready,
    M00_AXI_rdata,
    M00_AXI_rresp,
    M00_AXI_rlast,
    M00_AXI_rvalid,
    M00_AXI_rready);
  input aclk;
  input aclk1;
  input aresetn;
  input [63:0]S00_AXI_awaddr;
  input [7:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input [0:0]S00_AXI_awlock;
  input [3:0]S00_AXI_awcache;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  input S00_AXI_awvalid;
  output S00_AXI_awready;
  input [511:0]S00_AXI_wdata;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wlast;
  input S00_AXI_wvalid;
  output S00_AXI_wready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  input S00_AXI_bready;
  input [63:0]S00_AXI_araddr;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input [0:0]S00_AXI_arlock;
  input [3:0]S00_AXI_arcache;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  input S00_AXI_arvalid;
  output S00_AXI_arready;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rlast;
  output S00_AXI_rvalid;
  input S00_AXI_rready;
  output [32:0]M00_AXI_awaddr;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awsize;
  output [1:0]M00_AXI_awburst;
  output [1:0]M00_AXI_awlock;
  output [3:0]M00_AXI_awcache;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  output M00_AXI_awvalid;
  input M00_AXI_awready;
  output [255:0]M00_AXI_wdata;
  output [31:0]M00_AXI_wstrb;
  output M00_AXI_wlast;
  output M00_AXI_wvalid;
  input M00_AXI_wready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output M00_AXI_bready;
  output [32:0]M00_AXI_araddr;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arsize;
  output [1:0]M00_AXI_arburst;
  output [1:0]M00_AXI_arlock;
  output [3:0]M00_AXI_arcache;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  output M00_AXI_arvalid;
  input M00_AXI_arready;
  input [255:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rlast;
  input M00_AXI_rvalid;
  output M00_AXI_rready;


endmodule

(* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice0_6_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice1_0_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice2_1_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice3_2_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice4_3_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice5_4_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S00_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S01_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S02_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S03_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S04_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

(* X_CORE_INFO = "axi_vip_v1_1_11_top,Vivado 2021.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_vip_S05_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [32:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input s_axi_awvalid;
  output s_axi_awready;
  input [255:0]s_axi_wdata;
  input [31:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [32:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  output s_axi_arready;
  output [255:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [32:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  input m_axi_awready;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [32:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output m_axi_arvalid;
  input m_axi_arready;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;


endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_init_logic_imp_156LN22
   (hbm_mc_init_seq_complete,
    In0);
  output hbm_mc_init_seq_complete;
  input [0:0]In0;

  wire [0:0]In0;
  wire hbm_mc_init_seq_complete;
  wire init_concat_dout;

  (* CHECK_LICENSE_TYPE = "bd_5dca_init_concat_0,xlconcat_v2_1_4_xlconcat,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "xlconcat_v2_1_4_xlconcat,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_init_concat_0 init_concat
       (.In0(In0),
        .dout(init_concat_dout));
  (* X_CORE_INFO = "util_reduced_logic_v2_0_4_util_reduced_logic,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_init_reduce_0 init_reduce
       (.Op1(init_concat_dout),
        .Res(hbm_mc_init_seq_complete));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_0_imp_D0DQII
   (S01_AXI_awready,
    S01_AXI_wready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_arready,
    S01_AXI_rdata,
    S01_AXI_rresp,
    S01_AXI_rlast,
    S01_AXI_rvalid,
    M_AXI_awaddr,
    M_AXI_awlen,
    M_AXI_awburst,
    M_AXI_awlock,
    M_AXI_awcache,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awvalid,
    M_AXI_wdata,
    M_AXI_wstrb,
    M_AXI_wlast,
    M_AXI_wvalid,
    M_AXI_bready,
    M_AXI_araddr,
    M_AXI_arlen,
    M_AXI_arburst,
    M_AXI_arlock,
    M_AXI_arcache,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arvalid,
    M_AXI_rready,
    aclk1,
    hbm_aclk,
    aresetn1,
    S01_AXI_awaddr,
    S01_AXI_awlen,
    S01_AXI_awsize,
    S01_AXI_awburst,
    S01_AXI_awlock,
    S01_AXI_awcache,
    S01_AXI_awprot,
    S01_AXI_awqos,
    S01_AXI_awvalid,
    S01_AXI_wdata,
    S01_AXI_wstrb,
    S01_AXI_wlast,
    S01_AXI_wvalid,
    S01_AXI_bready,
    S01_AXI_araddr,
    S01_AXI_arlen,
    S01_AXI_arsize,
    S01_AXI_arburst,
    S01_AXI_arlock,
    S01_AXI_arcache,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arvalid,
    S01_AXI_rready,
    aresetn,
    M_AXI_awready,
    M_AXI_wready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_arready,
    M_AXI_rdata,
    M_AXI_rresp,
    M_AXI_rlast,
    M_AXI_rvalid);
  output [0:0]S01_AXI_awready;
  output [0:0]S01_AXI_wready;
  output [1:0]S01_AXI_bresp;
  output [0:0]S01_AXI_bvalid;
  output [0:0]S01_AXI_arready;
  output [511:0]S01_AXI_rdata;
  output [1:0]S01_AXI_rresp;
  output [0:0]S01_AXI_rlast;
  output [0:0]S01_AXI_rvalid;
  output [32:0]M_AXI_awaddr;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awburst;
  output [1:0]M_AXI_awlock;
  output [3:0]M_AXI_awcache;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  output M_AXI_awvalid;
  output [255:0]M_AXI_wdata;
  output [31:0]M_AXI_wstrb;
  output M_AXI_wlast;
  output M_AXI_wvalid;
  output M_AXI_bready;
  output [32:0]M_AXI_araddr;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arburst;
  output [1:0]M_AXI_arlock;
  output [3:0]M_AXI_arcache;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  output M_AXI_arvalid;
  output M_AXI_rready;
  input aclk1;
  input hbm_aclk;
  input aresetn1;
  input [63:0]S01_AXI_awaddr;
  input [7:0]S01_AXI_awlen;
  input [2:0]S01_AXI_awsize;
  input [1:0]S01_AXI_awburst;
  input [0:0]S01_AXI_awlock;
  input [3:0]S01_AXI_awcache;
  input [2:0]S01_AXI_awprot;
  input [3:0]S01_AXI_awqos;
  input [0:0]S01_AXI_awvalid;
  input [511:0]S01_AXI_wdata;
  input [63:0]S01_AXI_wstrb;
  input [0:0]S01_AXI_wlast;
  input [0:0]S01_AXI_wvalid;
  input [0:0]S01_AXI_bready;
  input [63:0]S01_AXI_araddr;
  input [7:0]S01_AXI_arlen;
  input [2:0]S01_AXI_arsize;
  input [1:0]S01_AXI_arburst;
  input [0:0]S01_AXI_arlock;
  input [3:0]S01_AXI_arcache;
  input [2:0]S01_AXI_arprot;
  input [3:0]S01_AXI_arqos;
  input [0:0]S01_AXI_arvalid;
  input [0:0]S01_AXI_rready;
  input aresetn;
  input M_AXI_awready;
  input M_AXI_wready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_arready;
  input [255:0]M_AXI_rdata;
  input [1:0]M_AXI_rresp;
  input M_AXI_rlast;
  input M_AXI_rvalid;

  wire [32:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire M_AXI_arvalid;
  wire [32:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [3:0]M_AXI_awlen;
  wire [1:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [255:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [255:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [31:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire [63:0]S01_AXI_araddr;
  wire [1:0]S01_AXI_arburst;
  wire [3:0]S01_AXI_arcache;
  wire [7:0]S01_AXI_arlen;
  wire [0:0]S01_AXI_arlock;
  wire [2:0]S01_AXI_arprot;
  wire [3:0]S01_AXI_arqos;
  wire [0:0]S01_AXI_arready;
  wire [2:0]S01_AXI_arsize;
  wire [0:0]S01_AXI_arvalid;
  wire [63:0]S01_AXI_awaddr;
  wire [1:0]S01_AXI_awburst;
  wire [3:0]S01_AXI_awcache;
  wire [7:0]S01_AXI_awlen;
  wire [0:0]S01_AXI_awlock;
  wire [2:0]S01_AXI_awprot;
  wire [3:0]S01_AXI_awqos;
  wire [0:0]S01_AXI_awready;
  wire [2:0]S01_AXI_awsize;
  wire [0:0]S01_AXI_awvalid;
  wire [0:0]S01_AXI_bready;
  wire [1:0]S01_AXI_bresp;
  wire [0:0]S01_AXI_bvalid;
  wire [511:0]S01_AXI_rdata;
  wire [0:0]S01_AXI_rlast;
  wire [0:0]S01_AXI_rready;
  wire [1:0]S01_AXI_rresp;
  wire [0:0]S01_AXI_rvalid;
  wire [511:0]S01_AXI_wdata;
  wire [0:0]S01_AXI_wlast;
  wire [0:0]S01_AXI_wready;
  wire [63:0]S01_AXI_wstrb;
  wire [0:0]S01_AXI_wvalid;
  wire aclk1;
  wire aresetn;
  wire aresetn1;
  wire hbm_aclk;
  wire [32:0]interconnect1_0_M00_AXI_ARADDR;
  wire [1:0]interconnect1_0_M00_AXI_ARBURST;
  wire [3:0]interconnect1_0_M00_AXI_ARCACHE;
  wire [3:0]interconnect1_0_M00_AXI_ARLEN;
  wire [1:0]interconnect1_0_M00_AXI_ARLOCK;
  wire [2:0]interconnect1_0_M00_AXI_ARPROT;
  wire [3:0]interconnect1_0_M00_AXI_ARQOS;
  wire interconnect1_0_M00_AXI_ARREADY;
  wire [2:0]interconnect1_0_M00_AXI_ARSIZE;
  wire interconnect1_0_M00_AXI_ARVALID;
  wire [32:0]interconnect1_0_M00_AXI_AWADDR;
  wire [1:0]interconnect1_0_M00_AXI_AWBURST;
  wire [3:0]interconnect1_0_M00_AXI_AWCACHE;
  wire [3:0]interconnect1_0_M00_AXI_AWLEN;
  wire [1:0]interconnect1_0_M00_AXI_AWLOCK;
  wire [2:0]interconnect1_0_M00_AXI_AWPROT;
  wire [3:0]interconnect1_0_M00_AXI_AWQOS;
  wire interconnect1_0_M00_AXI_AWREADY;
  wire [2:0]interconnect1_0_M00_AXI_AWSIZE;
  wire interconnect1_0_M00_AXI_AWVALID;
  wire interconnect1_0_M00_AXI_BREADY;
  wire [1:0]interconnect1_0_M00_AXI_BRESP;
  wire interconnect1_0_M00_AXI_BVALID;
  wire [255:0]interconnect1_0_M00_AXI_RDATA;
  wire interconnect1_0_M00_AXI_RLAST;
  wire interconnect1_0_M00_AXI_RREADY;
  wire [1:0]interconnect1_0_M00_AXI_RRESP;
  wire interconnect1_0_M00_AXI_RVALID;
  wire [255:0]interconnect1_0_M00_AXI_WDATA;
  wire interconnect1_0_M00_AXI_WLAST;
  wire interconnect1_0_M00_AXI_WREADY;
  wire [31:0]interconnect1_0_M00_AXI_WSTRB;
  wire interconnect1_0_M00_AXI_WVALID;
  wire [2:0]NLW_slice1_0_m_axi_arsize_UNCONNECTED;
  wire [2:0]NLW_slice1_0_m_axi_awsize_UNCONNECTED;

  (* X_CORE_INFO = "bd_763a,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect1_0_0 interconnect1_0
       (.M00_AXI_araddr(interconnect1_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(interconnect1_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(interconnect1_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(interconnect1_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(interconnect1_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(interconnect1_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(interconnect1_0_M00_AXI_ARQOS),
        .M00_AXI_arready(interconnect1_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(interconnect1_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(interconnect1_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(interconnect1_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(interconnect1_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(interconnect1_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(interconnect1_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(interconnect1_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(interconnect1_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(interconnect1_0_M00_AXI_AWQOS),
        .M00_AXI_awready(interconnect1_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(interconnect1_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(interconnect1_0_M00_AXI_AWVALID),
        .M00_AXI_bready(interconnect1_0_M00_AXI_BREADY),
        .M00_AXI_bresp(interconnect1_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(interconnect1_0_M00_AXI_BVALID),
        .M00_AXI_rdata(interconnect1_0_M00_AXI_RDATA),
        .M00_AXI_rlast(interconnect1_0_M00_AXI_RLAST),
        .M00_AXI_rready(interconnect1_0_M00_AXI_RREADY),
        .M00_AXI_rresp(interconnect1_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(interconnect1_0_M00_AXI_RVALID),
        .M00_AXI_wdata(interconnect1_0_M00_AXI_WDATA),
        .M00_AXI_wlast(interconnect1_0_M00_AXI_WLAST),
        .M00_AXI_wready(interconnect1_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(interconnect1_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(interconnect1_0_M00_AXI_WVALID),
        .S00_AXI_araddr(S01_AXI_araddr),
        .S00_AXI_arburst(S01_AXI_arburst),
        .S00_AXI_arcache(S01_AXI_arcache),
        .S00_AXI_arlen(S01_AXI_arlen),
        .S00_AXI_arlock(S01_AXI_arlock),
        .S00_AXI_arprot(S01_AXI_arprot),
        .S00_AXI_arqos(S01_AXI_arqos),
        .S00_AXI_arready(S01_AXI_arready),
        .S00_AXI_arsize(S01_AXI_arsize),
        .S00_AXI_arvalid(S01_AXI_arvalid),
        .S00_AXI_awaddr(S01_AXI_awaddr),
        .S00_AXI_awburst(S01_AXI_awburst),
        .S00_AXI_awcache(S01_AXI_awcache),
        .S00_AXI_awlen(S01_AXI_awlen),
        .S00_AXI_awlock(S01_AXI_awlock),
        .S00_AXI_awprot(S01_AXI_awprot),
        .S00_AXI_awqos(S01_AXI_awqos),
        .S00_AXI_awready(S01_AXI_awready),
        .S00_AXI_awsize(S01_AXI_awsize),
        .S00_AXI_awvalid(S01_AXI_awvalid),
        .S00_AXI_bready(S01_AXI_bready),
        .S00_AXI_bresp(S01_AXI_bresp),
        .S00_AXI_bvalid(S01_AXI_bvalid),
        .S00_AXI_rdata(S01_AXI_rdata),
        .S00_AXI_rlast(S01_AXI_rlast),
        .S00_AXI_rready(S01_AXI_rready),
        .S00_AXI_rresp(S01_AXI_rresp),
        .S00_AXI_rvalid(S01_AXI_rvalid),
        .S00_AXI_wdata(S01_AXI_wdata),
        .S00_AXI_wlast(S01_AXI_wlast),
        .S00_AXI_wready(S01_AXI_wready),
        .S00_AXI_wstrb(S01_AXI_wstrb),
        .S00_AXI_wvalid(S01_AXI_wvalid),
        .aclk(aclk1),
        .aclk1(hbm_aclk),
        .aresetn(aresetn1));
  (* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice1_0_0 slice1_0
       (.aclk(hbm_aclk),
        .aresetn(aresetn),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(NLW_slice1_0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(NLW_slice1_0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(interconnect1_0_M00_AXI_ARADDR),
        .s_axi_arburst(interconnect1_0_M00_AXI_ARBURST),
        .s_axi_arcache(interconnect1_0_M00_AXI_ARCACHE),
        .s_axi_arlen(interconnect1_0_M00_AXI_ARLEN),
        .s_axi_arlock(interconnect1_0_M00_AXI_ARLOCK),
        .s_axi_arprot(interconnect1_0_M00_AXI_ARPROT),
        .s_axi_arqos(interconnect1_0_M00_AXI_ARQOS),
        .s_axi_arready(interconnect1_0_M00_AXI_ARREADY),
        .s_axi_arsize(interconnect1_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(interconnect1_0_M00_AXI_ARVALID),
        .s_axi_awaddr(interconnect1_0_M00_AXI_AWADDR),
        .s_axi_awburst(interconnect1_0_M00_AXI_AWBURST),
        .s_axi_awcache(interconnect1_0_M00_AXI_AWCACHE),
        .s_axi_awlen(interconnect1_0_M00_AXI_AWLEN),
        .s_axi_awlock(interconnect1_0_M00_AXI_AWLOCK),
        .s_axi_awprot(interconnect1_0_M00_AXI_AWPROT),
        .s_axi_awqos(interconnect1_0_M00_AXI_AWQOS),
        .s_axi_awready(interconnect1_0_M00_AXI_AWREADY),
        .s_axi_awsize(interconnect1_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(interconnect1_0_M00_AXI_AWVALID),
        .s_axi_bready(interconnect1_0_M00_AXI_BREADY),
        .s_axi_bresp(interconnect1_0_M00_AXI_BRESP),
        .s_axi_bvalid(interconnect1_0_M00_AXI_BVALID),
        .s_axi_rdata(interconnect1_0_M00_AXI_RDATA),
        .s_axi_rlast(interconnect1_0_M00_AXI_RLAST),
        .s_axi_rready(interconnect1_0_M00_AXI_RREADY),
        .s_axi_rresp(interconnect1_0_M00_AXI_RRESP),
        .s_axi_rvalid(interconnect1_0_M00_AXI_RVALID),
        .s_axi_wdata(interconnect1_0_M00_AXI_WDATA),
        .s_axi_wlast(interconnect1_0_M00_AXI_WLAST),
        .s_axi_wready(interconnect1_0_M00_AXI_WREADY),
        .s_axi_wstrb(interconnect1_0_M00_AXI_WSTRB),
        .s_axi_wvalid(interconnect1_0_M00_AXI_WVALID));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_1_imp_1QSHYAS
   (S02_AXI_awready,
    S02_AXI_wready,
    S02_AXI_bresp,
    S02_AXI_bvalid,
    S02_AXI_arready,
    S02_AXI_rdata,
    S02_AXI_rresp,
    S02_AXI_rlast,
    S02_AXI_rvalid,
    M_AXI_awaddr,
    M_AXI_awlen,
    M_AXI_awburst,
    M_AXI_awlock,
    M_AXI_awcache,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awvalid,
    M_AXI_wdata,
    M_AXI_wstrb,
    M_AXI_wlast,
    M_AXI_wvalid,
    M_AXI_bready,
    M_AXI_araddr,
    M_AXI_arlen,
    M_AXI_arburst,
    M_AXI_arlock,
    M_AXI_arcache,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arvalid,
    M_AXI_rready,
    aclk1,
    hbm_aclk,
    aresetn1,
    S02_AXI_awaddr,
    S02_AXI_awlen,
    S02_AXI_awsize,
    S02_AXI_awburst,
    S02_AXI_awlock,
    S02_AXI_awcache,
    S02_AXI_awprot,
    S02_AXI_awqos,
    S02_AXI_awvalid,
    S02_AXI_wdata,
    S02_AXI_wstrb,
    S02_AXI_wlast,
    S02_AXI_wvalid,
    S02_AXI_bready,
    S02_AXI_araddr,
    S02_AXI_arlen,
    S02_AXI_arsize,
    S02_AXI_arburst,
    S02_AXI_arlock,
    S02_AXI_arcache,
    S02_AXI_arprot,
    S02_AXI_arqos,
    S02_AXI_arvalid,
    S02_AXI_rready,
    aresetn,
    M_AXI_awready,
    M_AXI_wready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_arready,
    M_AXI_rdata,
    M_AXI_rresp,
    M_AXI_rlast,
    M_AXI_rvalid);
  output [0:0]S02_AXI_awready;
  output [0:0]S02_AXI_wready;
  output [1:0]S02_AXI_bresp;
  output [0:0]S02_AXI_bvalid;
  output [0:0]S02_AXI_arready;
  output [511:0]S02_AXI_rdata;
  output [1:0]S02_AXI_rresp;
  output [0:0]S02_AXI_rlast;
  output [0:0]S02_AXI_rvalid;
  output [32:0]M_AXI_awaddr;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awburst;
  output [1:0]M_AXI_awlock;
  output [3:0]M_AXI_awcache;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  output M_AXI_awvalid;
  output [255:0]M_AXI_wdata;
  output [31:0]M_AXI_wstrb;
  output M_AXI_wlast;
  output M_AXI_wvalid;
  output M_AXI_bready;
  output [32:0]M_AXI_araddr;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arburst;
  output [1:0]M_AXI_arlock;
  output [3:0]M_AXI_arcache;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  output M_AXI_arvalid;
  output M_AXI_rready;
  input aclk1;
  input hbm_aclk;
  input aresetn1;
  input [63:0]S02_AXI_awaddr;
  input [7:0]S02_AXI_awlen;
  input [2:0]S02_AXI_awsize;
  input [1:0]S02_AXI_awburst;
  input [0:0]S02_AXI_awlock;
  input [3:0]S02_AXI_awcache;
  input [2:0]S02_AXI_awprot;
  input [3:0]S02_AXI_awqos;
  input [0:0]S02_AXI_awvalid;
  input [511:0]S02_AXI_wdata;
  input [63:0]S02_AXI_wstrb;
  input [0:0]S02_AXI_wlast;
  input [0:0]S02_AXI_wvalid;
  input [0:0]S02_AXI_bready;
  input [63:0]S02_AXI_araddr;
  input [7:0]S02_AXI_arlen;
  input [2:0]S02_AXI_arsize;
  input [1:0]S02_AXI_arburst;
  input [0:0]S02_AXI_arlock;
  input [3:0]S02_AXI_arcache;
  input [2:0]S02_AXI_arprot;
  input [3:0]S02_AXI_arqos;
  input [0:0]S02_AXI_arvalid;
  input [0:0]S02_AXI_rready;
  input aresetn;
  input M_AXI_awready;
  input M_AXI_wready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_arready;
  input [255:0]M_AXI_rdata;
  input [1:0]M_AXI_rresp;
  input M_AXI_rlast;
  input M_AXI_rvalid;

  wire [32:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire M_AXI_arvalid;
  wire [32:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [3:0]M_AXI_awlen;
  wire [1:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [255:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [255:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [31:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire [63:0]S02_AXI_araddr;
  wire [1:0]S02_AXI_arburst;
  wire [3:0]S02_AXI_arcache;
  wire [7:0]S02_AXI_arlen;
  wire [0:0]S02_AXI_arlock;
  wire [2:0]S02_AXI_arprot;
  wire [3:0]S02_AXI_arqos;
  wire [0:0]S02_AXI_arready;
  wire [2:0]S02_AXI_arsize;
  wire [0:0]S02_AXI_arvalid;
  wire [63:0]S02_AXI_awaddr;
  wire [1:0]S02_AXI_awburst;
  wire [3:0]S02_AXI_awcache;
  wire [7:0]S02_AXI_awlen;
  wire [0:0]S02_AXI_awlock;
  wire [2:0]S02_AXI_awprot;
  wire [3:0]S02_AXI_awqos;
  wire [0:0]S02_AXI_awready;
  wire [2:0]S02_AXI_awsize;
  wire [0:0]S02_AXI_awvalid;
  wire [0:0]S02_AXI_bready;
  wire [1:0]S02_AXI_bresp;
  wire [0:0]S02_AXI_bvalid;
  wire [511:0]S02_AXI_rdata;
  wire [0:0]S02_AXI_rlast;
  wire [0:0]S02_AXI_rready;
  wire [1:0]S02_AXI_rresp;
  wire [0:0]S02_AXI_rvalid;
  wire [511:0]S02_AXI_wdata;
  wire [0:0]S02_AXI_wlast;
  wire [0:0]S02_AXI_wready;
  wire [63:0]S02_AXI_wstrb;
  wire [0:0]S02_AXI_wvalid;
  wire aclk1;
  wire aresetn;
  wire aresetn1;
  wire hbm_aclk;
  wire [32:0]interconnect2_1_M00_AXI_ARADDR;
  wire [1:0]interconnect2_1_M00_AXI_ARBURST;
  wire [3:0]interconnect2_1_M00_AXI_ARCACHE;
  wire [3:0]interconnect2_1_M00_AXI_ARLEN;
  wire [1:0]interconnect2_1_M00_AXI_ARLOCK;
  wire [2:0]interconnect2_1_M00_AXI_ARPROT;
  wire [3:0]interconnect2_1_M00_AXI_ARQOS;
  wire interconnect2_1_M00_AXI_ARREADY;
  wire [2:0]interconnect2_1_M00_AXI_ARSIZE;
  wire interconnect2_1_M00_AXI_ARVALID;
  wire [32:0]interconnect2_1_M00_AXI_AWADDR;
  wire [1:0]interconnect2_1_M00_AXI_AWBURST;
  wire [3:0]interconnect2_1_M00_AXI_AWCACHE;
  wire [3:0]interconnect2_1_M00_AXI_AWLEN;
  wire [1:0]interconnect2_1_M00_AXI_AWLOCK;
  wire [2:0]interconnect2_1_M00_AXI_AWPROT;
  wire [3:0]interconnect2_1_M00_AXI_AWQOS;
  wire interconnect2_1_M00_AXI_AWREADY;
  wire [2:0]interconnect2_1_M00_AXI_AWSIZE;
  wire interconnect2_1_M00_AXI_AWVALID;
  wire interconnect2_1_M00_AXI_BREADY;
  wire [1:0]interconnect2_1_M00_AXI_BRESP;
  wire interconnect2_1_M00_AXI_BVALID;
  wire [255:0]interconnect2_1_M00_AXI_RDATA;
  wire interconnect2_1_M00_AXI_RLAST;
  wire interconnect2_1_M00_AXI_RREADY;
  wire [1:0]interconnect2_1_M00_AXI_RRESP;
  wire interconnect2_1_M00_AXI_RVALID;
  wire [255:0]interconnect2_1_M00_AXI_WDATA;
  wire interconnect2_1_M00_AXI_WLAST;
  wire interconnect2_1_M00_AXI_WREADY;
  wire [31:0]interconnect2_1_M00_AXI_WSTRB;
  wire interconnect2_1_M00_AXI_WVALID;
  wire [2:0]NLW_slice2_1_m_axi_arsize_UNCONNECTED;
  wire [2:0]NLW_slice2_1_m_axi_awsize_UNCONNECTED;

  (* X_CORE_INFO = "bd_b62f,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect2_1_0 interconnect2_1
       (.M00_AXI_araddr(interconnect2_1_M00_AXI_ARADDR),
        .M00_AXI_arburst(interconnect2_1_M00_AXI_ARBURST),
        .M00_AXI_arcache(interconnect2_1_M00_AXI_ARCACHE),
        .M00_AXI_arlen(interconnect2_1_M00_AXI_ARLEN),
        .M00_AXI_arlock(interconnect2_1_M00_AXI_ARLOCK),
        .M00_AXI_arprot(interconnect2_1_M00_AXI_ARPROT),
        .M00_AXI_arqos(interconnect2_1_M00_AXI_ARQOS),
        .M00_AXI_arready(interconnect2_1_M00_AXI_ARREADY),
        .M00_AXI_arsize(interconnect2_1_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(interconnect2_1_M00_AXI_ARVALID),
        .M00_AXI_awaddr(interconnect2_1_M00_AXI_AWADDR),
        .M00_AXI_awburst(interconnect2_1_M00_AXI_AWBURST),
        .M00_AXI_awcache(interconnect2_1_M00_AXI_AWCACHE),
        .M00_AXI_awlen(interconnect2_1_M00_AXI_AWLEN),
        .M00_AXI_awlock(interconnect2_1_M00_AXI_AWLOCK),
        .M00_AXI_awprot(interconnect2_1_M00_AXI_AWPROT),
        .M00_AXI_awqos(interconnect2_1_M00_AXI_AWQOS),
        .M00_AXI_awready(interconnect2_1_M00_AXI_AWREADY),
        .M00_AXI_awsize(interconnect2_1_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(interconnect2_1_M00_AXI_AWVALID),
        .M00_AXI_bready(interconnect2_1_M00_AXI_BREADY),
        .M00_AXI_bresp(interconnect2_1_M00_AXI_BRESP),
        .M00_AXI_bvalid(interconnect2_1_M00_AXI_BVALID),
        .M00_AXI_rdata(interconnect2_1_M00_AXI_RDATA),
        .M00_AXI_rlast(interconnect2_1_M00_AXI_RLAST),
        .M00_AXI_rready(interconnect2_1_M00_AXI_RREADY),
        .M00_AXI_rresp(interconnect2_1_M00_AXI_RRESP),
        .M00_AXI_rvalid(interconnect2_1_M00_AXI_RVALID),
        .M00_AXI_wdata(interconnect2_1_M00_AXI_WDATA),
        .M00_AXI_wlast(interconnect2_1_M00_AXI_WLAST),
        .M00_AXI_wready(interconnect2_1_M00_AXI_WREADY),
        .M00_AXI_wstrb(interconnect2_1_M00_AXI_WSTRB),
        .M00_AXI_wvalid(interconnect2_1_M00_AXI_WVALID),
        .S00_AXI_araddr(S02_AXI_araddr),
        .S00_AXI_arburst(S02_AXI_arburst),
        .S00_AXI_arcache(S02_AXI_arcache),
        .S00_AXI_arlen(S02_AXI_arlen),
        .S00_AXI_arlock(S02_AXI_arlock),
        .S00_AXI_arprot(S02_AXI_arprot),
        .S00_AXI_arqos(S02_AXI_arqos),
        .S00_AXI_arready(S02_AXI_arready),
        .S00_AXI_arsize(S02_AXI_arsize),
        .S00_AXI_arvalid(S02_AXI_arvalid),
        .S00_AXI_awaddr(S02_AXI_awaddr),
        .S00_AXI_awburst(S02_AXI_awburst),
        .S00_AXI_awcache(S02_AXI_awcache),
        .S00_AXI_awlen(S02_AXI_awlen),
        .S00_AXI_awlock(S02_AXI_awlock),
        .S00_AXI_awprot(S02_AXI_awprot),
        .S00_AXI_awqos(S02_AXI_awqos),
        .S00_AXI_awready(S02_AXI_awready),
        .S00_AXI_awsize(S02_AXI_awsize),
        .S00_AXI_awvalid(S02_AXI_awvalid),
        .S00_AXI_bready(S02_AXI_bready),
        .S00_AXI_bresp(S02_AXI_bresp),
        .S00_AXI_bvalid(S02_AXI_bvalid),
        .S00_AXI_rdata(S02_AXI_rdata),
        .S00_AXI_rlast(S02_AXI_rlast),
        .S00_AXI_rready(S02_AXI_rready),
        .S00_AXI_rresp(S02_AXI_rresp),
        .S00_AXI_rvalid(S02_AXI_rvalid),
        .S00_AXI_wdata(S02_AXI_wdata),
        .S00_AXI_wlast(S02_AXI_wlast),
        .S00_AXI_wready(S02_AXI_wready),
        .S00_AXI_wstrb(S02_AXI_wstrb),
        .S00_AXI_wvalid(S02_AXI_wvalid),
        .aclk(aclk1),
        .aclk1(hbm_aclk),
        .aresetn(aresetn1));
  (* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice2_1_0 slice2_1
       (.aclk(hbm_aclk),
        .aresetn(aresetn),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(NLW_slice2_1_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(NLW_slice2_1_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(interconnect2_1_M00_AXI_ARADDR),
        .s_axi_arburst(interconnect2_1_M00_AXI_ARBURST),
        .s_axi_arcache(interconnect2_1_M00_AXI_ARCACHE),
        .s_axi_arlen(interconnect2_1_M00_AXI_ARLEN),
        .s_axi_arlock(interconnect2_1_M00_AXI_ARLOCK),
        .s_axi_arprot(interconnect2_1_M00_AXI_ARPROT),
        .s_axi_arqos(interconnect2_1_M00_AXI_ARQOS),
        .s_axi_arready(interconnect2_1_M00_AXI_ARREADY),
        .s_axi_arsize(interconnect2_1_M00_AXI_ARSIZE),
        .s_axi_arvalid(interconnect2_1_M00_AXI_ARVALID),
        .s_axi_awaddr(interconnect2_1_M00_AXI_AWADDR),
        .s_axi_awburst(interconnect2_1_M00_AXI_AWBURST),
        .s_axi_awcache(interconnect2_1_M00_AXI_AWCACHE),
        .s_axi_awlen(interconnect2_1_M00_AXI_AWLEN),
        .s_axi_awlock(interconnect2_1_M00_AXI_AWLOCK),
        .s_axi_awprot(interconnect2_1_M00_AXI_AWPROT),
        .s_axi_awqos(interconnect2_1_M00_AXI_AWQOS),
        .s_axi_awready(interconnect2_1_M00_AXI_AWREADY),
        .s_axi_awsize(interconnect2_1_M00_AXI_AWSIZE),
        .s_axi_awvalid(interconnect2_1_M00_AXI_AWVALID),
        .s_axi_bready(interconnect2_1_M00_AXI_BREADY),
        .s_axi_bresp(interconnect2_1_M00_AXI_BRESP),
        .s_axi_bvalid(interconnect2_1_M00_AXI_BVALID),
        .s_axi_rdata(interconnect2_1_M00_AXI_RDATA),
        .s_axi_rlast(interconnect2_1_M00_AXI_RLAST),
        .s_axi_rready(interconnect2_1_M00_AXI_RREADY),
        .s_axi_rresp(interconnect2_1_M00_AXI_RRESP),
        .s_axi_rvalid(interconnect2_1_M00_AXI_RVALID),
        .s_axi_wdata(interconnect2_1_M00_AXI_WDATA),
        .s_axi_wlast(interconnect2_1_M00_AXI_WLAST),
        .s_axi_wready(interconnect2_1_M00_AXI_WREADY),
        .s_axi_wstrb(interconnect2_1_M00_AXI_WSTRB),
        .s_axi_wvalid(interconnect2_1_M00_AXI_WVALID));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_2_imp_U6BEH3
   (S03_AXI_awready,
    S03_AXI_wready,
    S03_AXI_bresp,
    S03_AXI_bvalid,
    S03_AXI_arready,
    S03_AXI_rdata,
    S03_AXI_rresp,
    S03_AXI_rlast,
    S03_AXI_rvalid,
    M_AXI_awaddr,
    M_AXI_awlen,
    M_AXI_awburst,
    M_AXI_awlock,
    M_AXI_awcache,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awvalid,
    M_AXI_wdata,
    M_AXI_wstrb,
    M_AXI_wlast,
    M_AXI_wvalid,
    M_AXI_bready,
    M_AXI_araddr,
    M_AXI_arlen,
    M_AXI_arburst,
    M_AXI_arlock,
    M_AXI_arcache,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arvalid,
    M_AXI_rready,
    aclk1,
    hbm_aclk,
    aresetn1,
    S03_AXI_awaddr,
    S03_AXI_awlen,
    S03_AXI_awsize,
    S03_AXI_awburst,
    S03_AXI_awlock,
    S03_AXI_awcache,
    S03_AXI_awprot,
    S03_AXI_awqos,
    S03_AXI_awvalid,
    S03_AXI_wdata,
    S03_AXI_wstrb,
    S03_AXI_wlast,
    S03_AXI_wvalid,
    S03_AXI_bready,
    S03_AXI_araddr,
    S03_AXI_arlen,
    S03_AXI_arsize,
    S03_AXI_arburst,
    S03_AXI_arlock,
    S03_AXI_arcache,
    S03_AXI_arprot,
    S03_AXI_arqos,
    S03_AXI_arvalid,
    S03_AXI_rready,
    aresetn,
    M_AXI_awready,
    M_AXI_wready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_arready,
    M_AXI_rdata,
    M_AXI_rresp,
    M_AXI_rlast,
    M_AXI_rvalid);
  output [0:0]S03_AXI_awready;
  output [0:0]S03_AXI_wready;
  output [1:0]S03_AXI_bresp;
  output [0:0]S03_AXI_bvalid;
  output [0:0]S03_AXI_arready;
  output [511:0]S03_AXI_rdata;
  output [1:0]S03_AXI_rresp;
  output [0:0]S03_AXI_rlast;
  output [0:0]S03_AXI_rvalid;
  output [32:0]M_AXI_awaddr;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awburst;
  output [1:0]M_AXI_awlock;
  output [3:0]M_AXI_awcache;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  output M_AXI_awvalid;
  output [255:0]M_AXI_wdata;
  output [31:0]M_AXI_wstrb;
  output M_AXI_wlast;
  output M_AXI_wvalid;
  output M_AXI_bready;
  output [32:0]M_AXI_araddr;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arburst;
  output [1:0]M_AXI_arlock;
  output [3:0]M_AXI_arcache;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  output M_AXI_arvalid;
  output M_AXI_rready;
  input aclk1;
  input hbm_aclk;
  input aresetn1;
  input [63:0]S03_AXI_awaddr;
  input [7:0]S03_AXI_awlen;
  input [2:0]S03_AXI_awsize;
  input [1:0]S03_AXI_awburst;
  input [0:0]S03_AXI_awlock;
  input [3:0]S03_AXI_awcache;
  input [2:0]S03_AXI_awprot;
  input [3:0]S03_AXI_awqos;
  input [0:0]S03_AXI_awvalid;
  input [511:0]S03_AXI_wdata;
  input [63:0]S03_AXI_wstrb;
  input [0:0]S03_AXI_wlast;
  input [0:0]S03_AXI_wvalid;
  input [0:0]S03_AXI_bready;
  input [63:0]S03_AXI_araddr;
  input [7:0]S03_AXI_arlen;
  input [2:0]S03_AXI_arsize;
  input [1:0]S03_AXI_arburst;
  input [0:0]S03_AXI_arlock;
  input [3:0]S03_AXI_arcache;
  input [2:0]S03_AXI_arprot;
  input [3:0]S03_AXI_arqos;
  input [0:0]S03_AXI_arvalid;
  input [0:0]S03_AXI_rready;
  input aresetn;
  input M_AXI_awready;
  input M_AXI_wready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_arready;
  input [255:0]M_AXI_rdata;
  input [1:0]M_AXI_rresp;
  input M_AXI_rlast;
  input M_AXI_rvalid;

  wire [32:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire M_AXI_arvalid;
  wire [32:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [3:0]M_AXI_awlen;
  wire [1:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [255:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [255:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [31:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire [63:0]S03_AXI_araddr;
  wire [1:0]S03_AXI_arburst;
  wire [3:0]S03_AXI_arcache;
  wire [7:0]S03_AXI_arlen;
  wire [0:0]S03_AXI_arlock;
  wire [2:0]S03_AXI_arprot;
  wire [3:0]S03_AXI_arqos;
  wire [0:0]S03_AXI_arready;
  wire [2:0]S03_AXI_arsize;
  wire [0:0]S03_AXI_arvalid;
  wire [63:0]S03_AXI_awaddr;
  wire [1:0]S03_AXI_awburst;
  wire [3:0]S03_AXI_awcache;
  wire [7:0]S03_AXI_awlen;
  wire [0:0]S03_AXI_awlock;
  wire [2:0]S03_AXI_awprot;
  wire [3:0]S03_AXI_awqos;
  wire [0:0]S03_AXI_awready;
  wire [2:0]S03_AXI_awsize;
  wire [0:0]S03_AXI_awvalid;
  wire [0:0]S03_AXI_bready;
  wire [1:0]S03_AXI_bresp;
  wire [0:0]S03_AXI_bvalid;
  wire [511:0]S03_AXI_rdata;
  wire [0:0]S03_AXI_rlast;
  wire [0:0]S03_AXI_rready;
  wire [1:0]S03_AXI_rresp;
  wire [0:0]S03_AXI_rvalid;
  wire [511:0]S03_AXI_wdata;
  wire [0:0]S03_AXI_wlast;
  wire [0:0]S03_AXI_wready;
  wire [63:0]S03_AXI_wstrb;
  wire [0:0]S03_AXI_wvalid;
  wire aclk1;
  wire aresetn;
  wire aresetn1;
  wire hbm_aclk;
  wire [32:0]interconnect3_2_M00_AXI_ARADDR;
  wire [1:0]interconnect3_2_M00_AXI_ARBURST;
  wire [3:0]interconnect3_2_M00_AXI_ARCACHE;
  wire [3:0]interconnect3_2_M00_AXI_ARLEN;
  wire [1:0]interconnect3_2_M00_AXI_ARLOCK;
  wire [2:0]interconnect3_2_M00_AXI_ARPROT;
  wire [3:0]interconnect3_2_M00_AXI_ARQOS;
  wire interconnect3_2_M00_AXI_ARREADY;
  wire [2:0]interconnect3_2_M00_AXI_ARSIZE;
  wire interconnect3_2_M00_AXI_ARVALID;
  wire [32:0]interconnect3_2_M00_AXI_AWADDR;
  wire [1:0]interconnect3_2_M00_AXI_AWBURST;
  wire [3:0]interconnect3_2_M00_AXI_AWCACHE;
  wire [3:0]interconnect3_2_M00_AXI_AWLEN;
  wire [1:0]interconnect3_2_M00_AXI_AWLOCK;
  wire [2:0]interconnect3_2_M00_AXI_AWPROT;
  wire [3:0]interconnect3_2_M00_AXI_AWQOS;
  wire interconnect3_2_M00_AXI_AWREADY;
  wire [2:0]interconnect3_2_M00_AXI_AWSIZE;
  wire interconnect3_2_M00_AXI_AWVALID;
  wire interconnect3_2_M00_AXI_BREADY;
  wire [1:0]interconnect3_2_M00_AXI_BRESP;
  wire interconnect3_2_M00_AXI_BVALID;
  wire [255:0]interconnect3_2_M00_AXI_RDATA;
  wire interconnect3_2_M00_AXI_RLAST;
  wire interconnect3_2_M00_AXI_RREADY;
  wire [1:0]interconnect3_2_M00_AXI_RRESP;
  wire interconnect3_2_M00_AXI_RVALID;
  wire [255:0]interconnect3_2_M00_AXI_WDATA;
  wire interconnect3_2_M00_AXI_WLAST;
  wire interconnect3_2_M00_AXI_WREADY;
  wire [31:0]interconnect3_2_M00_AXI_WSTRB;
  wire interconnect3_2_M00_AXI_WVALID;
  wire [2:0]NLW_slice3_2_m_axi_arsize_UNCONNECTED;
  wire [2:0]NLW_slice3_2_m_axi_awsize_UNCONNECTED;

  (* X_CORE_INFO = "bd_76e2,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect3_2_0 interconnect3_2
       (.M00_AXI_araddr(interconnect3_2_M00_AXI_ARADDR),
        .M00_AXI_arburst(interconnect3_2_M00_AXI_ARBURST),
        .M00_AXI_arcache(interconnect3_2_M00_AXI_ARCACHE),
        .M00_AXI_arlen(interconnect3_2_M00_AXI_ARLEN),
        .M00_AXI_arlock(interconnect3_2_M00_AXI_ARLOCK),
        .M00_AXI_arprot(interconnect3_2_M00_AXI_ARPROT),
        .M00_AXI_arqos(interconnect3_2_M00_AXI_ARQOS),
        .M00_AXI_arready(interconnect3_2_M00_AXI_ARREADY),
        .M00_AXI_arsize(interconnect3_2_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(interconnect3_2_M00_AXI_ARVALID),
        .M00_AXI_awaddr(interconnect3_2_M00_AXI_AWADDR),
        .M00_AXI_awburst(interconnect3_2_M00_AXI_AWBURST),
        .M00_AXI_awcache(interconnect3_2_M00_AXI_AWCACHE),
        .M00_AXI_awlen(interconnect3_2_M00_AXI_AWLEN),
        .M00_AXI_awlock(interconnect3_2_M00_AXI_AWLOCK),
        .M00_AXI_awprot(interconnect3_2_M00_AXI_AWPROT),
        .M00_AXI_awqos(interconnect3_2_M00_AXI_AWQOS),
        .M00_AXI_awready(interconnect3_2_M00_AXI_AWREADY),
        .M00_AXI_awsize(interconnect3_2_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(interconnect3_2_M00_AXI_AWVALID),
        .M00_AXI_bready(interconnect3_2_M00_AXI_BREADY),
        .M00_AXI_bresp(interconnect3_2_M00_AXI_BRESP),
        .M00_AXI_bvalid(interconnect3_2_M00_AXI_BVALID),
        .M00_AXI_rdata(interconnect3_2_M00_AXI_RDATA),
        .M00_AXI_rlast(interconnect3_2_M00_AXI_RLAST),
        .M00_AXI_rready(interconnect3_2_M00_AXI_RREADY),
        .M00_AXI_rresp(interconnect3_2_M00_AXI_RRESP),
        .M00_AXI_rvalid(interconnect3_2_M00_AXI_RVALID),
        .M00_AXI_wdata(interconnect3_2_M00_AXI_WDATA),
        .M00_AXI_wlast(interconnect3_2_M00_AXI_WLAST),
        .M00_AXI_wready(interconnect3_2_M00_AXI_WREADY),
        .M00_AXI_wstrb(interconnect3_2_M00_AXI_WSTRB),
        .M00_AXI_wvalid(interconnect3_2_M00_AXI_WVALID),
        .S00_AXI_araddr(S03_AXI_araddr),
        .S00_AXI_arburst(S03_AXI_arburst),
        .S00_AXI_arcache(S03_AXI_arcache),
        .S00_AXI_arlen(S03_AXI_arlen),
        .S00_AXI_arlock(S03_AXI_arlock),
        .S00_AXI_arprot(S03_AXI_arprot),
        .S00_AXI_arqos(S03_AXI_arqos),
        .S00_AXI_arready(S03_AXI_arready),
        .S00_AXI_arsize(S03_AXI_arsize),
        .S00_AXI_arvalid(S03_AXI_arvalid),
        .S00_AXI_awaddr(S03_AXI_awaddr),
        .S00_AXI_awburst(S03_AXI_awburst),
        .S00_AXI_awcache(S03_AXI_awcache),
        .S00_AXI_awlen(S03_AXI_awlen),
        .S00_AXI_awlock(S03_AXI_awlock),
        .S00_AXI_awprot(S03_AXI_awprot),
        .S00_AXI_awqos(S03_AXI_awqos),
        .S00_AXI_awready(S03_AXI_awready),
        .S00_AXI_awsize(S03_AXI_awsize),
        .S00_AXI_awvalid(S03_AXI_awvalid),
        .S00_AXI_bready(S03_AXI_bready),
        .S00_AXI_bresp(S03_AXI_bresp),
        .S00_AXI_bvalid(S03_AXI_bvalid),
        .S00_AXI_rdata(S03_AXI_rdata),
        .S00_AXI_rlast(S03_AXI_rlast),
        .S00_AXI_rready(S03_AXI_rready),
        .S00_AXI_rresp(S03_AXI_rresp),
        .S00_AXI_rvalid(S03_AXI_rvalid),
        .S00_AXI_wdata(S03_AXI_wdata),
        .S00_AXI_wlast(S03_AXI_wlast),
        .S00_AXI_wready(S03_AXI_wready),
        .S00_AXI_wstrb(S03_AXI_wstrb),
        .S00_AXI_wvalid(S03_AXI_wvalid),
        .aclk(aclk1),
        .aclk1(hbm_aclk),
        .aresetn(aresetn1));
  (* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice3_2_0 slice3_2
       (.aclk(hbm_aclk),
        .aresetn(aresetn),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(NLW_slice3_2_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(NLW_slice3_2_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(interconnect3_2_M00_AXI_ARADDR),
        .s_axi_arburst(interconnect3_2_M00_AXI_ARBURST),
        .s_axi_arcache(interconnect3_2_M00_AXI_ARCACHE),
        .s_axi_arlen(interconnect3_2_M00_AXI_ARLEN),
        .s_axi_arlock(interconnect3_2_M00_AXI_ARLOCK),
        .s_axi_arprot(interconnect3_2_M00_AXI_ARPROT),
        .s_axi_arqos(interconnect3_2_M00_AXI_ARQOS),
        .s_axi_arready(interconnect3_2_M00_AXI_ARREADY),
        .s_axi_arsize(interconnect3_2_M00_AXI_ARSIZE),
        .s_axi_arvalid(interconnect3_2_M00_AXI_ARVALID),
        .s_axi_awaddr(interconnect3_2_M00_AXI_AWADDR),
        .s_axi_awburst(interconnect3_2_M00_AXI_AWBURST),
        .s_axi_awcache(interconnect3_2_M00_AXI_AWCACHE),
        .s_axi_awlen(interconnect3_2_M00_AXI_AWLEN),
        .s_axi_awlock(interconnect3_2_M00_AXI_AWLOCK),
        .s_axi_awprot(interconnect3_2_M00_AXI_AWPROT),
        .s_axi_awqos(interconnect3_2_M00_AXI_AWQOS),
        .s_axi_awready(interconnect3_2_M00_AXI_AWREADY),
        .s_axi_awsize(interconnect3_2_M00_AXI_AWSIZE),
        .s_axi_awvalid(interconnect3_2_M00_AXI_AWVALID),
        .s_axi_bready(interconnect3_2_M00_AXI_BREADY),
        .s_axi_bresp(interconnect3_2_M00_AXI_BRESP),
        .s_axi_bvalid(interconnect3_2_M00_AXI_BVALID),
        .s_axi_rdata(interconnect3_2_M00_AXI_RDATA),
        .s_axi_rlast(interconnect3_2_M00_AXI_RLAST),
        .s_axi_rready(interconnect3_2_M00_AXI_RREADY),
        .s_axi_rresp(interconnect3_2_M00_AXI_RRESP),
        .s_axi_rvalid(interconnect3_2_M00_AXI_RVALID),
        .s_axi_wdata(interconnect3_2_M00_AXI_WDATA),
        .s_axi_wlast(interconnect3_2_M00_AXI_WLAST),
        .s_axi_wready(interconnect3_2_M00_AXI_WREADY),
        .s_axi_wstrb(interconnect3_2_M00_AXI_WSTRB),
        .s_axi_wvalid(interconnect3_2_M00_AXI_WVALID));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_3_imp_18IDHND
   (S04_AXI_awready,
    S04_AXI_wready,
    S04_AXI_bresp,
    S04_AXI_bvalid,
    S04_AXI_arready,
    S04_AXI_rdata,
    S04_AXI_rresp,
    S04_AXI_rlast,
    S04_AXI_rvalid,
    M_AXI_awaddr,
    M_AXI_awlen,
    M_AXI_awburst,
    M_AXI_awlock,
    M_AXI_awcache,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awvalid,
    M_AXI_wdata,
    M_AXI_wstrb,
    M_AXI_wlast,
    M_AXI_wvalid,
    M_AXI_bready,
    M_AXI_araddr,
    M_AXI_arlen,
    M_AXI_arburst,
    M_AXI_arlock,
    M_AXI_arcache,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arvalid,
    M_AXI_rready,
    aclk1,
    hbm_aclk,
    aresetn1,
    S04_AXI_awaddr,
    S04_AXI_awlen,
    S04_AXI_awsize,
    S04_AXI_awburst,
    S04_AXI_awlock,
    S04_AXI_awcache,
    S04_AXI_awprot,
    S04_AXI_awqos,
    S04_AXI_awvalid,
    S04_AXI_wdata,
    S04_AXI_wstrb,
    S04_AXI_wlast,
    S04_AXI_wvalid,
    S04_AXI_bready,
    S04_AXI_araddr,
    S04_AXI_arlen,
    S04_AXI_arsize,
    S04_AXI_arburst,
    S04_AXI_arlock,
    S04_AXI_arcache,
    S04_AXI_arprot,
    S04_AXI_arqos,
    S04_AXI_arvalid,
    S04_AXI_rready,
    interconnect_aresetn,
    M_AXI_awready,
    M_AXI_wready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_arready,
    M_AXI_rdata,
    M_AXI_rresp,
    M_AXI_rlast,
    M_AXI_rvalid);
  output [0:0]S04_AXI_awready;
  output [0:0]S04_AXI_wready;
  output [1:0]S04_AXI_bresp;
  output [0:0]S04_AXI_bvalid;
  output [0:0]S04_AXI_arready;
  output [511:0]S04_AXI_rdata;
  output [1:0]S04_AXI_rresp;
  output [0:0]S04_AXI_rlast;
  output [0:0]S04_AXI_rvalid;
  output [32:0]M_AXI_awaddr;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awburst;
  output [1:0]M_AXI_awlock;
  output [3:0]M_AXI_awcache;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  output M_AXI_awvalid;
  output [255:0]M_AXI_wdata;
  output [31:0]M_AXI_wstrb;
  output M_AXI_wlast;
  output M_AXI_wvalid;
  output M_AXI_bready;
  output [32:0]M_AXI_araddr;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arburst;
  output [1:0]M_AXI_arlock;
  output [3:0]M_AXI_arcache;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  output M_AXI_arvalid;
  output M_AXI_rready;
  input aclk1;
  input hbm_aclk;
  input aresetn1;
  input [63:0]S04_AXI_awaddr;
  input [7:0]S04_AXI_awlen;
  input [2:0]S04_AXI_awsize;
  input [1:0]S04_AXI_awburst;
  input [0:0]S04_AXI_awlock;
  input [3:0]S04_AXI_awcache;
  input [2:0]S04_AXI_awprot;
  input [3:0]S04_AXI_awqos;
  input [0:0]S04_AXI_awvalid;
  input [511:0]S04_AXI_wdata;
  input [63:0]S04_AXI_wstrb;
  input [0:0]S04_AXI_wlast;
  input [0:0]S04_AXI_wvalid;
  input [0:0]S04_AXI_bready;
  input [63:0]S04_AXI_araddr;
  input [7:0]S04_AXI_arlen;
  input [2:0]S04_AXI_arsize;
  input [1:0]S04_AXI_arburst;
  input [0:0]S04_AXI_arlock;
  input [3:0]S04_AXI_arcache;
  input [2:0]S04_AXI_arprot;
  input [3:0]S04_AXI_arqos;
  input [0:0]S04_AXI_arvalid;
  input [0:0]S04_AXI_rready;
  input [0:0]interconnect_aresetn;
  input M_AXI_awready;
  input M_AXI_wready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_arready;
  input [255:0]M_AXI_rdata;
  input [1:0]M_AXI_rresp;
  input M_AXI_rlast;
  input M_AXI_rvalid;

  wire [32:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire M_AXI_arvalid;
  wire [32:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [3:0]M_AXI_awlen;
  wire [1:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [255:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [255:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [31:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire [63:0]S04_AXI_araddr;
  wire [1:0]S04_AXI_arburst;
  wire [3:0]S04_AXI_arcache;
  wire [7:0]S04_AXI_arlen;
  wire [0:0]S04_AXI_arlock;
  wire [2:0]S04_AXI_arprot;
  wire [3:0]S04_AXI_arqos;
  wire [0:0]S04_AXI_arready;
  wire [2:0]S04_AXI_arsize;
  wire [0:0]S04_AXI_arvalid;
  wire [63:0]S04_AXI_awaddr;
  wire [1:0]S04_AXI_awburst;
  wire [3:0]S04_AXI_awcache;
  wire [7:0]S04_AXI_awlen;
  wire [0:0]S04_AXI_awlock;
  wire [2:0]S04_AXI_awprot;
  wire [3:0]S04_AXI_awqos;
  wire [0:0]S04_AXI_awready;
  wire [2:0]S04_AXI_awsize;
  wire [0:0]S04_AXI_awvalid;
  wire [0:0]S04_AXI_bready;
  wire [1:0]S04_AXI_bresp;
  wire [0:0]S04_AXI_bvalid;
  wire [511:0]S04_AXI_rdata;
  wire [0:0]S04_AXI_rlast;
  wire [0:0]S04_AXI_rready;
  wire [1:0]S04_AXI_rresp;
  wire [0:0]S04_AXI_rvalid;
  wire [511:0]S04_AXI_wdata;
  wire [0:0]S04_AXI_wlast;
  wire [0:0]S04_AXI_wready;
  wire [63:0]S04_AXI_wstrb;
  wire [0:0]S04_AXI_wvalid;
  wire aclk1;
  wire aresetn1;
  wire hbm_aclk;
  wire [32:0]interconnect4_3_M00_AXI_ARADDR;
  wire [1:0]interconnect4_3_M00_AXI_ARBURST;
  wire [3:0]interconnect4_3_M00_AXI_ARCACHE;
  wire [3:0]interconnect4_3_M00_AXI_ARLEN;
  wire [1:0]interconnect4_3_M00_AXI_ARLOCK;
  wire [2:0]interconnect4_3_M00_AXI_ARPROT;
  wire [3:0]interconnect4_3_M00_AXI_ARQOS;
  wire interconnect4_3_M00_AXI_ARREADY;
  wire [2:0]interconnect4_3_M00_AXI_ARSIZE;
  wire interconnect4_3_M00_AXI_ARVALID;
  wire [32:0]interconnect4_3_M00_AXI_AWADDR;
  wire [1:0]interconnect4_3_M00_AXI_AWBURST;
  wire [3:0]interconnect4_3_M00_AXI_AWCACHE;
  wire [3:0]interconnect4_3_M00_AXI_AWLEN;
  wire [1:0]interconnect4_3_M00_AXI_AWLOCK;
  wire [2:0]interconnect4_3_M00_AXI_AWPROT;
  wire [3:0]interconnect4_3_M00_AXI_AWQOS;
  wire interconnect4_3_M00_AXI_AWREADY;
  wire [2:0]interconnect4_3_M00_AXI_AWSIZE;
  wire interconnect4_3_M00_AXI_AWVALID;
  wire interconnect4_3_M00_AXI_BREADY;
  wire [1:0]interconnect4_3_M00_AXI_BRESP;
  wire interconnect4_3_M00_AXI_BVALID;
  wire [255:0]interconnect4_3_M00_AXI_RDATA;
  wire interconnect4_3_M00_AXI_RLAST;
  wire interconnect4_3_M00_AXI_RREADY;
  wire [1:0]interconnect4_3_M00_AXI_RRESP;
  wire interconnect4_3_M00_AXI_RVALID;
  wire [255:0]interconnect4_3_M00_AXI_WDATA;
  wire interconnect4_3_M00_AXI_WLAST;
  wire interconnect4_3_M00_AXI_WREADY;
  wire [31:0]interconnect4_3_M00_AXI_WSTRB;
  wire interconnect4_3_M00_AXI_WVALID;
  wire [0:0]interconnect_aresetn;
  wire [2:0]NLW_slice4_3_m_axi_arsize_UNCONNECTED;
  wire [2:0]NLW_slice4_3_m_axi_awsize_UNCONNECTED;

  (* X_CORE_INFO = "bd_7606,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect4_3_0 interconnect4_3
       (.M00_AXI_araddr(interconnect4_3_M00_AXI_ARADDR),
        .M00_AXI_arburst(interconnect4_3_M00_AXI_ARBURST),
        .M00_AXI_arcache(interconnect4_3_M00_AXI_ARCACHE),
        .M00_AXI_arlen(interconnect4_3_M00_AXI_ARLEN),
        .M00_AXI_arlock(interconnect4_3_M00_AXI_ARLOCK),
        .M00_AXI_arprot(interconnect4_3_M00_AXI_ARPROT),
        .M00_AXI_arqos(interconnect4_3_M00_AXI_ARQOS),
        .M00_AXI_arready(interconnect4_3_M00_AXI_ARREADY),
        .M00_AXI_arsize(interconnect4_3_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(interconnect4_3_M00_AXI_ARVALID),
        .M00_AXI_awaddr(interconnect4_3_M00_AXI_AWADDR),
        .M00_AXI_awburst(interconnect4_3_M00_AXI_AWBURST),
        .M00_AXI_awcache(interconnect4_3_M00_AXI_AWCACHE),
        .M00_AXI_awlen(interconnect4_3_M00_AXI_AWLEN),
        .M00_AXI_awlock(interconnect4_3_M00_AXI_AWLOCK),
        .M00_AXI_awprot(interconnect4_3_M00_AXI_AWPROT),
        .M00_AXI_awqos(interconnect4_3_M00_AXI_AWQOS),
        .M00_AXI_awready(interconnect4_3_M00_AXI_AWREADY),
        .M00_AXI_awsize(interconnect4_3_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(interconnect4_3_M00_AXI_AWVALID),
        .M00_AXI_bready(interconnect4_3_M00_AXI_BREADY),
        .M00_AXI_bresp(interconnect4_3_M00_AXI_BRESP),
        .M00_AXI_bvalid(interconnect4_3_M00_AXI_BVALID),
        .M00_AXI_rdata(interconnect4_3_M00_AXI_RDATA),
        .M00_AXI_rlast(interconnect4_3_M00_AXI_RLAST),
        .M00_AXI_rready(interconnect4_3_M00_AXI_RREADY),
        .M00_AXI_rresp(interconnect4_3_M00_AXI_RRESP),
        .M00_AXI_rvalid(interconnect4_3_M00_AXI_RVALID),
        .M00_AXI_wdata(interconnect4_3_M00_AXI_WDATA),
        .M00_AXI_wlast(interconnect4_3_M00_AXI_WLAST),
        .M00_AXI_wready(interconnect4_3_M00_AXI_WREADY),
        .M00_AXI_wstrb(interconnect4_3_M00_AXI_WSTRB),
        .M00_AXI_wvalid(interconnect4_3_M00_AXI_WVALID),
        .S00_AXI_araddr(S04_AXI_araddr),
        .S00_AXI_arburst(S04_AXI_arburst),
        .S00_AXI_arcache(S04_AXI_arcache),
        .S00_AXI_arlen(S04_AXI_arlen),
        .S00_AXI_arlock(S04_AXI_arlock),
        .S00_AXI_arprot(S04_AXI_arprot),
        .S00_AXI_arqos(S04_AXI_arqos),
        .S00_AXI_arready(S04_AXI_arready),
        .S00_AXI_arsize(S04_AXI_arsize),
        .S00_AXI_arvalid(S04_AXI_arvalid),
        .S00_AXI_awaddr(S04_AXI_awaddr),
        .S00_AXI_awburst(S04_AXI_awburst),
        .S00_AXI_awcache(S04_AXI_awcache),
        .S00_AXI_awlen(S04_AXI_awlen),
        .S00_AXI_awlock(S04_AXI_awlock),
        .S00_AXI_awprot(S04_AXI_awprot),
        .S00_AXI_awqos(S04_AXI_awqos),
        .S00_AXI_awready(S04_AXI_awready),
        .S00_AXI_awsize(S04_AXI_awsize),
        .S00_AXI_awvalid(S04_AXI_awvalid),
        .S00_AXI_bready(S04_AXI_bready),
        .S00_AXI_bresp(S04_AXI_bresp),
        .S00_AXI_bvalid(S04_AXI_bvalid),
        .S00_AXI_rdata(S04_AXI_rdata),
        .S00_AXI_rlast(S04_AXI_rlast),
        .S00_AXI_rready(S04_AXI_rready),
        .S00_AXI_rresp(S04_AXI_rresp),
        .S00_AXI_rvalid(S04_AXI_rvalid),
        .S00_AXI_wdata(S04_AXI_wdata),
        .S00_AXI_wlast(S04_AXI_wlast),
        .S00_AXI_wready(S04_AXI_wready),
        .S00_AXI_wstrb(S04_AXI_wstrb),
        .S00_AXI_wvalid(S04_AXI_wvalid),
        .aclk(aclk1),
        .aclk1(hbm_aclk),
        .aresetn(aresetn1));
  (* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice4_3_0 slice4_3
       (.aclk(hbm_aclk),
        .aresetn(interconnect_aresetn),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(NLW_slice4_3_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(NLW_slice4_3_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(interconnect4_3_M00_AXI_ARADDR),
        .s_axi_arburst(interconnect4_3_M00_AXI_ARBURST),
        .s_axi_arcache(interconnect4_3_M00_AXI_ARCACHE),
        .s_axi_arlen(interconnect4_3_M00_AXI_ARLEN),
        .s_axi_arlock(interconnect4_3_M00_AXI_ARLOCK),
        .s_axi_arprot(interconnect4_3_M00_AXI_ARPROT),
        .s_axi_arqos(interconnect4_3_M00_AXI_ARQOS),
        .s_axi_arready(interconnect4_3_M00_AXI_ARREADY),
        .s_axi_arsize(interconnect4_3_M00_AXI_ARSIZE),
        .s_axi_arvalid(interconnect4_3_M00_AXI_ARVALID),
        .s_axi_awaddr(interconnect4_3_M00_AXI_AWADDR),
        .s_axi_awburst(interconnect4_3_M00_AXI_AWBURST),
        .s_axi_awcache(interconnect4_3_M00_AXI_AWCACHE),
        .s_axi_awlen(interconnect4_3_M00_AXI_AWLEN),
        .s_axi_awlock(interconnect4_3_M00_AXI_AWLOCK),
        .s_axi_awprot(interconnect4_3_M00_AXI_AWPROT),
        .s_axi_awqos(interconnect4_3_M00_AXI_AWQOS),
        .s_axi_awready(interconnect4_3_M00_AXI_AWREADY),
        .s_axi_awsize(interconnect4_3_M00_AXI_AWSIZE),
        .s_axi_awvalid(interconnect4_3_M00_AXI_AWVALID),
        .s_axi_bready(interconnect4_3_M00_AXI_BREADY),
        .s_axi_bresp(interconnect4_3_M00_AXI_BRESP),
        .s_axi_bvalid(interconnect4_3_M00_AXI_BVALID),
        .s_axi_rdata(interconnect4_3_M00_AXI_RDATA),
        .s_axi_rlast(interconnect4_3_M00_AXI_RLAST),
        .s_axi_rready(interconnect4_3_M00_AXI_RREADY),
        .s_axi_rresp(interconnect4_3_M00_AXI_RRESP),
        .s_axi_rvalid(interconnect4_3_M00_AXI_RVALID),
        .s_axi_wdata(interconnect4_3_M00_AXI_WDATA),
        .s_axi_wlast(interconnect4_3_M00_AXI_WLAST),
        .s_axi_wready(interconnect4_3_M00_AXI_WREADY),
        .s_axi_wstrb(interconnect4_3_M00_AXI_WSTRB),
        .s_axi_wvalid(interconnect4_3_M00_AXI_WVALID));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_4_imp_1BCVI4G
   (S05_AXI_awready,
    S05_AXI_wready,
    S05_AXI_bresp,
    S05_AXI_bvalid,
    S05_AXI_arready,
    S05_AXI_rdata,
    S05_AXI_rresp,
    S05_AXI_rlast,
    S05_AXI_rvalid,
    M_AXI_awaddr,
    M_AXI_awlen,
    M_AXI_awburst,
    M_AXI_awlock,
    M_AXI_awcache,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awvalid,
    M_AXI_wdata,
    M_AXI_wstrb,
    M_AXI_wlast,
    M_AXI_wvalid,
    M_AXI_bready,
    M_AXI_araddr,
    M_AXI_arlen,
    M_AXI_arburst,
    M_AXI_arlock,
    M_AXI_arcache,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arvalid,
    M_AXI_rready,
    aclk1,
    hbm_aclk,
    aresetn1,
    S05_AXI_awaddr,
    S05_AXI_awlen,
    S05_AXI_awsize,
    S05_AXI_awburst,
    S05_AXI_awlock,
    S05_AXI_awcache,
    S05_AXI_awprot,
    S05_AXI_awqos,
    S05_AXI_awvalid,
    S05_AXI_wdata,
    S05_AXI_wstrb,
    S05_AXI_wlast,
    S05_AXI_wvalid,
    S05_AXI_bready,
    S05_AXI_araddr,
    S05_AXI_arlen,
    S05_AXI_arsize,
    S05_AXI_arburst,
    S05_AXI_arlock,
    S05_AXI_arcache,
    S05_AXI_arprot,
    S05_AXI_arqos,
    S05_AXI_arvalid,
    S05_AXI_rready,
    interconnect_aresetn,
    M_AXI_awready,
    M_AXI_wready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_arready,
    M_AXI_rdata,
    M_AXI_rresp,
    M_AXI_rlast,
    M_AXI_rvalid);
  output [0:0]S05_AXI_awready;
  output [0:0]S05_AXI_wready;
  output [1:0]S05_AXI_bresp;
  output [0:0]S05_AXI_bvalid;
  output [0:0]S05_AXI_arready;
  output [511:0]S05_AXI_rdata;
  output [1:0]S05_AXI_rresp;
  output [0:0]S05_AXI_rlast;
  output [0:0]S05_AXI_rvalid;
  output [32:0]M_AXI_awaddr;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awburst;
  output [1:0]M_AXI_awlock;
  output [3:0]M_AXI_awcache;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  output M_AXI_awvalid;
  output [255:0]M_AXI_wdata;
  output [31:0]M_AXI_wstrb;
  output M_AXI_wlast;
  output M_AXI_wvalid;
  output M_AXI_bready;
  output [32:0]M_AXI_araddr;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arburst;
  output [1:0]M_AXI_arlock;
  output [3:0]M_AXI_arcache;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  output M_AXI_arvalid;
  output M_AXI_rready;
  input aclk1;
  input hbm_aclk;
  input aresetn1;
  input [63:0]S05_AXI_awaddr;
  input [7:0]S05_AXI_awlen;
  input [2:0]S05_AXI_awsize;
  input [1:0]S05_AXI_awburst;
  input [0:0]S05_AXI_awlock;
  input [3:0]S05_AXI_awcache;
  input [2:0]S05_AXI_awprot;
  input [3:0]S05_AXI_awqos;
  input [0:0]S05_AXI_awvalid;
  input [511:0]S05_AXI_wdata;
  input [63:0]S05_AXI_wstrb;
  input [0:0]S05_AXI_wlast;
  input [0:0]S05_AXI_wvalid;
  input [0:0]S05_AXI_bready;
  input [63:0]S05_AXI_araddr;
  input [7:0]S05_AXI_arlen;
  input [2:0]S05_AXI_arsize;
  input [1:0]S05_AXI_arburst;
  input [0:0]S05_AXI_arlock;
  input [3:0]S05_AXI_arcache;
  input [2:0]S05_AXI_arprot;
  input [3:0]S05_AXI_arqos;
  input [0:0]S05_AXI_arvalid;
  input [0:0]S05_AXI_rready;
  input [0:0]interconnect_aresetn;
  input M_AXI_awready;
  input M_AXI_wready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_arready;
  input [255:0]M_AXI_rdata;
  input [1:0]M_AXI_rresp;
  input M_AXI_rlast;
  input M_AXI_rvalid;

  wire [32:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire M_AXI_arvalid;
  wire [32:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [3:0]M_AXI_awlen;
  wire [1:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [255:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [255:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [31:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire [63:0]S05_AXI_araddr;
  wire [1:0]S05_AXI_arburst;
  wire [3:0]S05_AXI_arcache;
  wire [7:0]S05_AXI_arlen;
  wire [0:0]S05_AXI_arlock;
  wire [2:0]S05_AXI_arprot;
  wire [3:0]S05_AXI_arqos;
  wire [0:0]S05_AXI_arready;
  wire [2:0]S05_AXI_arsize;
  wire [0:0]S05_AXI_arvalid;
  wire [63:0]S05_AXI_awaddr;
  wire [1:0]S05_AXI_awburst;
  wire [3:0]S05_AXI_awcache;
  wire [7:0]S05_AXI_awlen;
  wire [0:0]S05_AXI_awlock;
  wire [2:0]S05_AXI_awprot;
  wire [3:0]S05_AXI_awqos;
  wire [0:0]S05_AXI_awready;
  wire [2:0]S05_AXI_awsize;
  wire [0:0]S05_AXI_awvalid;
  wire [0:0]S05_AXI_bready;
  wire [1:0]S05_AXI_bresp;
  wire [0:0]S05_AXI_bvalid;
  wire [511:0]S05_AXI_rdata;
  wire [0:0]S05_AXI_rlast;
  wire [0:0]S05_AXI_rready;
  wire [1:0]S05_AXI_rresp;
  wire [0:0]S05_AXI_rvalid;
  wire [511:0]S05_AXI_wdata;
  wire [0:0]S05_AXI_wlast;
  wire [0:0]S05_AXI_wready;
  wire [63:0]S05_AXI_wstrb;
  wire [0:0]S05_AXI_wvalid;
  wire aclk1;
  wire aresetn1;
  wire hbm_aclk;
  wire [32:0]interconnect5_4_M00_AXI_ARADDR;
  wire [1:0]interconnect5_4_M00_AXI_ARBURST;
  wire [3:0]interconnect5_4_M00_AXI_ARCACHE;
  wire [3:0]interconnect5_4_M00_AXI_ARLEN;
  wire [1:0]interconnect5_4_M00_AXI_ARLOCK;
  wire [2:0]interconnect5_4_M00_AXI_ARPROT;
  wire [3:0]interconnect5_4_M00_AXI_ARQOS;
  wire interconnect5_4_M00_AXI_ARREADY;
  wire [2:0]interconnect5_4_M00_AXI_ARSIZE;
  wire interconnect5_4_M00_AXI_ARVALID;
  wire [32:0]interconnect5_4_M00_AXI_AWADDR;
  wire [1:0]interconnect5_4_M00_AXI_AWBURST;
  wire [3:0]interconnect5_4_M00_AXI_AWCACHE;
  wire [3:0]interconnect5_4_M00_AXI_AWLEN;
  wire [1:0]interconnect5_4_M00_AXI_AWLOCK;
  wire [2:0]interconnect5_4_M00_AXI_AWPROT;
  wire [3:0]interconnect5_4_M00_AXI_AWQOS;
  wire interconnect5_4_M00_AXI_AWREADY;
  wire [2:0]interconnect5_4_M00_AXI_AWSIZE;
  wire interconnect5_4_M00_AXI_AWVALID;
  wire interconnect5_4_M00_AXI_BREADY;
  wire [1:0]interconnect5_4_M00_AXI_BRESP;
  wire interconnect5_4_M00_AXI_BVALID;
  wire [255:0]interconnect5_4_M00_AXI_RDATA;
  wire interconnect5_4_M00_AXI_RLAST;
  wire interconnect5_4_M00_AXI_RREADY;
  wire [1:0]interconnect5_4_M00_AXI_RRESP;
  wire interconnect5_4_M00_AXI_RVALID;
  wire [255:0]interconnect5_4_M00_AXI_WDATA;
  wire interconnect5_4_M00_AXI_WLAST;
  wire interconnect5_4_M00_AXI_WREADY;
  wire [31:0]interconnect5_4_M00_AXI_WSTRB;
  wire interconnect5_4_M00_AXI_WVALID;
  wire [0:0]interconnect_aresetn;
  wire [2:0]NLW_slice5_4_m_axi_arsize_UNCONNECTED;
  wire [2:0]NLW_slice5_4_m_axi_awsize_UNCONNECTED;

  (* X_CORE_INFO = "bd_778a,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect5_4_0 interconnect5_4
       (.M00_AXI_araddr(interconnect5_4_M00_AXI_ARADDR),
        .M00_AXI_arburst(interconnect5_4_M00_AXI_ARBURST),
        .M00_AXI_arcache(interconnect5_4_M00_AXI_ARCACHE),
        .M00_AXI_arlen(interconnect5_4_M00_AXI_ARLEN),
        .M00_AXI_arlock(interconnect5_4_M00_AXI_ARLOCK),
        .M00_AXI_arprot(interconnect5_4_M00_AXI_ARPROT),
        .M00_AXI_arqos(interconnect5_4_M00_AXI_ARQOS),
        .M00_AXI_arready(interconnect5_4_M00_AXI_ARREADY),
        .M00_AXI_arsize(interconnect5_4_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(interconnect5_4_M00_AXI_ARVALID),
        .M00_AXI_awaddr(interconnect5_4_M00_AXI_AWADDR),
        .M00_AXI_awburst(interconnect5_4_M00_AXI_AWBURST),
        .M00_AXI_awcache(interconnect5_4_M00_AXI_AWCACHE),
        .M00_AXI_awlen(interconnect5_4_M00_AXI_AWLEN),
        .M00_AXI_awlock(interconnect5_4_M00_AXI_AWLOCK),
        .M00_AXI_awprot(interconnect5_4_M00_AXI_AWPROT),
        .M00_AXI_awqos(interconnect5_4_M00_AXI_AWQOS),
        .M00_AXI_awready(interconnect5_4_M00_AXI_AWREADY),
        .M00_AXI_awsize(interconnect5_4_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(interconnect5_4_M00_AXI_AWVALID),
        .M00_AXI_bready(interconnect5_4_M00_AXI_BREADY),
        .M00_AXI_bresp(interconnect5_4_M00_AXI_BRESP),
        .M00_AXI_bvalid(interconnect5_4_M00_AXI_BVALID),
        .M00_AXI_rdata(interconnect5_4_M00_AXI_RDATA),
        .M00_AXI_rlast(interconnect5_4_M00_AXI_RLAST),
        .M00_AXI_rready(interconnect5_4_M00_AXI_RREADY),
        .M00_AXI_rresp(interconnect5_4_M00_AXI_RRESP),
        .M00_AXI_rvalid(interconnect5_4_M00_AXI_RVALID),
        .M00_AXI_wdata(interconnect5_4_M00_AXI_WDATA),
        .M00_AXI_wlast(interconnect5_4_M00_AXI_WLAST),
        .M00_AXI_wready(interconnect5_4_M00_AXI_WREADY),
        .M00_AXI_wstrb(interconnect5_4_M00_AXI_WSTRB),
        .M00_AXI_wvalid(interconnect5_4_M00_AXI_WVALID),
        .S00_AXI_araddr(S05_AXI_araddr),
        .S00_AXI_arburst(S05_AXI_arburst),
        .S00_AXI_arcache(S05_AXI_arcache),
        .S00_AXI_arlen(S05_AXI_arlen),
        .S00_AXI_arlock(S05_AXI_arlock),
        .S00_AXI_arprot(S05_AXI_arprot),
        .S00_AXI_arqos(S05_AXI_arqos),
        .S00_AXI_arready(S05_AXI_arready),
        .S00_AXI_arsize(S05_AXI_arsize),
        .S00_AXI_arvalid(S05_AXI_arvalid),
        .S00_AXI_awaddr(S05_AXI_awaddr),
        .S00_AXI_awburst(S05_AXI_awburst),
        .S00_AXI_awcache(S05_AXI_awcache),
        .S00_AXI_awlen(S05_AXI_awlen),
        .S00_AXI_awlock(S05_AXI_awlock),
        .S00_AXI_awprot(S05_AXI_awprot),
        .S00_AXI_awqos(S05_AXI_awqos),
        .S00_AXI_awready(S05_AXI_awready),
        .S00_AXI_awsize(S05_AXI_awsize),
        .S00_AXI_awvalid(S05_AXI_awvalid),
        .S00_AXI_bready(S05_AXI_bready),
        .S00_AXI_bresp(S05_AXI_bresp),
        .S00_AXI_bvalid(S05_AXI_bvalid),
        .S00_AXI_rdata(S05_AXI_rdata),
        .S00_AXI_rlast(S05_AXI_rlast),
        .S00_AXI_rready(S05_AXI_rready),
        .S00_AXI_rresp(S05_AXI_rresp),
        .S00_AXI_rvalid(S05_AXI_rvalid),
        .S00_AXI_wdata(S05_AXI_wdata),
        .S00_AXI_wlast(S05_AXI_wlast),
        .S00_AXI_wready(S05_AXI_wready),
        .S00_AXI_wstrb(S05_AXI_wstrb),
        .S00_AXI_wvalid(S05_AXI_wvalid),
        .aclk(aclk1),
        .aclk1(hbm_aclk),
        .aresetn(aresetn1));
  (* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice5_4_0 slice5_4
       (.aclk(hbm_aclk),
        .aresetn(interconnect_aresetn),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(NLW_slice5_4_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(NLW_slice5_4_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(interconnect5_4_M00_AXI_ARADDR),
        .s_axi_arburst(interconnect5_4_M00_AXI_ARBURST),
        .s_axi_arcache(interconnect5_4_M00_AXI_ARCACHE),
        .s_axi_arlen(interconnect5_4_M00_AXI_ARLEN),
        .s_axi_arlock(interconnect5_4_M00_AXI_ARLOCK),
        .s_axi_arprot(interconnect5_4_M00_AXI_ARPROT),
        .s_axi_arqos(interconnect5_4_M00_AXI_ARQOS),
        .s_axi_arready(interconnect5_4_M00_AXI_ARREADY),
        .s_axi_arsize(interconnect5_4_M00_AXI_ARSIZE),
        .s_axi_arvalid(interconnect5_4_M00_AXI_ARVALID),
        .s_axi_awaddr(interconnect5_4_M00_AXI_AWADDR),
        .s_axi_awburst(interconnect5_4_M00_AXI_AWBURST),
        .s_axi_awcache(interconnect5_4_M00_AXI_AWCACHE),
        .s_axi_awlen(interconnect5_4_M00_AXI_AWLEN),
        .s_axi_awlock(interconnect5_4_M00_AXI_AWLOCK),
        .s_axi_awprot(interconnect5_4_M00_AXI_AWPROT),
        .s_axi_awqos(interconnect5_4_M00_AXI_AWQOS),
        .s_axi_awready(interconnect5_4_M00_AXI_AWREADY),
        .s_axi_awsize(interconnect5_4_M00_AXI_AWSIZE),
        .s_axi_awvalid(interconnect5_4_M00_AXI_AWVALID),
        .s_axi_bready(interconnect5_4_M00_AXI_BREADY),
        .s_axi_bresp(interconnect5_4_M00_AXI_BRESP),
        .s_axi_bvalid(interconnect5_4_M00_AXI_BVALID),
        .s_axi_rdata(interconnect5_4_M00_AXI_RDATA),
        .s_axi_rlast(interconnect5_4_M00_AXI_RLAST),
        .s_axi_rready(interconnect5_4_M00_AXI_RREADY),
        .s_axi_rresp(interconnect5_4_M00_AXI_RRESP),
        .s_axi_rvalid(interconnect5_4_M00_AXI_RVALID),
        .s_axi_wdata(interconnect5_4_M00_AXI_WDATA),
        .s_axi_wlast(interconnect5_4_M00_AXI_WLAST),
        .s_axi_wready(interconnect5_4_M00_AXI_WREADY),
        .s_axi_wstrb(interconnect5_4_M00_AXI_WSTRB),
        .s_axi_wvalid(interconnect5_4_M00_AXI_WVALID));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_path_6_imp_1SIT5H9
   (S00_AXI_awready,
    S00_AXI_wready,
    S00_AXI_bid,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_arready,
    S00_AXI_rid,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    M_AXI_awaddr,
    M_AXI_awlen,
    M_AXI_awburst,
    M_AXI_awlock,
    M_AXI_awcache,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awvalid,
    M_AXI_wdata,
    M_AXI_wstrb,
    M_AXI_wlast,
    M_AXI_wvalid,
    M_AXI_bready,
    M_AXI_araddr,
    M_AXI_arlen,
    M_AXI_arburst,
    M_AXI_arlock,
    M_AXI_arcache,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arvalid,
    M_AXI_rready,
    aclk,
    hbm_aclk,
    aresetn,
    S00_AXI_awid,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awlock,
    S00_AXI_awcache,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awvalid,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wlast,
    S00_AXI_wvalid,
    S00_AXI_bready,
    S00_AXI_arid,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arlock,
    S00_AXI_arcache,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arvalid,
    S00_AXI_rready,
    aresetn1,
    M_AXI_awready,
    M_AXI_wready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_arready,
    M_AXI_rdata,
    M_AXI_rresp,
    M_AXI_rlast,
    M_AXI_rvalid);
  output [0:0]S00_AXI_awready;
  output [0:0]S00_AXI_wready;
  output [2:0]S00_AXI_bid;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [0:0]S00_AXI_arready;
  output [2:0]S00_AXI_rid;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rlast;
  output [0:0]S00_AXI_rvalid;
  output [32:0]M_AXI_awaddr;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awburst;
  output [1:0]M_AXI_awlock;
  output [3:0]M_AXI_awcache;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  output M_AXI_awvalid;
  output [255:0]M_AXI_wdata;
  output [31:0]M_AXI_wstrb;
  output M_AXI_wlast;
  output M_AXI_wvalid;
  output M_AXI_bready;
  output [32:0]M_AXI_araddr;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arburst;
  output [1:0]M_AXI_arlock;
  output [3:0]M_AXI_arcache;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  output M_AXI_arvalid;
  output M_AXI_rready;
  input aclk;
  input hbm_aclk;
  input aresetn;
  input [2:0]S00_AXI_awid;
  input [39:0]S00_AXI_awaddr;
  input [7:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awsize;
  input [1:0]S00_AXI_awburst;
  input [0:0]S00_AXI_awlock;
  input [3:0]S00_AXI_awcache;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  input [0:0]S00_AXI_awvalid;
  input [511:0]S00_AXI_wdata;
  input [63:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wlast;
  input [0:0]S00_AXI_wvalid;
  input [0:0]S00_AXI_bready;
  input [2:0]S00_AXI_arid;
  input [39:0]S00_AXI_araddr;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arsize;
  input [1:0]S00_AXI_arburst;
  input [0:0]S00_AXI_arlock;
  input [3:0]S00_AXI_arcache;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  input [0:0]S00_AXI_arvalid;
  input [0:0]S00_AXI_rready;
  input aresetn1;
  input M_AXI_awready;
  input M_AXI_wready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_arready;
  input [255:0]M_AXI_rdata;
  input [1:0]M_AXI_rresp;
  input M_AXI_rlast;
  input M_AXI_rvalid;

  wire [32:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire M_AXI_arvalid;
  wire [32:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [3:0]M_AXI_awlen;
  wire [1:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [255:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [255:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [31:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire [39:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [2:0]S00_AXI_arid;
  wire [7:0]S00_AXI_arlen;
  wire [0:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire [0:0]S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire [0:0]S00_AXI_arvalid;
  wire [39:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [2:0]S00_AXI_awid;
  wire [7:0]S00_AXI_awlen;
  wire [0:0]S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire [0:0]S00_AXI_awready;
  wire [2:0]S00_AXI_awsize;
  wire [0:0]S00_AXI_awvalid;
  wire [2:0]S00_AXI_bid;
  wire [0:0]S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire [0:0]S00_AXI_bvalid;
  wire [511:0]S00_AXI_rdata;
  wire [2:0]S00_AXI_rid;
  wire [0:0]S00_AXI_rlast;
  wire [0:0]S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire [0:0]S00_AXI_rvalid;
  wire [511:0]S00_AXI_wdata;
  wire [0:0]S00_AXI_wlast;
  wire [0:0]S00_AXI_wready;
  wire [63:0]S00_AXI_wstrb;
  wire [0:0]S00_AXI_wvalid;
  wire aclk;
  wire aresetn;
  wire aresetn1;
  wire hbm_aclk;
  wire [32:0]interconnect0_6_M00_AXI_ARADDR;
  wire [1:0]interconnect0_6_M00_AXI_ARBURST;
  wire [3:0]interconnect0_6_M00_AXI_ARCACHE;
  wire [3:0]interconnect0_6_M00_AXI_ARLEN;
  wire [1:0]interconnect0_6_M00_AXI_ARLOCK;
  wire [2:0]interconnect0_6_M00_AXI_ARPROT;
  wire [3:0]interconnect0_6_M00_AXI_ARQOS;
  wire interconnect0_6_M00_AXI_ARREADY;
  wire [2:0]interconnect0_6_M00_AXI_ARSIZE;
  wire interconnect0_6_M00_AXI_ARVALID;
  wire [32:0]interconnect0_6_M00_AXI_AWADDR;
  wire [1:0]interconnect0_6_M00_AXI_AWBURST;
  wire [3:0]interconnect0_6_M00_AXI_AWCACHE;
  wire [3:0]interconnect0_6_M00_AXI_AWLEN;
  wire [1:0]interconnect0_6_M00_AXI_AWLOCK;
  wire [2:0]interconnect0_6_M00_AXI_AWPROT;
  wire [3:0]interconnect0_6_M00_AXI_AWQOS;
  wire interconnect0_6_M00_AXI_AWREADY;
  wire [2:0]interconnect0_6_M00_AXI_AWSIZE;
  wire interconnect0_6_M00_AXI_AWVALID;
  wire interconnect0_6_M00_AXI_BREADY;
  wire [1:0]interconnect0_6_M00_AXI_BRESP;
  wire interconnect0_6_M00_AXI_BVALID;
  wire [255:0]interconnect0_6_M00_AXI_RDATA;
  wire interconnect0_6_M00_AXI_RLAST;
  wire interconnect0_6_M00_AXI_RREADY;
  wire [1:0]interconnect0_6_M00_AXI_RRESP;
  wire interconnect0_6_M00_AXI_RVALID;
  wire [255:0]interconnect0_6_M00_AXI_WDATA;
  wire interconnect0_6_M00_AXI_WLAST;
  wire interconnect0_6_M00_AXI_WREADY;
  wire [31:0]interconnect0_6_M00_AXI_WSTRB;
  wire interconnect0_6_M00_AXI_WVALID;
  wire [2:0]NLW_slice0_6_m_axi_arsize_UNCONNECTED;
  wire [2:0]NLW_slice0_6_m_axi_awsize_UNCONNECTED;

  (* X_CORE_INFO = "bd_b7e7,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_interconnect0_6_0 interconnect0_6
       (.M00_AXI_araddr(interconnect0_6_M00_AXI_ARADDR),
        .M00_AXI_arburst(interconnect0_6_M00_AXI_ARBURST),
        .M00_AXI_arcache(interconnect0_6_M00_AXI_ARCACHE),
        .M00_AXI_arlen(interconnect0_6_M00_AXI_ARLEN),
        .M00_AXI_arlock(interconnect0_6_M00_AXI_ARLOCK),
        .M00_AXI_arprot(interconnect0_6_M00_AXI_ARPROT),
        .M00_AXI_arqos(interconnect0_6_M00_AXI_ARQOS),
        .M00_AXI_arready(interconnect0_6_M00_AXI_ARREADY),
        .M00_AXI_arsize(interconnect0_6_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(interconnect0_6_M00_AXI_ARVALID),
        .M00_AXI_awaddr(interconnect0_6_M00_AXI_AWADDR),
        .M00_AXI_awburst(interconnect0_6_M00_AXI_AWBURST),
        .M00_AXI_awcache(interconnect0_6_M00_AXI_AWCACHE),
        .M00_AXI_awlen(interconnect0_6_M00_AXI_AWLEN),
        .M00_AXI_awlock(interconnect0_6_M00_AXI_AWLOCK),
        .M00_AXI_awprot(interconnect0_6_M00_AXI_AWPROT),
        .M00_AXI_awqos(interconnect0_6_M00_AXI_AWQOS),
        .M00_AXI_awready(interconnect0_6_M00_AXI_AWREADY),
        .M00_AXI_awsize(interconnect0_6_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(interconnect0_6_M00_AXI_AWVALID),
        .M00_AXI_bready(interconnect0_6_M00_AXI_BREADY),
        .M00_AXI_bresp(interconnect0_6_M00_AXI_BRESP),
        .M00_AXI_bvalid(interconnect0_6_M00_AXI_BVALID),
        .M00_AXI_rdata(interconnect0_6_M00_AXI_RDATA),
        .M00_AXI_rlast(interconnect0_6_M00_AXI_RLAST),
        .M00_AXI_rready(interconnect0_6_M00_AXI_RREADY),
        .M00_AXI_rresp(interconnect0_6_M00_AXI_RRESP),
        .M00_AXI_rvalid(interconnect0_6_M00_AXI_RVALID),
        .M00_AXI_wdata(interconnect0_6_M00_AXI_WDATA),
        .M00_AXI_wlast(interconnect0_6_M00_AXI_WLAST),
        .M00_AXI_wready(interconnect0_6_M00_AXI_WREADY),
        .M00_AXI_wstrb(interconnect0_6_M00_AXI_WSTRB),
        .M00_AXI_wvalid(interconnect0_6_M00_AXI_WVALID),
        .S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arburst(S00_AXI_arburst),
        .S00_AXI_arcache(S00_AXI_arcache),
        .S00_AXI_arid(S00_AXI_arid),
        .S00_AXI_arlen(S00_AXI_arlen),
        .S00_AXI_arlock(S00_AXI_arlock),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arqos(S00_AXI_arqos),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arsize(S00_AXI_arsize),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awburst(S00_AXI_awburst),
        .S00_AXI_awcache(S00_AXI_awcache),
        .S00_AXI_awid(S00_AXI_awid),
        .S00_AXI_awlen(S00_AXI_awlen),
        .S00_AXI_awlock(S00_AXI_awlock),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awqos(S00_AXI_awqos),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awsize(S00_AXI_awsize),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bid(S00_AXI_bid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rid(S00_AXI_rid),
        .S00_AXI_rlast(S00_AXI_rlast),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wlast(S00_AXI_wlast),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid),
        .aclk(aclk),
        .aclk1(hbm_aclk),
        .aresetn(aresetn));
  (* X_CORE_INFO = "axi_register_slice_v2_1_25_axi_register_slice,Vivado 2021.2" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca_slice0_6_0 slice0_6
       (.aclk(hbm_aclk),
        .aresetn(aresetn1),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(NLW_slice0_6_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(NLW_slice0_6_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(interconnect0_6_M00_AXI_ARADDR),
        .s_axi_arburst(interconnect0_6_M00_AXI_ARBURST),
        .s_axi_arcache(interconnect0_6_M00_AXI_ARCACHE),
        .s_axi_arlen(interconnect0_6_M00_AXI_ARLEN),
        .s_axi_arlock(interconnect0_6_M00_AXI_ARLOCK),
        .s_axi_arprot(interconnect0_6_M00_AXI_ARPROT),
        .s_axi_arqos(interconnect0_6_M00_AXI_ARQOS),
        .s_axi_arready(interconnect0_6_M00_AXI_ARREADY),
        .s_axi_arsize(interconnect0_6_M00_AXI_ARSIZE),
        .s_axi_arvalid(interconnect0_6_M00_AXI_ARVALID),
        .s_axi_awaddr(interconnect0_6_M00_AXI_AWADDR),
        .s_axi_awburst(interconnect0_6_M00_AXI_AWBURST),
        .s_axi_awcache(interconnect0_6_M00_AXI_AWCACHE),
        .s_axi_awlen(interconnect0_6_M00_AXI_AWLEN),
        .s_axi_awlock(interconnect0_6_M00_AXI_AWLOCK),
        .s_axi_awprot(interconnect0_6_M00_AXI_AWPROT),
        .s_axi_awqos(interconnect0_6_M00_AXI_AWQOS),
        .s_axi_awready(interconnect0_6_M00_AXI_AWREADY),
        .s_axi_awsize(interconnect0_6_M00_AXI_AWSIZE),
        .s_axi_awvalid(interconnect0_6_M00_AXI_AWVALID),
        .s_axi_bready(interconnect0_6_M00_AXI_BREADY),
        .s_axi_bresp(interconnect0_6_M00_AXI_BRESP),
        .s_axi_bvalid(interconnect0_6_M00_AXI_BVALID),
        .s_axi_rdata(interconnect0_6_M00_AXI_RDATA),
        .s_axi_rlast(interconnect0_6_M00_AXI_RLAST),
        .s_axi_rready(interconnect0_6_M00_AXI_RREADY),
        .s_axi_rresp(interconnect0_6_M00_AXI_RRESP),
        .s_axi_rvalid(interconnect0_6_M00_AXI_RVALID),
        .s_axi_wdata(interconnect0_6_M00_AXI_WDATA),
        .s_axi_wlast(interconnect0_6_M00_AXI_WLAST),
        .s_axi_wready(interconnect0_6_M00_AXI_WREADY),
        .s_axi_wstrb(interconnect0_6_M00_AXI_WSTRB),
        .s_axi_wvalid(interconnect0_6_M00_AXI_WVALID));
endmodule

(* CHECK_LICENSE_TYPE = "pfm_dynamic_hmss_0_0,bd_5dca,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "bd_5dca,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (hbm_aclk,
    hbm_aresetn,
    hbm_ref_clk,
    hbm_mc_init_seq_complete,
    DRAM_0_STAT_TEMP,
    DRAM_1_STAT_TEMP,
    DRAM_STAT_CATTRIP,
    S_AXI_CTRL_awaddr,
    S_AXI_CTRL_awvalid,
    S_AXI_CTRL_awready,
    S_AXI_CTRL_wdata,
    S_AXI_CTRL_wvalid,
    S_AXI_CTRL_wready,
    S_AXI_CTRL_bresp,
    S_AXI_CTRL_bvalid,
    S_AXI_CTRL_bready,
    S_AXI_CTRL_araddr,
    S_AXI_CTRL_arvalid,
    S_AXI_CTRL_arready,
    S_AXI_CTRL_rdata,
    S_AXI_CTRL_rresp,
    S_AXI_CTRL_rvalid,
    S_AXI_CTRL_rready,
    ctrl_aclk,
    ctrl_aresetn,
    aclk,
    aclk1,
    aresetn,
    aresetn1,
    S00_AXI_awid,
    S00_AXI_awaddr,
    S00_AXI_awlen,
    S00_AXI_awsize,
    S00_AXI_awburst,
    S00_AXI_awlock,
    S00_AXI_awcache,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awvalid,
    S00_AXI_awready,
    S00_AXI_wdata,
    S00_AXI_wstrb,
    S00_AXI_wlast,
    S00_AXI_wvalid,
    S00_AXI_wready,
    S00_AXI_bid,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_bready,
    S00_AXI_arid,
    S00_AXI_araddr,
    S00_AXI_arlen,
    S00_AXI_arsize,
    S00_AXI_arburst,
    S00_AXI_arlock,
    S00_AXI_arcache,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arvalid,
    S00_AXI_arready,
    S00_AXI_rid,
    S00_AXI_rdata,
    S00_AXI_rresp,
    S00_AXI_rlast,
    S00_AXI_rvalid,
    S00_AXI_rready,
    S01_AXI_awaddr,
    S01_AXI_awlen,
    S01_AXI_awsize,
    S01_AXI_awburst,
    S01_AXI_awlock,
    S01_AXI_awcache,
    S01_AXI_awprot,
    S01_AXI_awqos,
    S01_AXI_awvalid,
    S01_AXI_awready,
    S01_AXI_wdata,
    S01_AXI_wstrb,
    S01_AXI_wlast,
    S01_AXI_wvalid,
    S01_AXI_wready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_bready,
    S01_AXI_araddr,
    S01_AXI_arlen,
    S01_AXI_arsize,
    S01_AXI_arburst,
    S01_AXI_arlock,
    S01_AXI_arcache,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arvalid,
    S01_AXI_arready,
    S01_AXI_rdata,
    S01_AXI_rresp,
    S01_AXI_rlast,
    S01_AXI_rvalid,
    S01_AXI_rready,
    S02_AXI_awaddr,
    S02_AXI_awlen,
    S02_AXI_awsize,
    S02_AXI_awburst,
    S02_AXI_awlock,
    S02_AXI_awcache,
    S02_AXI_awprot,
    S02_AXI_awqos,
    S02_AXI_awvalid,
    S02_AXI_awready,
    S02_AXI_wdata,
    S02_AXI_wstrb,
    S02_AXI_wlast,
    S02_AXI_wvalid,
    S02_AXI_wready,
    S02_AXI_bresp,
    S02_AXI_bvalid,
    S02_AXI_bready,
    S02_AXI_araddr,
    S02_AXI_arlen,
    S02_AXI_arsize,
    S02_AXI_arburst,
    S02_AXI_arlock,
    S02_AXI_arcache,
    S02_AXI_arprot,
    S02_AXI_arqos,
    S02_AXI_arvalid,
    S02_AXI_arready,
    S02_AXI_rdata,
    S02_AXI_rresp,
    S02_AXI_rlast,
    S02_AXI_rvalid,
    S02_AXI_rready,
    S03_AXI_awaddr,
    S03_AXI_awlen,
    S03_AXI_awsize,
    S03_AXI_awburst,
    S03_AXI_awlock,
    S03_AXI_awcache,
    S03_AXI_awprot,
    S03_AXI_awqos,
    S03_AXI_awvalid,
    S03_AXI_awready,
    S03_AXI_wdata,
    S03_AXI_wstrb,
    S03_AXI_wlast,
    S03_AXI_wvalid,
    S03_AXI_wready,
    S03_AXI_bresp,
    S03_AXI_bvalid,
    S03_AXI_bready,
    S03_AXI_araddr,
    S03_AXI_arlen,
    S03_AXI_arsize,
    S03_AXI_arburst,
    S03_AXI_arlock,
    S03_AXI_arcache,
    S03_AXI_arprot,
    S03_AXI_arqos,
    S03_AXI_arvalid,
    S03_AXI_arready,
    S03_AXI_rdata,
    S03_AXI_rresp,
    S03_AXI_rlast,
    S03_AXI_rvalid,
    S03_AXI_rready,
    S04_AXI_awaddr,
    S04_AXI_awlen,
    S04_AXI_awsize,
    S04_AXI_awburst,
    S04_AXI_awlock,
    S04_AXI_awcache,
    S04_AXI_awprot,
    S04_AXI_awqos,
    S04_AXI_awvalid,
    S04_AXI_awready,
    S04_AXI_wdata,
    S04_AXI_wstrb,
    S04_AXI_wlast,
    S04_AXI_wvalid,
    S04_AXI_wready,
    S04_AXI_bresp,
    S04_AXI_bvalid,
    S04_AXI_bready,
    S04_AXI_araddr,
    S04_AXI_arlen,
    S04_AXI_arsize,
    S04_AXI_arburst,
    S04_AXI_arlock,
    S04_AXI_arcache,
    S04_AXI_arprot,
    S04_AXI_arqos,
    S04_AXI_arvalid,
    S04_AXI_arready,
    S04_AXI_rdata,
    S04_AXI_rresp,
    S04_AXI_rlast,
    S04_AXI_rvalid,
    S04_AXI_rready,
    S05_AXI_awaddr,
    S05_AXI_awlen,
    S05_AXI_awsize,
    S05_AXI_awburst,
    S05_AXI_awlock,
    S05_AXI_awcache,
    S05_AXI_awprot,
    S05_AXI_awqos,
    S05_AXI_awvalid,
    S05_AXI_awready,
    S05_AXI_wdata,
    S05_AXI_wstrb,
    S05_AXI_wlast,
    S05_AXI_wvalid,
    S05_AXI_wready,
    S05_AXI_bresp,
    S05_AXI_bvalid,
    S05_AXI_bready,
    S05_AXI_araddr,
    S05_AXI_arlen,
    S05_AXI_arsize,
    S05_AXI_arburst,
    S05_AXI_arlock,
    S05_AXI_arcache,
    S05_AXI_arprot,
    S05_AXI_arqos,
    S05_AXI_arvalid,
    S05_AXI_arready,
    S05_AXI_rdata,
    S05_AXI_rresp,
    S05_AXI_rlast,
    S05_AXI_rvalid,
    S05_AXI_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.hbm_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.hbm_aclk, FREQ_HZ 450000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN pfm_dynamic_clk_out1_pfm_top_clkwiz_hbm_aclk_0, INSERT_VIP 0, ASSOCIATED_CLKEN s_sc_aclken" *) input hbm_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.hbm_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.hbm_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input hbm_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.hbm_ref_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.hbm_ref_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN pfm_dynamic_hbm_ref_clk, INSERT_VIP 0" *) input hbm_ref_clk;
  output hbm_mc_init_seq_complete;
  output [6:0]DRAM_0_STAT_TEMP;
  output [6:0]DRAM_1_STAT_TEMP;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.DRAM_STAT_CATTRIP INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.DRAM_STAT_CATTRIP, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output DRAM_STAT_CATTRIP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL AWADDR" *) input [21:0]S_AXI_CTRL_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL AWVALID" *) input [0:0]S_AXI_CTRL_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL AWREADY" *) output [0:0]S_AXI_CTRL_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL WDATA" *) input [31:0]S_AXI_CTRL_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL WVALID" *) input [0:0]S_AXI_CTRL_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL WREADY" *) output [0:0]S_AXI_CTRL_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL BRESP" *) output [1:0]S_AXI_CTRL_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL BVALID" *) output [0:0]S_AXI_CTRL_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL BREADY" *) input [0:0]S_AXI_CTRL_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL ARADDR" *) input [21:0]S_AXI_CTRL_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL ARVALID" *) input [0:0]S_AXI_CTRL_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL ARREADY" *) output [0:0]S_AXI_CTRL_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL RDATA" *) output [31:0]S_AXI_CTRL_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL RRESP" *) output [1:0]S_AXI_CTRL_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL RVALID" *) output [0:0]S_AXI_CTRL_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTRL RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CTRL, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 22, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN pfm_dynamic_s_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [0:0]S_AXI_CTRL_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ctrl_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ctrl_aclk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN pfm_dynamic_s_axi_aclk, ASSOCIATED_BUSIF S_AXI_CTRL, ASSOCIATED_RESET ctrl_aresetn, INSERT_VIP 0" *) input ctrl_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ctrl_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ctrl_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ctrl_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.aclk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN pfm_dynamic_dma_pcie_axi_aclk, ASSOCIATED_BUSIF S00_AXI, INSERT_VIP 0, ASSOCIATED_CLKEN m_sc_aclken" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.aclk1 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.aclk1, FREQ_HZ 300000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, ASSOCIATED_BUSIF S01_AXI:S02_AXI:S03_AXI:S04_AXI:S05_AXI, INSERT_VIP 0, ASSOCIATED_CLKEN m_sc_aclken" *) input aclk1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.aresetn1 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.aresetn1, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWID" *) input [2:0]S00_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [39:0]S00_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLEN" *) input [7:0]S00_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWSIZE" *) input [2:0]S00_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWBURST" *) input [1:0]S00_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLOCK" *) input [0:0]S00_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWCACHE" *) input [3:0]S00_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]S00_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWQOS" *) input [3:0]S00_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input [0:0]S00_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output [0:0]S00_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [511:0]S00_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [63:0]S00_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WLAST" *) input [0:0]S00_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input [0:0]S00_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output [0:0]S00_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BID" *) output [2:0]S00_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]S00_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output [0:0]S00_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input [0:0]S00_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARID" *) input [2:0]S00_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [39:0]S00_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLEN" *) input [7:0]S00_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARSIZE" *) input [2:0]S00_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARBURST" *) input [1:0]S00_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLOCK" *) input [0:0]S00_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARCACHE" *) input [3:0]S00_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]S00_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARQOS" *) input [3:0]S00_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input [0:0]S00_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output [0:0]S00_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RID" *) output [2:0]S00_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [511:0]S00_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]S00_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RLAST" *) output [0:0]S00_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output [0:0]S00_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 250000000, ID_WIDTH 3, ADDR_WIDTH 33, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN pfm_dynamic_dma_pcie_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, SLR_ASSIGNMENT SLR2, INSERT_VIP 0" *) input [0:0]S00_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWADDR" *) input [63:0]S01_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWLEN" *) input [7:0]S01_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWSIZE" *) input [2:0]S01_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWBURST" *) input [1:0]S01_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWLOCK" *) input [0:0]S01_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWCACHE" *) input [3:0]S01_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWPROT" *) input [2:0]S01_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWQOS" *) input [3:0]S01_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWVALID" *) input [0:0]S01_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWREADY" *) output [0:0]S01_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WDATA" *) input [511:0]S01_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WSTRB" *) input [63:0]S01_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WLAST" *) input [0:0]S01_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WVALID" *) input [0:0]S01_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WREADY" *) output [0:0]S01_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BRESP" *) output [1:0]S01_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BVALID" *) output [0:0]S01_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BREADY" *) input [0:0]S01_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARADDR" *) input [63:0]S01_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLEN" *) input [7:0]S01_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARSIZE" *) input [2:0]S01_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARBURST" *) input [1:0]S01_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLOCK" *) input [0:0]S01_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARCACHE" *) input [3:0]S01_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARPROT" *) input [2:0]S01_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARQOS" *) input [3:0]S01_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARVALID" *) input [0:0]S01_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARREADY" *) output [0:0]S01_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RDATA" *) output [511:0]S01_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RRESP" *) output [1:0]S01_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RLAST" *) output [0:0]S01_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RVALID" *) output [0:0]S01_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXI, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 300000000, ID_WIDTH 0, ADDR_WIDTH 28, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [0:0]S01_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWADDR" *) input [63:0]S02_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWLEN" *) input [7:0]S02_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWSIZE" *) input [2:0]S02_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWBURST" *) input [1:0]S02_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWLOCK" *) input [0:0]S02_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWCACHE" *) input [3:0]S02_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWPROT" *) input [2:0]S02_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWQOS" *) input [3:0]S02_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWVALID" *) input [0:0]S02_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI AWREADY" *) output [0:0]S02_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WDATA" *) input [511:0]S02_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WSTRB" *) input [63:0]S02_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WLAST" *) input [0:0]S02_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WVALID" *) input [0:0]S02_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI WREADY" *) output [0:0]S02_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BRESP" *) output [1:0]S02_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BVALID" *) output [0:0]S02_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI BREADY" *) input [0:0]S02_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARADDR" *) input [63:0]S02_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARLEN" *) input [7:0]S02_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARSIZE" *) input [2:0]S02_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARBURST" *) input [1:0]S02_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARLOCK" *) input [0:0]S02_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARCACHE" *) input [3:0]S02_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARPROT" *) input [2:0]S02_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARQOS" *) input [3:0]S02_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARVALID" *) input [0:0]S02_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI ARREADY" *) output [0:0]S02_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RDATA" *) output [511:0]S02_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RRESP" *) output [1:0]S02_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RLAST" *) output [0:0]S02_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RVALID" *) output [0:0]S02_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S02_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S02_AXI, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 300000000, ID_WIDTH 0, ADDR_WIDTH 28, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [0:0]S02_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWADDR" *) input [63:0]S03_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWLEN" *) input [7:0]S03_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWSIZE" *) input [2:0]S03_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWBURST" *) input [1:0]S03_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWLOCK" *) input [0:0]S03_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWCACHE" *) input [3:0]S03_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWPROT" *) input [2:0]S03_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWQOS" *) input [3:0]S03_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWVALID" *) input [0:0]S03_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI AWREADY" *) output [0:0]S03_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WDATA" *) input [511:0]S03_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WSTRB" *) input [63:0]S03_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WLAST" *) input [0:0]S03_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WVALID" *) input [0:0]S03_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI WREADY" *) output [0:0]S03_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BRESP" *) output [1:0]S03_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BVALID" *) output [0:0]S03_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI BREADY" *) input [0:0]S03_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARADDR" *) input [63:0]S03_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARLEN" *) input [7:0]S03_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARSIZE" *) input [2:0]S03_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARBURST" *) input [1:0]S03_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARLOCK" *) input [0:0]S03_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARCACHE" *) input [3:0]S03_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARPROT" *) input [2:0]S03_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARQOS" *) input [3:0]S03_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARVALID" *) input [0:0]S03_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI ARREADY" *) output [0:0]S03_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RDATA" *) output [511:0]S03_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RRESP" *) output [1:0]S03_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RLAST" *) output [0:0]S03_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RVALID" *) output [0:0]S03_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S03_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S03_AXI, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 300000000, ID_WIDTH 0, ADDR_WIDTH 28, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 0, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 64, PHASE 0.000, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [0:0]S03_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWADDR" *) input [63:0]S04_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWLEN" *) input [7:0]S04_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWSIZE" *) input [2:0]S04_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWBURST" *) input [1:0]S04_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWLOCK" *) input [0:0]S04_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWCACHE" *) input [3:0]S04_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWPROT" *) input [2:0]S04_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWQOS" *) input [3:0]S04_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWVALID" *) input [0:0]S04_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI AWREADY" *) output [0:0]S04_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WDATA" *) input [511:0]S04_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WSTRB" *) input [63:0]S04_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WLAST" *) input [0:0]S04_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WVALID" *) input [0:0]S04_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI WREADY" *) output [0:0]S04_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI BRESP" *) output [1:0]S04_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI BVALID" *) output [0:0]S04_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI BREADY" *) input [0:0]S04_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARADDR" *) input [63:0]S04_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARLEN" *) input [7:0]S04_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARSIZE" *) input [2:0]S04_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARBURST" *) input [1:0]S04_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARLOCK" *) input [0:0]S04_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARCACHE" *) input [3:0]S04_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARPROT" *) input [2:0]S04_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARQOS" *) input [3:0]S04_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARVALID" *) input [0:0]S04_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI ARREADY" *) output [0:0]S04_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RDATA" *) output [511:0]S04_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RRESP" *) output [1:0]S04_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RLAST" *) output [0:0]S04_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RVALID" *) output [0:0]S04_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S04_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S04_AXI, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 300000000, ID_WIDTH 0, ADDR_WIDTH 28, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 0, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 64, PHASE 0.000, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [0:0]S04_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWADDR" *) input [63:0]S05_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWLEN" *) input [7:0]S05_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWSIZE" *) input [2:0]S05_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWBURST" *) input [1:0]S05_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWLOCK" *) input [0:0]S05_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWCACHE" *) input [3:0]S05_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWPROT" *) input [2:0]S05_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWQOS" *) input [3:0]S05_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWVALID" *) input [0:0]S05_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI AWREADY" *) output [0:0]S05_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WDATA" *) input [511:0]S05_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WSTRB" *) input [63:0]S05_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WLAST" *) input [0:0]S05_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WVALID" *) input [0:0]S05_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI WREADY" *) output [0:0]S05_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI BRESP" *) output [1:0]S05_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI BVALID" *) output [0:0]S05_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI BREADY" *) input [0:0]S05_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARADDR" *) input [63:0]S05_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARLEN" *) input [7:0]S05_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARSIZE" *) input [2:0]S05_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARBURST" *) input [1:0]S05_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARLOCK" *) input [0:0]S05_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARCACHE" *) input [3:0]S05_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARPROT" *) input [2:0]S05_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARQOS" *) input [3:0]S05_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARVALID" *) input [0:0]S05_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI ARREADY" *) output [0:0]S05_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RDATA" *) output [511:0]S05_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RRESP" *) output [1:0]S05_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RLAST" *) output [0:0]S05_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RVALID" *) output [0:0]S05_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S05_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S05_AXI, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 300000000, ID_WIDTH 0, ADDR_WIDTH 28, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 0, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 64, PHASE 0.000, CLK_DOMAIN pfm_dynamic_clkwiz_kernel_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [0:0]S05_AXI_rready;

  wire [6:0]DRAM_0_STAT_TEMP;
  wire [6:0]DRAM_1_STAT_TEMP;
  wire DRAM_STAT_CATTRIP;
  wire [39:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [2:0]S00_AXI_arid;
  wire [7:0]S00_AXI_arlen;
  wire [0:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire [0:0]S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire [0:0]S00_AXI_arvalid;
  wire [39:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [2:0]S00_AXI_awid;
  wire [7:0]S00_AXI_awlen;
  wire [0:0]S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire [0:0]S00_AXI_awready;
  wire [2:0]S00_AXI_awsize;
  wire [0:0]S00_AXI_awvalid;
  wire [2:0]S00_AXI_bid;
  wire [0:0]S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire [0:0]S00_AXI_bvalid;
  wire [511:0]S00_AXI_rdata;
  wire [2:0]S00_AXI_rid;
  wire [0:0]S00_AXI_rlast;
  wire [0:0]S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire [0:0]S00_AXI_rvalid;
  wire [511:0]S00_AXI_wdata;
  wire [0:0]S00_AXI_wlast;
  wire [0:0]S00_AXI_wready;
  wire [63:0]S00_AXI_wstrb;
  wire [0:0]S00_AXI_wvalid;
  wire [63:0]S01_AXI_araddr;
  wire [1:0]S01_AXI_arburst;
  wire [3:0]S01_AXI_arcache;
  wire [7:0]S01_AXI_arlen;
  wire [0:0]S01_AXI_arlock;
  wire [2:0]S01_AXI_arprot;
  wire [3:0]S01_AXI_arqos;
  wire [0:0]S01_AXI_arready;
  wire [2:0]S01_AXI_arsize;
  wire [0:0]S01_AXI_arvalid;
  wire [63:0]S01_AXI_awaddr;
  wire [1:0]S01_AXI_awburst;
  wire [3:0]S01_AXI_awcache;
  wire [7:0]S01_AXI_awlen;
  wire [0:0]S01_AXI_awlock;
  wire [2:0]S01_AXI_awprot;
  wire [3:0]S01_AXI_awqos;
  wire [0:0]S01_AXI_awready;
  wire [2:0]S01_AXI_awsize;
  wire [0:0]S01_AXI_awvalid;
  wire [0:0]S01_AXI_bready;
  wire [1:0]S01_AXI_bresp;
  wire [0:0]S01_AXI_bvalid;
  wire [511:0]S01_AXI_rdata;
  wire [0:0]S01_AXI_rlast;
  wire [0:0]S01_AXI_rready;
  wire [1:0]S01_AXI_rresp;
  wire [0:0]S01_AXI_rvalid;
  wire [511:0]S01_AXI_wdata;
  wire [0:0]S01_AXI_wlast;
  wire [0:0]S01_AXI_wready;
  wire [63:0]S01_AXI_wstrb;
  wire [0:0]S01_AXI_wvalid;
  wire [63:0]S02_AXI_araddr;
  wire [1:0]S02_AXI_arburst;
  wire [3:0]S02_AXI_arcache;
  wire [7:0]S02_AXI_arlen;
  wire [0:0]S02_AXI_arlock;
  wire [2:0]S02_AXI_arprot;
  wire [3:0]S02_AXI_arqos;
  wire [0:0]S02_AXI_arready;
  wire [2:0]S02_AXI_arsize;
  wire [0:0]S02_AXI_arvalid;
  wire [63:0]S02_AXI_awaddr;
  wire [1:0]S02_AXI_awburst;
  wire [3:0]S02_AXI_awcache;
  wire [7:0]S02_AXI_awlen;
  wire [0:0]S02_AXI_awlock;
  wire [2:0]S02_AXI_awprot;
  wire [3:0]S02_AXI_awqos;
  wire [0:0]S02_AXI_awready;
  wire [2:0]S02_AXI_awsize;
  wire [0:0]S02_AXI_awvalid;
  wire [0:0]S02_AXI_bready;
  wire [1:0]S02_AXI_bresp;
  wire [0:0]S02_AXI_bvalid;
  wire [511:0]S02_AXI_rdata;
  wire [0:0]S02_AXI_rlast;
  wire [0:0]S02_AXI_rready;
  wire [1:0]S02_AXI_rresp;
  wire [0:0]S02_AXI_rvalid;
  wire [511:0]S02_AXI_wdata;
  wire [0:0]S02_AXI_wlast;
  wire [0:0]S02_AXI_wready;
  wire [63:0]S02_AXI_wstrb;
  wire [0:0]S02_AXI_wvalid;
  wire [63:0]S03_AXI_araddr;
  wire [1:0]S03_AXI_arburst;
  wire [3:0]S03_AXI_arcache;
  wire [7:0]S03_AXI_arlen;
  wire [0:0]S03_AXI_arlock;
  wire [2:0]S03_AXI_arprot;
  wire [3:0]S03_AXI_arqos;
  wire [0:0]S03_AXI_arready;
  wire [2:0]S03_AXI_arsize;
  wire [0:0]S03_AXI_arvalid;
  wire [63:0]S03_AXI_awaddr;
  wire [1:0]S03_AXI_awburst;
  wire [3:0]S03_AXI_awcache;
  wire [7:0]S03_AXI_awlen;
  wire [0:0]S03_AXI_awlock;
  wire [2:0]S03_AXI_awprot;
  wire [3:0]S03_AXI_awqos;
  wire [0:0]S03_AXI_awready;
  wire [2:0]S03_AXI_awsize;
  wire [0:0]S03_AXI_awvalid;
  wire [0:0]S03_AXI_bready;
  wire [1:0]S03_AXI_bresp;
  wire [0:0]S03_AXI_bvalid;
  wire [511:0]S03_AXI_rdata;
  wire [0:0]S03_AXI_rlast;
  wire [0:0]S03_AXI_rready;
  wire [1:0]S03_AXI_rresp;
  wire [0:0]S03_AXI_rvalid;
  wire [511:0]S03_AXI_wdata;
  wire [0:0]S03_AXI_wlast;
  wire [0:0]S03_AXI_wready;
  wire [63:0]S03_AXI_wstrb;
  wire [0:0]S03_AXI_wvalid;
  wire [63:0]S04_AXI_araddr;
  wire [1:0]S04_AXI_arburst;
  wire [3:0]S04_AXI_arcache;
  wire [7:0]S04_AXI_arlen;
  wire [0:0]S04_AXI_arlock;
  wire [2:0]S04_AXI_arprot;
  wire [3:0]S04_AXI_arqos;
  wire [0:0]S04_AXI_arready;
  wire [2:0]S04_AXI_arsize;
  wire [0:0]S04_AXI_arvalid;
  wire [63:0]S04_AXI_awaddr;
  wire [1:0]S04_AXI_awburst;
  wire [3:0]S04_AXI_awcache;
  wire [7:0]S04_AXI_awlen;
  wire [0:0]S04_AXI_awlock;
  wire [2:0]S04_AXI_awprot;
  wire [3:0]S04_AXI_awqos;
  wire [0:0]S04_AXI_awready;
  wire [2:0]S04_AXI_awsize;
  wire [0:0]S04_AXI_awvalid;
  wire [0:0]S04_AXI_bready;
  wire [1:0]S04_AXI_bresp;
  wire [0:0]S04_AXI_bvalid;
  wire [511:0]S04_AXI_rdata;
  wire [0:0]S04_AXI_rlast;
  wire [0:0]S04_AXI_rready;
  wire [1:0]S04_AXI_rresp;
  wire [0:0]S04_AXI_rvalid;
  wire [511:0]S04_AXI_wdata;
  wire [0:0]S04_AXI_wlast;
  wire [0:0]S04_AXI_wready;
  wire [63:0]S04_AXI_wstrb;
  wire [0:0]S04_AXI_wvalid;
  wire [63:0]S05_AXI_araddr;
  wire [1:0]S05_AXI_arburst;
  wire [3:0]S05_AXI_arcache;
  wire [7:0]S05_AXI_arlen;
  wire [0:0]S05_AXI_arlock;
  wire [2:0]S05_AXI_arprot;
  wire [3:0]S05_AXI_arqos;
  wire [0:0]S05_AXI_arready;
  wire [2:0]S05_AXI_arsize;
  wire [0:0]S05_AXI_arvalid;
  wire [63:0]S05_AXI_awaddr;
  wire [1:0]S05_AXI_awburst;
  wire [3:0]S05_AXI_awcache;
  wire [7:0]S05_AXI_awlen;
  wire [0:0]S05_AXI_awlock;
  wire [2:0]S05_AXI_awprot;
  wire [3:0]S05_AXI_awqos;
  wire [0:0]S05_AXI_awready;
  wire [2:0]S05_AXI_awsize;
  wire [0:0]S05_AXI_awvalid;
  wire [0:0]S05_AXI_bready;
  wire [1:0]S05_AXI_bresp;
  wire [0:0]S05_AXI_bvalid;
  wire [511:0]S05_AXI_rdata;
  wire [0:0]S05_AXI_rlast;
  wire [0:0]S05_AXI_rready;
  wire [1:0]S05_AXI_rresp;
  wire [0:0]S05_AXI_rvalid;
  wire [511:0]S05_AXI_wdata;
  wire [0:0]S05_AXI_wlast;
  wire [0:0]S05_AXI_wready;
  wire [63:0]S05_AXI_wstrb;
  wire [0:0]S05_AXI_wvalid;
  wire [21:0]S_AXI_CTRL_araddr;
  wire [0:0]S_AXI_CTRL_arready;
  wire [0:0]S_AXI_CTRL_arvalid;
  wire [21:0]S_AXI_CTRL_awaddr;
  wire [0:0]S_AXI_CTRL_awready;
  wire [0:0]S_AXI_CTRL_awvalid;
  wire [0:0]S_AXI_CTRL_bready;
  wire [1:0]S_AXI_CTRL_bresp;
  wire [0:0]S_AXI_CTRL_bvalid;
  wire [31:0]S_AXI_CTRL_rdata;
  wire [0:0]S_AXI_CTRL_rready;
  wire [1:0]S_AXI_CTRL_rresp;
  wire [0:0]S_AXI_CTRL_rvalid;
  wire [31:0]S_AXI_CTRL_wdata;
  wire [0:0]S_AXI_CTRL_wready;
  wire [0:0]S_AXI_CTRL_wvalid;
  wire aclk;
  wire aclk1;
  wire aresetn;
  wire aresetn1;
  wire ctrl_aclk;
  wire ctrl_aresetn;
  wire hbm_aclk;
  wire hbm_aresetn;
  wire hbm_mc_init_seq_complete;
  wire hbm_ref_clk;

  (* HW_HANDOFF = "pfm_dynamic_hmss_0_0.hwdef" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5dca inst
       (.DRAM_0_STAT_TEMP(DRAM_0_STAT_TEMP),
        .DRAM_1_STAT_TEMP(DRAM_1_STAT_TEMP),
        .DRAM_STAT_CATTRIP(DRAM_STAT_CATTRIP),
        .S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arburst(S00_AXI_arburst),
        .S00_AXI_arcache(S00_AXI_arcache),
        .S00_AXI_arid(S00_AXI_arid),
        .S00_AXI_arlen(S00_AXI_arlen),
        .S00_AXI_arlock(S00_AXI_arlock),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arqos(S00_AXI_arqos),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arsize(S00_AXI_arsize),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awburst(S00_AXI_awburst),
        .S00_AXI_awcache(S00_AXI_awcache),
        .S00_AXI_awid(S00_AXI_awid),
        .S00_AXI_awlen(S00_AXI_awlen),
        .S00_AXI_awlock(S00_AXI_awlock),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awqos(S00_AXI_awqos),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awsize(S00_AXI_awsize),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bid(S00_AXI_bid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rid(S00_AXI_rid),
        .S00_AXI_rlast(S00_AXI_rlast),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wlast(S00_AXI_wlast),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid),
        .S01_AXI_araddr(S01_AXI_araddr),
        .S01_AXI_arburst(S01_AXI_arburst),
        .S01_AXI_arcache(S01_AXI_arcache),
        .S01_AXI_arlen(S01_AXI_arlen),
        .S01_AXI_arlock(S01_AXI_arlock),
        .S01_AXI_arprot(S01_AXI_arprot),
        .S01_AXI_arqos(S01_AXI_arqos),
        .S01_AXI_arready(S01_AXI_arready),
        .S01_AXI_arsize(S01_AXI_arsize),
        .S01_AXI_arvalid(S01_AXI_arvalid),
        .S01_AXI_awaddr(S01_AXI_awaddr),
        .S01_AXI_awburst(S01_AXI_awburst),
        .S01_AXI_awcache(S01_AXI_awcache),
        .S01_AXI_awlen(S01_AXI_awlen),
        .S01_AXI_awlock(S01_AXI_awlock),
        .S01_AXI_awprot(S01_AXI_awprot),
        .S01_AXI_awqos(S01_AXI_awqos),
        .S01_AXI_awready(S01_AXI_awready),
        .S01_AXI_awsize(S01_AXI_awsize),
        .S01_AXI_awvalid(S01_AXI_awvalid),
        .S01_AXI_bready(S01_AXI_bready),
        .S01_AXI_bresp(S01_AXI_bresp),
        .S01_AXI_bvalid(S01_AXI_bvalid),
        .S01_AXI_rdata(S01_AXI_rdata),
        .S01_AXI_rlast(S01_AXI_rlast),
        .S01_AXI_rready(S01_AXI_rready),
        .S01_AXI_rresp(S01_AXI_rresp),
        .S01_AXI_rvalid(S01_AXI_rvalid),
        .S01_AXI_wdata(S01_AXI_wdata),
        .S01_AXI_wlast(S01_AXI_wlast),
        .S01_AXI_wready(S01_AXI_wready),
        .S01_AXI_wstrb(S01_AXI_wstrb),
        .S01_AXI_wvalid(S01_AXI_wvalid),
        .S02_AXI_araddr(S02_AXI_araddr),
        .S02_AXI_arburst(S02_AXI_arburst),
        .S02_AXI_arcache(S02_AXI_arcache),
        .S02_AXI_arlen(S02_AXI_arlen),
        .S02_AXI_arlock(S02_AXI_arlock),
        .S02_AXI_arprot(S02_AXI_arprot),
        .S02_AXI_arqos(S02_AXI_arqos),
        .S02_AXI_arready(S02_AXI_arready),
        .S02_AXI_arsize(S02_AXI_arsize),
        .S02_AXI_arvalid(S02_AXI_arvalid),
        .S02_AXI_awaddr(S02_AXI_awaddr),
        .S02_AXI_awburst(S02_AXI_awburst),
        .S02_AXI_awcache(S02_AXI_awcache),
        .S02_AXI_awlen(S02_AXI_awlen),
        .S02_AXI_awlock(S02_AXI_awlock),
        .S02_AXI_awprot(S02_AXI_awprot),
        .S02_AXI_awqos(S02_AXI_awqos),
        .S02_AXI_awready(S02_AXI_awready),
        .S02_AXI_awsize(S02_AXI_awsize),
        .S02_AXI_awvalid(S02_AXI_awvalid),
        .S02_AXI_bready(S02_AXI_bready),
        .S02_AXI_bresp(S02_AXI_bresp),
        .S02_AXI_bvalid(S02_AXI_bvalid),
        .S02_AXI_rdata(S02_AXI_rdata),
        .S02_AXI_rlast(S02_AXI_rlast),
        .S02_AXI_rready(S02_AXI_rready),
        .S02_AXI_rresp(S02_AXI_rresp),
        .S02_AXI_rvalid(S02_AXI_rvalid),
        .S02_AXI_wdata(S02_AXI_wdata),
        .S02_AXI_wlast(S02_AXI_wlast),
        .S02_AXI_wready(S02_AXI_wready),
        .S02_AXI_wstrb(S02_AXI_wstrb),
        .S02_AXI_wvalid(S02_AXI_wvalid),
        .S03_AXI_araddr(S03_AXI_araddr),
        .S03_AXI_arburst(S03_AXI_arburst),
        .S03_AXI_arcache(S03_AXI_arcache),
        .S03_AXI_arlen(S03_AXI_arlen),
        .S03_AXI_arlock(S03_AXI_arlock),
        .S03_AXI_arprot(S03_AXI_arprot),
        .S03_AXI_arqos(S03_AXI_arqos),
        .S03_AXI_arready(S03_AXI_arready),
        .S03_AXI_arsize(S03_AXI_arsize),
        .S03_AXI_arvalid(S03_AXI_arvalid),
        .S03_AXI_awaddr(S03_AXI_awaddr),
        .S03_AXI_awburst(S03_AXI_awburst),
        .S03_AXI_awcache(S03_AXI_awcache),
        .S03_AXI_awlen(S03_AXI_awlen),
        .S03_AXI_awlock(S03_AXI_awlock),
        .S03_AXI_awprot(S03_AXI_awprot),
        .S03_AXI_awqos(S03_AXI_awqos),
        .S03_AXI_awready(S03_AXI_awready),
        .S03_AXI_awsize(S03_AXI_awsize),
        .S03_AXI_awvalid(S03_AXI_awvalid),
        .S03_AXI_bready(S03_AXI_bready),
        .S03_AXI_bresp(S03_AXI_bresp),
        .S03_AXI_bvalid(S03_AXI_bvalid),
        .S03_AXI_rdata(S03_AXI_rdata),
        .S03_AXI_rlast(S03_AXI_rlast),
        .S03_AXI_rready(S03_AXI_rready),
        .S03_AXI_rresp(S03_AXI_rresp),
        .S03_AXI_rvalid(S03_AXI_rvalid),
        .S03_AXI_wdata(S03_AXI_wdata),
        .S03_AXI_wlast(S03_AXI_wlast),
        .S03_AXI_wready(S03_AXI_wready),
        .S03_AXI_wstrb(S03_AXI_wstrb),
        .S03_AXI_wvalid(S03_AXI_wvalid),
        .S04_AXI_araddr(S04_AXI_araddr),
        .S04_AXI_arburst(S04_AXI_arburst),
        .S04_AXI_arcache(S04_AXI_arcache),
        .S04_AXI_arlen(S04_AXI_arlen),
        .S04_AXI_arlock(S04_AXI_arlock),
        .S04_AXI_arprot(S04_AXI_arprot),
        .S04_AXI_arqos(S04_AXI_arqos),
        .S04_AXI_arready(S04_AXI_arready),
        .S04_AXI_arsize(S04_AXI_arsize),
        .S04_AXI_arvalid(S04_AXI_arvalid),
        .S04_AXI_awaddr(S04_AXI_awaddr),
        .S04_AXI_awburst(S04_AXI_awburst),
        .S04_AXI_awcache(S04_AXI_awcache),
        .S04_AXI_awlen(S04_AXI_awlen),
        .S04_AXI_awlock(S04_AXI_awlock),
        .S04_AXI_awprot(S04_AXI_awprot),
        .S04_AXI_awqos(S04_AXI_awqos),
        .S04_AXI_awready(S04_AXI_awready),
        .S04_AXI_awsize(S04_AXI_awsize),
        .S04_AXI_awvalid(S04_AXI_awvalid),
        .S04_AXI_bready(S04_AXI_bready),
        .S04_AXI_bresp(S04_AXI_bresp),
        .S04_AXI_bvalid(S04_AXI_bvalid),
        .S04_AXI_rdata(S04_AXI_rdata),
        .S04_AXI_rlast(S04_AXI_rlast),
        .S04_AXI_rready(S04_AXI_rready),
        .S04_AXI_rresp(S04_AXI_rresp),
        .S04_AXI_rvalid(S04_AXI_rvalid),
        .S04_AXI_wdata(S04_AXI_wdata),
        .S04_AXI_wlast(S04_AXI_wlast),
        .S04_AXI_wready(S04_AXI_wready),
        .S04_AXI_wstrb(S04_AXI_wstrb),
        .S04_AXI_wvalid(S04_AXI_wvalid),
        .S05_AXI_araddr(S05_AXI_araddr),
        .S05_AXI_arburst(S05_AXI_arburst),
        .S05_AXI_arcache(S05_AXI_arcache),
        .S05_AXI_arlen(S05_AXI_arlen),
        .S05_AXI_arlock(S05_AXI_arlock),
        .S05_AXI_arprot(S05_AXI_arprot),
        .S05_AXI_arqos(S05_AXI_arqos),
        .S05_AXI_arready(S05_AXI_arready),
        .S05_AXI_arsize(S05_AXI_arsize),
        .S05_AXI_arvalid(S05_AXI_arvalid),
        .S05_AXI_awaddr(S05_AXI_awaddr),
        .S05_AXI_awburst(S05_AXI_awburst),
        .S05_AXI_awcache(S05_AXI_awcache),
        .S05_AXI_awlen(S05_AXI_awlen),
        .S05_AXI_awlock(S05_AXI_awlock),
        .S05_AXI_awprot(S05_AXI_awprot),
        .S05_AXI_awqos(S05_AXI_awqos),
        .S05_AXI_awready(S05_AXI_awready),
        .S05_AXI_awsize(S05_AXI_awsize),
        .S05_AXI_awvalid(S05_AXI_awvalid),
        .S05_AXI_bready(S05_AXI_bready),
        .S05_AXI_bresp(S05_AXI_bresp),
        .S05_AXI_bvalid(S05_AXI_bvalid),
        .S05_AXI_rdata(S05_AXI_rdata),
        .S05_AXI_rlast(S05_AXI_rlast),
        .S05_AXI_rready(S05_AXI_rready),
        .S05_AXI_rresp(S05_AXI_rresp),
        .S05_AXI_rvalid(S05_AXI_rvalid),
        .S05_AXI_wdata(S05_AXI_wdata),
        .S05_AXI_wlast(S05_AXI_wlast),
        .S05_AXI_wready(S05_AXI_wready),
        .S05_AXI_wstrb(S05_AXI_wstrb),
        .S05_AXI_wvalid(S05_AXI_wvalid),
        .S_AXI_CTRL_araddr(S_AXI_CTRL_araddr),
        .S_AXI_CTRL_arready(S_AXI_CTRL_arready),
        .S_AXI_CTRL_arvalid(S_AXI_CTRL_arvalid),
        .S_AXI_CTRL_awaddr(S_AXI_CTRL_awaddr),
        .S_AXI_CTRL_awready(S_AXI_CTRL_awready),
        .S_AXI_CTRL_awvalid(S_AXI_CTRL_awvalid),
        .S_AXI_CTRL_bready(S_AXI_CTRL_bready),
        .S_AXI_CTRL_bresp(S_AXI_CTRL_bresp),
        .S_AXI_CTRL_bvalid(S_AXI_CTRL_bvalid),
        .S_AXI_CTRL_rdata(S_AXI_CTRL_rdata),
        .S_AXI_CTRL_rready(S_AXI_CTRL_rready),
        .S_AXI_CTRL_rresp(S_AXI_CTRL_rresp),
        .S_AXI_CTRL_rvalid(S_AXI_CTRL_rvalid),
        .S_AXI_CTRL_wdata(S_AXI_CTRL_wdata),
        .S_AXI_CTRL_wready(S_AXI_CTRL_wready),
        .S_AXI_CTRL_wvalid(S_AXI_CTRL_wvalid),
        .aclk(aclk),
        .aclk1(aclk1),
        .aresetn(aresetn),
        .aresetn1(aresetn1),
        .ctrl_aclk(ctrl_aclk),
        .ctrl_aresetn(ctrl_aresetn),
        .hbm_aclk(hbm_aclk),
        .hbm_aresetn(hbm_aresetn),
        .hbm_mc_init_seq_complete(hbm_mc_init_seq_complete),
        .hbm_ref_clk(hbm_ref_clk));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
