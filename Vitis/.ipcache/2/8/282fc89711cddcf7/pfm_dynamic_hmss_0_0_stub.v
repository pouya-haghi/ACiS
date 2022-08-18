// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Aug 17 18:41:02 2022
// Host        : caadlab-01 running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ pfm_dynamic_hmss_0_0_stub.v
// Design      : pfm_dynamic_hmss_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_5dca,Vivado 2021.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(hbm_aclk, hbm_aresetn, hbm_ref_clk, 
  hbm_mc_init_seq_complete, DRAM_0_STAT_TEMP, DRAM_1_STAT_TEMP, DRAM_STAT_CATTRIP, 
  S_AXI_CTRL_awaddr, S_AXI_CTRL_awvalid, S_AXI_CTRL_awready, S_AXI_CTRL_wdata, 
  S_AXI_CTRL_wvalid, S_AXI_CTRL_wready, S_AXI_CTRL_bresp, S_AXI_CTRL_bvalid, 
  S_AXI_CTRL_bready, S_AXI_CTRL_araddr, S_AXI_CTRL_arvalid, S_AXI_CTRL_arready, 
  S_AXI_CTRL_rdata, S_AXI_CTRL_rresp, S_AXI_CTRL_rvalid, S_AXI_CTRL_rready, ctrl_aclk, 
  ctrl_aresetn, aclk, aclk1, aresetn, aresetn1, S00_AXI_awid, S00_AXI_awaddr, S00_AXI_awlen, 
  S00_AXI_awsize, S00_AXI_awburst, S00_AXI_awlock, S00_AXI_awcache, S00_AXI_awprot, 
  S00_AXI_awqos, S00_AXI_awvalid, S00_AXI_awready, S00_AXI_wdata, S00_AXI_wstrb, 
  S00_AXI_wlast, S00_AXI_wvalid, S00_AXI_wready, S00_AXI_bid, S00_AXI_bresp, S00_AXI_bvalid, 
  S00_AXI_bready, S00_AXI_arid, S00_AXI_araddr, S00_AXI_arlen, S00_AXI_arsize, 
  S00_AXI_arburst, S00_AXI_arlock, S00_AXI_arcache, S00_AXI_arprot, S00_AXI_arqos, 
  S00_AXI_arvalid, S00_AXI_arready, S00_AXI_rid, S00_AXI_rdata, S00_AXI_rresp, S00_AXI_rlast, 
  S00_AXI_rvalid, S00_AXI_rready, S01_AXI_awaddr, S01_AXI_awlen, S01_AXI_awsize, 
  S01_AXI_awburst, S01_AXI_awlock, S01_AXI_awcache, S01_AXI_awprot, S01_AXI_awqos, 
  S01_AXI_awvalid, S01_AXI_awready, S01_AXI_wdata, S01_AXI_wstrb, S01_AXI_wlast, 
  S01_AXI_wvalid, S01_AXI_wready, S01_AXI_bresp, S01_AXI_bvalid, S01_AXI_bready, 
  S01_AXI_araddr, S01_AXI_arlen, S01_AXI_arsize, S01_AXI_arburst, S01_AXI_arlock, 
  S01_AXI_arcache, S01_AXI_arprot, S01_AXI_arqos, S01_AXI_arvalid, S01_AXI_arready, 
  S01_AXI_rdata, S01_AXI_rresp, S01_AXI_rlast, S01_AXI_rvalid, S01_AXI_rready, 
  S02_AXI_awaddr, S02_AXI_awlen, S02_AXI_awsize, S02_AXI_awburst, S02_AXI_awlock, 
  S02_AXI_awcache, S02_AXI_awprot, S02_AXI_awqos, S02_AXI_awvalid, S02_AXI_awready, 
  S02_AXI_wdata, S02_AXI_wstrb, S02_AXI_wlast, S02_AXI_wvalid, S02_AXI_wready, S02_AXI_bresp, 
  S02_AXI_bvalid, S02_AXI_bready, S02_AXI_araddr, S02_AXI_arlen, S02_AXI_arsize, 
  S02_AXI_arburst, S02_AXI_arlock, S02_AXI_arcache, S02_AXI_arprot, S02_AXI_arqos, 
  S02_AXI_arvalid, S02_AXI_arready, S02_AXI_rdata, S02_AXI_rresp, S02_AXI_rlast, 
  S02_AXI_rvalid, S02_AXI_rready, S03_AXI_awaddr, S03_AXI_awlen, S03_AXI_awsize, 
  S03_AXI_awburst, S03_AXI_awlock, S03_AXI_awcache, S03_AXI_awprot, S03_AXI_awqos, 
  S03_AXI_awvalid, S03_AXI_awready, S03_AXI_wdata, S03_AXI_wstrb, S03_AXI_wlast, 
  S03_AXI_wvalid, S03_AXI_wready, S03_AXI_bresp, S03_AXI_bvalid, S03_AXI_bready, 
  S03_AXI_araddr, S03_AXI_arlen, S03_AXI_arsize, S03_AXI_arburst, S03_AXI_arlock, 
  S03_AXI_arcache, S03_AXI_arprot, S03_AXI_arqos, S03_AXI_arvalid, S03_AXI_arready, 
  S03_AXI_rdata, S03_AXI_rresp, S03_AXI_rlast, S03_AXI_rvalid, S03_AXI_rready, 
  S04_AXI_awaddr, S04_AXI_awlen, S04_AXI_awsize, S04_AXI_awburst, S04_AXI_awlock, 
  S04_AXI_awcache, S04_AXI_awprot, S04_AXI_awqos, S04_AXI_awvalid, S04_AXI_awready, 
  S04_AXI_wdata, S04_AXI_wstrb, S04_AXI_wlast, S04_AXI_wvalid, S04_AXI_wready, S04_AXI_bresp, 
  S04_AXI_bvalid, S04_AXI_bready, S04_AXI_araddr, S04_AXI_arlen, S04_AXI_arsize, 
  S04_AXI_arburst, S04_AXI_arlock, S04_AXI_arcache, S04_AXI_arprot, S04_AXI_arqos, 
  S04_AXI_arvalid, S04_AXI_arready, S04_AXI_rdata, S04_AXI_rresp, S04_AXI_rlast, 
  S04_AXI_rvalid, S04_AXI_rready, S05_AXI_awaddr, S05_AXI_awlen, S05_AXI_awsize, 
  S05_AXI_awburst, S05_AXI_awlock, S05_AXI_awcache, S05_AXI_awprot, S05_AXI_awqos, 
  S05_AXI_awvalid, S05_AXI_awready, S05_AXI_wdata, S05_AXI_wstrb, S05_AXI_wlast, 
  S05_AXI_wvalid, S05_AXI_wready, S05_AXI_bresp, S05_AXI_bvalid, S05_AXI_bready, 
  S05_AXI_araddr, S05_AXI_arlen, S05_AXI_arsize, S05_AXI_arburst, S05_AXI_arlock, 
  S05_AXI_arcache, S05_AXI_arprot, S05_AXI_arqos, S05_AXI_arvalid, S05_AXI_arready, 
  S05_AXI_rdata, S05_AXI_rresp, S05_AXI_rlast, S05_AXI_rvalid, S05_AXI_rready)
