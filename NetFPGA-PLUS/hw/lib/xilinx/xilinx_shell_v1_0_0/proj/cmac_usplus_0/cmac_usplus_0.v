//------------------------------------------------------------------------------
// (c) Copyright 1995-2013 Xilinx, Inc. All rights reserved.
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
// DO NOT MODIFY THIS FILE.

`timescale 1ps/1ps

(* CHECK_LICENSE_TYPE = "cmac_usplus_0,cmac_usplus_core,{}" *)
(* CORE_GENERATION_INFO = "cmac_usplus_0,cmac_usplus_core,{x_ipProduct=Vivado 2020.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=cmac_usplus,x_ipVersion=3.1,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_CMAC_CAUI4_MODE=1,C_NUM_LANES=4,C_LINE_RATE=25.78125,C_GT_TYPE=GTY,C_GT_REF_CLK_FREQ=156.25,C_OPERATING_MODE=3,C_USER_INTERFACE=AXIS,C_GT_DRP_CLK=125.00,C_ENABLE_AXIS=0,C_CLOCKING_MODE=Asynchronous,C_TX_OTN_INTERFACE=0,C_TX_FRAME_CRC_CHECKING=Enable FCS Insertion,C_TX_FCS_INS_ENABLE=1,C_TX_IGNORE_FCS=1,C_TX_LANE0_VLM_BIP7_OVERRIDE=0,C_RX_FRAME_CRC_CHECKING=Enable FCS Stripping,C_RX_DELETE_FCS=1,C_RX_IGNORE_FCS=0,C_RX_MAX_PACKET_LEN=1518,C_RX_MIN_PACKET_LEN=64,C_RX_CHECK_PREAMBLE=0,C_RX_CHECK_SFD=0,C_RX_PROCESS_LFI=0,C_TX_FLOW_CONTROL=1,C_RX_FLOW_CONTROL=1,C_RX_FORWARD_CONTROL_FRAMES=0,C_RX_CHECK_ACK=1,C_ENABLE_TIME_STAMPING=0,C_TX_PTP_1STEP_ENABLE=0,C_PTP_TRANSPCLK_MODE=0,C_TX_PTP_LATENCY_ADJUST=0,C_TX_PTP_VLANE_ADJUST_MODE=0,C_TX_IPG_VALUE=12,C_INCLUDE_RS_FEC=1,C_INCLUDE_AUTO_NEG_LT_LOGIC=0,C_INCLUDE_AN_LT_TX_TRAINER=0,C_ENABLE_AXI_INTERFACE=1,C_INCLUDE_STATISTICS_COUNTERS=1,C_STATISTICS_REGS_TYPE=0,C_TX_SA_GPP=0x000000000000,C_TX_DA_GPP=0x0180C2000001,C_TX_SA_PPP=0x000000000000,C_TX_DA_PPP=0x0180C2000001,C_RX_PAUSE_DA_UCAST=0x000000000000,C_RX_PAUSE_SA=0x000000000000,C_RX_PAUSE_DA_MCAST=0x0180C2000001,C_TX_OPCODE_GPP=0x0001,C_TX_OPCODE_PPP=0x0101,C_RX_OPCODE_GPP=0x0001,C_RX_OPCODE_MIN_GCP=0x0000,C_RX_OPCODE_MAX_GCP=0xFFFF,C_RX_OPCODE_PPP=0x0101,C_RX_OPCODE_MIN_PCP=0x0000,C_RX_OPCODE_MAX_PCP=0xFFFF,C_TX_ETHERTYPE_GPP=0x8808,C_TX_ETHERTYPE_PPP=0x8808,C_RX_ETYPE_GPP=0x8808,C_RX_ETYPE_GCP=0x8808,C_RX_ETYPE_PPP=0x8808,C_RX_ETYPE_PCP=0x8808,C_INS_LOSS_NYQ=20,C_RX_EQ_MODE=AUTO,C_GT_LOCATION=1,C_CMAC_CORE_SELECT=CMACE4_X0Y6,C_GT_GROUP_SELECT=0,C_LANE1_GT_LOC=X0Y40,C_LANE2_GT_LOC=X0Y41,C_LANE3_GT_LOC=X0Y42,C_LANE4_GT_LOC=X0Y43,C_LANE5_GT_LOC=NA,C_LANE6_GT_LOC=NA,C_LANE7_GT_LOC=NA,C_LANE8_GT_LOC=NA,C_LANE9_GT_LOC=NA,C_LANE10_GT_LOC=NA,C_INCLUDE_SHARED_LOGIC=2,C_RX_GT_BUFFER=1,C_GT_RX_BUFFER_BYPASS=0,C_ENABLE_PIPELINE_REG=1,C_ADD_GT_CNRL_STS_PORTS=0,C_PLL_TYPE=QPLL0,C_QPLL_FRACN_NUMERATOR=8388608,C_RS_FEC_TRANSCODE_BYPASS=0,C_RS_FEC_CORE_SEL=CMACE4_X0Y0,C_FAST_SIM_MODE=0,C_UPDATE_LT_COEFF=0,C_FAMILY_CHK=virtexuplusHBM,IS_BOARD_PROJECT=1,C_EXDES_AXI4LITE_INTERFACE=0,x_ipLicense=cmac_usplus@2020.05(bought),x_ipLicense=cmac_an_lt@2020.05(design_linking)}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)

module cmac_usplus_0 (
  gt_rxp_in,
  gt_rxn_in,
  gt_txp_out,
  gt_txn_out,
  gt_txusrclk2,
  gt_loopback_in,
  gt_rxrecclkout,
  gt_powergoodout,
  gt_ref_clk_out,
  gtwiz_reset_tx_datapath,
  gtwiz_reset_rx_datapath,
  s_axi_aclk,
  s_axi_sreset,
  pm_tick,
  s_axi_awaddr,
  s_axi_awvalid,
  s_axi_awready,
  s_axi_wdata,
  s_axi_wstrb,
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
  sys_reset,
  gt_ref_clk_p,
  gt_ref_clk_n,
  init_clk,
  rx_axis_tvalid,
  rx_axis_tdata,
  rx_axis_tlast,
  rx_axis_tkeep,
  rx_axis_tuser,
  rx_otn_bip8_0,
  rx_otn_bip8_1,
  rx_otn_bip8_2,
  rx_otn_bip8_3,
  rx_otn_bip8_4,
  rx_otn_data_0,
  rx_otn_data_1,
  rx_otn_data_2,
  rx_otn_data_3,
  rx_otn_data_4,
  rx_otn_ena,
  rx_otn_lane0,
  rx_otn_vlmarker,
  rx_preambleout,
  usr_rx_reset,
  gt_rxusrclk2,
  stat_rx_aligned,
  stat_rx_aligned_err,
  stat_rx_bad_code,
  stat_rx_bad_fcs,
  stat_rx_bad_preamble,
  stat_rx_bad_sfd,
  stat_rx_bip_err_0,
  stat_rx_bip_err_1,
  stat_rx_bip_err_10,
  stat_rx_bip_err_11,
  stat_rx_bip_err_12,
  stat_rx_bip_err_13,
  stat_rx_bip_err_14,
  stat_rx_bip_err_15,
  stat_rx_bip_err_16,
  stat_rx_bip_err_17,
  stat_rx_bip_err_18,
  stat_rx_bip_err_19,
  stat_rx_bip_err_2,
  stat_rx_bip_err_3,
  stat_rx_bip_err_4,
  stat_rx_bip_err_5,
  stat_rx_bip_err_6,
  stat_rx_bip_err_7,
  stat_rx_bip_err_8,
  stat_rx_bip_err_9,
  stat_rx_block_lock,
  stat_rx_broadcast,
  stat_rx_fragment,
  stat_rx_framing_err_0,
  stat_rx_framing_err_1,
  stat_rx_framing_err_10,
  stat_rx_framing_err_11,
  stat_rx_framing_err_12,
  stat_rx_framing_err_13,
  stat_rx_framing_err_14,
  stat_rx_framing_err_15,
  stat_rx_framing_err_16,
  stat_rx_framing_err_17,
  stat_rx_framing_err_18,
  stat_rx_framing_err_19,
  stat_rx_framing_err_2,
  stat_rx_framing_err_3,
  stat_rx_framing_err_4,
  stat_rx_framing_err_5,
  stat_rx_framing_err_6,
  stat_rx_framing_err_7,
  stat_rx_framing_err_8,
  stat_rx_framing_err_9,
  stat_rx_framing_err_valid_0,
  stat_rx_framing_err_valid_1,
  stat_rx_framing_err_valid_10,
  stat_rx_framing_err_valid_11,
  stat_rx_framing_err_valid_12,
  stat_rx_framing_err_valid_13,
  stat_rx_framing_err_valid_14,
  stat_rx_framing_err_valid_15,
  stat_rx_framing_err_valid_16,
  stat_rx_framing_err_valid_17,
  stat_rx_framing_err_valid_18,
  stat_rx_framing_err_valid_19,
  stat_rx_framing_err_valid_2,
  stat_rx_framing_err_valid_3,
  stat_rx_framing_err_valid_4,
  stat_rx_framing_err_valid_5,
  stat_rx_framing_err_valid_6,
  stat_rx_framing_err_valid_7,
  stat_rx_framing_err_valid_8,
  stat_rx_framing_err_valid_9,
  stat_rx_got_signal_os,
  stat_rx_hi_ber,
  stat_rx_inrangeerr,
  stat_rx_internal_local_fault,
  stat_rx_jabber,
  stat_rx_local_fault,
  stat_rx_mf_err,
  stat_rx_mf_len_err,
  stat_rx_mf_repeat_err,
  stat_rx_misaligned,
  stat_rx_multicast,
  stat_rx_oversize,
  stat_rx_packet_1024_1518_bytes,
  stat_rx_packet_128_255_bytes,
  stat_rx_packet_1519_1522_bytes,
  stat_rx_packet_1523_1548_bytes,
  stat_rx_packet_1549_2047_bytes,
  stat_rx_packet_2048_4095_bytes,
  stat_rx_packet_256_511_bytes,
  stat_rx_packet_4096_8191_bytes,
  stat_rx_packet_512_1023_bytes,
  stat_rx_packet_64_bytes,
  stat_rx_packet_65_127_bytes,
  stat_rx_packet_8192_9215_bytes,
  stat_rx_packet_bad_fcs,
  stat_rx_packet_large,
  stat_rx_packet_small,
  stat_rx_pause,
  stat_rx_pause_quanta0,
  stat_rx_pause_quanta1,
  stat_rx_pause_quanta2,
  stat_rx_pause_quanta3,
  stat_rx_pause_quanta4,
  stat_rx_pause_quanta5,
  stat_rx_pause_quanta6,
  stat_rx_pause_quanta7,
  stat_rx_pause_quanta8,
  stat_rx_pause_req,
  stat_rx_pause_valid,
  stat_rx_user_pause,
  core_rx_reset,
  rx_clk,
  stat_rx_received_local_fault,
  stat_rx_remote_fault,
  stat_rx_status,
  stat_rx_stomped_fcs,
  stat_rx_synced,
  stat_rx_synced_err,
  stat_rx_test_pattern_mismatch,
  stat_rx_toolong,
  stat_rx_total_bytes,
  stat_rx_total_good_bytes,
  stat_rx_total_good_packets,
  stat_rx_total_packets,
  stat_rx_truncated,
  stat_rx_undersize,
  stat_rx_unicast,
  stat_rx_vlan,
  stat_rx_pcsl_demuxed,
  stat_rx_pcsl_number_0,
  stat_rx_pcsl_number_1,
  stat_rx_pcsl_number_10,
  stat_rx_pcsl_number_11,
  stat_rx_pcsl_number_12,
  stat_rx_pcsl_number_13,
  stat_rx_pcsl_number_14,
  stat_rx_pcsl_number_15,
  stat_rx_pcsl_number_16,
  stat_rx_pcsl_number_17,
  stat_rx_pcsl_number_18,
  stat_rx_pcsl_number_19,
  stat_rx_pcsl_number_2,
  stat_rx_pcsl_number_3,
  stat_rx_pcsl_number_4,
  stat_rx_pcsl_number_5,
  stat_rx_pcsl_number_6,
  stat_rx_pcsl_number_7,
  stat_rx_pcsl_number_8,
  stat_rx_pcsl_number_9,
  stat_rx_rsfec_am_lock0,
  stat_rx_rsfec_am_lock1,
  stat_rx_rsfec_am_lock2,
  stat_rx_rsfec_am_lock3,
  stat_rx_rsfec_corrected_cw_inc,
  stat_rx_rsfec_cw_inc,
  stat_rx_rsfec_err_count0_inc,
  stat_rx_rsfec_err_count1_inc,
  stat_rx_rsfec_err_count2_inc,
  stat_rx_rsfec_err_count3_inc,
  stat_rx_rsfec_hi_ser,
  stat_rx_rsfec_lane_alignment_status,
  stat_rx_rsfec_lane_fill_0,
  stat_rx_rsfec_lane_fill_1,
  stat_rx_rsfec_lane_fill_2,
  stat_rx_rsfec_lane_fill_3,
  stat_rx_rsfec_lane_mapping,
  stat_rx_rsfec_uncorrected_cw_inc,
  stat_tx_bad_fcs,
  stat_tx_broadcast,
  stat_tx_frame_error,
  stat_tx_local_fault,
  stat_tx_multicast,
  stat_tx_packet_1024_1518_bytes,
  stat_tx_packet_128_255_bytes,
  stat_tx_packet_1519_1522_bytes,
  stat_tx_packet_1523_1548_bytes,
  stat_tx_packet_1549_2047_bytes,
  stat_tx_packet_2048_4095_bytes,
  stat_tx_packet_256_511_bytes,
  stat_tx_packet_4096_8191_bytes,
  stat_tx_packet_512_1023_bytes,
  stat_tx_packet_64_bytes,
  stat_tx_packet_65_127_bytes,
  stat_tx_packet_8192_9215_bytes,
  stat_tx_packet_large,
  stat_tx_packet_small,
  stat_tx_total_bytes,
  stat_tx_total_good_bytes,
  stat_tx_total_good_packets,
  stat_tx_total_packets,
  stat_tx_unicast,
  stat_tx_vlan,


  ctl_tx_send_idle,
  ctl_tx_send_rfi,
  ctl_tx_send_lfi,
  core_tx_reset,
  stat_tx_pause_valid,
  stat_tx_pause,
  stat_tx_user_pause,
  ctl_tx_pause_req,
  ctl_tx_resend_pause,
  tx_axis_tready, 
  tx_axis_tvalid,
  tx_axis_tdata,
  tx_axis_tlast,
  tx_axis_tkeep,
  tx_axis_tuser,
  tx_ovfout,
  tx_unfout,
  tx_preamblein,
  usr_tx_reset,

  user_reg0,

  core_drp_reset,
  drp_clk,
  drp_addr,
  drp_di,
  drp_en,
  drp_do,
  drp_rdy,
  drp_we
);

input  wire [3 :0]     gt_rxp_in;
input  wire [3 :0]     gt_rxn_in;
output wire [3 :0]     gt_txp_out;
output wire [3 :0]     gt_txn_out;
output wire           gt_txusrclk2;
input  wire [11 : 0]  gt_loopback_in;
output wire [3 :0]    gt_rxrecclkout;
output wire [3 :0]    gt_powergoodout;
output wire           gt_ref_clk_out;
input  wire           gtwiz_reset_tx_datapath;
input  wire           gtwiz_reset_rx_datapath;
input  wire           s_axi_aclk;
input  wire           s_axi_sreset;
input  wire           pm_tick;
input  wire [31:0]    s_axi_awaddr;
input  wire           s_axi_awvalid;
output wire           s_axi_awready;
input  wire [31:0]    s_axi_wdata;
input  wire [3:0]     s_axi_wstrb;
input  wire           s_axi_wvalid;
output wire           s_axi_wready;
output wire [1:0]     s_axi_bresp;
output wire           s_axi_bvalid;
input  wire           s_axi_bready;
input  wire [31:0]    s_axi_araddr;
input  wire           s_axi_arvalid;
output wire           s_axi_arready;
output wire [31:0]    s_axi_rdata;
output wire [1:0]     s_axi_rresp;
output wire           s_axi_rvalid;
input  wire           s_axi_rready;
input wire            sys_reset;
input  wire           gt_ref_clk_p;
input  wire           gt_ref_clk_n;
input  wire           init_clk;
output wire           rx_axis_tvalid;
output wire [511:0]   rx_axis_tdata;
output wire           rx_axis_tlast;
output wire [63:0]    rx_axis_tkeep;
output wire           rx_axis_tuser;
output wire [7:0]     rx_otn_bip8_0;
output wire [7:0]     rx_otn_bip8_1;
output wire [7:0]     rx_otn_bip8_2;
output wire [7:0]     rx_otn_bip8_3;
output wire [7:0]     rx_otn_bip8_4;
output wire [65:0]    rx_otn_data_0;
output wire [65:0]    rx_otn_data_1;
output wire [65:0]    rx_otn_data_2;
output wire [65:0]    rx_otn_data_3;
output wire [65:0]    rx_otn_data_4;
output wire           rx_otn_ena;
output wire           rx_otn_lane0;
output wire           rx_otn_vlmarker;
output wire [55 : 0]  rx_preambleout;
output wire           usr_rx_reset;
output wire           gt_rxusrclk2;
output wire           stat_rx_aligned;
output wire           stat_rx_aligned_err;
output wire [2 : 0]   stat_rx_bad_code;
output wire [2 : 0]   stat_rx_bad_fcs;
output wire           stat_rx_bad_preamble;
output wire           stat_rx_bad_sfd;
output wire           stat_rx_bip_err_0;
output wire           stat_rx_bip_err_1;
output wire           stat_rx_bip_err_10;
output wire           stat_rx_bip_err_11;
output wire           stat_rx_bip_err_12;
output wire           stat_rx_bip_err_13;
output wire           stat_rx_bip_err_14;
output wire           stat_rx_bip_err_15;
output wire           stat_rx_bip_err_16;
output wire           stat_rx_bip_err_17;
output wire           stat_rx_bip_err_18;
output wire           stat_rx_bip_err_19;
output wire           stat_rx_bip_err_2;
output wire           stat_rx_bip_err_3;
output wire           stat_rx_bip_err_4;
output wire           stat_rx_bip_err_5;
output wire           stat_rx_bip_err_6;
output wire           stat_rx_bip_err_7;
output wire           stat_rx_bip_err_8;
output wire           stat_rx_bip_err_9;
output wire [19 : 0]  stat_rx_block_lock;
output wire           stat_rx_broadcast;
output wire [2 : 0]   stat_rx_fragment;
output wire [1 : 0]   stat_rx_framing_err_0;
output wire [1 : 0]   stat_rx_framing_err_1;
output wire [1 : 0]   stat_rx_framing_err_10;
output wire [1 : 0]   stat_rx_framing_err_11;
output wire [1 : 0]   stat_rx_framing_err_12;
output wire [1 : 0]   stat_rx_framing_err_13;
output wire [1 : 0]   stat_rx_framing_err_14;
output wire [1 : 0]   stat_rx_framing_err_15;
output wire [1 : 0]   stat_rx_framing_err_16;
output wire [1 : 0]   stat_rx_framing_err_17;
output wire [1 : 0]   stat_rx_framing_err_18;
output wire [1 : 0]   stat_rx_framing_err_19;
output wire [1 : 0]   stat_rx_framing_err_2;
output wire [1 : 0]   stat_rx_framing_err_3;
output wire [1 : 0]   stat_rx_framing_err_4;
output wire [1 : 0]   stat_rx_framing_err_5;
output wire [1 : 0]   stat_rx_framing_err_6;
output wire [1 : 0]   stat_rx_framing_err_7;
output wire [1 : 0]   stat_rx_framing_err_8;
output wire [1 : 0]   stat_rx_framing_err_9;
output wire           stat_rx_framing_err_valid_0;
output wire           stat_rx_framing_err_valid_1;
output wire           stat_rx_framing_err_valid_10;
output wire           stat_rx_framing_err_valid_11;
output wire           stat_rx_framing_err_valid_12;
output wire           stat_rx_framing_err_valid_13;
output wire           stat_rx_framing_err_valid_14;
output wire           stat_rx_framing_err_valid_15;
output wire           stat_rx_framing_err_valid_16;
output wire           stat_rx_framing_err_valid_17;
output wire           stat_rx_framing_err_valid_18;
output wire           stat_rx_framing_err_valid_19;
output wire           stat_rx_framing_err_valid_2;
output wire           stat_rx_framing_err_valid_3;
output wire           stat_rx_framing_err_valid_4;
output wire           stat_rx_framing_err_valid_5;
output wire           stat_rx_framing_err_valid_6;
output wire           stat_rx_framing_err_valid_7;
output wire           stat_rx_framing_err_valid_8;
output wire           stat_rx_framing_err_valid_9;
output wire           stat_rx_got_signal_os;
output wire           stat_rx_hi_ber;
output wire           stat_rx_inrangeerr;
output wire           stat_rx_internal_local_fault;
output wire           stat_rx_jabber;
output wire           stat_rx_local_fault;
output wire [19 : 0]  stat_rx_mf_err;
output wire [19 : 0]  stat_rx_mf_len_err;
output wire [19 : 0]  stat_rx_mf_repeat_err;
output wire           stat_rx_misaligned;
output wire           stat_rx_multicast;
output wire           stat_rx_oversize;
output wire           stat_rx_packet_1024_1518_bytes;
output wire           stat_rx_packet_128_255_bytes;
output wire           stat_rx_packet_1519_1522_bytes;
output wire           stat_rx_packet_1523_1548_bytes;
output wire           stat_rx_packet_1549_2047_bytes;
output wire           stat_rx_packet_2048_4095_bytes;
output wire           stat_rx_packet_256_511_bytes;
output wire           stat_rx_packet_4096_8191_bytes;
output wire           stat_rx_packet_512_1023_bytes;
output wire           stat_rx_packet_64_bytes;
output wire           stat_rx_packet_65_127_bytes;
output wire           stat_rx_packet_8192_9215_bytes;
output wire           stat_rx_packet_bad_fcs;
output wire           stat_rx_packet_large;
output wire [2 : 0]   stat_rx_packet_small;
output wire           stat_rx_pause;
output wire [15 : 0]  stat_rx_pause_quanta0;
output wire [15 : 0]  stat_rx_pause_quanta1;
output wire [15 : 0]  stat_rx_pause_quanta2;
output wire [15 : 0]  stat_rx_pause_quanta3;
output wire [15 : 0]  stat_rx_pause_quanta4;
output wire [15 : 0]  stat_rx_pause_quanta5;
output wire [15 : 0]  stat_rx_pause_quanta6;
output wire [15 : 0]  stat_rx_pause_quanta7;
output wire [15 : 0]  stat_rx_pause_quanta8;
output wire [8 : 0]   stat_rx_pause_req;
output wire [8 : 0]   stat_rx_pause_valid;
output wire           stat_rx_user_pause;
input  wire           core_rx_reset;
input  wire           rx_clk;
output wire           stat_rx_received_local_fault;
output wire           stat_rx_remote_fault;
output wire           stat_rx_status;
output wire [2 : 0]   stat_rx_stomped_fcs;
output wire [19 : 0]  stat_rx_synced;
output wire [19 : 0]  stat_rx_synced_err;
output wire [2 : 0]   stat_rx_test_pattern_mismatch;
output wire           stat_rx_toolong;
output wire [6 : 0]   stat_rx_total_bytes;
output wire [13 : 0]  stat_rx_total_good_bytes;
output wire           stat_rx_total_good_packets;
output wire [2 : 0]   stat_rx_total_packets;
output wire           stat_rx_truncated;
output wire [2 : 0]   stat_rx_undersize;
output wire           stat_rx_unicast;
output wire           stat_rx_vlan;
output wire [19 : 0]  stat_rx_pcsl_demuxed;
output wire [4 : 0]   stat_rx_pcsl_number_0;
output wire [4 : 0]   stat_rx_pcsl_number_1;
output wire [4 : 0]   stat_rx_pcsl_number_10;
output wire [4 : 0]   stat_rx_pcsl_number_11;
output wire [4 : 0]   stat_rx_pcsl_number_12;
output wire [4 : 0]   stat_rx_pcsl_number_13;
output wire [4 : 0]   stat_rx_pcsl_number_14;
output wire [4 : 0]   stat_rx_pcsl_number_15;
output wire [4 : 0]   stat_rx_pcsl_number_16;
output wire [4 : 0]   stat_rx_pcsl_number_17;
output wire [4 : 0]   stat_rx_pcsl_number_18;
output wire [4 : 0]   stat_rx_pcsl_number_19;
output wire [4 : 0]   stat_rx_pcsl_number_2;
output wire [4 : 0]   stat_rx_pcsl_number_3;
output wire [4 : 0]   stat_rx_pcsl_number_4;
output wire [4 : 0]   stat_rx_pcsl_number_5;
output wire [4 : 0]   stat_rx_pcsl_number_6;
output wire [4 : 0]   stat_rx_pcsl_number_7;
output wire [4 : 0]   stat_rx_pcsl_number_8;
output wire [4 : 0]   stat_rx_pcsl_number_9;
output wire           stat_rx_rsfec_am_lock0;
output wire           stat_rx_rsfec_am_lock1;
output wire           stat_rx_rsfec_am_lock2;
output wire           stat_rx_rsfec_am_lock3;
output wire           stat_rx_rsfec_corrected_cw_inc;
output wire           stat_rx_rsfec_cw_inc;
output wire [2 : 0]   stat_rx_rsfec_err_count0_inc;
output wire [2 : 0]   stat_rx_rsfec_err_count1_inc;
output wire [2 : 0]   stat_rx_rsfec_err_count2_inc;
output wire [2 : 0]   stat_rx_rsfec_err_count3_inc;
output wire           stat_rx_rsfec_hi_ser;
output wire           stat_rx_rsfec_lane_alignment_status;
output wire [13 : 0]  stat_rx_rsfec_lane_fill_0;
output wire [13 : 0]  stat_rx_rsfec_lane_fill_1;
output wire [13 : 0]  stat_rx_rsfec_lane_fill_2;
output wire [13 : 0]  stat_rx_rsfec_lane_fill_3;
output wire [7 : 0]   stat_rx_rsfec_lane_mapping;
output wire           stat_rx_rsfec_uncorrected_cw_inc;
output wire           stat_tx_bad_fcs;
output wire           stat_tx_broadcast;
output wire           stat_tx_frame_error;
output wire           stat_tx_local_fault;
output wire           stat_tx_multicast;
output wire           stat_tx_packet_1024_1518_bytes;
output wire           stat_tx_packet_128_255_bytes;
output wire           stat_tx_packet_1519_1522_bytes;
output wire           stat_tx_packet_1523_1548_bytes;
output wire           stat_tx_packet_1549_2047_bytes;
output wire           stat_tx_packet_2048_4095_bytes;
output wire           stat_tx_packet_256_511_bytes;
output wire           stat_tx_packet_4096_8191_bytes;
output wire           stat_tx_packet_512_1023_bytes;
output wire           stat_tx_packet_64_bytes;
output wire           stat_tx_packet_65_127_bytes;
output wire           stat_tx_packet_8192_9215_bytes;
output wire           stat_tx_packet_large;
output wire           stat_tx_packet_small;
output wire [5 : 0]   stat_tx_total_bytes;
output wire [13 : 0]  stat_tx_total_good_bytes;
output wire           stat_tx_total_good_packets;
output wire           stat_tx_total_packets;
output wire           stat_tx_unicast;
output wire           stat_tx_vlan;


input  wire           ctl_tx_send_idle;
input  wire           ctl_tx_send_rfi;
input  wire           ctl_tx_send_lfi;
input  wire           core_tx_reset;
output wire [8 : 0]   stat_tx_pause_valid;
output wire           stat_tx_pause;
output wire           stat_tx_user_pause;
input  wire [8 : 0]   ctl_tx_pause_req;
input  wire           ctl_tx_resend_pause;
output wire           tx_axis_tready;
input  wire           tx_axis_tvalid;
input  wire [511:0]   tx_axis_tdata;
input  wire           tx_axis_tlast;
input  wire [63:0]    tx_axis_tkeep;
input  wire           tx_axis_tuser;
output wire           tx_ovfout;
output wire           tx_unfout;
input  wire [55 : 0]  tx_preamblein;
output wire           usr_tx_reset;

output wire [31:0]    user_reg0;

input  wire           core_drp_reset;
input  wire           drp_clk;
input  wire [9 : 0]   drp_addr;
input  wire [15 : 0]  drp_di;
input  wire           drp_en;
output wire [15 : 0]  drp_do;
output wire           drp_rdy;
input  wire           drp_we;


  cmac_usplus_0_wrapper #(
    .C_CMAC_CAUI4_MODE(1),
    .C_NUM_LANES(4),
    .C_LINE_RATE(25.78125),
    .C_GT_TYPE("GTY"),
    .C_GT_REF_CLK_FREQ(156.25),
    .C_OPERATING_MODE("3"),
    .C_CLOCKING_MODE("Asynchronous"),
    .C_GT_DRP_CLK("125.00"),
    .C_USER_INTERFACE("AXIS"),
    .C_TX_FCS_INS_ENABLE(1),
    .C_TX_IGNORE_FCS(1),
    .C_TX_LANE0_VLM_BIP7_OVERRIDE(0),
    .C_RX_DELETE_FCS(1),
    .C_RX_IGNORE_FCS(0),
    .C_RX_MAX_PACKET_LEN(1518),
    .C_RX_MIN_PACKET_LEN(64),
    .C_RX_CHECK_PREAMBLE(0),
    .C_RX_CHECK_SFD(0),
    .C_RX_PROCESS_LFI(0),
    .C_TX_FLOW_CONTROL(1),
    .C_RX_FLOW_CONTROL(1),
    .C_RX_FORWARD_CONTROL_FRAMES(0),
    .C_TX_PTP_1STEP_ENABLE(0),
    .C_PTP_TRANSPCLK_MODE(0),
    .C_TX_PTP_LATENCY_ADJUST(0),
    .C_TX_PTP_VLANE_ADJUST_MODE(0),
    .C_TX_IPG_VALUE(12),
    .C_RX_PAUSE_DA_UCAST(48'h000000000000),
    .C_RX_PAUSE_SA(48'h000000000000),
    .C_RX_PAUSE_DA_MCAST(48'h0180C2000001),
    .C_TX_DA_GPP(48'h0180C2000001),
    .C_TX_SA_GPP(48'h000000000000),
    .C_TX_DA_PPP(48'h0180C2000001),
    .C_TX_SA_PPP(48'h000000000000),
    .C_RX_OPCODE_MIN_GCP(16'h0000),
    .C_RX_OPCODE_MAX_GCP(16'hFFFF),
    .C_RX_OPCODE_MIN_PCP(16'h0000),
    .C_RX_OPCODE_MAX_PCP(16'hFFFF),
    .C_RX_OPCODE_GPP(16'h0001),
    .C_RX_OPCODE_PPP(16'h0101),
    .C_TX_OPCODE_GPP(16'h0001),
    .C_TX_OPCODE_PPP(16'h0101),
    .C_RX_ETYPE_GCP(16'h8808),
    .C_RX_ETYPE_PCP(16'h8808),
    .C_RX_ETYPE_GPP(16'h8808),
    .C_RX_ETYPE_PPP(16'h8808),
    .C_TX_ETHERTYPE_GPP(16'h8808),
    .C_TX_ETHERTYPE_PPP(16'h8808),
    .C_CMAC_CORE_SELECT("CMACE4_X0Y6"),
    .C_LANE1_GT_LOC("X0Y40"),
    .C_LANE2_GT_LOC("X0Y41"),
    .C_LANE3_GT_LOC("X0Y42"),
    .C_LANE4_GT_LOC("X0Y43"),
    .C_LANE5_GT_LOC("NA"),
    .C_LANE6_GT_LOC("NA"),
    .C_LANE7_GT_LOC("NA"),
    .C_LANE8_GT_LOC("NA"),
    .C_LANE9_GT_LOC("NA"),
    .C_LANE10_GT_LOC("NA"),
    .C_INCLUDE_SHARED_LOGIC(2),
    .C_INS_LOSS_NYQ(20),
    .C_RX_EQ_MODE("AUTO"),
    .C_RX_GT_BUFFER(1),
    .C_GT_RX_BUFFER_BYPASS(0),
    .C_ADD_GT_CNRL_STS_PORTS(0),
    .C_RX_CHECK_ACK(1),
    .C_ENABLE_PIPELINE_REG(1),
    .C_PLL_TYPE("QPLL0"),
    .C_RS_FEC_TRANSCODE_BYPASS(0),
    .C_RS_FEC_CORE_SEL("CMACE4_X0Y0")
  ) inst (
    .gt_rxp_in(gt_rxp_in),
    .gt_rxn_in(gt_rxn_in),
    .gt_txp_out(gt_txp_out),
    .gt_txn_out(gt_txn_out),
    .gt_loopback_in(gt_loopback_in),
    .gt_rxrecclkout(gt_rxrecclkout),
    .gt_powergoodout(gt_powergoodout),
    .gt_ref_clk_out(gt_ref_clk_out),
    .gtwiz_reset_tx_datapath(gtwiz_reset_tx_datapath),
    .gtwiz_reset_rx_datapath(gtwiz_reset_rx_datapath),
    .gt_eyescanreset(4'B0),
    .gt_eyescantrigger(4'B0),
    .gt_rxcdrhold(4'B0),
    .gt_rxpolarity(4'B0),
    .gt_rxrate(12'B0),
    .gt_txdiffctrl(20'B0),
    .gt_txpolarity(4'B0),
    .gt_txinhibit(4'B0),
    .gt_txpippmen(4'B0),
    .gt_txpippmsel(4'B0),
    .gt_txpostcursor(20'B0),
    .gt_txprbsforceerr(4'B0),
    .gt_txprecursor(20'B0),
    .gt_eyescandataerror(),
    .gt_txbufstatus(),
    .gt_rxdfelpmreset(4'B0),
    .gt_rxlpmen(4'B0),
    .gt_rxprbscntreset(4'B0),
    .gt_rxprbserr(),
    .gt_rxprbssel(16'B0),
    .gt_rxresetdone(),
    .gt_txprbssel(16'B0),
    .gt_txresetdone(),
    .gt_rxbufstatus(),

    .gt_drpclk(1'B0),
    .gt0_drpaddr(10'B0),
    .gt0_drpen(1'B0),
    .gt0_drpdi(16'B0),
    .gt0_drpwe(1'B0),
    .gt0_drpdo(),
    .gt0_drprdy(),
    .gt1_drpaddr(10'B0),
    .gt1_drpen(1'B0),
    .gt1_drpdi(16'B0),
    .gt1_drpwe(1'B0),
    .gt1_drpdo(),
    .gt1_drprdy(),
    .gt2_drpaddr(10'B0),
    .gt2_drpen(1'B0),
    .gt2_drpdi(16'B0),
    .gt2_drpwe(1'B0),
    .gt2_drpdo(),
    .gt2_drprdy(),
    .gt3_drpaddr(10'B0),
    .gt3_drpen(1'B0),
    .gt3_drpdi(16'B0),
    .gt3_drpwe(1'B0),
    .gt3_drpdo(),
    .gt3_drprdy(),

    .s_axi_aclk(s_axi_aclk),
    .s_axi_sreset(s_axi_sreset),
    .pm_tick(pm_tick),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .sys_reset(sys_reset),
    .core_drp_reset(core_drp_reset),
    .gt_txusrclk2(gt_txusrclk2),
    .gt_ref_clk_p(gt_ref_clk_p),
    .gt_ref_clk_n(gt_ref_clk_n),
    .init_clk(init_clk),
    .drp_do(drp_do),
    .rx_axis_tvalid(rx_axis_tvalid),
    .rx_axis_tdata(rx_axis_tdata),
    .rx_axis_tkeep(rx_axis_tkeep),
    .rx_axis_tlast(rx_axis_tlast),
    .rx_axis_tuser(rx_axis_tuser),
    .rx_otn_bip8_0(rx_otn_bip8_0),
    .rx_otn_bip8_1(rx_otn_bip8_1),
    .rx_otn_bip8_2(rx_otn_bip8_2),
    .rx_otn_bip8_3(rx_otn_bip8_3),
    .rx_otn_bip8_4(rx_otn_bip8_4),
    .rx_otn_data_0(rx_otn_data_0),
    .rx_otn_data_1(rx_otn_data_1),
    .rx_otn_data_2(rx_otn_data_2),
    .rx_otn_data_3(rx_otn_data_3),
    .rx_otn_data_4(rx_otn_data_4),
    .rx_otn_ena(rx_otn_ena),
    .rx_otn_lane0(rx_otn_lane0),
    .rx_otn_vlmarker(rx_otn_vlmarker),
    .rx_preambleout(rx_preambleout),
    .usr_rx_reset(usr_rx_reset),
    .gt_rxusrclk2(gt_rxusrclk2),
    .rx_lane_aligner_fill_0(),
    .rx_lane_aligner_fill_1(),
    .rx_lane_aligner_fill_10(),
    .rx_lane_aligner_fill_11(),
    .rx_lane_aligner_fill_12(),
    .rx_lane_aligner_fill_13(),
    .rx_lane_aligner_fill_14(),
    .rx_lane_aligner_fill_15(),
    .rx_lane_aligner_fill_16(),
    .rx_lane_aligner_fill_17(),
    .rx_lane_aligner_fill_18(),
    .rx_lane_aligner_fill_19(),
    .rx_lane_aligner_fill_2(),
    .rx_lane_aligner_fill_3(),
    .rx_lane_aligner_fill_4(),
    .rx_lane_aligner_fill_5(),
    .rx_lane_aligner_fill_6(),
    .rx_lane_aligner_fill_7(),
    .rx_lane_aligner_fill_8(),
    .rx_lane_aligner_fill_9(),
    .rx_ptp_tstamp_out(),
    .rx_ptp_pcslane_out(),
    .ctl_rx_systemtimerin(80'B0),

    .ctl_tx_systemtimerin(80'B0),
    .stat_tx_ptp_fifo_read_error(),
    .stat_tx_ptp_fifo_write_error(),
    .tx_ptp_tstamp_valid_out(),
    .tx_ptp_pcslane_out(),
    .tx_ptp_tstamp_tag_out(),
    .tx_ptp_tstamp_out(),
    .tx_ptp_1588op_in(2'B0),
    .tx_ptp_tag_field_in(16'B0),
    .tx_ptp_upd_chksum_in(1'B0),
    .tx_ptp_chksum_offset_in(16'B0),
    .tx_ptp_tstamp_offset_in(16'B0),
    .ctl_tx_ptp_vlane_adjust_mode(1'B0),
    .tx_ptp_rxtstamp_in(64'B0),

    .stat_rx_aligned(stat_rx_aligned),
    .stat_rx_aligned_err(stat_rx_aligned_err),
    .stat_rx_bad_code(stat_rx_bad_code),
    .stat_rx_bad_fcs(stat_rx_bad_fcs),
    .stat_rx_bad_preamble(stat_rx_bad_preamble),
    .stat_rx_bad_sfd(stat_rx_bad_sfd),
    .stat_rx_bip_err_0(stat_rx_bip_err_0),
    .stat_rx_bip_err_1(stat_rx_bip_err_1),
    .stat_rx_bip_err_10(stat_rx_bip_err_10),
    .stat_rx_bip_err_11(stat_rx_bip_err_11),
    .stat_rx_bip_err_12(stat_rx_bip_err_12),
    .stat_rx_bip_err_13(stat_rx_bip_err_13),
    .stat_rx_bip_err_14(stat_rx_bip_err_14),
    .stat_rx_bip_err_15(stat_rx_bip_err_15),
    .stat_rx_bip_err_16(stat_rx_bip_err_16),
    .stat_rx_bip_err_17(stat_rx_bip_err_17),
    .stat_rx_bip_err_18(stat_rx_bip_err_18),
    .stat_rx_bip_err_19(stat_rx_bip_err_19),
    .stat_rx_bip_err_2(stat_rx_bip_err_2),
    .stat_rx_bip_err_3(stat_rx_bip_err_3),
    .stat_rx_bip_err_4(stat_rx_bip_err_4),
    .stat_rx_bip_err_5(stat_rx_bip_err_5),
    .stat_rx_bip_err_6(stat_rx_bip_err_6),
    .stat_rx_bip_err_7(stat_rx_bip_err_7),
    .stat_rx_bip_err_8(stat_rx_bip_err_8),
    .stat_rx_bip_err_9(stat_rx_bip_err_9),
    .stat_rx_block_lock(stat_rx_block_lock),
    .stat_rx_broadcast(stat_rx_broadcast),
    .stat_rx_fragment(stat_rx_fragment),
    .stat_rx_framing_err_0(stat_rx_framing_err_0),
    .stat_rx_framing_err_1(stat_rx_framing_err_1),
    .stat_rx_framing_err_10(stat_rx_framing_err_10),
    .stat_rx_framing_err_11(stat_rx_framing_err_11),
    .stat_rx_framing_err_12(stat_rx_framing_err_12),
    .stat_rx_framing_err_13(stat_rx_framing_err_13),
    .stat_rx_framing_err_14(stat_rx_framing_err_14),
    .stat_rx_framing_err_15(stat_rx_framing_err_15),
    .stat_rx_framing_err_16(stat_rx_framing_err_16),
    .stat_rx_framing_err_17(stat_rx_framing_err_17),
    .stat_rx_framing_err_18(stat_rx_framing_err_18),
    .stat_rx_framing_err_19(stat_rx_framing_err_19),
    .stat_rx_framing_err_2(stat_rx_framing_err_2),
    .stat_rx_framing_err_3(stat_rx_framing_err_3),
    .stat_rx_framing_err_4(stat_rx_framing_err_4),
    .stat_rx_framing_err_5(stat_rx_framing_err_5),
    .stat_rx_framing_err_6(stat_rx_framing_err_6),
    .stat_rx_framing_err_7(stat_rx_framing_err_7),
    .stat_rx_framing_err_8(stat_rx_framing_err_8),
    .stat_rx_framing_err_9(stat_rx_framing_err_9),
    .stat_rx_framing_err_valid_0(stat_rx_framing_err_valid_0),
    .stat_rx_framing_err_valid_1(stat_rx_framing_err_valid_1),
    .stat_rx_framing_err_valid_10(stat_rx_framing_err_valid_10),
    .stat_rx_framing_err_valid_11(stat_rx_framing_err_valid_11),
    .stat_rx_framing_err_valid_12(stat_rx_framing_err_valid_12),
    .stat_rx_framing_err_valid_13(stat_rx_framing_err_valid_13),
    .stat_rx_framing_err_valid_14(stat_rx_framing_err_valid_14),
    .stat_rx_framing_err_valid_15(stat_rx_framing_err_valid_15),
    .stat_rx_framing_err_valid_16(stat_rx_framing_err_valid_16),
    .stat_rx_framing_err_valid_17(stat_rx_framing_err_valid_17),
    .stat_rx_framing_err_valid_18(stat_rx_framing_err_valid_18),
    .stat_rx_framing_err_valid_19(stat_rx_framing_err_valid_19),
    .stat_rx_framing_err_valid_2(stat_rx_framing_err_valid_2),
    .stat_rx_framing_err_valid_3(stat_rx_framing_err_valid_3),
    .stat_rx_framing_err_valid_4(stat_rx_framing_err_valid_4),
    .stat_rx_framing_err_valid_5(stat_rx_framing_err_valid_5),
    .stat_rx_framing_err_valid_6(stat_rx_framing_err_valid_6),
    .stat_rx_framing_err_valid_7(stat_rx_framing_err_valid_7),
    .stat_rx_framing_err_valid_8(stat_rx_framing_err_valid_8),
    .stat_rx_framing_err_valid_9(stat_rx_framing_err_valid_9),
    .stat_rx_got_signal_os(stat_rx_got_signal_os),
    .stat_rx_hi_ber(stat_rx_hi_ber),
    .stat_rx_inrangeerr(stat_rx_inrangeerr),
    .stat_rx_internal_local_fault(stat_rx_internal_local_fault),
    .stat_rx_jabber(stat_rx_jabber),
    .stat_rx_local_fault(stat_rx_local_fault),
    .stat_rx_mf_err(stat_rx_mf_err),
    .stat_rx_mf_len_err(stat_rx_mf_len_err),
    .stat_rx_mf_repeat_err(stat_rx_mf_repeat_err),
    .stat_rx_misaligned(stat_rx_misaligned),
    .stat_rx_multicast(stat_rx_multicast),
    .stat_rx_oversize(stat_rx_oversize),
    .stat_rx_packet_1024_1518_bytes(stat_rx_packet_1024_1518_bytes),
    .stat_rx_packet_128_255_bytes(stat_rx_packet_128_255_bytes),
    .stat_rx_packet_1519_1522_bytes(stat_rx_packet_1519_1522_bytes),
    .stat_rx_packet_1523_1548_bytes(stat_rx_packet_1523_1548_bytes),
    .stat_rx_packet_1549_2047_bytes(stat_rx_packet_1549_2047_bytes),
    .stat_rx_packet_2048_4095_bytes(stat_rx_packet_2048_4095_bytes),
    .stat_rx_packet_256_511_bytes(stat_rx_packet_256_511_bytes),
    .stat_rx_packet_4096_8191_bytes(stat_rx_packet_4096_8191_bytes),
    .stat_rx_packet_512_1023_bytes(stat_rx_packet_512_1023_bytes),
    .stat_rx_packet_64_bytes(stat_rx_packet_64_bytes),
    .stat_rx_packet_65_127_bytes(stat_rx_packet_65_127_bytes),
    .stat_rx_packet_8192_9215_bytes(stat_rx_packet_8192_9215_bytes),
    .stat_rx_packet_bad_fcs(stat_rx_packet_bad_fcs),
    .stat_rx_packet_large(stat_rx_packet_large),
    .stat_rx_packet_small(stat_rx_packet_small),
    .stat_rx_received_local_fault(stat_rx_received_local_fault),
    .stat_rx_remote_fault(stat_rx_remote_fault),
    .stat_rx_status(stat_rx_status),
    .stat_rx_stomped_fcs(stat_rx_stomped_fcs),
    .stat_rx_synced(stat_rx_synced),
    .stat_rx_synced_err(stat_rx_synced_err),
    .stat_rx_test_pattern_mismatch(stat_rx_test_pattern_mismatch),
    .stat_rx_toolong(stat_rx_toolong),
    .stat_rx_total_bytes(stat_rx_total_bytes),
    .stat_rx_total_good_bytes(stat_rx_total_good_bytes),
    .stat_rx_total_good_packets(stat_rx_total_good_packets),
    .stat_rx_total_packets(stat_rx_total_packets),
    .stat_rx_truncated(stat_rx_truncated),
    .stat_rx_undersize(stat_rx_undersize),
    .stat_rx_unicast(stat_rx_unicast),
    .stat_rx_vlan(stat_rx_vlan),
    .stat_rx_pcsl_demuxed(stat_rx_pcsl_demuxed),
    .stat_rx_pcsl_number_0(stat_rx_pcsl_number_0),
    .stat_rx_pcsl_number_1(stat_rx_pcsl_number_1),
    .stat_rx_pcsl_number_10(stat_rx_pcsl_number_10),
    .stat_rx_pcsl_number_11(stat_rx_pcsl_number_11),
    .stat_rx_pcsl_number_12(stat_rx_pcsl_number_12),
    .stat_rx_pcsl_number_13(stat_rx_pcsl_number_13),
    .stat_rx_pcsl_number_14(stat_rx_pcsl_number_14),
    .stat_rx_pcsl_number_15(stat_rx_pcsl_number_15),
    .stat_rx_pcsl_number_16(stat_rx_pcsl_number_16),
    .stat_rx_pcsl_number_17(stat_rx_pcsl_number_17),
    .stat_rx_pcsl_number_18(stat_rx_pcsl_number_18),
    .stat_rx_pcsl_number_19(stat_rx_pcsl_number_19),
    .stat_rx_pcsl_number_2(stat_rx_pcsl_number_2),
    .stat_rx_pcsl_number_3(stat_rx_pcsl_number_3),
    .stat_rx_pcsl_number_4(stat_rx_pcsl_number_4),
    .stat_rx_pcsl_number_5(stat_rx_pcsl_number_5),
    .stat_rx_pcsl_number_6(stat_rx_pcsl_number_6),
    .stat_rx_pcsl_number_7(stat_rx_pcsl_number_7),
    .stat_rx_pcsl_number_8(stat_rx_pcsl_number_8),
    .stat_rx_pcsl_number_9(stat_rx_pcsl_number_9),
    .stat_rx_rsfec_am_lock0(stat_rx_rsfec_am_lock0),
    .stat_rx_rsfec_am_lock1(stat_rx_rsfec_am_lock1),
    .stat_rx_rsfec_am_lock2(stat_rx_rsfec_am_lock2),
    .stat_rx_rsfec_am_lock3(stat_rx_rsfec_am_lock3),
    .stat_rx_rsfec_corrected_cw_inc(stat_rx_rsfec_corrected_cw_inc),
    .stat_rx_rsfec_cw_inc(stat_rx_rsfec_cw_inc),
    .stat_rx_rsfec_err_count0_inc(stat_rx_rsfec_err_count0_inc),
    .stat_rx_rsfec_err_count1_inc(stat_rx_rsfec_err_count1_inc),
    .stat_rx_rsfec_err_count2_inc(stat_rx_rsfec_err_count2_inc),
    .stat_rx_rsfec_err_count3_inc(stat_rx_rsfec_err_count3_inc),
    .stat_rx_rsfec_hi_ser(stat_rx_rsfec_hi_ser),
    .stat_rx_rsfec_lane_alignment_status(stat_rx_rsfec_lane_alignment_status),
    .stat_rx_rsfec_lane_fill_0(stat_rx_rsfec_lane_fill_0),
    .stat_rx_rsfec_lane_fill_1(stat_rx_rsfec_lane_fill_1),
    .stat_rx_rsfec_lane_fill_2(stat_rx_rsfec_lane_fill_2),
    .stat_rx_rsfec_lane_fill_3(stat_rx_rsfec_lane_fill_3),
    .stat_rx_rsfec_lane_mapping(stat_rx_rsfec_lane_mapping),
    .stat_rx_rsfec_rsvd(),
    .stat_rx_rsfec_uncorrected_cw_inc(stat_rx_rsfec_uncorrected_cw_inc),
    .core_rx_reset(core_rx_reset),
    .rx_clk(rx_clk),
    .stat_rx_lane0_vlm_bip7(),
    .stat_rx_lane0_vlm_bip7_valid(),
    .stat_rx_pause(stat_rx_pause),
    .stat_rx_pause_quanta0(stat_rx_pause_quanta0),
    .stat_rx_pause_quanta1(stat_rx_pause_quanta1),
    .stat_rx_pause_quanta2(stat_rx_pause_quanta2),
    .stat_rx_pause_quanta3(stat_rx_pause_quanta3),
    .stat_rx_pause_quanta4(stat_rx_pause_quanta4),
    .stat_rx_pause_quanta5(stat_rx_pause_quanta5),
    .stat_rx_pause_quanta6(stat_rx_pause_quanta6),
    .stat_rx_pause_quanta7(stat_rx_pause_quanta7),
    .stat_rx_pause_quanta8(stat_rx_pause_quanta8),
    .stat_rx_pause_req(stat_rx_pause_req),
    .stat_rx_pause_valid(stat_rx_pause_valid),
    .stat_rx_user_pause(stat_rx_user_pause),
    .stat_tx_bad_fcs(stat_tx_bad_fcs),
    .stat_tx_broadcast(stat_tx_broadcast),
    .stat_tx_frame_error(stat_tx_frame_error),
    .stat_tx_local_fault(stat_tx_local_fault),
    .stat_tx_multicast(stat_tx_multicast),
    .stat_tx_packet_1024_1518_bytes(stat_tx_packet_1024_1518_bytes),
    .stat_tx_packet_128_255_bytes(stat_tx_packet_128_255_bytes),
    .stat_tx_packet_1519_1522_bytes(stat_tx_packet_1519_1522_bytes),
    .stat_tx_packet_1523_1548_bytes(stat_tx_packet_1523_1548_bytes),
    .stat_tx_packet_1549_2047_bytes(stat_tx_packet_1549_2047_bytes),
    .stat_tx_packet_2048_4095_bytes(stat_tx_packet_2048_4095_bytes),
    .stat_tx_packet_256_511_bytes(stat_tx_packet_256_511_bytes),
    .stat_tx_packet_4096_8191_bytes(stat_tx_packet_4096_8191_bytes),
    .stat_tx_packet_512_1023_bytes(stat_tx_packet_512_1023_bytes),
    .stat_tx_packet_64_bytes(stat_tx_packet_64_bytes),
    .stat_tx_packet_65_127_bytes(stat_tx_packet_65_127_bytes),
    .stat_tx_packet_8192_9215_bytes(stat_tx_packet_8192_9215_bytes),
    .stat_tx_packet_large(stat_tx_packet_large),
    .stat_tx_packet_small(stat_tx_packet_small),
    .stat_tx_total_bytes(stat_tx_total_bytes),
    .stat_tx_total_good_bytes(stat_tx_total_good_bytes),
    .stat_tx_total_good_packets(stat_tx_total_good_packets),
    .stat_tx_total_packets(stat_tx_total_packets),
    .stat_tx_unicast(stat_tx_unicast),
    .stat_tx_vlan(stat_tx_vlan),


    .ctl_tx_send_idle(ctl_tx_send_idle),
    .ctl_tx_send_rfi(ctl_tx_send_rfi),
    .ctl_tx_send_lfi(ctl_tx_send_lfi),
    .core_tx_reset(core_tx_reset),
    .drp_addr(drp_addr),
    .drp_clk(drp_clk),
    .drp_di(drp_di),
    .drp_en(drp_en),
    .drp_we(drp_we),
    .tx_axis_tready(tx_axis_tready),
    .tx_axis_tvalid(tx_axis_tvalid),
    .tx_axis_tdata(tx_axis_tdata),
    .tx_axis_tkeep(tx_axis_tkeep),
    .tx_axis_tlast(tx_axis_tlast),
    .tx_axis_tuser(tx_axis_tuser),
    .tx_ovfout(tx_ovfout),
    .tx_unfout(tx_unfout),
    .tx_preamblein(tx_preamblein),
    .usr_tx_reset(usr_tx_reset),
    .stat_tx_pause_valid(stat_tx_pause_valid),
    .stat_tx_pause(stat_tx_pause),
    .stat_tx_user_pause(stat_tx_user_pause),
    .ctl_tx_pause_req(ctl_tx_pause_req),
    .ctl_tx_resend_pause(ctl_tx_resend_pause),

    .user_reg0 (user_reg0),
    .qpll0clk_in(4'B0),
    .qpll0refclk_in(4'B0),
    .qpll1clk_in(4'B0),
    .qpll1refclk_in(4'B0),
    .gtwiz_reset_qpll0lock_in(1'B0),
    .gtwiz_reset_qpll0reset_out(),
    .gtwiz_reset_qpll1lock_in(1'B0),
    .gtwiz_reset_qpll1reset_out(),
    .ctl_caui4_mode(1'b1),
    .gt_drp_done(1'b0),
    .common0_drpaddr(16'd0),
    .common0_drpdi(16'd0),
    .common0_drpwe(1'b0),
    .common0_drpen(1'b0),
    .common0_drprdy(),
    .common0_drpdo(),

    .drp_rdy(drp_rdy)
  );
endmodule