/* synthesis syn_black_box black_box_pad_pin="hbm_aclk,hbm_aresetn,hbm_ref_clk,hbm_mc_init_seq_complete,DRAM_0_STAT_TEMP[6:0],DRAM_1_STAT_TEMP[6:0],DRAM_STAT_CATTRIP,S_AXI_CTRL_awaddr[21:0],S_AXI_CTRL_awvalid[0:0],S_AXI_CTRL_awready[0:0],S_AXI_CTRL_wdata[31:0],S_AXI_CTRL_wvalid[0:0],S_AXI_CTRL_wready[0:0],S_AXI_CTRL_bresp[1:0],S_AXI_CTRL_bvalid[0:0],S_AXI_CTRL_bready[0:0],S_AXI_CTRL_araddr[21:0],S_AXI_CTRL_arvalid[0:0],S_AXI_CTRL_arready[0:0],S_AXI_CTRL_rdata[31:0],S_AXI_CTRL_rresp[1:0],S_AXI_CTRL_rvalid[0:0],S_AXI_CTRL_rready[0:0],ctrl_aclk,ctrl_aresetn,aclk,aclk1,aresetn,aresetn1,S00_AXI_awid[2:0],S00_AXI_awaddr[39:0],S00_AXI_awlen[7:0],S00_AXI_awsize[2:0],S00_AXI_awburst[1:0],S00_AXI_awlock[0:0],S00_AXI_awcache[3:0],S00_AXI_awprot[2:0],S00_AXI_awqos[3:0],S00_AXI_awvalid[0:0],S00_AXI_awready[0:0],S00_AXI_wdata[511:0],S00_AXI_wstrb[63:0],S00_AXI_wlast[0:0],S00_AXI_wvalid[0:0],S00_AXI_wready[0:0],S00_AXI_bid[2:0],S00_AXI_bresp[1:0],S00_AXI_bvalid[0:0],S00_AXI_bready[0:0],S00_AXI_arid[2:0],S00_AXI_araddr[39:0],S00_AXI_arlen[7:0],S00_AXI_arsize[2:0],S00_AXI_arburst[1:0],S00_AXI_arlock[0:0],S00_AXI_arcache[3:0],S00_AXI_arprot[2:0],S00_AXI_arqos[3:0],S00_AXI_arvalid[0:0],S00_AXI_arready[0:0],S00_AXI_rid[2:0],S00_AXI_rdata[511:0],S00_AXI_rresp[1:0],S00_AXI_rlast[0:0],S00_AXI_rvalid[0:0],S00_AXI_rready[0:0],S01_AXI_awaddr[63:0],S01_AXI_awlen[7:0],S01_AXI_awsize[2:0],S01_AXI_awburst[1:0],S01_AXI_awlock[0:0],S01_AXI_awcache[3:0],S01_AXI_awprot[2:0],S01_AXI_awqos[3:0],S01_AXI_awvalid[0:0],S01_AXI_awready[0:0],S01_AXI_wdata[511:0],S01_AXI_wstrb[63:0],S01_AXI_wlast[0:0],S01_AXI_wvalid[0:0],S01_AXI_wready[0:0],S01_AXI_bresp[1:0],S01_AXI_bvalid[0:0],S01_AXI_bready[0:0],S01_AXI_araddr[63:0],S01_AXI_arlen[7:0],S01_AXI_arsize[2:0],S01_AXI_arburst[1:0],S01_AXI_arlock[0:0],S01_AXI_arcache[3:0],S01_AXI_arprot[2:0],S01_AXI_arqos[3:0],S01_AXI_arvalid[0:0],S01_AXI_arready[0:0],S01_AXI_rdata[511:0],S01_AXI_rresp[1:0],S01_AXI_rlast[0:0],S01_AXI_rvalid[0:0],S01_AXI_rready[0:0],S02_AXI_awaddr[63:0],S02_AXI_awlen[7:0],S02_AXI_awsize[2:0],S02_AXI_awburst[1:0],S02_AXI_awlock[0:0],S02_AXI_awcache[3:0],S02_AXI_awprot[2:0],S02_AXI_awqos[3:0],S02_AXI_awvalid[0:0],S02_AXI_awready[0:0],S02_AXI_wdata[511:0],S02_AXI_wstrb[63:0],S02_AXI_wlast[0:0],S02_AXI_wvalid[0:0],S02_AXI_wready[0:0],S02_AXI_bresp[1:0],S02_AXI_bvalid[0:0],S02_AXI_bready[0:0],S02_AXI_araddr[63:0],S02_AXI_arlen[7:0],S02_AXI_arsize[2:0],S02_AXI_arburst[1:0],S02_AXI_arlock[0:0],S02_AXI_arcache[3:0],S02_AXI_arprot[2:0],S02_AXI_arqos[3:0],S02_AXI_arvalid[0:0],S02_AXI_arready[0:0],S02_AXI_rdata[511:0],S02_AXI_rresp[1:0],S02_AXI_rlast[0:0],S02_AXI_rvalid[0:0],S02_AXI_rready[0:0],S03_AXI_awaddr[63:0],S03_AXI_awlen[7:0],S03_AXI_awsize[2:0],S03_AXI_awburst[1:0],S03_AXI_awlock[0:0],S03_AXI_awcache[3:0],S03_AXI_awprot[2:0],S03_AXI_awqos[3:0],S03_AXI_awvalid[0:0],S03_AXI_awready[0:0],S03_AXI_wdata[511:0],S03_AXI_wstrb[63:0],S03_AXI_wlast[0:0],S03_AXI_wvalid[0:0],S03_AXI_wready[0:0],S03_AXI_bresp[1:0],S03_AXI_bvalid[0:0],S03_AXI_bready[0:0],S03_AXI_araddr[63:0],S03_AXI_arlen[7:0],S03_AXI_arsize[2:0],S03_AXI_arburst[1:0],S03_AXI_arlock[0:0],S03_AXI_arcache[3:0],S03_AXI_arprot[2:0],S03_AXI_arqos[3:0],S03_AXI_arvalid[0:0],S03_AXI_arready[0:0],S03_AXI_rdata[511:0],S03_AXI_rresp[1:0],S03_AXI_rlast[0:0],S03_AXI_rvalid[0:0],S03_AXI_rready[0:0],S04_AXI_awaddr[63:0],S04_AXI_awlen[7:0],S04_AXI_awsize[2:0],S04_AXI_awburst[1:0],S04_AXI_awlock[0:0],S04_AXI_awcache[3:0],S04_AXI_awprot[2:0],S04_AXI_awqos[3:0],S04_AXI_awvalid[0:0],S04_AXI_awready[0:0],S04_AXI_wdata[511:0],S04_AXI_wstrb[63:0],S04_AXI_wlast[0:0],S04_AXI_wvalid[0:0],S04_AXI_wready[0:0],S04_AXI_bresp[1:0],S04_AXI_bvalid[0:0],S04_AXI_bready[0:0],S04_AXI_araddr[63:0],S04_AXI_arlen[7:0],S04_AXI_arsize[2:0],S04_AXI_arburst[1:0],S04_AXI_arlock[0:0],S04_AXI_arcache[3:0],S04_AXI_arprot[2:0],S04_AXI_arqos[3:0],S04_AXI_arvalid[0:0],S04_AXI_arready[0:0],S04_AXI_rdata[511:0],S04_AXI_rresp[1:0],S04_AXI_rlast[0:0],S04_AXI_rvalid[0:0],S04_AXI_rready[0:0],S05_AXI_awaddr[63:0],S05_AXI_awlen[7:0],S05_AXI_awsize[2:0],S05_AXI_awburst[1:0],S05_AXI_awlock[0:0],S05_AXI_awcache[3:0],S05_AXI_awprot[2:0],S05_AXI_awqos[3:0],S05_AXI_awvalid[0:0],S05_AXI_awready[0:0],S05_AXI_wdata[511:0],S05_AXI_wstrb[63:0],S05_AXI_wlast[0:0],S05_AXI_wvalid[0:0],S05_AXI_wready[0:0],S05_AXI_bresp[1:0],S05_AXI_bvalid[0:0],S05_AXI_bready[0:0],S05_AXI_araddr[63:0],S05_AXI_arlen[7:0],S05_AXI_arsize[2:0],S05_AXI_arburst[1:0],S05_AXI_arlock[0:0],S05_AXI_arcache[3:0],S05_AXI_arprot[2:0],S05_AXI_arqos[3:0],S05_AXI_arvalid[0:0],S05_AXI_arready[0:0],S05_AXI_rdata[511:0],S05_AXI_rresp[1:0],S05_AXI_rlast[0:0],S05_AXI_rvalid[0:0],S05_AXI_rready[0:0]" */;
  input hbm_aclk;
  input hbm_aresetn;
  input hbm_ref_clk;
  output hbm_mc_init_seq_complete;
  output [6:0]DRAM_0_STAT_TEMP;
  output [6:0]DRAM_1_STAT_TEMP;
  output DRAM_STAT_CATTRIP;
  input [21:0]S_AXI_CTRL_awaddr;
  input [0:0]S_AXI_CTRL_awvalid;
  output [0:0]S_AXI_CTRL_awready;
  input [31:0]S_AXI_CTRL_wdata;
  input [0:0]S_AXI_CTRL_wvalid;
  output [0:0]S_AXI_CTRL_wready;
  output [1:0]S_AXI_CTRL_bresp;
  output [0:0]S_AXI_CTRL_bvalid;
  input [0:0]S_AXI_CTRL_bready;
  input [21:0]S_AXI_CTRL_araddr;
  input [0:0]S_AXI_CTRL_arvalid;
  output [0:0]S_AXI_CTRL_arready;
  output [31:0]S_AXI_CTRL_rdata;
  output [1:0]S_AXI_CTRL_rresp;
  output [0:0]S_AXI_CTRL_rvalid;
  input [0:0]S_AXI_CTRL_rready;
  input ctrl_aclk;
  input ctrl_aresetn;
  input aclk;
  input aclk1;
  input aresetn;
  input aresetn1;
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
  output [0:0]S00_AXI_awready;
  input [511:0]S00_AXI_wdata;
  input [63:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wlast;
  input [0:0]S00_AXI_wvalid;
  output [0:0]S00_AXI_wready;
  output [2:0]S00_AXI_bid;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
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
  output [0:0]S00_AXI_arready;
  output [2:0]S00_AXI_rid;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rlast;
  output [0:0]S00_AXI_rvalid;
  input [0:0]S00_AXI_rready;
  input [63:0]S01_AXI_awaddr;
  input [7:0]S01_AXI_awlen;
  input [2:0]S01_AXI_awsize;
  input [1:0]S01_AXI_awburst;
  input [0:0]S01_AXI_awlock;
  input [3:0]S01_AXI_awcache;
  input [2:0]S01_AXI_awprot;
  input [3:0]S01_AXI_awqos;
  input [0:0]S01_AXI_awvalid;
  output [0:0]S01_AXI_awready;
  input [511:0]S01_AXI_wdata;
  input [63:0]S01_AXI_wstrb;
  input [0:0]S01_AXI_wlast;
  input [0:0]S01_AXI_wvalid;
  output [0:0]S01_AXI_wready;
  output [1:0]S01_AXI_bresp;
  output [0:0]S01_AXI_bvalid;
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
  output [0:0]S01_AXI_arready;
  output [511:0]S01_AXI_rdata;
  output [1:0]S01_AXI_rresp;
  output [0:0]S01_AXI_rlast;
  output [0:0]S01_AXI_rvalid;
  input [0:0]S01_AXI_rready;
  input [63:0]S02_AXI_awaddr;
  input [7:0]S02_AXI_awlen;
  input [2:0]S02_AXI_awsize;
  input [1:0]S02_AXI_awburst;
  input [0:0]S02_AXI_awlock;
  input [3:0]S02_AXI_awcache;
  input [2:0]S02_AXI_awprot;
  input [3:0]S02_AXI_awqos;
  input [0:0]S02_AXI_awvalid;
  output [0:0]S02_AXI_awready;
  input [511:0]S02_AXI_wdata;
  input [63:0]S02_AXI_wstrb;
  input [0:0]S02_AXI_wlast;
  input [0:0]S02_AXI_wvalid;
  output [0:0]S02_AXI_wready;
  output [1:0]S02_AXI_bresp;
  output [0:0]S02_AXI_bvalid;
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
  output [0:0]S02_AXI_arready;
  output [511:0]S02_AXI_rdata;
  output [1:0]S02_AXI_rresp;
  output [0:0]S02_AXI_rlast;
  output [0:0]S02_AXI_rvalid;
  input [0:0]S02_AXI_rready;
  input [63:0]S03_AXI_awaddr;
  input [7:0]S03_AXI_awlen;
  input [2:0]S03_AXI_awsize;
  input [1:0]S03_AXI_awburst;
  input [0:0]S03_AXI_awlock;
  input [3:0]S03_AXI_awcache;
  input [2:0]S03_AXI_awprot;
  input [3:0]S03_AXI_awqos;
  input [0:0]S03_AXI_awvalid;
  output [0:0]S03_AXI_awready;
  input [511:0]S03_AXI_wdata;
  input [63:0]S03_AXI_wstrb;
  input [0:0]S03_AXI_wlast;
  input [0:0]S03_AXI_wvalid;
  output [0:0]S03_AXI_wready;
  output [1:0]S03_AXI_bresp;
  output [0:0]S03_AXI_bvalid;
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
  output [0:0]S03_AXI_arready;
  output [511:0]S03_AXI_rdata;
  output [1:0]S03_AXI_rresp;
  output [0:0]S03_AXI_rlast;
  output [0:0]S03_AXI_rvalid;
  input [0:0]S03_AXI_rready;
  input [63:0]S04_AXI_awaddr;
  input [7:0]S04_AXI_awlen;
  input [2:0]S04_AXI_awsize;
  input [1:0]S04_AXI_awburst;
  input [0:0]S04_AXI_awlock;
  input [3:0]S04_AXI_awcache;
  input [2:0]S04_AXI_awprot;
  input [3:0]S04_AXI_awqos;
  input [0:0]S04_AXI_awvalid;
  output [0:0]S04_AXI_awready;
  input [511:0]S04_AXI_wdata;
  input [63:0]S04_AXI_wstrb;
  input [0:0]S04_AXI_wlast;
  input [0:0]S04_AXI_wvalid;
  output [0:0]S04_AXI_wready;
  output [1:0]S04_AXI_bresp;
  output [0:0]S04_AXI_bvalid;
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
  output [0:0]S04_AXI_arready;
  output [511:0]S04_AXI_rdata;
  output [1:0]S04_AXI_rresp;
  output [0:0]S04_AXI_rlast;
  output [0:0]S04_AXI_rvalid;
  input [0:0]S04_AXI_rready;
  input [63:0]S05_AXI_awaddr;
  input [7:0]S05_AXI_awlen;
  input [2:0]S05_AXI_awsize;
  input [1:0]S05_AXI_awburst;
  input [0:0]S05_AXI_awlock;
  input [3:0]S05_AXI_awcache;
  input [2:0]S05_AXI_awprot;
  input [3:0]S05_AXI_awqos;
  input [0:0]S05_AXI_awvalid;
  output [0:0]S05_AXI_awready;
  input [511:0]S05_AXI_wdata;
  input [63:0]S05_AXI_wstrb;
  input [0:0]S05_AXI_wlast;
  input [0:0]S05_AXI_wvalid;
  output [0:0]S05_AXI_wready;
  output [1:0]S05_AXI_bresp;
  output [0:0]S05_AXI_bvalid;
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
  output [0:0]S05_AXI_arready;
  output [511:0]S05_AXI_rdata;
  output [1:0]S05_AXI_rresp;
  output [0:0]S05_AXI_rlast;
  output [0:0]S05_AXI_rvalid;
  input [0:0]S05_AXI_rready;
endmodule
