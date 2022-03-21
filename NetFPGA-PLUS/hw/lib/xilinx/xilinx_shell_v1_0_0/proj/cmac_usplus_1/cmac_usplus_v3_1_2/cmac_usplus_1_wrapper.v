////------------------------------------------------------------------------------
////  (c) Copyright 2013 Xilinx, Inc. All rights reserved.
////
////  This file contains confidential and proprietary information
////  of Xilinx, Inc. and is protected under U.S. and
////  international copyright and other intellectual property
////  laws.
////
////  DISCLAIMER
////  This disclaimer is not a license and does not grant any
////  rights to the materials distributed herewith. Except as
////  otherwise provided in a valid license issued to you by
////  Xilinx, and to the maximum extent permitted by applicable
////  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
////  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
////  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
////  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
////  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
////  (2) Xilinx shall not be liable (whether in contract or tort,
////  including negligence, or under any other theory of
////  liability) for any loss or damage of any kind or nature
////  related to, arising under or in connection with these
////  materials, including for any direct, or any indirect,
////  special, incidental, or consequential loss or damage
////  (including loss of data, profits, goodwill, or any type of
////  loss or damage suffered as a result of any action brought
////  by a third party) even if such damage or loss was
////  reasonably foreseeable or Xilinx had been advised of the
////  possibility of the same.
////
////  CRITICAL APPLICATIONS
////  Xilinx products are not designed or intended to be fail-
////  safe, or for use in any application requiring fail-safe
////  performance, such as life-support or safety devices or
////  systems, Class III medical devices, nuclear facilities,
////  applications related to the deployment of airbags, or any
////  other applications that could lead to death, personal
////  injury, or severe property or environmental damage
////  (individually and collectively, "Critical
////  Applications"). Customer assumes the sole risk and
////  liability of any use of Xilinx products in Critical
////  Applications, subject only to applicable laws and
////  regulations governing limitations on product liability.
////
////  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
////  PART OF THIS FILE AT ALL TIMES.
////------------------------------------------------------------------------------


`timescale 1ps/1ps

(* DowngradeIPIdentifiedWarnings="yes" *)
module cmac_usplus_1_wrapper

#(
    ////PHYSICAL LAYER OPTIONS
    parameter   C_CMAC_CAUI4_MODE                =   0,
    parameter   C_NUM_LANES                      =   10,
    parameter   C_LINE_RATE                      =   10.3125,
    parameter   C_GT_TYPE                        =   "GTY",
    parameter   C_GT_REF_CLK_FREQ                =   322.265625,
    parameter   C_OPERATING_MODE                 =   "duplex",
    parameter   C_CLOCKING_MODE                  =   "Synchronous",
    parameter   C_GT_DRP_CLK                     =   100.00,
    parameter   C_USER_INTERFACE                 =   "LBUS",
    parameter   C_TX_FCS_INS_ENABLE              =   1,
    parameter   C_TX_IGNORE_FCS                  =   1,
    parameter   C_TX_LANE0_VLM_BIP7_OVERRIDE     =   0,
    parameter   C_RX_DELETE_FCS                  =   1,
    parameter   C_RX_IGNORE_FCS                  =   0,
    parameter   [14:0] C_RX_MAX_PACKET_LEN       =   9600,
    parameter   [7:0] C_RX_MIN_PACKET_LEN        =   64,
    parameter   C_RX_CHECK_ACK                   =   0,
    parameter   C_RX_CHECK_PREAMBLE              =   1,
    parameter   C_RX_CHECK_SFD                   =   1,
    parameter   C_RX_PROCESS_LFI                 =   0,
    parameter   [8:0] C_RX_RSFEC_AM_THRESHOLD    =   9'h046,
    parameter   [1:0] C_RX_RSFEC_FILL_ADJUST     =   2'h0,
    parameter   [3:0] C_TX_IPG_VALUE             =   4'hC,
    parameter   C_TX_FLOW_CONTROL                =   1,
    parameter   C_RX_FLOW_CONTROL                =   1,
    parameter   C_RX_FORWARD_CONTROL_FRAMES      =   1,
    parameter   C_TX_PTP_1STEP_ENABLE            =   1,
    parameter   C_PTP_TRANSPCLK_MODE             =   1,
    parameter   C_TX_PTP_LATENCY_ADJUST          =   705,
    parameter   C_TX_PTP_VLANE_ADJUST_MODE       =   1,
    parameter   [47:0] C_RX_PAUSE_DA_UCAST       =   48'h000000000000,
    parameter   [47:0] C_RX_PAUSE_SA             =   48'h000000000000,
    parameter   [47:0] C_RX_PAUSE_DA_MCAST       =   48'h000000000000,
    parameter   [47:0] C_TX_DA_GPP               =   48'h000000000000,
    parameter   [47:0] C_TX_SA_GPP               =   48'h000000000000,
    parameter   [47:0] C_TX_DA_PPP               =   48'h000000000000,
    parameter   [47:0] C_TX_SA_PPP               =   48'h000000000000,
    parameter   [15:0] C_RX_OPCODE_MIN_GCP       =   16'h0000,
    parameter   [15:0] C_RX_OPCODE_MAX_GCP       =   16'hFFFF,
    parameter   [15:0] C_RX_OPCODE_MIN_PCP       =   16'h0000,
    parameter   [15:0] C_RX_OPCODE_MAX_PCP       =   16'hFFFF,
    parameter   [15:0] C_RX_OPCODE_GPP           =   16'h0001,
    parameter   [15:0] C_RX_OPCODE_PPP           =   16'h0000,
    parameter   [15:0] C_TX_OPCODE_GPP           =   16'h0000,
    parameter   [15:0] C_TX_OPCODE_PPP           =   16'h0000,
    parameter   [15:0] C_RX_ETYPE_GCP            =   16'h8088,
    parameter   [15:0] C_RX_ETYPE_PCP            =   16'h8088,
    parameter   [15:0] C_RX_ETYPE_GPP            =   16'h8088,
    parameter   [15:0] C_RX_ETYPE_PPP            =   16'h8088,
    parameter   [15:0] C_TX_ETHERTYPE_GPP        =   16'h8088,
    parameter   [15:0] C_TX_ETHERTYPE_PPP        =   16'h8088,

    parameter   C_CMAC_CORE_SELECT               =   "CMACE4_X0Y0",
    parameter   C_LANE1_GT_LOC                   =   "X0Y0",
    parameter   C_LANE2_GT_LOC                   =   "X0Y1",
    parameter   C_LANE3_GT_LOC                   =   "X0Y2",
    parameter   C_LANE4_GT_LOC                   =   "X0Y3",
    parameter   C_LANE5_GT_LOC                   =   "X0Y4",
    parameter   C_LANE6_GT_LOC                   =   "X0Y5",
    parameter   C_LANE7_GT_LOC                   =   "X0Y6",
    parameter   C_LANE8_GT_LOC                   =   "X0Y7",
    parameter   C_LANE9_GT_LOC                   =   "X0Y8",
    parameter   C_LANE10_GT_LOC                  =   "X0Y9",
    parameter   C_INCLUDE_SHARED_LOGIC           =   2,
    parameter   C_INS_LOSS_NYQ                   =   20,
    parameter   C_RX_EQ_MODE                     =   "Auto",
    parameter   C_RX_GT_BUFFER                   =   1,
    parameter   C_GT_RX_BUFFER_BYPASS            =   0,
    parameter   C_ENABLE_PIPELINE_REG            =   0,
    parameter   C_ADD_GT_CNRL_STS_PORTS          =   0,
    parameter   C_PLL_TYPE                       =   "QPLL0",
    parameter   C_RS_FEC_TRANSCODE_BYPASS        =   0,
    parameter   C_RS_FEC_CORE_SEL                =   "CMACE4_X0Y0"
)
(
    input  [3 :0]     gt_rxp_in,
    input  [3 :0]     gt_rxn_in,
    output [3 :0]     gt_txp_out,
    output [3 :0]     gt_txn_out,

    input  [11 :0]    gt_loopback_in,
    output [3 :0]     gt_rxrecclkout,
    output [3 :0]     gt_powergoodout,
    output            gt_ref_clk_out,

    //// GT Transceiver debug interface ports
    input  [3 :0]     gt_eyescanreset,
    input  [3 :0]     gt_eyescantrigger,
    input  [3 :0]     gt_rxcdrhold,
    input  [3 :0]     gt_rxpolarity,
    input  [11 :0]    gt_rxrate,
    input  [19 :0]    gt_txdiffctrl,
    input  [3 :0]     gt_txpolarity,
    input  [3 :0]     gt_txinhibit,
    input  [3 :0]     gt_txpippmen,
    input  [3 :0]     gt_txpippmsel,
    input  [19 :0]    gt_txpostcursor,
    input  [3 :0]     gt_txprbsforceerr,
    input  [19 :0]    gt_txprecursor,
    output [3 :0]     gt_eyescandataerror,
    output [7 :0]    gt_txbufstatus,

    input  [3 :0]     gt_rxdfelpmreset,
    input  [3 :0]     gt_rxlpmen,
    input  [3 :0]     gt_rxprbscntreset,
    output [3 :0]     gt_rxprbserr,
    input  [15 :0]    gt_rxprbssel,
    output [3 :0]     gt_rxresetdone,
    input  [15 :0]    gt_txprbssel,
    output [3 :0]     gt_txresetdone,
    output [11 :0]    gt_rxbufstatus,
    input             gtwiz_reset_tx_datapath,
    input             gtwiz_reset_rx_datapath,
    input             gt_drpclk,
    input  [9:0]      gt0_drpaddr,
    input             gt0_drpen,
    input  [15:0]     gt0_drpdi,
    output [15:0]     gt0_drpdo,
    output            gt0_drprdy,
    input             gt0_drpwe,
    input  [9:0]      gt1_drpaddr,
    input             gt1_drpen,
    input  [15:0]     gt1_drpdi,
    output [15:0]     gt1_drpdo,
    output            gt1_drprdy,
    input             gt1_drpwe,
    input  [9:0]      gt2_drpaddr,
    input             gt2_drpen,
    input  [15:0]     gt2_drpdi,
    output [15:0]     gt2_drpdo,
    output            gt2_drprdy,
    input             gt2_drpwe,
    input  [9:0]      gt3_drpaddr,
    input             gt3_drpen,
    input  [15:0]     gt3_drpdi,
    output [15:0]     gt3_drpdo,
    output            gt3_drprdy,
    input             gt3_drpwe,

    input             sys_reset,
    output            gt_txusrclk2,
    output            gt_rxusrclk2,
    output            usr_tx_reset,
    output            usr_rx_reset,
    input             core_tx_reset,
    input             core_rx_reset,
    input             core_drp_reset,
    input             rx_clk,
    input             gt_ref_clk_p,
    input             gt_ref_clk_n,
    input             init_clk,

    ////  Ports present when shared logic is implemented outside core
    input  [3 :0]     qpll0clk_in,
    input  [3 :0]     qpll0refclk_in,
    input  [3 :0]     qpll1clk_in,
    input  [3 :0]     qpll1refclk_in,
    input  [0 :0]     gtwiz_reset_qpll0lock_in,
    output [0 :0]     gtwiz_reset_qpll0reset_out,
    input  [0 :0]     gtwiz_reset_qpll1lock_in,
    output [0 :0]     gtwiz_reset_qpll1reset_out,

    output            rx_axis_tvalid,
    output [511:0]    rx_axis_tdata,
    output            rx_axis_tlast,
    output [63:0]     rx_axis_tkeep,
    output            rx_axis_tuser,

    output            tx_axis_tready, 
    input             tx_axis_tvalid,
    input  [511:0]    tx_axis_tdata,
    input             tx_axis_tlast,
    input  [63:0]     tx_axis_tkeep,
    input             tx_axis_tuser,
    output            tx_ovfout,
    output            tx_unfout,
    output [15:0]     drp_do,
    output            drp_rdy,
    output [6:0]      rx_lane_aligner_fill_0,
    output [6:0]      rx_lane_aligner_fill_1,
    output [6:0]      rx_lane_aligner_fill_10,
    output [6:0]      rx_lane_aligner_fill_11,
    output [6:0]      rx_lane_aligner_fill_12,
    output [6:0]      rx_lane_aligner_fill_13,
    output [6:0]      rx_lane_aligner_fill_14,
    output [6:0]      rx_lane_aligner_fill_15,
    output [6:0]      rx_lane_aligner_fill_16,
    output [6:0]      rx_lane_aligner_fill_17,
    output [6:0]      rx_lane_aligner_fill_18,
    output [6:0]      rx_lane_aligner_fill_19,
    output [6:0]      rx_lane_aligner_fill_2,
    output [6:0]      rx_lane_aligner_fill_3,
    output [6:0]      rx_lane_aligner_fill_4,
    output [6:0]      rx_lane_aligner_fill_5,
    output [6:0]      rx_lane_aligner_fill_6,
    output [6:0]      rx_lane_aligner_fill_7,
    output [6:0]      rx_lane_aligner_fill_8,
    output [6:0]      rx_lane_aligner_fill_9,
    output [7:0]      rx_otn_bip8_0,
    output [7:0]      rx_otn_bip8_1,
    output [7:0]      rx_otn_bip8_2,
    output [7:0]      rx_otn_bip8_3,
    output [7:0]      rx_otn_bip8_4,
    output [65:0]     rx_otn_data_0,
    output [65:0]     rx_otn_data_1,
    output [65:0]     rx_otn_data_2,
    output [65:0]     rx_otn_data_3,
    output [65:0]     rx_otn_data_4,
    output            rx_otn_ena,
    output            rx_otn_lane0,
    output            rx_otn_vlmarker,
    output [55:0]     rx_preambleout,
    output [4:0]      rx_ptp_pcslane_out,
    output [79:0]     rx_ptp_tstamp_out,
    output            stat_rx_aligned,
    output            stat_rx_aligned_err,
    output [2:0]      stat_rx_bad_code,
    output [2:0]      stat_rx_bad_fcs,
    output            stat_rx_bad_preamble,
    output            stat_rx_bad_sfd,
    output            stat_rx_bip_err_0,
    output            stat_rx_bip_err_1,
    output            stat_rx_bip_err_10,
    output            stat_rx_bip_err_11,
    output            stat_rx_bip_err_12,
    output            stat_rx_bip_err_13,
    output            stat_rx_bip_err_14,
    output            stat_rx_bip_err_15,
    output            stat_rx_bip_err_16,
    output            stat_rx_bip_err_17,
    output            stat_rx_bip_err_18,
    output            stat_rx_bip_err_19,
    output            stat_rx_bip_err_2,
    output            stat_rx_bip_err_3,
    output            stat_rx_bip_err_4,
    output            stat_rx_bip_err_5,
    output            stat_rx_bip_err_6,
    output            stat_rx_bip_err_7,
    output            stat_rx_bip_err_8,
    output            stat_rx_bip_err_9,
    output [19:0]     stat_rx_block_lock,
    output            stat_rx_broadcast,
    output [2:0]      stat_rx_fragment,
    output [1:0]      stat_rx_framing_err_0,
    output [1:0]      stat_rx_framing_err_1,
    output [1:0]      stat_rx_framing_err_10,
    output [1:0]      stat_rx_framing_err_11,
    output [1:0]      stat_rx_framing_err_12,
    output [1:0]      stat_rx_framing_err_13,
    output [1:0]      stat_rx_framing_err_14,
    output [1:0]      stat_rx_framing_err_15,
    output [1:0]      stat_rx_framing_err_16,
    output [1:0]      stat_rx_framing_err_17,
    output [1:0]      stat_rx_framing_err_18,
    output [1:0]      stat_rx_framing_err_19,
    output [1:0]      stat_rx_framing_err_2,
    output [1:0]      stat_rx_framing_err_3,
    output [1:0]      stat_rx_framing_err_4,
    output [1:0]      stat_rx_framing_err_5,
    output [1:0]      stat_rx_framing_err_6,
    output [1:0]      stat_rx_framing_err_7,
    output [1:0]      stat_rx_framing_err_8,
    output [1:0]      stat_rx_framing_err_9,
    output            stat_rx_framing_err_valid_0,
    output            stat_rx_framing_err_valid_1,
    output            stat_rx_framing_err_valid_10,
    output            stat_rx_framing_err_valid_11,
    output            stat_rx_framing_err_valid_12,
    output            stat_rx_framing_err_valid_13,
    output            stat_rx_framing_err_valid_14,
    output            stat_rx_framing_err_valid_15,
    output            stat_rx_framing_err_valid_16,
    output            stat_rx_framing_err_valid_17,
    output            stat_rx_framing_err_valid_18,
    output            stat_rx_framing_err_valid_19,
    output            stat_rx_framing_err_valid_2,
    output            stat_rx_framing_err_valid_3,
    output            stat_rx_framing_err_valid_4,
    output            stat_rx_framing_err_valid_5,
    output            stat_rx_framing_err_valid_6,
    output            stat_rx_framing_err_valid_7,
    output            stat_rx_framing_err_valid_8,
    output            stat_rx_framing_err_valid_9,
    output            stat_rx_got_signal_os,
    output            stat_rx_hi_ber,
    output            stat_rx_inrangeerr,
    output            stat_rx_internal_local_fault,
    output            stat_rx_jabber,
    output [7:0]      stat_rx_lane0_vlm_bip7,
    output            stat_rx_lane0_vlm_bip7_valid,
    output            stat_rx_local_fault,
    output [19:0]     stat_rx_mf_err,
    output [19:0]     stat_rx_mf_len_err,
    output [19:0]     stat_rx_mf_repeat_err,
    output            stat_rx_misaligned,
    output            stat_rx_multicast,
    output            stat_rx_oversize,
    output            stat_rx_packet_1024_1518_bytes,
    output            stat_rx_packet_128_255_bytes,
    output            stat_rx_packet_1519_1522_bytes,
    output            stat_rx_packet_1523_1548_bytes,
    output            stat_rx_packet_1549_2047_bytes,
    output            stat_rx_packet_2048_4095_bytes,
    output            stat_rx_packet_256_511_bytes,
    output            stat_rx_packet_4096_8191_bytes,
    output            stat_rx_packet_512_1023_bytes,
    output            stat_rx_packet_64_bytes,
    output            stat_rx_packet_65_127_bytes,
    output            stat_rx_packet_8192_9215_bytes,
    output            stat_rx_packet_bad_fcs,
    output            stat_rx_packet_large,
    output [2:0]      stat_rx_packet_small,
    output            stat_rx_pause,
    output [15:0]     stat_rx_pause_quanta0,
    output [15:0]     stat_rx_pause_quanta1,
    output [15:0]     stat_rx_pause_quanta2,
    output [15:0]     stat_rx_pause_quanta3,
    output [15:0]     stat_rx_pause_quanta4,
    output [15:0]     stat_rx_pause_quanta5,
    output [15:0]     stat_rx_pause_quanta6,
    output [15:0]     stat_rx_pause_quanta7,
    output [15:0]     stat_rx_pause_quanta8,
    output [8:0]      stat_rx_pause_req,
    output [8:0]      stat_rx_pause_valid,
    output            stat_rx_received_local_fault,
    output            stat_rx_remote_fault,
    output            stat_rx_rsfec_am_lock0,
    output            stat_rx_rsfec_am_lock1,
    output            stat_rx_rsfec_am_lock2,
    output            stat_rx_rsfec_am_lock3,
    output            stat_rx_rsfec_corrected_cw_inc,
    output            stat_rx_rsfec_cw_inc,
    output [2:0]      stat_rx_rsfec_err_count0_inc,
    output [2:0]      stat_rx_rsfec_err_count1_inc,
    output [2:0]      stat_rx_rsfec_err_count2_inc,
    output [2:0]      stat_rx_rsfec_err_count3_inc,
    output            stat_rx_rsfec_hi_ser,
    output            stat_rx_rsfec_lane_alignment_status,
    output [13:0]     stat_rx_rsfec_lane_fill_0,
    output [13:0]     stat_rx_rsfec_lane_fill_1,
    output [13:0]     stat_rx_rsfec_lane_fill_2,
    output [13:0]     stat_rx_rsfec_lane_fill_3,
    output [7:0]      stat_rx_rsfec_lane_mapping,
    output [31:0]     stat_rx_rsfec_rsvd,
    output            stat_rx_rsfec_uncorrected_cw_inc,
    output            stat_rx_status,
    output [2:0]      stat_rx_stomped_fcs,
    output [19:0]     stat_rx_synced,
    output [19:0]     stat_rx_synced_err,
    output [2:0]      stat_rx_test_pattern_mismatch,
    output            stat_rx_toolong,
    output [6:0]      stat_rx_total_bytes,
    output [13:0]     stat_rx_total_good_bytes,
    output            stat_rx_total_good_packets,
    output [2:0]      stat_rx_total_packets,
    output            stat_rx_truncated,
    output [2:0]      stat_rx_undersize,
    output            stat_rx_unicast,
    output            stat_rx_user_pause,
    output            stat_rx_vlan,
    output [19:0]     stat_rx_pcsl_demuxed,
    output [4:0]      stat_rx_pcsl_number_0,
    output [4:0]      stat_rx_pcsl_number_1,
    output [4:0]      stat_rx_pcsl_number_10,
    output [4:0]      stat_rx_pcsl_number_11,
    output [4:0]      stat_rx_pcsl_number_12,
    output [4:0]      stat_rx_pcsl_number_13,
    output [4:0]      stat_rx_pcsl_number_14,
    output [4:0]      stat_rx_pcsl_number_15,
    output [4:0]      stat_rx_pcsl_number_16,
    output [4:0]      stat_rx_pcsl_number_17,
    output [4:0]      stat_rx_pcsl_number_18,
    output [4:0]      stat_rx_pcsl_number_19,
    output [4:0]      stat_rx_pcsl_number_2,
    output [4:0]      stat_rx_pcsl_number_3,
    output [4:0]      stat_rx_pcsl_number_4,
    output [4:0]      stat_rx_pcsl_number_5,
    output [4:0]      stat_rx_pcsl_number_6,
    output [4:0]      stat_rx_pcsl_number_7,
    output [4:0]      stat_rx_pcsl_number_8,
    output [4:0]      stat_rx_pcsl_number_9,
    output            stat_tx_bad_fcs,
    output            stat_tx_broadcast,
    output            stat_tx_frame_error,
    output            stat_tx_local_fault,
    output            stat_tx_multicast,
    output            stat_tx_packet_1024_1518_bytes,
    output            stat_tx_packet_128_255_bytes,
    output            stat_tx_packet_1519_1522_bytes,
    output            stat_tx_packet_1523_1548_bytes,
    output            stat_tx_packet_1549_2047_bytes,
    output            stat_tx_packet_2048_4095_bytes,
    output            stat_tx_packet_256_511_bytes,
    output            stat_tx_packet_4096_8191_bytes,
    output            stat_tx_packet_512_1023_bytes,
    output            stat_tx_packet_64_bytes,
    output            stat_tx_packet_65_127_bytes,
    output            stat_tx_packet_8192_9215_bytes,
    output            stat_tx_packet_large,
    output            stat_tx_packet_small,
    output            stat_tx_pause,
    output [8:0]      stat_tx_pause_valid,
    output            stat_tx_ptp_fifo_read_error,
    output            stat_tx_ptp_fifo_write_error,
    output [5:0]      stat_tx_total_bytes,
    output [13:0]     stat_tx_total_good_bytes,
    output            stat_tx_total_good_packets,
    output            stat_tx_total_packets,
    output            stat_tx_unicast,
    output            stat_tx_user_pause,
    output            stat_tx_vlan,
    output [4:0]      tx_ptp_pcslane_out,
    output [79:0]     tx_ptp_tstamp_out,
    output [15:0]     tx_ptp_tstamp_tag_out,
    output            tx_ptp_tstamp_valid_out,

    input  [15:0]     common0_drpaddr,
    input  [15:0]     common0_drpdi,
    input             common0_drpwe,
    input             common0_drpen,
    output            common0_drprdy,
    output [15:0]     common0_drpdo,
    input             gt_drp_done,   

    input  [79:0]     ctl_rx_systemtimerin,
    input  [79:0]     ctl_tx_systemtimerin,
    input             ctl_tx_ptp_vlane_adjust_mode,
    input             ctl_caui4_mode,
    input             ctl_tx_send_idle,
    input             ctl_tx_send_lfi,
    input             ctl_tx_send_rfi,


    //// AXI4-Lite clk and reset
    input             s_axi_aclk,
    input             s_axi_sreset,

    //// AXI4-Lite IOs
    input             pm_tick,
    input  [31:0]     s_axi_awaddr,
    input             s_axi_awvalid,
    output            s_axi_awready,
    input  [31:0]     s_axi_wdata,
    input  [3:0]      s_axi_wstrb,
    input             s_axi_wvalid,
    output            s_axi_wready,
    output [1:0]      s_axi_bresp,
    output            s_axi_bvalid,
    input             s_axi_bready,

    input  [31:0]     s_axi_araddr,
    input             s_axi_arvalid,
    output            s_axi_arready,
    output [31:0]     s_axi_rdata,
    output [1:0]      s_axi_rresp,
    output            s_axi_rvalid,
    input             s_axi_rready,


    output  [31:0]    user_reg0,

    input  [8:0]      ctl_tx_pause_req,
    input             ctl_tx_resend_pause,
    input  [9:0]      drp_addr,
    input             drp_clk,
    input  [15:0]     drp_di,
    input             drp_en,
    input             drp_we,
    input  [55:0]     tx_preamblein,
    input  [1:0]      tx_ptp_1588op_in,
    input  [15:0]     tx_ptp_chksum_offset_in,
    input  [63:0]     tx_ptp_rxtstamp_in,
    input  [15:0]     tx_ptp_tag_field_in,
    input  [15:0]     tx_ptp_tstamp_offset_in,
    input             tx_ptp_upd_chksum_in
);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
  wire [127:0]    rx_dataout0;
  wire [127:0]    rx_dataout1;
  wire [127:0]    rx_dataout2;
  wire [127:0]    rx_dataout3;
  wire            rx_enaout0 ;
  wire            rx_enaout1 ;
  wire            rx_enaout2 ;
  wire            rx_enaout3 ;
  wire            rx_eopout0 ;
  wire            rx_eopout1 ;
  wire            rx_eopout2 ;
  wire            rx_eopout3 ;
  wire            rx_errout0 ;
  wire            rx_errout1 ;
  wire            rx_errout2 ;
  wire            rx_errout3 ;
  wire [3:0]      rx_mtyout0 ;
  wire [3:0]      rx_mtyout1 ;
  wire [3:0]      rx_mtyout2 ;
  wire [3:0]      rx_mtyout3 ;
  wire            rx_sopout0 ;
  wire            rx_sopout1 ;
  wire            rx_sopout2 ;
  wire            rx_sopout3 ;

  wire            tx_rdyout;
  wire [127:0]    tx_datain0;
  wire [127:0]    tx_datain1;
  wire [127:0]    tx_datain2;
  wire [127:0]    tx_datain3;
  wire            tx_enain0;
  wire            tx_enain1;
  wire            tx_enain2;
  wire            tx_enain3;
  wire            tx_eopin0;
  wire            tx_eopin1;
  wire            tx_eopin2;
  wire            tx_eopin3;
  wire            tx_errin0;
  wire            tx_errin1;
  wire            tx_errin2;
  wire            tx_errin3;
  wire [3:0]      tx_mtyin0;
  wire [3:0]      tx_mtyin1;
  wire [3:0]      tx_mtyin2;
  wire [3:0]      tx_mtyin3;
  wire            tx_sopin0;
  wire            tx_sopin1;
  wire            tx_sopin2;
  wire            tx_sopin3;


  wire            ctl_tx_send_idle_int;
  wire            ctl_tx_send_lfi_int;
  wire            ctl_tx_send_rfi_int;
  wire            tx_reset_done_init_clk_sync;
  wire            rx_reset_done_init_clk_sync;
  wire            stat_rx_aligned_init_clk_sync;
  wire            axi_gt_reset_all;
  wire            ctl_gt_loopback;
  wire            axi_usr_tx_reset;
  wire            axi_usr_rx_reset;
  wire [9:0]      axi_usr_rx_serdes_reset;
  wire [9:0]      axi_usr_rx_serdes_reset_sync;
  wire            s_axi_sreset_sync;

  wire            ctl_tx_enable;
  wire            ctl_tx_send_lfi_axi;
  wire            ctl_tx_send_rfi_axi;
  wire            ctl_tx_send_idle_axi;
  wire            ctl_tx_test_pattern;
  wire            ctl_tx_lane0_vlm_bip7_override;
  wire [7:0]      ctl_tx_lane0_vlm_bip7_override_value;
  wire [8:0]      ctl_tx_pause_enable;
  wire [15:0]     ctl_tx_pause_refresh_timer0;
  wire [15:0]     ctl_tx_pause_refresh_timer1;
  wire [15:0]     ctl_tx_pause_refresh_timer2;
  wire [15:0]     ctl_tx_pause_refresh_timer3;
  wire [15:0]     ctl_tx_pause_refresh_timer4;
  wire [15:0]     ctl_tx_pause_refresh_timer5;
  wire [15:0]     ctl_tx_pause_refresh_timer6;
  wire [15:0]     ctl_tx_pause_refresh_timer7;
  wire [15:0]     ctl_tx_pause_refresh_timer8;
  wire [15:0]     ctl_tx_pause_quanta0;
  wire [15:0]     ctl_tx_pause_quanta1;
  wire [15:0]     ctl_tx_pause_quanta2;
  wire [15:0]     ctl_tx_pause_quanta3;
  wire [15:0]     ctl_tx_pause_quanta4;
  wire [15:0]     ctl_tx_pause_quanta5;
  wire [15:0]     ctl_tx_pause_quanta6;
  wire [15:0]     ctl_tx_pause_quanta7;
  wire [15:0]     ctl_tx_pause_quanta8;
  wire            ctl_tx_rsfec_enable;
  wire            ctl_rx_enable;
  wire            ctl_rx_force_resync;
  wire            ctl_rx_test_pattern;
  wire [8:0]      ctl_rx_pause_enable;
  wire            ctl_rx_enable_gcp;
  wire            ctl_rx_enable_gpp;
  wire            ctl_rx_enable_pcp;
  wire            ctl_rx_enable_ppp;
  wire [8:0]      ctl_rx_pause_ack;
  wire            ctl_rx_check_mcast_gcp;
  wire            ctl_rx_check_ucast_gcp;
  wire            ctl_rx_check_sa_gcp;
  wire            ctl_rx_check_etype_gcp;
  wire            ctl_rx_check_opcode_gcp;
  wire            ctl_rx_check_mcast_pcp;
  wire            ctl_rx_check_ucast_pcp;
  wire            ctl_rx_check_sa_pcp;
  wire            ctl_rx_check_etype_pcp;
  wire            ctl_rx_check_opcode_pcp;
  wire            ctl_rx_check_mcast_gpp;
  wire            ctl_rx_check_ucast_gpp;
  wire            ctl_rx_check_sa_gpp;
  wire            ctl_rx_check_etype_gpp;
  wire            ctl_rx_check_opcode_gpp;
  wire            ctl_rx_check_opcode_ppp;
  wire            ctl_rx_check_mcast_ppp;
  wire            ctl_rx_check_ucast_ppp;
  wire            ctl_rx_check_sa_ppp;
  wire            ctl_rx_check_etype_ppp;
  wire            ctl_rsfec_ieee_error_indication_mode;
  wire            ctl_rx_rsfec_enable;
  wire            ctl_rx_rsfec_enable_correction;
  wire            ctl_rx_rsfec_enable_indication;
  wire            tx_clk;
  wire            gt_txresetdone_int;
  wire            gt_txresetdone_int_sync;
  wire            gt_tx_reset_done_inv;
  wire            tx_reset_done;
  wire            tx_reset_done_sync;
  wire            gt_rxresetdone_int;
  wire            gt_rxresetdone_int_sync;
  wire            gt_rx_reset_done_inv;
  reg             gt_rx_reset_done_inv_reg;
  wire            gt_rx_reset_done_inv_reg_sync;
  wire            reset_done_async;
  wire            rx_reset_done;
  wire [9:0]      rx_serdes_reset_done;
  wire [9:0]      rx_serdes_clk;

  wire [15:0]     tx_serdes_alt_data0;
  wire [15:0]     tx_serdes_alt_data1;
  wire [15:0]     tx_serdes_alt_data2;
  wire [15:0]     tx_serdes_alt_data3;
  wire [63:0]     tx_serdes_data0;
  wire [63:0]     tx_serdes_data1;
  wire [63:0]     tx_serdes_data2;
  wire [63:0]     tx_serdes_data3;
  wire [31:0]     tx_serdes_data4;
  wire [31:0]     tx_serdes_data5;
  wire [31:0]     tx_serdes_data6;
  wire [31:0]     tx_serdes_data7;
  wire [31:0]     tx_serdes_data8;
  wire [31:0]     tx_serdes_data9;

  wire [15:0]     rx_serdes_alt_data0;
  wire [15:0]     rx_serdes_alt_data1;
  wire [15:0]     rx_serdes_alt_data2;
  wire [15:0]     rx_serdes_alt_data3;
  wire [63:0]     rx_serdes_data0;
  wire [63:0]     rx_serdes_data1;
  wire [63:0]     rx_serdes_data2;
  wire [63:0]     rx_serdes_data3;
  wire [31:0]     rx_serdes_data4;
  wire [31:0]     rx_serdes_data5;
  wire [31:0]     rx_serdes_data6;
  wire [31:0]     rx_serdes_data7;
  wire [31:0]     rx_serdes_data8;
  wire [31:0]     rx_serdes_data9;

  wire [15:0]     rx_serdes_alt_data0_int;
  wire [15:0]     rx_serdes_alt_data1_int;
  wire [15:0]     rx_serdes_alt_data2_int;
  wire [15:0]     rx_serdes_alt_data3_int;
  wire [63:0]     rx_serdes_data0_int;
  wire [63:0]     rx_serdes_data1_int;
  wire [63:0]     rx_serdes_data2_int;
  wire [63:0]     rx_serdes_data3_int;
  wire [31:0]     rx_serdes_data4_int;
  wire [31:0]     rx_serdes_data5_int;
  wire [31:0]     rx_serdes_data6_int;
  wire [31:0]     rx_serdes_data7_int;
  wire [31:0]     rx_serdes_data8_int;
  wire [31:0]     rx_serdes_data9_int;

  wire [15:0]     rx_serdes_alt_data0_2d;
  wire [15:0]     rx_serdes_alt_data1_2d;
  wire [15:0]     rx_serdes_alt_data2_2d;
  wire [15:0]     rx_serdes_alt_data3_2d;
  wire [63:0]     rx_serdes_data0_2d;
  wire [63:0]     rx_serdes_data1_2d;
  wire [63:0]     rx_serdes_data2_2d;
  wire [63:0]     rx_serdes_data3_2d;
  wire [31:0]     rx_serdes_data4_2d;
  wire [31:0]     rx_serdes_data5_2d;
  wire [31:0]     rx_serdes_data6_2d;
  wire [31:0]     rx_serdes_data7_2d;
  wire [31:0]     rx_serdes_data8_2d;
  wire [31:0]     rx_serdes_data9_2d;
  wire [55:0]     tx_preamblein_int;
  wire [55:0]     rx_preambleout_int;

  wire            ctl_rsfec_enable_transcoder_bypass_mode;
  wire [329:0]    rsfec_bypass_rx_dout;
  wire            rsfec_bypass_rx_dout_cw_start;
  wire            rsfec_bypass_rx_dout_valid;
  wire [329:0]    rsfec_bypass_tx_dout;
  wire            rsfec_bypass_tx_dout_cw_start;
  wire            rsfec_bypass_tx_dout_valid;
  wire [329:0]    rsfec_bypass_rx_din;
  wire            rsfec_bypass_rx_din_cw_start;
  wire [329:0]    rsfec_bypass_tx_din;
  wire            rsfec_bypass_tx_din_cw_start;

  assign ctl_rsfec_enable_transcoder_bypass_mode  =  1'b0;
  assign rsfec_bypass_rx_din                      =  330'd0;
  assign rsfec_bypass_rx_din_cw_start             =  1'b0;
  assign rsfec_bypass_tx_din                      =  330'd0;
  assign rsfec_bypass_tx_din_cw_start             =  1'b0;




  wire [7:0]      rx_otn_bip8_0_int;
  wire [7:0]      rx_otn_bip8_1_int;
  wire [7:0]      rx_otn_bip8_2_int;
  wire [7:0]      rx_otn_bip8_3_int;
  wire [7:0]      rx_otn_bip8_4_int;
  wire [65:0]     rx_otn_data_0_int;
  wire [65:0]     rx_otn_data_1_int;
  wire [65:0]     rx_otn_data_2_int;
  wire [65:0]     rx_otn_data_3_int;
  wire [65:0]     rx_otn_data_4_int;

  assign rx_otn_bip8_0[7:0] = {rx_otn_bip8_0_int[0],rx_otn_bip8_0_int[1],rx_otn_bip8_0_int[2],rx_otn_bip8_0_int[3],rx_otn_bip8_0_int[4],rx_otn_bip8_0_int[5],rx_otn_bip8_0_int[6],rx_otn_bip8_0_int[7]};
  assign rx_otn_bip8_1[7:0] = {rx_otn_bip8_1_int[0],rx_otn_bip8_1_int[1],rx_otn_bip8_1_int[2],rx_otn_bip8_1_int[3],rx_otn_bip8_1_int[4],rx_otn_bip8_1_int[5],rx_otn_bip8_1_int[6],rx_otn_bip8_1_int[7]};
  assign rx_otn_bip8_2[7:0] = {rx_otn_bip8_2_int[0],rx_otn_bip8_2_int[1],rx_otn_bip8_2_int[2],rx_otn_bip8_2_int[3],rx_otn_bip8_2_int[4],rx_otn_bip8_2_int[5],rx_otn_bip8_2_int[6],rx_otn_bip8_2_int[7]};
  assign rx_otn_bip8_3[7:0] = {rx_otn_bip8_3_int[0],rx_otn_bip8_3_int[1],rx_otn_bip8_3_int[2],rx_otn_bip8_3_int[3],rx_otn_bip8_3_int[4],rx_otn_bip8_3_int[5],rx_otn_bip8_3_int[6],rx_otn_bip8_3_int[7]};
  assign rx_otn_bip8_4[7:0] = {rx_otn_bip8_4_int[0],rx_otn_bip8_4_int[1],rx_otn_bip8_4_int[2],rx_otn_bip8_4_int[3],rx_otn_bip8_4_int[4],rx_otn_bip8_4_int[5],rx_otn_bip8_4_int[6],rx_otn_bip8_4_int[7]};

  assign rx_otn_data_0[65:64] = {rx_otn_data_0_int[64],rx_otn_data_0_int[65]};
  assign rx_otn_data_1[65:64] = {rx_otn_data_1_int[64],rx_otn_data_1_int[65]};
  assign rx_otn_data_2[65:64] = {rx_otn_data_2_int[64],rx_otn_data_2_int[65]};
  assign rx_otn_data_3[65:64] = {rx_otn_data_3_int[64],rx_otn_data_3_int[65]};
  assign rx_otn_data_4[65:64] = {rx_otn_data_4_int[64],rx_otn_data_4_int[65]};

  genvar rx_otn_data_indx;
  generate for (rx_otn_data_indx = 0; rx_otn_data_indx <= 63; rx_otn_data_indx = rx_otn_data_indx + 1) begin : gen_rx_otn_data
     assign rx_otn_data_0[rx_otn_data_indx] = rx_otn_data_0_int[63 - rx_otn_data_indx];
     assign rx_otn_data_1[rx_otn_data_indx] = rx_otn_data_1_int[63 - rx_otn_data_indx];
     assign rx_otn_data_2[rx_otn_data_indx] = rx_otn_data_2_int[63 - rx_otn_data_indx];
     assign rx_otn_data_3[rx_otn_data_indx] = rx_otn_data_3_int[63 - rx_otn_data_indx];
     assign rx_otn_data_4[rx_otn_data_indx] = rx_otn_data_4_int[63 - rx_otn_data_indx];
  end
  endgenerate

  wire [3 :0]     gthrxn_int;
  assign gthrxn_int      = gt_rxn_in;

  wire [3 :0]      gthrxp_int;
  assign gthrxp_int      = gt_rxp_in;

  wire [3 :0]      gthtxn_int;
  assign gt_txn_out      = gthtxn_int;

  wire [3 :0]      gthtxp_int;
  assign gt_txp_out      = gthtxp_int;

  // Calculation of 750ms with respect to init_clk (ns per cycle)
  localparam [28:0] MASTER_WATCHDOG_TIMER_RESET = 750000000 / (1000 / 125.00);
  reg  [28:0] master_watchdog = MASTER_WATCHDOG_TIMER_RESET;
  reg  master_watchdog_barking;

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_tx_reset_done_init_clk
  (
   .clk              (init_clk),
   .signal_in        (tx_reset_done),
   .signal_out       (tx_reset_done_init_clk_sync)
  );

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_rx_reset_done_init_clk
  (
   .clk              (init_clk),
   .signal_in        (rx_reset_done), 
   .signal_out       (rx_reset_done_init_clk_sync)
  );

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_stat_rx_aligned
  (
   .clk              (init_clk),
   .signal_in        (stat_rx_aligned), 
   .signal_out       (stat_rx_aligned_init_clk_sync)
  );

  always @(posedge init_clk)
  begin
    if ((tx_reset_done_init_clk_sync == 1'b0 && rx_reset_done_init_clk_sync == 1'b0 && stat_rx_aligned_init_clk_sync == 1'b1) || master_watchdog == 0)
      master_watchdog <= MASTER_WATCHDOG_TIMER_RESET;
    else
      master_watchdog <= master_watchdog - 1;
  end

  always @(posedge init_clk)
  begin
    if (master_watchdog == 0)
      master_watchdog_barking <= 1'b1;
    else
      master_watchdog_barking <= 1'b0;
  end

  assign ctl_tx_send_idle_int = ctl_tx_send_idle | ctl_tx_send_idle_axi;
  assign ctl_tx_send_lfi_int  = ctl_tx_send_lfi | ctl_tx_send_lfi_axi;
  assign ctl_tx_send_rfi_int  = ctl_tx_send_rfi | ctl_tx_send_rfi_axi;

  cmac_usplus_1_syncer_reset #(
    .PIPE_LEN            (2)
  ) i_cmac_usplus_1_axi_sreset_syncer (
    .clk                 (s_axi_aclk),
    .resetn_async        (s_axi_sreset),
    .resetn              (s_axi_sreset_sync)
  );

//// AXI INTERFACE module
  localparam ADDR_WIDTH = 32;    //// Width of M_AXI address bus
  localparam DATA_WIDTH = 32;    //// Width of M_AXI data bus

  cmac_usplus_1_axi4_lite_if_wrapper
  #(
     .ADDR_WIDTH                            (ADDR_WIDTH),
     .DATA_WIDTH                            (DATA_WIDTH)
   ) i_cmac_usplus_1_axi4_lite_if_wrapper
  (

  //// AXI IOs
  .S_AXI_ACLK                               (s_axi_aclk),
  .S_AXI_SRESET                             (s_axi_sreset_sync),

  .S_AXI_AWADDR                             (s_axi_awaddr),
  .S_AXI_AWVALID                            (s_axi_awvalid),
  .S_AXI_AWREADY                            (s_axi_awready),

  .S_AXI_WDATA                              (s_axi_wdata),
  .S_AXI_WSTRB                              (s_axi_wstrb),
  .S_AXI_WVALID                             (s_axi_wvalid),
  .S_AXI_WREADY                             (s_axi_wready),

  .S_AXI_BRESP                              (s_axi_bresp),
  .S_AXI_BVALID                             (s_axi_bvalid),
  .S_AXI_BREADY                             (s_axi_bready),

  .S_AXI_ARADDR                             (s_axi_araddr),
  .S_AXI_ARVALID                            (s_axi_arvalid),
  .S_AXI_ARREADY                            (s_axi_arready),
  .S_AXI_RDATA                              (s_axi_rdata),
  .S_AXI_RRESP                              (s_axi_rresp),
  .S_AXI_RVALID                             (s_axi_rvalid),
  .S_AXI_RREADY                             (s_axi_rready),

  .tx_clk                                   (tx_clk),
  .rx_clk                                   (rx_clk),
  .tx_usrclk2                               (gt_txusrclk2),
  .tx_reset_done_inv                        (tx_reset_done_sync),
  .tx_reset                                 (tx_reset_done),
  .rx_reset                                 (rx_reset_done),

  .gt_reset_all                             (axi_gt_reset_all),
  .usr_rx_serdes_reset                      (axi_usr_rx_serdes_reset),
  .usr_rx_reset                             (axi_usr_rx_reset),
  .usr_tx_reset                             (axi_usr_tx_reset),
  .ctl_gt_loopback                          (ctl_gt_loopback),

  .ctl_tx_enable                            (ctl_tx_enable),
  .ctl_tx_send_lfi                          (ctl_tx_send_lfi_axi),
  .ctl_tx_send_rfi                          (ctl_tx_send_rfi_axi),
  .ctl_tx_send_idle                         (ctl_tx_send_idle_axi),
  .ctl_tx_test_pattern                      (ctl_tx_test_pattern),
  .ctl_tx_lane0_vlm_bip7_override_value     (ctl_tx_lane0_vlm_bip7_override_value),
  .ctl_tx_lane0_vlm_bip7_override           (ctl_tx_lane0_vlm_bip7_override),
  .ctl_tx_pause_enable                      (ctl_tx_pause_enable),
  .ctl_tx_pause_refresh_timer0              (ctl_tx_pause_refresh_timer0),
  .ctl_tx_pause_refresh_timer1              (ctl_tx_pause_refresh_timer1),
  .ctl_tx_pause_refresh_timer2              (ctl_tx_pause_refresh_timer2),
  .ctl_tx_pause_refresh_timer3              (ctl_tx_pause_refresh_timer3),
  .ctl_tx_pause_refresh_timer4              (ctl_tx_pause_refresh_timer4),
  .ctl_tx_pause_refresh_timer5              (ctl_tx_pause_refresh_timer5),
  .ctl_tx_pause_refresh_timer6              (ctl_tx_pause_refresh_timer6),
  .ctl_tx_pause_refresh_timer7              (ctl_tx_pause_refresh_timer7),
  .ctl_tx_pause_refresh_timer8              (ctl_tx_pause_refresh_timer8),
  .ctl_tx_pause_quanta0                     (ctl_tx_pause_quanta0),
  .ctl_tx_pause_quanta1                     (ctl_tx_pause_quanta1),
  .ctl_tx_pause_quanta2                     (ctl_tx_pause_quanta2),
  .ctl_tx_pause_quanta3                     (ctl_tx_pause_quanta3),
  .ctl_tx_pause_quanta4                     (ctl_tx_pause_quanta4),
  .ctl_tx_pause_quanta5                     (ctl_tx_pause_quanta5),
  .ctl_tx_pause_quanta6                     (ctl_tx_pause_quanta6),
  .ctl_tx_pause_quanta7                     (ctl_tx_pause_quanta7),
  .ctl_tx_pause_quanta8                     (ctl_tx_pause_quanta8),
  .ctl_tx_rsfec_enable                      (ctl_tx_rsfec_enable),
  .ctl_rx_enable                            (ctl_rx_enable),
  .ctl_rx_force_resync                      (ctl_rx_force_resync),
  .ctl_rx_test_pattern                      (ctl_rx_test_pattern),
  .ctl_rx_pause_enable                      (ctl_rx_pause_enable),
  .ctl_rx_enable_gcp                        (ctl_rx_enable_gcp),
  .ctl_rx_enable_pcp                        (ctl_rx_enable_pcp),
  .ctl_rx_enable_gpp                        (ctl_rx_enable_gpp),
  .ctl_rx_enable_ppp                        (ctl_rx_enable_ppp),
  .ctl_rx_pause_ack                         (ctl_rx_pause_ack),
  .ctl_rx_check_mcast_gcp                   (ctl_rx_check_mcast_gcp),
  .ctl_rx_check_ucast_gcp                   (ctl_rx_check_ucast_gcp),
  .ctl_rx_check_sa_gcp                      (ctl_rx_check_sa_gcp),
  .ctl_rx_check_etype_gcp                   (ctl_rx_check_etype_gcp),
  .ctl_rx_check_opcode_gcp                  (ctl_rx_check_opcode_gcp),
  .ctl_rx_check_mcast_pcp                   (ctl_rx_check_mcast_pcp),
  .ctl_rx_check_ucast_pcp                   (ctl_rx_check_ucast_pcp),
  .ctl_rx_check_sa_pcp                      (ctl_rx_check_sa_pcp),
  .ctl_rx_check_etype_pcp                   (ctl_rx_check_etype_pcp),
  .ctl_rx_check_opcode_pcp                  (ctl_rx_check_opcode_pcp),
  .ctl_rx_check_mcast_gpp                   (ctl_rx_check_mcast_gpp),
  .ctl_rx_check_ucast_gpp                   (ctl_rx_check_ucast_gpp),
  .ctl_rx_check_sa_gpp                      (ctl_rx_check_sa_gpp),
  .ctl_rx_check_etype_gpp                   (ctl_rx_check_etype_gpp),
  .ctl_rx_check_opcode_gpp                  (ctl_rx_check_opcode_gpp),
  .ctl_rx_check_opcode_ppp                  (ctl_rx_check_opcode_ppp),
  .ctl_rx_check_mcast_ppp                   (ctl_rx_check_mcast_ppp),
  .ctl_rx_check_ucast_ppp                   (ctl_rx_check_ucast_ppp),
  .ctl_rx_check_sa_ppp                      (ctl_rx_check_sa_ppp),
  .ctl_rx_check_etype_ppp                   (ctl_rx_check_etype_ppp),
  .ctl_rsfec_ieee_error_indication_mode     (ctl_rsfec_ieee_error_indication_mode),
  .ctl_rx_rsfec_enable                      (ctl_rx_rsfec_enable),
  .ctl_rx_rsfec_enable_correction           (ctl_rx_rsfec_enable_correction),
  .ctl_rx_rsfec_enable_indication           (ctl_rx_rsfec_enable_indication),
  .user_reg0                                (user_reg0),

  .stat_tx_total_packets                    (stat_tx_total_packets),
  .stat_tx_total_bytes                      (stat_tx_total_bytes),
  .stat_tx_total_good_packets               (stat_tx_total_good_packets),
  .stat_tx_total_good_bytes                 (stat_tx_total_good_bytes),
  .stat_tx_packet_small                     (stat_tx_packet_small),
  .stat_tx_packet_large                     (stat_tx_packet_large),
  .stat_tx_packet_64_bytes                  (stat_tx_packet_64_bytes),
  .stat_tx_packet_65_127_bytes              (stat_tx_packet_65_127_bytes),
  .stat_tx_packet_128_255_bytes             (stat_tx_packet_128_255_bytes),
  .stat_tx_packet_256_511_bytes             (stat_tx_packet_256_511_bytes),
  .stat_tx_packet_512_1023_bytes            (stat_tx_packet_512_1023_bytes),
  .stat_tx_packet_1024_1518_bytes           (stat_tx_packet_1024_1518_bytes),
  .stat_tx_packet_1519_1522_bytes           (stat_tx_packet_1519_1522_bytes),
  .stat_tx_packet_1523_1548_bytes           (stat_tx_packet_1523_1548_bytes),
  .stat_tx_packet_1549_2047_bytes           (stat_tx_packet_1549_2047_bytes),
  .stat_tx_packet_2048_4095_bytes           (stat_tx_packet_2048_4095_bytes),
  .stat_tx_packet_4096_8191_bytes           (stat_tx_packet_4096_8191_bytes),
  .stat_tx_packet_8192_9215_bytes           (stat_tx_packet_8192_9215_bytes),
  .stat_tx_bad_fcs                          (stat_tx_bad_fcs),
  .stat_tx_local_fault                      (stat_tx_local_fault),
  .stat_tx_ptp_fifo_read_error              (stat_tx_ptp_fifo_read_error),
  .stat_tx_ptp_fifo_write_error             (stat_tx_ptp_fifo_write_error),
  .stat_tx_frame_error                      (stat_tx_frame_error),
  .stat_tx_unicast                          (stat_tx_unicast),
  .stat_tx_multicast                        (stat_tx_multicast),
  .stat_tx_broadcast                        (stat_tx_broadcast),
  .stat_tx_vlan                             (stat_tx_vlan),
  .stat_tx_pause                            (stat_tx_pause),
  .stat_tx_user_pause                       (stat_tx_user_pause),
  .stat_rx_status                           (stat_rx_status),
  .stat_rx_aligned                          (stat_rx_aligned),
  .stat_rx_misaligned                       (stat_rx_misaligned ),
  .stat_rx_aligned_err                      (stat_rx_aligned_err),
  .stat_rx_hi_ber                           (stat_rx_hi_ber),
  .stat_rx_remote_fault                     (stat_rx_remote_fault),
  .stat_rx_local_fault                      (stat_rx_local_fault),
  .stat_rx_internal_local_fault             (stat_rx_internal_local_fault),
  .stat_rx_received_local_fault             (stat_rx_received_local_fault),
  .stat_rx_test_pattern_mismatch            (stat_rx_test_pattern_mismatch),
  .stat_rx_bad_preamble                     (stat_rx_bad_preamble),
  .stat_rx_bad_sfd                          (stat_rx_bad_sfd),
  .stat_rx_got_signal_os                    (stat_rx_got_signal_os),
  .stat_rx_block_lock                       (stat_rx_block_lock),
  .stat_rx_synced                           (stat_rx_synced),
  .stat_rx_synced_err                       (stat_rx_synced_err),
  .stat_rx_mf_err                           (stat_rx_mf_err),
  .stat_rx_mf_len_err                       (stat_rx_mf_len_err),
  .stat_rx_mf_repeat_err                    (stat_rx_mf_repeat_err),
  .stat_rx_pcsl_demuxed                     (stat_rx_pcsl_demuxed),
  .stat_rx_pcsl_number_0                    (stat_rx_pcsl_number_0),
  .stat_rx_pcsl_number_1                    (stat_rx_pcsl_number_1),
  .stat_rx_pcsl_number_2                    (stat_rx_pcsl_number_2),
  .stat_rx_pcsl_number_3                    (stat_rx_pcsl_number_3),
  .stat_rx_pcsl_number_4                    (stat_rx_pcsl_number_4),
  .stat_rx_pcsl_number_5                    (stat_rx_pcsl_number_5),
  .stat_rx_pcsl_number_6                    (stat_rx_pcsl_number_6),
  .stat_rx_pcsl_number_7                    (stat_rx_pcsl_number_7),
  .stat_rx_pcsl_number_8                    (stat_rx_pcsl_number_8),
  .stat_rx_pcsl_number_9                    (stat_rx_pcsl_number_9),
  .stat_rx_pcsl_number_10                   (stat_rx_pcsl_number_10),
  .stat_rx_pcsl_number_11                   (stat_rx_pcsl_number_11),
  .stat_rx_pcsl_number_12                   (stat_rx_pcsl_number_12),
  .stat_rx_pcsl_number_13                   (stat_rx_pcsl_number_13),
  .stat_rx_pcsl_number_14                   (stat_rx_pcsl_number_14),
  .stat_rx_pcsl_number_15                   (stat_rx_pcsl_number_15),
  .stat_rx_pcsl_number_16                   (stat_rx_pcsl_number_16),
  .stat_rx_pcsl_number_17                   (stat_rx_pcsl_number_17),
  .stat_rx_pcsl_number_18                   (stat_rx_pcsl_number_18),
  .stat_rx_pcsl_number_19                   (stat_rx_pcsl_number_19),
  .stat_rx_lane0_vlm_bip7                   (stat_rx_lane0_vlm_bip7),
  .stat_rx_lane0_vlm_bip7_valid             (stat_rx_lane0_vlm_bip7_valid),
  .stat_rx_bip_err_0                        (stat_rx_bip_err_0),
  .stat_rx_bip_err_1                        (stat_rx_bip_err_1),
  .stat_rx_bip_err_2                        (stat_rx_bip_err_2),
  .stat_rx_bip_err_3                        (stat_rx_bip_err_3),
  .stat_rx_bip_err_4                        (stat_rx_bip_err_4),
  .stat_rx_bip_err_5                        (stat_rx_bip_err_5),
  .stat_rx_bip_err_6                        (stat_rx_bip_err_6),
  .stat_rx_bip_err_7                        (stat_rx_bip_err_7),
  .stat_rx_bip_err_8                        (stat_rx_bip_err_8),
  .stat_rx_bip_err_9                        (stat_rx_bip_err_9),
  .stat_rx_bip_err_10                       (stat_rx_bip_err_10),
  .stat_rx_bip_err_11                       (stat_rx_bip_err_11),
  .stat_rx_bip_err_12                       (stat_rx_bip_err_12),
  .stat_rx_bip_err_13                       (stat_rx_bip_err_13),
  .stat_rx_bip_err_14                       (stat_rx_bip_err_14),
  .stat_rx_bip_err_15                       (stat_rx_bip_err_15),
  .stat_rx_bip_err_16                       (stat_rx_bip_err_16),
  .stat_rx_bip_err_17                       (stat_rx_bip_err_17),
  .stat_rx_bip_err_18                       (stat_rx_bip_err_18),
  .stat_rx_bip_err_19                       (stat_rx_bip_err_19),
  .stat_rx_framing_err_0                    (stat_rx_framing_err_0),
  .stat_rx_framing_err_valid_0              (stat_rx_framing_err_valid_0),
  .stat_rx_framing_err_1                    (stat_rx_framing_err_1),
  .stat_rx_framing_err_valid_1              (stat_rx_framing_err_valid_1),
  .stat_rx_framing_err_2                    (stat_rx_framing_err_2),
  .stat_rx_framing_err_valid_2              (stat_rx_framing_err_valid_2),
  .stat_rx_framing_err_3                    (stat_rx_framing_err_3),
  .stat_rx_framing_err_valid_3              (stat_rx_framing_err_valid_3),
  .stat_rx_framing_err_4                    (stat_rx_framing_err_4),
  .stat_rx_framing_err_valid_4              (stat_rx_framing_err_valid_4),
  .stat_rx_framing_err_5                    (stat_rx_framing_err_5),
  .stat_rx_framing_err_valid_5              (stat_rx_framing_err_valid_5),
  .stat_rx_framing_err_6                    (stat_rx_framing_err_6),
  .stat_rx_framing_err_valid_6              (stat_rx_framing_err_valid_6),
  .stat_rx_framing_err_7                    (stat_rx_framing_err_7),
  .stat_rx_framing_err_valid_7              (stat_rx_framing_err_valid_7),
  .stat_rx_framing_err_8                    (stat_rx_framing_err_8),
  .stat_rx_framing_err_valid_8              (stat_rx_framing_err_valid_8),
  .stat_rx_framing_err_9                    (stat_rx_framing_err_9),
  .stat_rx_framing_err_valid_9              (stat_rx_framing_err_valid_9),
  .stat_rx_framing_err_10                   (stat_rx_framing_err_10),
  .stat_rx_framing_err_valid_10             (stat_rx_framing_err_valid_10),
  .stat_rx_framing_err_11                   (stat_rx_framing_err_11),
  .stat_rx_framing_err_valid_11             (stat_rx_framing_err_valid_11),
  .stat_rx_framing_err_12                   (stat_rx_framing_err_12),
  .stat_rx_framing_err_valid_12             (stat_rx_framing_err_valid_12),
  .stat_rx_framing_err_13                   (stat_rx_framing_err_13),
  .stat_rx_framing_err_valid_13             (stat_rx_framing_err_valid_13),
  .stat_rx_framing_err_14                   (stat_rx_framing_err_14),
  .stat_rx_framing_err_valid_14             (stat_rx_framing_err_valid_14),
  .stat_rx_framing_err_15                   (stat_rx_framing_err_15),
  .stat_rx_framing_err_valid_15             (stat_rx_framing_err_valid_15),
  .stat_rx_framing_err_16                   (stat_rx_framing_err_16),
  .stat_rx_framing_err_valid_16             (stat_rx_framing_err_valid_16),
  .stat_rx_framing_err_17                   (stat_rx_framing_err_17),
  .stat_rx_framing_err_valid_17             (stat_rx_framing_err_valid_17),
  .stat_rx_framing_err_18                   (stat_rx_framing_err_18),
  .stat_rx_framing_err_valid_18             (stat_rx_framing_err_valid_18),
  .stat_rx_framing_err_19                   (stat_rx_framing_err_19),
  .stat_rx_framing_err_valid_19             (stat_rx_framing_err_valid_19),
  .stat_rx_bad_code                         (stat_rx_bad_code),
  .stat_rx_total_packets                    (stat_rx_total_packets),
  .stat_rx_total_good_packets               (stat_rx_total_good_packets),
  .stat_rx_total_bytes                      (stat_rx_total_bytes),
  .stat_rx_total_good_bytes                 (stat_rx_total_good_bytes),
  .stat_rx_packet_64_bytes                  (stat_rx_packet_64_bytes),
  .stat_rx_packet_65_127_bytes              (stat_rx_packet_65_127_bytes),
  .stat_rx_packet_128_255_bytes             (stat_rx_packet_128_255_bytes),
  .stat_rx_packet_256_511_bytes             (stat_rx_packet_256_511_bytes),
  .stat_rx_packet_512_1023_bytes            (stat_rx_packet_512_1023_bytes),
  .stat_rx_packet_1024_1518_bytes           (stat_rx_packet_1024_1518_bytes),
  .stat_rx_packet_1519_1522_bytes           (stat_rx_packet_1519_1522_bytes),
  .stat_rx_packet_1523_1548_bytes           (stat_rx_packet_1523_1548_bytes),
  .stat_rx_packet_1549_2047_bytes           (stat_rx_packet_1549_2047_bytes),
  .stat_rx_packet_2048_4095_bytes           (stat_rx_packet_2048_4095_bytes),
  .stat_rx_packet_4096_8191_bytes           (stat_rx_packet_4096_8191_bytes),
  .stat_rx_packet_8192_9215_bytes           (stat_rx_packet_8192_9215_bytes),
  .stat_rx_packet_large                     (stat_rx_packet_large),
  .stat_rx_packet_small                     (stat_rx_packet_small),
  .stat_rx_undersize                        (stat_rx_undersize),
  .stat_rx_fragment                         (stat_rx_fragment),
  .stat_rx_oversize                         (stat_rx_oversize),
  .stat_rx_toolong                          (stat_rx_toolong),
  .stat_rx_jabber                           (stat_rx_jabber),
  .stat_rx_bad_fcs                          (stat_rx_bad_fcs),
  .stat_rx_packet_bad_fcs                   (stat_rx_packet_bad_fcs),
  .stat_rx_stomped_fcs                      (stat_rx_stomped_fcs),
  .stat_rx_unicast                          (stat_rx_unicast),
  .stat_rx_multicast                        (stat_rx_multicast),
  .stat_rx_broadcast                        (stat_rx_broadcast),
  .stat_rx_vlan                             (stat_rx_vlan),
  .stat_rx_pause                            (stat_rx_pause),
  .stat_rx_user_pause                       (stat_rx_user_pause),
  .stat_rx_inrangeerr                       (stat_rx_inrangeerr),
  .stat_rx_truncated                        (stat_rx_truncated),
  .stat_rx_rsfec_am_lock0                   (stat_rx_rsfec_am_lock0),
  .stat_rx_rsfec_am_lock1                   (stat_rx_rsfec_am_lock1),
  .stat_rx_rsfec_am_lock2                   (stat_rx_rsfec_am_lock2),
  .stat_rx_rsfec_am_lock3                   (stat_rx_rsfec_am_lock3),
  .stat_rx_rsfec_corrected_cw_inc           (stat_rx_rsfec_corrected_cw_inc),
  .stat_rx_rsfec_cw_inc                     (stat_rx_rsfec_cw_inc),
  .stat_rx_rsfec_err_count0_inc             (stat_rx_rsfec_err_count0_inc),
  .stat_rx_rsfec_err_count1_inc             (stat_rx_rsfec_err_count1_inc),
  .stat_rx_rsfec_err_count2_inc             (stat_rx_rsfec_err_count2_inc),
  .stat_rx_rsfec_err_count3_inc             (stat_rx_rsfec_err_count3_inc),
  .stat_rx_rsfec_hi_ser                     (stat_rx_rsfec_hi_ser),
  .stat_rx_rsfec_lane_alignment_status      (stat_rx_rsfec_lane_alignment_status),
  .stat_rx_rsfec_lane_fill_0                (stat_rx_rsfec_lane_fill_0),
  .stat_rx_rsfec_lane_fill_1                (stat_rx_rsfec_lane_fill_1),
  .stat_rx_rsfec_lane_fill_2                (stat_rx_rsfec_lane_fill_2),
  .stat_rx_rsfec_lane_fill_3                (stat_rx_rsfec_lane_fill_3),
  .stat_rx_rsfec_lane_mapping               (stat_rx_rsfec_lane_mapping),
  .stat_rx_rsfec_uncorrected_cw_inc         (stat_rx_rsfec_uncorrected_cw_inc),
  .pm_tick                                  (pm_tick)
  );





////If mode is CAUI-4 with GTY (4 Lanes, Line Rate 25.78125 Gbps)
  wire [7:0]      tx_serdes_alt_data0_ctrl0;
  wire [7:0]      tx_serdes_alt_data0_ctrl1;
  wire [7:0]      tx_serdes_alt_data1_ctrl0;
  wire [7:0]      tx_serdes_alt_data1_ctrl1;
  wire [7:0]      tx_serdes_alt_data2_ctrl0;
  wire [7:0]      tx_serdes_alt_data2_ctrl1;
  wire [7:0]      tx_serdes_alt_data3_ctrl0;
  wire [7:0]      tx_serdes_alt_data3_ctrl1;
  wire [7:0]      rx_serdes_alt_data0_ctrl0;
  wire [7:0]      rx_serdes_alt_data0_ctrl1;
  wire [7:0]      rx_serdes_alt_data1_ctrl0;
  wire [7:0]      rx_serdes_alt_data1_ctrl1;
  wire [7:0]      rx_serdes_alt_data2_ctrl0;
  wire [7:0]      rx_serdes_alt_data2_ctrl1;
  wire [7:0]      rx_serdes_alt_data3_ctrl0;
  wire [7:0]      rx_serdes_alt_data3_ctrl1;

  wire [ 511 : 0] txdata_in_int;
  wire [ 63 : 0]  txctrl0_in_int;
  wire [ 63 : 0]  txctrl1_in_int;

  wire [ 511 : 0] txdata_in_int_2d;
  wire [ 63 : 0]  txctrl0_in_int_2d;
  wire [ 63 : 0]  txctrl1_in_int_2d;

  wire [ 511 : 0] txdata_in;
  wire [ 63 : 0]  txctrl0_in;
  wire [ 63 : 0]  txctrl1_in;

  wire [ 511 : 0] rxdata_out;
  wire [ 63 : 0]  rxctrl0_out;
  wire [ 63 : 0]  rxctrl1_out;
  
  assign tx_serdes_alt_data0_ctrl0 = {tx_serdes_alt_data0[14], tx_serdes_alt_data0[12],
                                      tx_serdes_alt_data0[10], tx_serdes_alt_data0[8],
                                      tx_serdes_alt_data0[6],  tx_serdes_alt_data0[4],
                                      tx_serdes_alt_data0[2],  tx_serdes_alt_data0[0]};

  assign tx_serdes_alt_data0_ctrl1 = {tx_serdes_alt_data0[15], tx_serdes_alt_data0[13],
                                      tx_serdes_alt_data0[11], tx_serdes_alt_data0[9],
                                      tx_serdes_alt_data0[7],  tx_serdes_alt_data0[5],
                                      tx_serdes_alt_data0[3],  tx_serdes_alt_data0[1]};

  assign tx_serdes_alt_data1_ctrl0 = {tx_serdes_alt_data1[14], tx_serdes_alt_data1[12],
                                      tx_serdes_alt_data1[10], tx_serdes_alt_data1[8],
                                      tx_serdes_alt_data1[6],  tx_serdes_alt_data1[4],
                                      tx_serdes_alt_data1[2],  tx_serdes_alt_data1[0]};

  assign tx_serdes_alt_data1_ctrl1 = {tx_serdes_alt_data1[15], tx_serdes_alt_data1[13],
                                      tx_serdes_alt_data1[11], tx_serdes_alt_data1[9],
                                      tx_serdes_alt_data1[7],  tx_serdes_alt_data1[5],
                                      tx_serdes_alt_data1[3],  tx_serdes_alt_data1[1]};

  assign tx_serdes_alt_data2_ctrl0 = {tx_serdes_alt_data2[14], tx_serdes_alt_data2[12],
                                      tx_serdes_alt_data2[10], tx_serdes_alt_data2[8],
                                      tx_serdes_alt_data2[6],  tx_serdes_alt_data2[4],
                                      tx_serdes_alt_data2[2],  tx_serdes_alt_data2[0]};

  assign tx_serdes_alt_data2_ctrl1 = {tx_serdes_alt_data2[15], tx_serdes_alt_data2[13],
                                      tx_serdes_alt_data2[11], tx_serdes_alt_data2[9],
                                      tx_serdes_alt_data2[7],  tx_serdes_alt_data2[5],
                                      tx_serdes_alt_data2[3],  tx_serdes_alt_data2[1]};

  assign tx_serdes_alt_data3_ctrl0 = {tx_serdes_alt_data3[14], tx_serdes_alt_data3[12],
                                      tx_serdes_alt_data3[10], tx_serdes_alt_data3[8],
                                      tx_serdes_alt_data3[6],  tx_serdes_alt_data3[4],
                                      tx_serdes_alt_data3[2],  tx_serdes_alt_data3[0]};

  assign tx_serdes_alt_data3_ctrl1 = {tx_serdes_alt_data3[15], tx_serdes_alt_data3[13],
                                      tx_serdes_alt_data3[11], tx_serdes_alt_data3[9],
                                      tx_serdes_alt_data3[7],  tx_serdes_alt_data3[5],
                                      tx_serdes_alt_data3[3],  tx_serdes_alt_data3[1]};

  assign txctrl0_in_int            = { 8'b0, tx_serdes_alt_data3_ctrl0,
                                       8'b0, tx_serdes_alt_data2_ctrl0,
                                       8'b0, tx_serdes_alt_data1_ctrl0,
                                       8'b0, tx_serdes_alt_data0_ctrl0
                                     };

  assign txctrl1_in_int            = { 8'b0, tx_serdes_alt_data3_ctrl1,
                                       8'b0, tx_serdes_alt_data2_ctrl1,
                                       8'b0, tx_serdes_alt_data1_ctrl1,
                                       8'b0, tx_serdes_alt_data0_ctrl1
                                     };

  assign txdata_in_int             = { 64'b0, tx_serdes_data3,
                                       64'b0, tx_serdes_data2,
                                       64'b0, tx_serdes_data1,
                                       64'b0, tx_serdes_data0
                                     };

  cmac_usplus_1_tx_sync i_cmac_usplus_1_tx_sync
  (
   .clk            (tx_clk),
   .data_in        (txdata_in_int),
   .ctrl0_in       (txctrl0_in_int),
   .ctrl1_in       (txctrl1_in_int),
   .data_out       (txdata_in_int_2d),
   .ctrl0_out      (txctrl0_in_int_2d),
   .ctrl1_out      (txctrl1_in_int_2d)
  );

  cmac_usplus_1_pipeline_sync_512bit i_cmac_usplus_1_pipeline_sync_512bit_txdata
  (
   .clk              (gt_txusrclk2),
   .data_in          (txdata_in_int_2d),
   .data_out         (txdata_in)
  );
  
  cmac_usplus_1_pipeline_sync_64bit i_cmac_usplus_1_pipeline_sync_64bit_txctrl0
  (
   .clk              (gt_txusrclk2),
   .data_in          (txctrl0_in_int_2d),
   .data_out         (txctrl0_in)
  );
  
  cmac_usplus_1_pipeline_sync_64bit i_cmac_usplus_1_pipeline_sync_64bit_txctrl1
  (
   .clk              (gt_txusrclk2),
   .data_in          (txctrl1_in_int_2d),
   .data_out         (txctrl1_in)
  );

  assign rx_serdes_alt_data0_ctrl0 = rxctrl0_out[7:0];
  assign rx_serdes_alt_data1_ctrl0 = rxctrl0_out[23:16];
  assign rx_serdes_alt_data2_ctrl0 = rxctrl0_out[39:32];
  assign rx_serdes_alt_data3_ctrl0 = rxctrl0_out[55:48];

  assign rx_serdes_alt_data0_ctrl1 = rxctrl1_out[7:0];
  assign rx_serdes_alt_data1_ctrl1 = rxctrl1_out[23:16];
  assign rx_serdes_alt_data2_ctrl1 = rxctrl1_out[39:32];
  assign rx_serdes_alt_data3_ctrl1 = rxctrl1_out[55:48];

  assign rx_serdes_alt_data0_int   = {rx_serdes_alt_data0_ctrl1[7], rx_serdes_alt_data0_ctrl0[7],
                                      rx_serdes_alt_data0_ctrl1[6], rx_serdes_alt_data0_ctrl0[6],
                                      rx_serdes_alt_data0_ctrl1[5], rx_serdes_alt_data0_ctrl0[5],
                                      rx_serdes_alt_data0_ctrl1[4], rx_serdes_alt_data0_ctrl0[4],
                                      rx_serdes_alt_data0_ctrl1[3], rx_serdes_alt_data0_ctrl0[3],
                                      rx_serdes_alt_data0_ctrl1[2], rx_serdes_alt_data0_ctrl0[2],
                                      rx_serdes_alt_data0_ctrl1[1], rx_serdes_alt_data0_ctrl0[1],
                                      rx_serdes_alt_data0_ctrl1[0], rx_serdes_alt_data0_ctrl0[0]};

  assign rx_serdes_alt_data1_int   = {rx_serdes_alt_data1_ctrl1[7], rx_serdes_alt_data1_ctrl0[7],
                                      rx_serdes_alt_data1_ctrl1[6], rx_serdes_alt_data1_ctrl0[6],
                                      rx_serdes_alt_data1_ctrl1[5], rx_serdes_alt_data1_ctrl0[5],
                                      rx_serdes_alt_data1_ctrl1[4], rx_serdes_alt_data1_ctrl0[4],
                                      rx_serdes_alt_data1_ctrl1[3], rx_serdes_alt_data1_ctrl0[3],
                                      rx_serdes_alt_data1_ctrl1[2], rx_serdes_alt_data1_ctrl0[2],
                                      rx_serdes_alt_data1_ctrl1[1], rx_serdes_alt_data1_ctrl0[1],
                                      rx_serdes_alt_data1_ctrl1[0], rx_serdes_alt_data1_ctrl0[0]};

  assign rx_serdes_alt_data2_int   = {rx_serdes_alt_data2_ctrl1[7], rx_serdes_alt_data2_ctrl0[7],
                                      rx_serdes_alt_data2_ctrl1[6], rx_serdes_alt_data2_ctrl0[6],
                                      rx_serdes_alt_data2_ctrl1[5], rx_serdes_alt_data2_ctrl0[5],
                                      rx_serdes_alt_data2_ctrl1[4], rx_serdes_alt_data2_ctrl0[4],
                                      rx_serdes_alt_data2_ctrl1[3], rx_serdes_alt_data2_ctrl0[3],
                                      rx_serdes_alt_data2_ctrl1[2], rx_serdes_alt_data2_ctrl0[2],
                                      rx_serdes_alt_data2_ctrl1[1], rx_serdes_alt_data2_ctrl0[1],
                                      rx_serdes_alt_data2_ctrl1[0], rx_serdes_alt_data2_ctrl0[0]};

  assign rx_serdes_alt_data3_int   = {rx_serdes_alt_data3_ctrl1[7], rx_serdes_alt_data3_ctrl0[7],
                                      rx_serdes_alt_data3_ctrl1[6], rx_serdes_alt_data3_ctrl0[6],
                                      rx_serdes_alt_data3_ctrl1[5], rx_serdes_alt_data3_ctrl0[5],
                                      rx_serdes_alt_data3_ctrl1[4], rx_serdes_alt_data3_ctrl0[4],
                                      rx_serdes_alt_data3_ctrl1[3], rx_serdes_alt_data3_ctrl0[3],
                                      rx_serdes_alt_data3_ctrl1[2], rx_serdes_alt_data3_ctrl0[2],
                                      rx_serdes_alt_data3_ctrl1[1], rx_serdes_alt_data3_ctrl0[1],
                                      rx_serdes_alt_data3_ctrl1[0], rx_serdes_alt_data3_ctrl0[0]};

  assign rx_serdes_data0_int       = rxdata_out[63:0];
  assign rx_serdes_data1_int       = rxdata_out[191:128];
  assign rx_serdes_data2_int       = rxdata_out[319:256];
  assign rx_serdes_data3_int       = rxdata_out[447:384];
  assign rx_serdes_data4_int       = 32'h0;
  assign rx_serdes_data5_int       = 32'h0;
  assign rx_serdes_data6_int       = 32'h0;
  assign rx_serdes_data7_int       = 32'h0;
  assign rx_serdes_data8_int       = 32'h0;
  assign rx_serdes_data9_int       = 32'h0;



  assign common0_drpdo           = 'd0;
  assign common0_drprdy          = 'b0;

  wire [0 :0]      qpll0outclk_int;
  wire [0 :0]      qpll0outrefclk_int;

  ////--------------------------------------------------------------------------------------------------------------------
  wire [0:0]      gtwiz_userclk_tx_srcclk_int;

  ////--------------------------------------------------------------------------------------------------------------------
  wire [0:0]      gtwiz_userclk_tx_usrclk_int;

  ////--------------------------------------------------------------------------------------------------------------------
  wire [0:0]      gtwiz_userclk_tx_usrclk2_int;

  ////--------------------------------------------------------------------------------------------------------------------
  wire [0:0]      gtwiz_userclk_tx_active_int;

  ////--------------------------------------------------------------------------------------------------------------------
  wire [0:0]      gtwiz_userclk_rx_usrclk_out;
  wire [0:0]      gtwiz_userclk_rx_srcclk_out;
  wire [0:0]      gtwiz_userclk_rx_usrclk2_out;
  wire [0:0]      gtwiz_userclk_rx_active_out;
  wire [0:0]      gtwiz_userclk_rx_active_in;
  wire [0:0]      cmac_gtwiz_userclk_rx_reset_in;
  wire [0:0]      cmac_gtwiz_userclk_rx_active_out;
  wire [0:0]      gtwiz_userclk_rx_srcclk_int;
  wire [0:0]      gtwiz_userclk_rx_usrclk_int;
  wire [0:0]      gtwiz_userclk_rx_usrclk2_int;
  wire [0:0]      gtwiz_userclk_rx_active_int;

  assign gt_txusrclk2             =  gtwiz_userclk_tx_usrclk2_int[0];
  assign gt_rxusrclk2             =  gtwiz_userclk_rx_usrclk2_int[0];
  assign tx_clk                   =  gt_txusrclk2;

  wire [0:0]      gtwiz_reset_tx_done_int;
  wire [0:0]      gtwiz_reset_rx_done_int;

  assign gt_txresetdone_int       =  gtwiz_reset_tx_done_int[0];

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_gt_txresetdone_int
  (
   .clk              (gt_txusrclk2),
   .signal_in        (gt_txresetdone_int), 
   .signal_out       (gt_txresetdone_int_sync)
  );

  wire core_drp_reset_tx_clk_sync;
  wire core_tx_reset_sync;

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_core_drp_reset_tx_clk
  (
   .clk              (gt_txusrclk2),
   .signal_in        (core_drp_reset), 
   .signal_out       (core_drp_reset_tx_clk_sync)
  );

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_core_tx_reset
  (
   .clk              (gt_txusrclk2),
   .signal_in        (core_tx_reset), 
   .signal_out       (core_tx_reset_sync)
  );

  assign gt_tx_reset_done_inv     =  ~(gt_txresetdone_int_sync);
  assign tx_reset_done            =  gt_tx_reset_done_inv | core_drp_reset_tx_clk_sync | core_tx_reset_sync | axi_usr_tx_reset;

  assign tx_reset_done_sync       =  tx_reset_done;

  assign usr_tx_reset             =  tx_reset_done;

 
  assign gt_rxresetdone_int       =  gtwiz_reset_rx_done_int[0];

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_gt_rxresetdone_int
  (
   .clk              (rx_clk),
   .signal_in        (gt_rxresetdone_int), 
   .signal_out       (gt_rxresetdone_int_sync)
  );

  wire core_drp_reset_rx_clk_sync;
  wire core_rx_reset_sync;

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_core_drp_reset_rx_clk
  (
   .clk              (rx_clk),
   .signal_in        (core_drp_reset), 
   .signal_out       (core_drp_reset_rx_clk_sync)
  );

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_core_rx_reset
  (
   .clk              (rx_clk),
   .signal_in        (core_rx_reset), 
   .signal_out       (core_rx_reset_sync)
  );


  assign gt_rx_reset_done_inv     =  ~(gt_rxresetdone_int_sync);
  assign rx_reset_done            =  gt_rx_reset_done_inv | core_drp_reset_rx_clk_sync | core_rx_reset_sync | axi_usr_rx_reset;

  assign usr_rx_reset             =  rx_reset_done;

  always @(posedge rx_clk)
  begin
      gt_rx_reset_done_inv_reg    <= gt_rx_reset_done_inv;
  end

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_gt_rxresetdone_reg_rxusrclk2
  (
   .clk              (gt_rxusrclk2),
   .signal_in        (gt_rx_reset_done_inv_reg), 
   .signal_out       (gt_rx_reset_done_inv_reg_sync)
  );
  
  wire core_drp_reset_serdes_clk_sync;

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_gt_txresetdone_int3
  (
   .clk              (gt_rxusrclk2),
   .signal_in        (core_drp_reset), 
   .signal_out       (core_drp_reset_serdes_clk_sync)
  );

  assign reset_done_async         =  gt_rx_reset_done_inv_reg_sync | core_drp_reset_serdes_clk_sync;

  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_axi_usr_rx_serdes_reset_0
  (
   .clk              (rx_serdes_clk[0]),
   .signal_in        (axi_usr_rx_serdes_reset[0]), 
   .signal_out       (axi_usr_rx_serdes_reset_sync[0])
  );
  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_axi_usr_rx_serdes_reset_1
  (
   .clk              (rx_serdes_clk[1]),
   .signal_in        (axi_usr_rx_serdes_reset[1]), 
   .signal_out       (axi_usr_rx_serdes_reset_sync[1])
  );
  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_axi_usr_rx_serdes_reset_2
  (
   .clk              (rx_serdes_clk[2]),
   .signal_in        (axi_usr_rx_serdes_reset[2]), 
   .signal_out       (axi_usr_rx_serdes_reset_sync[2])
  );
  cmac_usplus_1_cdc_sync i_cmac_usplus_1_cmac_cdc_sync_axi_usr_rx_serdes_reset_3
  (
   .clk              (rx_serdes_clk[3]),
   .signal_in        (axi_usr_rx_serdes_reset[3]), 
   .signal_out       (axi_usr_rx_serdes_reset_sync[3])
  );
  assign axi_usr_rx_serdes_reset_sync[4]  =  1'b1;
  assign axi_usr_rx_serdes_reset_sync[5]  =  1'b1;
  assign axi_usr_rx_serdes_reset_sync[6]  =  1'b1;
  assign axi_usr_rx_serdes_reset_sync[7]  =  1'b1;
  assign axi_usr_rx_serdes_reset_sync[8]  =  1'b1;
  assign axi_usr_rx_serdes_reset_sync[9]  =  1'b1;

  assign rx_serdes_reset_done[0]  =  reset_done_async | axi_usr_rx_serdes_reset_sync[0];
  assign rx_serdes_reset_done[1]  =  reset_done_async | axi_usr_rx_serdes_reset_sync[1];
  assign rx_serdes_reset_done[2]  =  reset_done_async | axi_usr_rx_serdes_reset_sync[2];
  assign rx_serdes_reset_done[3]  =  reset_done_async | axi_usr_rx_serdes_reset_sync[3];
  assign rx_serdes_reset_done[4]  =  1'b1;
  assign rx_serdes_reset_done[5]  =  1'b1;
  assign rx_serdes_reset_done[6]  =  1'b1;
  assign rx_serdes_reset_done[7]  =  1'b1;
  assign rx_serdes_reset_done[8]  =  1'b1;
  assign rx_serdes_reset_done[9]  =  1'b1;
  
  assign rx_serdes_clk[0]         =  gt_rxusrclk2;
  assign rx_serdes_clk[1]         =  gt_rxusrclk2;
  assign rx_serdes_clk[2]         =  gt_rxusrclk2;
  assign rx_serdes_clk[3]         =  gt_rxusrclk2;
  assign rx_serdes_clk[4]         =  1'b0;
  assign rx_serdes_clk[5]         =  1'b0;
  assign rx_serdes_clk[6]         =  1'b0;
  assign rx_serdes_clk[7]         =  1'b0;
  assign rx_serdes_clk[8]         =  1'b0;
  assign rx_serdes_clk[9]         =  1'b0;

  cmac_usplus_1_rx_64bit_pipeline_sync i_cmac_usplus_1_rx_64bit_pipeline_sync_serdes_data0
  (
   .clk            (rx_serdes_clk[0]),
   .data_in        (rx_serdes_data0_int),
   .data_out       (rx_serdes_data0)
  );
  cmac_usplus_1_rx_64bit_pipeline_sync i_cmac_usplus_1_rx_64bit_pipeline_sync_serdes_data1
  (
   .clk            (rx_serdes_clk[1]),
   .data_in        (rx_serdes_data1_int),
   .data_out       (rx_serdes_data1)
  );
  cmac_usplus_1_rx_64bit_pipeline_sync i_cmac_usplus_1_rx_64bit_pipeline_sync_serdes_data2
  (
   .clk            (rx_serdes_clk[2]),
   .data_in        (rx_serdes_data2_int),
   .data_out       (rx_serdes_data2)
  );
  cmac_usplus_1_rx_64bit_pipeline_sync i_cmac_usplus_1_rx_64bit_pipeline_sync_serdes_data3
  (
   .clk            (rx_serdes_clk[3]),
   .data_in        (rx_serdes_data3_int),
   .data_out       (rx_serdes_data3)
  );
  cmac_usplus_1_rx_32bit_pipeline_sync i_cmac_usplus_1_rx_32bit_pipeline_sync_serdes_data4
  (
   .clk            (rx_serdes_clk[4]),
   .data_in        (rx_serdes_data4_int),
   .data_out       (rx_serdes_data4)
  );
  cmac_usplus_1_rx_32bit_pipeline_sync i_cmac_usplus_1_rx_32bit_pipeline_sync_serdes_data5
  (
   .clk            (rx_serdes_clk[5]),
   .data_in        (rx_serdes_data5_int),
   .data_out       (rx_serdes_data5)
  );
  cmac_usplus_1_rx_32bit_pipeline_sync i_cmac_usplus_1_rx_32bit_pipeline_sync_serdes_data6
  (
   .clk            (rx_serdes_clk[6]),
   .data_in        (rx_serdes_data6_int),
   .data_out       (rx_serdes_data6)
  );
  cmac_usplus_1_rx_32bit_pipeline_sync i_cmac_usplus_1_rx_32bit_pipeline_sync_serdes_data7
  (
   .clk            (rx_serdes_clk[7]),
   .data_in        (rx_serdes_data7_int),
   .data_out       (rx_serdes_data7)
  );
  cmac_usplus_1_rx_32bit_pipeline_sync i_cmac_usplus_1_rx_32bit_pipeline_sync_serdes_data8
  (
   .clk            (rx_serdes_clk[8]),
   .data_in        (rx_serdes_data8_int),
   .data_out       (rx_serdes_data8)
  );
  cmac_usplus_1_rx_32bit_pipeline_sync i_cmac_usplus_1_rx_32bit_pipeline_sync_serdes_data9
  (
   .clk            (rx_serdes_clk[9]),
   .data_in        (rx_serdes_data9_int),
   .data_out       (rx_serdes_data9)
  );
  cmac_usplus_1_rx_16bit_pipeline_sync i_cmac_usplus_1_rx_16bit_pipeline_sync_alt_data0
  (
   .clk            (rx_serdes_clk[0]),
   .data_in        (rx_serdes_alt_data0_int),
   .data_out       (rx_serdes_alt_data0)
  );
  cmac_usplus_1_rx_16bit_pipeline_sync i_cmac_usplus_1_rx_16bit_pipeline_sync_alt_data1
  (
   .clk            (rx_serdes_clk[1]),
   .data_in        (rx_serdes_alt_data1_int),
   .data_out       (rx_serdes_alt_data1)
  );
  cmac_usplus_1_rx_16bit_pipeline_sync i_cmac_usplus_1_rx_16bit_pipeline_sync_alt_data2
  (
   .clk            (rx_serdes_clk[2]),
   .data_in        (rx_serdes_alt_data2_int),
   .data_out       (rx_serdes_alt_data2)
  );
  cmac_usplus_1_rx_16bit_pipeline_sync i_cmac_usplus_1_rx_16bit_pipeline_sync_alt_data3
  (
   .clk            (rx_serdes_clk[3]),
   .data_in        (rx_serdes_alt_data3_int),
   .data_out       (rx_serdes_alt_data3)
  );
  cmac_usplus_1_rx_64bit_sync i_cmac_usplus_1_rx_64bit_sync_serdes_data0
  (
   .clk            (rx_serdes_clk[0]),
   .data_in        (rx_serdes_data0),
   .data_out       (rx_serdes_data0_2d)
  );
  cmac_usplus_1_rx_64bit_sync i_cmac_usplus_1_rx_64bit_sync_serdes_data1
  (
   .clk            (rx_serdes_clk[1]),
   .data_in        (rx_serdes_data1),
   .data_out       (rx_serdes_data1_2d)
  );
  cmac_usplus_1_rx_64bit_sync i_cmac_usplus_1_rx_64bit_sync_serdes_data2
  (
   .clk            (rx_serdes_clk[2]),
   .data_in        (rx_serdes_data2),
   .data_out       (rx_serdes_data2_2d)
  );
  cmac_usplus_1_rx_64bit_sync i_cmac_usplus_1_rx_64bit_sync_serdes_data3
  (
   .clk            (rx_serdes_clk[3]),
   .data_in        (rx_serdes_data3),
   .data_out       (rx_serdes_data3_2d)
  );
  cmac_usplus_1_rx_32bit_sync i_cmac_usplus_1_rx_32bit_sync_serdes_data4
  (
   .clk            (rx_serdes_clk[4]),
   .data_in        (rx_serdes_data4),
   .data_out       (rx_serdes_data4_2d)
  );
  cmac_usplus_1_rx_32bit_sync i_cmac_usplus_1_rx_32bit_sync_serdes_data5
  (
   .clk            (rx_serdes_clk[5]),
   .data_in        (rx_serdes_data5),
   .data_out       (rx_serdes_data5_2d)
  );
  cmac_usplus_1_rx_32bit_sync i_cmac_usplus_1_rx_32bit_sync_serdes_data6
  (
   .clk            (rx_serdes_clk[6]),
   .data_in        (rx_serdes_data6),
   .data_out       (rx_serdes_data6_2d)
  );
  cmac_usplus_1_rx_32bit_sync i_cmac_usplus_1_rx_32bit_sync_serdes_data7
  (
   .clk            (rx_serdes_clk[7]),
   .data_in        (rx_serdes_data7),
   .data_out       (rx_serdes_data7_2d)
  );
  cmac_usplus_1_rx_32bit_sync i_cmac_usplus_1_rx_32bit_sync_serdes_data8
  (
   .clk            (rx_serdes_clk[8]),
   .data_in        (rx_serdes_data8),
   .data_out       (rx_serdes_data8_2d)
  );
  cmac_usplus_1_rx_32bit_sync i_cmac_usplus_1_rx_32bit_sync_serdes_data9
  (
   .clk            (rx_serdes_clk[9]),
   .data_in        (rx_serdes_data9),
   .data_out       (rx_serdes_data9_2d)
  );
  cmac_usplus_1_rx_16bit_sync i_cmac_usplus_1_rx_16bit_sync_alt_data0
  (
   .clk            (rx_serdes_clk[0]),
   .data_in        (rx_serdes_alt_data0),
   .data_out       (rx_serdes_alt_data0_2d)
  );
  cmac_usplus_1_rx_16bit_sync i_cmac_usplus_1_rx_16bit_sync_alt_data1
  (
   .clk            (rx_serdes_clk[1]),
   .data_in        (rx_serdes_alt_data1),
   .data_out       (rx_serdes_alt_data1_2d)
  );
  cmac_usplus_1_rx_16bit_sync i_cmac_usplus_1_rx_16bit_sync_alt_data2
  (
   .clk            (rx_serdes_clk[2]),
   .data_in        (rx_serdes_alt_data2),
   .data_out       (rx_serdes_alt_data2_2d)
  );
  cmac_usplus_1_rx_16bit_sync i_cmac_usplus_1_rx_16bit_sync_alt_data3
  (
   .clk            (rx_serdes_clk[3]),
   .data_in        (rx_serdes_alt_data3),
   .data_out       (rx_serdes_alt_data3_2d)
  );


cmac_usplus_1_lbus2axis_segmented_top
#(
   .DATA_WIDTH(512),
   .C_HAS_PTP(0)
) i_cmac_usplus_1_lbus2axis
(
    .core_clk                            (rx_clk),
    .core_rst                            (rx_reset_done),
    .axis_tvalid                         (rx_axis_tvalid),
    .axis_tdata                          (rx_axis_tdata),
    .axis_tkeep                          (rx_axis_tkeep),
    .axis_tlast                          (rx_axis_tlast),
    .axis_tuser                          (rx_axis_tuser),
    .rx_preambleout_i                    (rx_preambleout_int),
    .rx_preambleout_o                    (rx_preambleout),
    .lbus_data0                          (rx_dataout0),
    .lbus_data1                          (rx_dataout1),
    .lbus_data2                          (rx_dataout2),
    .lbus_data3                          (rx_dataout3),
    .lbus_ena0                           (rx_enaout0),
    .lbus_ena1                           (rx_enaout1),
    .lbus_ena2                           (rx_enaout2),
    .lbus_ena3                           (rx_enaout3),
    .lbus_eop0                           (rx_eopout0),
    .lbus_eop1                           (rx_eopout1),
    .lbus_eop2                           (rx_eopout2),
    .lbus_eop3                           (rx_eopout3),
    .lbus_err0                           (rx_errout0),
    .lbus_err1                           (rx_errout1),
    .lbus_err2                           (rx_errout2),
    .lbus_err3                           (rx_errout3),
    .lbus_mty0                           (rx_mtyout0),
    .lbus_mty1                           (rx_mtyout1),
    .lbus_mty2                           (rx_mtyout2),
    .lbus_mty3                           (rx_mtyout3),
    .lbus_sop0                           (rx_sopout0),
    .lbus_sop1                           (rx_sopout1),
    .lbus_sop2                           (rx_sopout2),
    .lbus_sop3                           (rx_sopout3)
);

cmac_usplus_1_axis2lbus_segmented_top
#(
   .DATA_WIDTH(512),
   .C_HAS_PTP(0)
) i_cmac_usplus_1_axis2lbus
(
    .core_clk                            (tx_clk),
    .core_rst                            (tx_reset_done),
    .axis_tready                         (tx_axis_tready),
    .axis_tvalid                         (tx_axis_tvalid),
    .axis_tdata                          (tx_axis_tdata),
    .axis_tkeep                          (tx_axis_tkeep),
    .axis_tlast                          (tx_axis_tlast),
    .axis_tuser                          (tx_axis_tuser),
    .tx_preamblein_i                     (tx_preamblein),
    .tx_preamblein_o                     (tx_preamblein_int),
    .lbus_rdyout                         (tx_rdyout),
    .lbus_ovfout                         (tx_ovfout),
    .lbus_unfout                         (tx_unfout),
    .lbus_data0                          (tx_datain0),
    .lbus_data1                          (tx_datain1),
    .lbus_data2                          (tx_datain2),
    .lbus_data3                          (tx_datain3),
    .lbus_ena0                           (tx_enain0),
    .lbus_ena1                           (tx_enain1),
    .lbus_ena2                           (tx_enain2),
    .lbus_ena3                           (tx_enain3),
    .lbus_eop0                           (tx_eopin0),
    .lbus_eop1                           (tx_eopin1),
    .lbus_eop2                           (tx_eopin2),
    .lbus_eop3                           (tx_eopin3),
    .lbus_err0                           (tx_errin0),
    .lbus_err1                           (tx_errin1),
    .lbus_err2                           (tx_errin2),
    .lbus_err3                           (tx_errin3),
    .lbus_mty0                           (tx_mtyin0),
    .lbus_mty1                           (tx_mtyin1),
    .lbus_mty2                           (tx_mtyin2),
    .lbus_mty3                           (tx_mtyin3),
    .lbus_sop0                           (tx_sopin0),
    .lbus_sop1                           (tx_sopin1),
    .lbus_sop2                           (tx_sopin2),
    .lbus_sop3                           (tx_sopin3)
);

cmac_usplus_v3_1_2_top 
#(
.CTL_PTP_TRANSPCLK_MODE                ("FALSE"),
.CTL_RX_CHECK_ACK                      ("TRUE"),

.CTL_RX_CHECK_PREAMBLE                 ("FALSE"),
.CTL_RX_CHECK_SFD                      ("FALSE"),
.CTL_RX_DELETE_FCS                     ("TRUE"),
.CTL_RX_ETYPE_GCP                      (C_RX_ETYPE_GCP),
.CTL_RX_ETYPE_GPP                      (C_RX_ETYPE_GPP),
.CTL_RX_ETYPE_PCP                      (C_RX_ETYPE_PCP),
.CTL_RX_ETYPE_PPP                      (C_RX_ETYPE_PPP),
.CTL_RX_FORWARD_CONTROL                ("FALSE"),
.CTL_RX_IGNORE_FCS                     ("FALSE"),
.CTL_RX_MAX_PACKET_LEN                 (C_RX_MAX_PACKET_LEN),
.CTL_RX_MIN_PACKET_LEN                 (C_RX_MIN_PACKET_LEN),
.CTL_RX_OPCODE_GPP                     (C_RX_OPCODE_GPP),
.CTL_RX_OPCODE_MAX_GCP                 (C_RX_OPCODE_MAX_GCP),
.CTL_RX_OPCODE_MAX_PCP                 (C_RX_OPCODE_MAX_PCP),
.CTL_RX_OPCODE_MIN_GCP                 (C_RX_OPCODE_MIN_GCP),
.CTL_RX_OPCODE_MIN_PCP                 (C_RX_OPCODE_MIN_PCP),
.CTL_RX_OPCODE_PPP                     (C_RX_OPCODE_PPP),
.CTL_RX_PAUSE_DA_MCAST                 (C_RX_PAUSE_DA_MCAST),
.CTL_RX_PAUSE_DA_UCAST                 (C_RX_PAUSE_DA_UCAST),
.CTL_RX_PAUSE_SA                       (C_RX_PAUSE_SA),
.CTL_RX_PROCESS_LFI                    ("FALSE"),
.CTL_RX_RSFEC_AM_THRESHOLD             (C_RX_RSFEC_AM_THRESHOLD),
.CTL_RX_RSFEC_FILL_ADJUST              (C_RX_RSFEC_FILL_ADJUST),
.CTL_TX_CUSTOM_PREAMBLE_ENABLE         ("FALSE"),
.CTL_TX_IPG_VALUE                      (C_TX_IPG_VALUE),
`ifdef SIM_SPEED_UP
.CTL_RX_VL_LENGTH_MINUS1               (16'h03FF),
`else
.CTL_RX_VL_LENGTH_MINUS1               (16'h3FFF),
`endif
.CTL_RX_VL_MARKER_ID0                  (64'hC16821003E97DE00),
.CTL_RX_VL_MARKER_ID1                  (64'h9D718E00628E7100),
.CTL_RX_VL_MARKER_ID10                 (64'hFD6C990002936600),
.CTL_RX_VL_MARKER_ID11                 (64'hB9915500466EAA00),
.CTL_RX_VL_MARKER_ID12                 (64'h5CB9B200A3464D00),
.CTL_RX_VL_MARKER_ID13                 (64'h1AF8BD00E5074200),
.CTL_RX_VL_MARKER_ID14                 (64'h83C7CA007C383500),
.CTL_RX_VL_MARKER_ID15                 (64'h3536CD00CAC93200),
.CTL_RX_VL_MARKER_ID16                 (64'hC4314C003BCEB300),
.CTL_RX_VL_MARKER_ID17                 (64'hADD6B70052294800),
.CTL_RX_VL_MARKER_ID18                 (64'h5F662A00A099D500),
.CTL_RX_VL_MARKER_ID19                 (64'hC0F0E5003F0F1A00),
.CTL_RX_VL_MARKER_ID2                  (64'h594BE800A6B41700),
.CTL_RX_VL_MARKER_ID3                  (64'h4D957B00B26A8400),
.CTL_RX_VL_MARKER_ID4                  (64'hF50709000AF8F600),
.CTL_RX_VL_MARKER_ID5                  (64'hDD14C20022EB3D00),
.CTL_RX_VL_MARKER_ID6                  (64'h9A4A260065B5D900),
.CTL_RX_VL_MARKER_ID7                  (64'h7B45660084BA9900),
.CTL_RX_VL_MARKER_ID8                  (64'hA02476005FDB8900),
.CTL_RX_VL_MARKER_ID9                  (64'h68C9FB0097360400),
.CTL_TEST_MODE_PIN_CHAR                ("FALSE"),
.CTL_TX_DA_GPP                         (C_TX_DA_GPP),
.CTL_TX_DA_PPP                         (C_TX_DA_PPP),
.CTL_TX_ETHERTYPE_GPP                  (C_TX_ETHERTYPE_GPP),
.CTL_TX_ETHERTYPE_PPP                  (C_TX_ETHERTYPE_PPP),
.CTL_TX_FCS_INS_ENABLE                 ("TRUE"),
.CTL_TX_IGNORE_FCS                     ("TRUE"),
                                
.CTL_TX_OPCODE_GPP                     (C_TX_OPCODE_GPP), 
.CTL_TX_OPCODE_PPP                     (C_TX_OPCODE_PPP),
.CTL_TX_PTP_1STEP_ENABLE               ("FALSE"),
                                
.CTL_TX_PTP_LATENCY_ADJUST             (0),
.CTL_TX_SA_GPP                         (C_TX_SA_GPP),
.CTL_TX_SA_PPP                         (C_TX_SA_PPP),
`ifdef SIM_SPEED_UP
.CTL_TX_VL_LENGTH_MINUS1               (16'h03FF),
`else
.CTL_TX_VL_LENGTH_MINUS1               (16'h3FFF),
`endif
.CTL_TX_VL_MARKER_ID0                  (64'hC16821003E97DE00),
.CTL_TX_VL_MARKER_ID1                  (64'h9D718E00628E7100),
.CTL_TX_VL_MARKER_ID10                 (64'hFD6C990002936600),
.CTL_TX_VL_MARKER_ID11                 (64'hB9915500466EAA00),
.CTL_TX_VL_MARKER_ID12                 (64'h5CB9B200A3464D00),
.CTL_TX_VL_MARKER_ID13                 (64'h1AF8BD00E5074200),
.CTL_TX_VL_MARKER_ID14                 (64'h83C7CA007C383500),
.CTL_TX_VL_MARKER_ID15                 (64'h3536CD00CAC93200),
.CTL_TX_VL_MARKER_ID16                 (64'hC4314C003BCEB300),
.CTL_TX_VL_MARKER_ID17                 (64'hADD6B70052294800),
.CTL_TX_VL_MARKER_ID18                 (64'h5F662A00A099D500),
.CTL_TX_VL_MARKER_ID19                 (64'hC0F0E5003F0F1A00),
.CTL_TX_VL_MARKER_ID2                  (64'h594BE800A6B41700),
.CTL_TX_VL_MARKER_ID3                  (64'h4D957B00B26A8400),
.CTL_TX_VL_MARKER_ID4                  (64'hF50709000AF8F600),
.CTL_TX_VL_MARKER_ID5                  (64'hDD14C20022EB3D00),
.CTL_TX_VL_MARKER_ID6                  (64'h9A4A260065B5D900),
.CTL_TX_VL_MARKER_ID7                  (64'h7B45660084BA9900),
.CTL_TX_VL_MARKER_ID8                  (64'hA02476005FDB8900),
.CTL_TX_VL_MARKER_ID9                  (64'h68C9FB0097360400),
.TEST_MODE_PIN_CHAR                    ("FALSE")
) i_cmac_usplus_1_top ( 
.drp_do                                (drp_do),
.drp_rdy                               (drp_rdy),
.rsfec_bypass_rx_dout                  (rsfec_bypass_rx_dout),
.rsfec_bypass_rx_dout_cw_start         (rsfec_bypass_rx_dout_cw_start),
.rsfec_bypass_rx_dout_valid            (rsfec_bypass_rx_dout_valid),
.rsfec_bypass_tx_dout                  (rsfec_bypass_tx_dout),
.rsfec_bypass_tx_dout_cw_start         (rsfec_bypass_tx_dout_cw_start),
.rsfec_bypass_tx_dout_valid            (rsfec_bypass_tx_dout_valid),
.rx_dataout0                           (rx_dataout0),
.rx_dataout1                           (rx_dataout1),
.rx_dataout2                           (rx_dataout2),
.rx_dataout3                           (rx_dataout3),
.rx_enaout0                            (rx_enaout0),
.rx_enaout1                            (rx_enaout1),
.rx_enaout2                            (rx_enaout2),
.rx_enaout3                            (rx_enaout3),
.rx_eopout0                            (rx_eopout0),
.rx_eopout1                            (rx_eopout1),
.rx_eopout2                            (rx_eopout2),
.rx_eopout3                            (rx_eopout3),
.rx_errout0                            (rx_errout0),
.rx_errout1                            (rx_errout1),
.rx_errout2                            (rx_errout2),
.rx_errout3                            (rx_errout3),
.rx_lane_aligner_fill_0                (rx_lane_aligner_fill_0),
.rx_lane_aligner_fill_1                (rx_lane_aligner_fill_1),
.rx_lane_aligner_fill_10               (rx_lane_aligner_fill_10),
.rx_lane_aligner_fill_11               (rx_lane_aligner_fill_11),
.rx_lane_aligner_fill_12               (rx_lane_aligner_fill_12),
.rx_lane_aligner_fill_13               (rx_lane_aligner_fill_13),
.rx_lane_aligner_fill_14               (rx_lane_aligner_fill_14),
.rx_lane_aligner_fill_15               (rx_lane_aligner_fill_15),
.rx_lane_aligner_fill_16               (rx_lane_aligner_fill_16),
.rx_lane_aligner_fill_17               (rx_lane_aligner_fill_17),
.rx_lane_aligner_fill_18               (rx_lane_aligner_fill_18),
.rx_lane_aligner_fill_19               (rx_lane_aligner_fill_19),
.rx_lane_aligner_fill_2                (rx_lane_aligner_fill_2),
.rx_lane_aligner_fill_3                (rx_lane_aligner_fill_3),
.rx_lane_aligner_fill_4                (rx_lane_aligner_fill_4),
.rx_lane_aligner_fill_5                (rx_lane_aligner_fill_5),
.rx_lane_aligner_fill_6                (rx_lane_aligner_fill_6),
.rx_lane_aligner_fill_7                (rx_lane_aligner_fill_7),
.rx_lane_aligner_fill_8                (rx_lane_aligner_fill_8),
.rx_lane_aligner_fill_9                (rx_lane_aligner_fill_9),
.rx_mtyout0                            (rx_mtyout0),
.rx_mtyout1                            (rx_mtyout1),
.rx_mtyout2                            (rx_mtyout2),
.rx_mtyout3                            (rx_mtyout3),
.rx_otn_bip8_0                         (rx_otn_bip8_0_int),
.rx_otn_bip8_1                         (rx_otn_bip8_1_int),
.rx_otn_bip8_2                         (rx_otn_bip8_2_int),
.rx_otn_bip8_3                         (rx_otn_bip8_3_int),
.rx_otn_bip8_4                         (rx_otn_bip8_4_int),
.rx_otn_data_0                         (rx_otn_data_0_int),
.rx_otn_data_1                         (rx_otn_data_1_int),
.rx_otn_data_2                         (rx_otn_data_2_int),
.rx_otn_data_3                         (rx_otn_data_3_int),
.rx_otn_data_4                         (rx_otn_data_4_int),
.rx_otn_ena                            (rx_otn_ena),
.rx_otn_lane0                          (rx_otn_lane0),
.rx_otn_vlmarker                       (rx_otn_vlmarker),
.rx_preout                             (rx_preambleout_int),
.rx_ptp_pcslane_out                    (rx_ptp_pcslane_out),
.rx_ptp_tstamp_out                     (rx_ptp_tstamp_out),
.rx_sopout0                            (rx_sopout0),
.rx_sopout1                            (rx_sopout1),
.rx_sopout2                            (rx_sopout2),
.rx_sopout3                            (rx_sopout3),
.stat_rx_aligned                       (stat_rx_aligned),
.stat_rx_aligned_err                   (stat_rx_aligned_err),
.stat_rx_bad_code                      (stat_rx_bad_code),
.stat_rx_bad_fcs                       (stat_rx_bad_fcs),
.stat_rx_bad_preamble                  (stat_rx_bad_preamble),
.stat_rx_bad_sfd                       (stat_rx_bad_sfd),
.stat_rx_bip_err_0                     (stat_rx_bip_err_0),
.stat_rx_bip_err_1                     (stat_rx_bip_err_1),
.stat_rx_bip_err_10                    (stat_rx_bip_err_10),
.stat_rx_bip_err_11                    (stat_rx_bip_err_11),
.stat_rx_bip_err_12                    (stat_rx_bip_err_12),
.stat_rx_bip_err_13                    (stat_rx_bip_err_13),
.stat_rx_bip_err_14                    (stat_rx_bip_err_14),
.stat_rx_bip_err_15                    (stat_rx_bip_err_15),
.stat_rx_bip_err_16                    (stat_rx_bip_err_16),
.stat_rx_bip_err_17                    (stat_rx_bip_err_17),
.stat_rx_bip_err_18                    (stat_rx_bip_err_18),
.stat_rx_bip_err_19                    (stat_rx_bip_err_19),
.stat_rx_bip_err_2                     (stat_rx_bip_err_2),
.stat_rx_bip_err_3                     (stat_rx_bip_err_3),
.stat_rx_bip_err_4                     (stat_rx_bip_err_4),
.stat_rx_bip_err_5                     (stat_rx_bip_err_5),
.stat_rx_bip_err_6                     (stat_rx_bip_err_6),
.stat_rx_bip_err_7                     (stat_rx_bip_err_7),
.stat_rx_bip_err_8                     (stat_rx_bip_err_8),
.stat_rx_bip_err_9                     (stat_rx_bip_err_9),
.stat_rx_block_lock                    (stat_rx_block_lock),
.stat_rx_broadcast                     (stat_rx_broadcast),
.stat_rx_fragment                      (stat_rx_fragment),
.stat_rx_framing_err_0                 (stat_rx_framing_err_0),
.stat_rx_framing_err_1                 (stat_rx_framing_err_1),
.stat_rx_framing_err_10                (stat_rx_framing_err_10),
.stat_rx_framing_err_11                (stat_rx_framing_err_11),
.stat_rx_framing_err_12                (stat_rx_framing_err_12),
.stat_rx_framing_err_13                (stat_rx_framing_err_13),
.stat_rx_framing_err_14                (stat_rx_framing_err_14),
.stat_rx_framing_err_15                (stat_rx_framing_err_15),
.stat_rx_framing_err_16                (stat_rx_framing_err_16),
.stat_rx_framing_err_17                (stat_rx_framing_err_17),
.stat_rx_framing_err_18                (stat_rx_framing_err_18),
.stat_rx_framing_err_19                (stat_rx_framing_err_19),
.stat_rx_framing_err_2                 (stat_rx_framing_err_2),
.stat_rx_framing_err_3                 (stat_rx_framing_err_3),
.stat_rx_framing_err_4                 (stat_rx_framing_err_4),
.stat_rx_framing_err_5                 (stat_rx_framing_err_5),
.stat_rx_framing_err_6                 (stat_rx_framing_err_6),
.stat_rx_framing_err_7                 (stat_rx_framing_err_7),
.stat_rx_framing_err_8                 (stat_rx_framing_err_8),
.stat_rx_framing_err_9                 (stat_rx_framing_err_9),
.stat_rx_framing_err_valid_0           (stat_rx_framing_err_valid_0),
.stat_rx_framing_err_valid_1           (stat_rx_framing_err_valid_1),
.stat_rx_framing_err_valid_10          (stat_rx_framing_err_valid_10),
.stat_rx_framing_err_valid_11          (stat_rx_framing_err_valid_11),
.stat_rx_framing_err_valid_12          (stat_rx_framing_err_valid_12),
.stat_rx_framing_err_valid_13          (stat_rx_framing_err_valid_13),
.stat_rx_framing_err_valid_14          (stat_rx_framing_err_valid_14),
.stat_rx_framing_err_valid_15          (stat_rx_framing_err_valid_15),
.stat_rx_framing_err_valid_16          (stat_rx_framing_err_valid_16),
.stat_rx_framing_err_valid_17          (stat_rx_framing_err_valid_17),
.stat_rx_framing_err_valid_18          (stat_rx_framing_err_valid_18),
.stat_rx_framing_err_valid_19          (stat_rx_framing_err_valid_19),
.stat_rx_framing_err_valid_2           (stat_rx_framing_err_valid_2),
.stat_rx_framing_err_valid_3           (stat_rx_framing_err_valid_3),
.stat_rx_framing_err_valid_4           (stat_rx_framing_err_valid_4),
.stat_rx_framing_err_valid_5           (stat_rx_framing_err_valid_5),
.stat_rx_framing_err_valid_6           (stat_rx_framing_err_valid_6),
.stat_rx_framing_err_valid_7           (stat_rx_framing_err_valid_7),
.stat_rx_framing_err_valid_8           (stat_rx_framing_err_valid_8),
.stat_rx_framing_err_valid_9           (stat_rx_framing_err_valid_9),
.stat_rx_got_signal_os                 (stat_rx_got_signal_os),
.stat_rx_hi_ber                        (stat_rx_hi_ber),
.stat_rx_inrangeerr                    (stat_rx_inrangeerr),
.stat_rx_internal_local_fault          (stat_rx_internal_local_fault),
.stat_rx_jabber                        (stat_rx_jabber),
.stat_rx_lane0_vlm_bip7                (stat_rx_lane0_vlm_bip7),
.stat_rx_lane0_vlm_bip7_valid          (stat_rx_lane0_vlm_bip7_valid),
.stat_rx_local_fault                   (stat_rx_local_fault),
.stat_rx_mf_err                        (stat_rx_mf_err),
.stat_rx_mf_len_err                    (stat_rx_mf_len_err),
.stat_rx_mf_repeat_err                 (stat_rx_mf_repeat_err),
.stat_rx_misaligned                    (stat_rx_misaligned),
.stat_rx_multicast                     (stat_rx_multicast),
.stat_rx_oversize                      (stat_rx_oversize),
.stat_rx_packet_1024_1518_bytes        (stat_rx_packet_1024_1518_bytes),
.stat_rx_packet_128_255_bytes          (stat_rx_packet_128_255_bytes),
.stat_rx_packet_1519_1522_bytes        (stat_rx_packet_1519_1522_bytes),
.stat_rx_packet_1523_1548_bytes        (stat_rx_packet_1523_1548_bytes),
.stat_rx_packet_1549_2047_bytes        (stat_rx_packet_1549_2047_bytes),
.stat_rx_packet_2048_4095_bytes        (stat_rx_packet_2048_4095_bytes),
.stat_rx_packet_256_511_bytes          (stat_rx_packet_256_511_bytes),
.stat_rx_packet_4096_8191_bytes        (stat_rx_packet_4096_8191_bytes),
.stat_rx_packet_512_1023_bytes         (stat_rx_packet_512_1023_bytes),
.stat_rx_packet_64_bytes               (stat_rx_packet_64_bytes),
.stat_rx_packet_65_127_bytes           (stat_rx_packet_65_127_bytes),
.stat_rx_packet_8192_9215_bytes        (stat_rx_packet_8192_9215_bytes),
.stat_rx_packet_bad_fcs                (stat_rx_packet_bad_fcs),
.stat_rx_packet_large                  (stat_rx_packet_large),
.stat_rx_packet_small                  (stat_rx_packet_small),
.stat_rx_pause                         (stat_rx_pause),
.stat_rx_pause_quanta0                 (stat_rx_pause_quanta0),
.stat_rx_pause_quanta1                 (stat_rx_pause_quanta1),
.stat_rx_pause_quanta2                 (stat_rx_pause_quanta2),
.stat_rx_pause_quanta3                 (stat_rx_pause_quanta3),
.stat_rx_pause_quanta4                 (stat_rx_pause_quanta4),
.stat_rx_pause_quanta5                 (stat_rx_pause_quanta5),
.stat_rx_pause_quanta6                 (stat_rx_pause_quanta6),
.stat_rx_pause_quanta7                 (stat_rx_pause_quanta7),
.stat_rx_pause_quanta8                 (stat_rx_pause_quanta8),
.stat_rx_pause_req                     (stat_rx_pause_req),
.stat_rx_pause_valid                   (stat_rx_pause_valid),
.stat_rx_received_local_fault          (stat_rx_received_local_fault),
.stat_rx_remote_fault                  (stat_rx_remote_fault),
.stat_rx_rsfec_am_lock0                (stat_rx_rsfec_am_lock0),
.stat_rx_rsfec_am_lock1                (stat_rx_rsfec_am_lock1),
.stat_rx_rsfec_am_lock2                (stat_rx_rsfec_am_lock2),
.stat_rx_rsfec_am_lock3                (stat_rx_rsfec_am_lock3),
.stat_rx_rsfec_corrected_cw_inc        (stat_rx_rsfec_corrected_cw_inc),
.stat_rx_rsfec_cw_inc                  (stat_rx_rsfec_cw_inc),
.stat_rx_rsfec_err_count0_inc          (stat_rx_rsfec_err_count0_inc),
.stat_rx_rsfec_err_count1_inc          (stat_rx_rsfec_err_count1_inc),
.stat_rx_rsfec_err_count2_inc          (stat_rx_rsfec_err_count2_inc),
.stat_rx_rsfec_err_count3_inc          (stat_rx_rsfec_err_count3_inc),
.stat_rx_rsfec_hi_ser                  (stat_rx_rsfec_hi_ser),
.stat_rx_rsfec_lane_alignment_status   (stat_rx_rsfec_lane_alignment_status),
.stat_rx_rsfec_lane_fill_0             (stat_rx_rsfec_lane_fill_0),
.stat_rx_rsfec_lane_fill_1             (stat_rx_rsfec_lane_fill_1),
.stat_rx_rsfec_lane_fill_2             (stat_rx_rsfec_lane_fill_2),
.stat_rx_rsfec_lane_fill_3             (stat_rx_rsfec_lane_fill_3),
.stat_rx_rsfec_lane_mapping            (stat_rx_rsfec_lane_mapping),
.stat_rx_rsfec_rsvd                    (stat_rx_rsfec_rsvd),
.stat_rx_rsfec_uncorrected_cw_inc      (stat_rx_rsfec_uncorrected_cw_inc),
.stat_rx_status                        (stat_rx_status),
.stat_rx_stomped_fcs                   (stat_rx_stomped_fcs),
.stat_rx_synced                        (stat_rx_synced),
.stat_rx_synced_err                    (stat_rx_synced_err),
.stat_rx_test_pattern_mismatch         (stat_rx_test_pattern_mismatch),
.stat_rx_toolong                       (stat_rx_toolong),
.stat_rx_total_bytes                   (stat_rx_total_bytes),
.stat_rx_total_good_bytes              (stat_rx_total_good_bytes),
.stat_rx_total_good_packets            (stat_rx_total_good_packets),
.stat_rx_total_packets                 (stat_rx_total_packets),
.stat_rx_truncated                     (stat_rx_truncated),
.stat_rx_undersize                     (stat_rx_undersize),
.stat_rx_unicast                       (stat_rx_unicast),
.stat_rx_user_pause                    (stat_rx_user_pause),
.stat_rx_vlan                          (stat_rx_vlan),
.stat_rx_vl_demuxed                    (stat_rx_pcsl_demuxed),
.stat_rx_vl_number_0                   (stat_rx_pcsl_number_0),
.stat_rx_vl_number_1                   (stat_rx_pcsl_number_1),
.stat_rx_vl_number_10                  (stat_rx_pcsl_number_10),
.stat_rx_vl_number_11                  (stat_rx_pcsl_number_11),
.stat_rx_vl_number_12                  (stat_rx_pcsl_number_12),
.stat_rx_vl_number_13                  (stat_rx_pcsl_number_13),
.stat_rx_vl_number_14                  (stat_rx_pcsl_number_14),
.stat_rx_vl_number_15                  (stat_rx_pcsl_number_15),
.stat_rx_vl_number_16                  (stat_rx_pcsl_number_16),
.stat_rx_vl_number_17                  (stat_rx_pcsl_number_17),
.stat_rx_vl_number_18                  (stat_rx_pcsl_number_18),
.stat_rx_vl_number_19                  (stat_rx_pcsl_number_19),
.stat_rx_vl_number_2                   (stat_rx_pcsl_number_2),
.stat_rx_vl_number_3                   (stat_rx_pcsl_number_3),
.stat_rx_vl_number_4                   (stat_rx_pcsl_number_4),
.stat_rx_vl_number_5                   (stat_rx_pcsl_number_5),
.stat_rx_vl_number_6                   (stat_rx_pcsl_number_6),
.stat_rx_vl_number_7                   (stat_rx_pcsl_number_7),
.stat_rx_vl_number_8                   (stat_rx_pcsl_number_8),
.stat_rx_vl_number_9                   (stat_rx_pcsl_number_9),
.stat_tx_total_packets                 (stat_tx_total_packets),
.stat_tx_total_bytes                   (stat_tx_total_bytes),
.stat_tx_total_good_packets            (stat_tx_total_good_packets),
.stat_tx_total_good_bytes              (stat_tx_total_good_bytes),
.stat_tx_packet_small                  (stat_tx_packet_small),
.stat_tx_packet_large                  (stat_tx_packet_large),
.stat_tx_packet_64_bytes               (stat_tx_packet_64_bytes),
.stat_tx_packet_65_127_bytes           (stat_tx_packet_65_127_bytes),
.stat_tx_packet_128_255_bytes          (stat_tx_packet_128_255_bytes),
.stat_tx_packet_256_511_bytes          (stat_tx_packet_256_511_bytes),
.stat_tx_packet_512_1023_bytes         (stat_tx_packet_512_1023_bytes),
.stat_tx_packet_1024_1518_bytes        (stat_tx_packet_1024_1518_bytes),
.stat_tx_packet_1519_1522_bytes        (stat_tx_packet_1519_1522_bytes),
.stat_tx_packet_1523_1548_bytes        (stat_tx_packet_1523_1548_bytes),
.stat_tx_packet_1549_2047_bytes        (stat_tx_packet_1549_2047_bytes),
.stat_tx_packet_2048_4095_bytes        (stat_tx_packet_2048_4095_bytes),
.stat_tx_packet_4096_8191_bytes        (stat_tx_packet_4096_8191_bytes),
.stat_tx_packet_8192_9215_bytes        (stat_tx_packet_8192_9215_bytes),
.stat_tx_bad_fcs                       (stat_tx_bad_fcs),
.stat_tx_local_fault                   (stat_tx_local_fault),
.stat_tx_ptp_fifo_read_error           (stat_tx_ptp_fifo_read_error),
.stat_tx_ptp_fifo_write_error          (stat_tx_ptp_fifo_write_error),
.stat_tx_frame_error                   (stat_tx_frame_error),
.stat_tx_unicast                       (stat_tx_unicast),
.stat_tx_multicast                     (stat_tx_multicast),
.stat_tx_broadcast                     (stat_tx_broadcast),
.stat_tx_vlan                          (stat_tx_vlan),
.stat_tx_pause                         (stat_tx_pause),
.stat_tx_user_pause                    (stat_tx_user_pause),
.stat_tx_pause_valid                   (stat_tx_pause_valid),

.tx_ovfout                             (tx_ovfout),
.tx_ptp_pcslane_out                    (tx_ptp_pcslane_out),
.tx_ptp_tstamp_out                     (tx_ptp_tstamp_out),
.tx_ptp_tstamp_tag_out                 (tx_ptp_tstamp_tag_out),
.tx_ptp_tstamp_valid_out               (tx_ptp_tstamp_valid_out),
.tx_rdyout                             (tx_rdyout),
                         
.tx_serdes_alt_data0                   (tx_serdes_alt_data0),
.tx_serdes_alt_data1                   (tx_serdes_alt_data1),
.tx_serdes_alt_data2                   (tx_serdes_alt_data2),
.tx_serdes_alt_data3                   (tx_serdes_alt_data3),
.rx_serdes_alt_data0                   (rx_serdes_alt_data0_2d),
.rx_serdes_alt_data1                   (rx_serdes_alt_data1_2d),
.rx_serdes_alt_data2                   (rx_serdes_alt_data2_2d),
.rx_serdes_alt_data3                   (rx_serdes_alt_data3_2d),
                         
                         
                         
.tx_serdes_data0                       (tx_serdes_data0),
.tx_serdes_data1                       (tx_serdes_data1),
.tx_serdes_data2                       (tx_serdes_data2),
.tx_serdes_data3                       (tx_serdes_data3),
                         
.tx_serdes_data4                       (tx_serdes_data4),
.tx_serdes_data5                       (tx_serdes_data5),
.tx_serdes_data6                       (tx_serdes_data6),
.tx_serdes_data7                       (tx_serdes_data7),
.tx_serdes_data8                       (tx_serdes_data8),
.tx_serdes_data9                       (tx_serdes_data9),
.tx_unfout                             (tx_unfout),
                         
.ctl_caui4_mode_in                     (ctl_caui4_mode),
.ctl_rsfec_enable_transcoder_bypass_mode (ctl_rsfec_enable_transcoder_bypass_mode),
.ctl_rx_check_etype_gcp                (ctl_rx_check_etype_gcp),
.ctl_rx_check_etype_gpp                (ctl_rx_check_etype_gpp),
.ctl_rx_check_etype_pcp                (ctl_rx_check_etype_pcp),
.ctl_rx_check_etype_ppp                (ctl_rx_check_etype_ppp),
.ctl_rx_check_mcast_gcp                (ctl_rx_check_mcast_gcp),
.ctl_rx_check_mcast_gpp                (ctl_rx_check_mcast_gpp),
.ctl_rx_check_mcast_pcp                (ctl_rx_check_mcast_pcp),
.ctl_rx_check_mcast_ppp                (ctl_rx_check_mcast_ppp),
.ctl_rx_check_opcode_gcp               (ctl_rx_check_opcode_gcp),
.ctl_rx_check_opcode_gpp               (ctl_rx_check_opcode_gpp),
.ctl_rx_check_opcode_pcp               (ctl_rx_check_opcode_pcp),
.ctl_rx_check_opcode_ppp               (ctl_rx_check_opcode_ppp),
.ctl_rx_check_sa_gcp                   (ctl_rx_check_sa_gcp),
.ctl_rx_check_sa_gpp                   (ctl_rx_check_sa_gpp),
.ctl_rx_check_sa_pcp                   (ctl_rx_check_sa_pcp),
.ctl_rx_check_sa_ppp                   (ctl_rx_check_sa_ppp),
.ctl_rx_check_ucast_gcp                (ctl_rx_check_ucast_gcp),
.ctl_rx_check_ucast_gpp                (ctl_rx_check_ucast_gpp),
.ctl_rx_check_ucast_pcp                (ctl_rx_check_ucast_pcp),
.ctl_rx_check_ucast_ppp                (ctl_rx_check_ucast_ppp),
.ctl_rx_enable                         (ctl_rx_enable),
.ctl_rx_enable_gcp                     (ctl_rx_enable_gcp),
.ctl_rx_enable_gpp                     (ctl_rx_enable_gpp),
.ctl_rx_enable_pcp                     (ctl_rx_enable_pcp),
.ctl_rx_enable_ppp                     (ctl_rx_enable_ppp),
.ctl_rx_force_resync                   (ctl_rx_force_resync),
.ctl_rx_pause_ack                      (ctl_rx_pause_ack),
.ctl_rx_pause_enable                   (ctl_rx_pause_enable),
.ctl_rsfec_ieee_error_indication_mode  (ctl_rsfec_ieee_error_indication_mode),
.ctl_rx_rsfec_enable                   (ctl_rx_rsfec_enable),
.ctl_rx_rsfec_enable_correction        (ctl_rx_rsfec_enable_correction),
.ctl_rx_rsfec_enable_indication        (ctl_rx_rsfec_enable_indication),
.ctl_rx_systemtimerin                  (ctl_rx_systemtimerin),
.ctl_rx_test_pattern                   (ctl_rx_test_pattern),
.ctl_tx_enable                         (ctl_tx_enable),
.ctl_tx_lane0_vlm_bip7_override        (ctl_tx_lane0_vlm_bip7_override),
.ctl_tx_lane0_vlm_bip7_override_value  (ctl_tx_lane0_vlm_bip7_override_value),
.ctl_tx_pause_enable                   (ctl_tx_pause_enable),
.ctl_tx_pause_quanta0                  (ctl_tx_pause_quanta0),
.ctl_tx_pause_quanta1                  (ctl_tx_pause_quanta1),
.ctl_tx_pause_quanta2                  (ctl_tx_pause_quanta2),
.ctl_tx_pause_quanta3                  (ctl_tx_pause_quanta3),
.ctl_tx_pause_quanta4                  (ctl_tx_pause_quanta4),
.ctl_tx_pause_quanta5                  (ctl_tx_pause_quanta5),
.ctl_tx_pause_quanta6                  (ctl_tx_pause_quanta6),
.ctl_tx_pause_quanta7                  (ctl_tx_pause_quanta7),
.ctl_tx_pause_quanta8                  (ctl_tx_pause_quanta8),
.ctl_tx_pause_refresh_timer0           (ctl_tx_pause_refresh_timer0),
.ctl_tx_pause_refresh_timer1           (ctl_tx_pause_refresh_timer1),
.ctl_tx_pause_refresh_timer2           (ctl_tx_pause_refresh_timer2),
.ctl_tx_pause_refresh_timer3           (ctl_tx_pause_refresh_timer3),
.ctl_tx_pause_refresh_timer4           (ctl_tx_pause_refresh_timer4),
.ctl_tx_pause_refresh_timer5           (ctl_tx_pause_refresh_timer5),
.ctl_tx_pause_refresh_timer6           (ctl_tx_pause_refresh_timer6),
.ctl_tx_pause_refresh_timer7           (ctl_tx_pause_refresh_timer7),
.ctl_tx_pause_refresh_timer8           (ctl_tx_pause_refresh_timer8),
.ctl_tx_pause_req                      (ctl_tx_pause_req),
.ctl_tx_ptp_vlane_adjust_mode          (ctl_tx_ptp_vlane_adjust_mode),
.ctl_tx_resend_pause                   (ctl_tx_resend_pause),
.ctl_tx_rsfec_enable                   (ctl_tx_rsfec_enable),
.ctl_tx_send_idle                      (ctl_tx_send_idle_int),
.ctl_tx_send_lfi                       (ctl_tx_send_lfi_int),
.ctl_tx_send_rfi                       (ctl_tx_send_rfi_int),
.ctl_tx_test_pattern                   (ctl_tx_test_pattern),
.ctl_tx_systemtimerin                  (ctl_tx_systemtimerin),
.drp_addr                              (drp_addr),
.drp_clk                               (drp_clk),
.drp_di                                (drp_di),
.drp_en                                (drp_en),
.drp_we                                (drp_we),
.rsfec_bypass_rx_din                   (rsfec_bypass_rx_din),
.rsfec_bypass_rx_din_cw_start          (rsfec_bypass_rx_din_cw_start),
.rsfec_bypass_tx_din                   (rsfec_bypass_tx_din),
.rsfec_bypass_tx_din_cw_start          (rsfec_bypass_tx_din_cw_start),
.rx_clk                                (rx_clk),
.rx_reset                              (rx_reset_done),
.rx_serdes_clk                         (rx_serdes_clk),
                         
                         
.rx_serdes_data0                       (rx_serdes_data0_2d),
.rx_serdes_data1                       (rx_serdes_data1_2d),
.rx_serdes_data2                       (rx_serdes_data2_2d),
.rx_serdes_data3                       (rx_serdes_data3_2d),
.rx_serdes_data4                       (rx_serdes_data4_2d),
.rx_serdes_data5                       (rx_serdes_data5_2d),
.rx_serdes_data6                       (rx_serdes_data6_2d),
.rx_serdes_data7                       (rx_serdes_data7_2d),
.rx_serdes_data8                       (rx_serdes_data8_2d),
.rx_serdes_data9                       (rx_serdes_data9_2d),
.rx_serdes_reset                       (rx_serdes_reset_done),
.tx_clk                                (tx_clk),
.tx_datain0                            (tx_datain0),
.tx_datain1                            (tx_datain1),
.tx_datain2                            (tx_datain2),
.tx_datain3                            (tx_datain3),
.tx_enain0                             (tx_enain0),
.tx_enain1                             (tx_enain1),
.tx_enain2                             (tx_enain2),
.tx_enain3                             (tx_enain3),
.tx_eopin0                             (tx_eopin0),
.tx_eopin1                             (tx_eopin1),
.tx_eopin2                             (tx_eopin2),
.tx_eopin3                             (tx_eopin3),
.tx_errin0                             (tx_errin0),
.tx_errin1                             (tx_errin1),
.tx_errin2                             (tx_errin2),
.tx_errin3                             (tx_errin3),
.tx_mtyin0                             (tx_mtyin0),
.tx_mtyin1                             (tx_mtyin1),
.tx_mtyin2                             (tx_mtyin2),
.tx_mtyin3                             (tx_mtyin3),
.tx_prein                              (tx_preamblein_int),
.tx_ptp_1588op_in                      (tx_ptp_1588op_in),
.tx_ptp_chksum_offset_in               (tx_ptp_chksum_offset_in),
.tx_ptp_rxtstamp_in                    (tx_ptp_rxtstamp_in),
.tx_ptp_tag_field_in                   (tx_ptp_tag_field_in),
.tx_ptp_tstamp_offset_in               (tx_ptp_tstamp_offset_in),
.tx_ptp_upd_chksum_in                  (tx_ptp_upd_chksum_in),
.tx_reset                              (tx_reset_done),
.tx_sopin0                             (tx_sopin0),
.tx_sopin1                             (tx_sopin1),
.tx_sopin2                             (tx_sopin2),
.tx_sopin3                             (tx_sopin3)
);

  wire [0 : 0]    gtwiz_userclk_tx_active_in;
  wire [3 : 0]    txusrclk_in;
  wire [3 : 0]    txusrclk2_in;
  wire [3 : 0]    rxusrclk_in;
  wire [3 : 0]    rxusrclk2_in;
  wire [0 : 0]    gtwiz_userclk_tx_reset_in;
  wire [0 : 0]    gtwiz_userclk_tx_srcclk_out;
  wire [0 : 0]    gtwiz_userclk_tx_usrclk_out;
  wire [0 : 0]    gtwiz_userclk_tx_usrclk2_out;
  wire [0 : 0]    gtwiz_userclk_tx_active_out;
  wire [0 : 0]    gtwiz_userclk_rx_reset_in;
  wire [0 : 0]    gtwiz_reset_clk_freerun_in;
  wire [0 : 0]    gtwiz_reset_all_in;
  wire [0 : 0]    gtwiz_reset_tx_pll_and_datapath_in;
  wire [0 : 0]    gtwiz_reset_tx_datapath_in;
  wire [0 : 0]    gtwiz_reset_rx_pll_and_datapath_in;
  wire [0 : 0]    gtwiz_reset_rx_datapath_in;
  wire [0 : 0]    gtwiz_reset_rx_data_good_in;
  wire [0 : 0]    gtwiz_reset_rx_cdr_stable_out;
  wire [0 : 0]    gtwiz_reset_tx_done_out;
  wire [0 : 0]    gtwiz_reset_rx_done_out;

  wire [0 :0]     gtrefclk00_in;
  wire [0 :0]     qpll0outclk_out;
  wire [0 :0]     qpll0outrefclk_out;
  wire [3 :0]     gtyrxn_in;
  wire [3 :0]     gtyrxp_in;
  wire [11 :0]    loopback_in;
  wire [3 :0]     rxrecclkout_out;
  wire [319 :0]   gtwiz_userdata_tx_in;
      
  wire [3 :0]     gtytxn_out;
  wire [3 :0]     gtytxp_out;
  wire [3 :0]     gtpowergood_out;
  wire [319 :0]   gtwiz_userdata_rx_out;
  wire [3 :0]     rxpmaresetdone_out;
  wire [3 :0]     txprgdivresetdone_out;
  wire [3 :0]     txpmaresetdone_out;
  wire [3 :0]     rxcdrhold_in;
  wire [3 :0]     rxdfelfhold_in;


  ////IBUFDS_GTE4 and BUFG_GT instantiations
  wire [0 :0]      gtrefclk00_int;
  wire             gt_ref_clk;
  wire             gt_ref_clk_int;
  wire             gtpowergood_int;

  assign gtpowergood_int = (&gtpowergood_out);

  IBUFDS_GTE4 IBUFDS_GTE4_GTREFCLK_INST (
    .I             (gt_ref_clk_p),
    .IB            (gt_ref_clk_n),
    .CEB           (1'b0),
    .O             (gt_ref_clk),
    .ODIV2         (gt_ref_clk_int)
  );

  BUFG_GT BUFG_GT_GTREFCLK_INST (
    .CE      (gtpowergood_int),
    .CEMASK  (1'b1),
    .CLR     (1'b0),
    .CLRMASK (1'b1),
    .DIV     (3'b000),
    .I       (gt_ref_clk_int),
    .O       (gt_ref_clk_out)
  );

  assign gtrefclk00_int[0]             = gt_ref_clk;
  assign gtwiz_reset_qpll0reset_out[0] = 1'b0;
  assign gtwiz_reset_qpll1reset_out[0] = 1'b0;

  ////assign inputs to GT
  assign gtwiz_userclk_tx_reset_in              = 1'b0;
  assign gtwiz_userclk_rx_reset_in              = 1'b0;
  assign gtwiz_reset_clk_freerun_in[0]          = init_clk;

  assign rxcdrhold_in   = 'b0;
  assign rxdfelfhold_in = 'b0;

  assign gtwiz_reset_all_in[0] = sys_reset | gt_drp_done | axi_gt_reset_all | master_watchdog_barking;

  assign gtwiz_reset_tx_pll_and_datapath_in     = 1'b0;
  assign gtwiz_reset_rx_pll_and_datapath_in     = 1'b0;
  assign gtwiz_reset_tx_datapath_in             = gtwiz_reset_tx_datapath;
  assign gtwiz_reset_rx_datapath_in             = gtwiz_reset_rx_datapath;
  assign gtwiz_reset_rx_data_good_in            = 1'b1;
  assign gtrefclk00_in                          = gtrefclk00_int;
  assign gtyrxn_in                              = gthrxn_int;
  assign gtyrxp_in                              = gthrxp_int;
  assign loopback_in                            = gt_loopback_in | {4{1'b0,ctl_gt_loopback,1'b0}};
  assign gt_rxrecclkout                         = rxrecclkout_out;

  ////outputs from GT
  assign gthtxn_int                             = gtytxn_out;
  assign gthtxp_int                             = gtytxp_out;
  assign gtwiz_userclk_tx_srcclk_int            = gtwiz_userclk_tx_srcclk_out;
  assign gtwiz_userclk_tx_usrclk_int            = gtwiz_userclk_tx_usrclk_out;
  assign gtwiz_userclk_tx_usrclk2_int           = gtwiz_userclk_tx_usrclk2_out;
  assign gtwiz_userclk_tx_active_int            = gtwiz_userclk_tx_active_out;
  assign gtwiz_userclk_rx_srcclk_int            = gtwiz_userclk_rx_srcclk_out;
  assign gtwiz_userclk_rx_usrclk_int            = gtwiz_userclk_rx_usrclk_out;
  assign gtwiz_userclk_rx_usrclk2_int           = gtwiz_userclk_rx_usrclk2_out;
  assign gtwiz_userclk_rx_active_int            = gtwiz_userclk_rx_active_out;
  assign gtwiz_reset_tx_done_int                = gtwiz_reset_tx_done_out;
  assign gtwiz_reset_rx_done_int                = gtwiz_reset_rx_done_out;
  assign qpll0outclk_int                        = qpll0outclk_out;
  assign qpll0outrefclk_int                     = qpll0outrefclk_out;
  assign gt_powergoodout                        = gtpowergood_out;


/*
Using RX/TX User clocking outside GT core

Difference in the GT core port map after this change:

inputs removed

    input [0 : 0] gtwiz_userclk_tx_reset_in;
    input [0 : 0] gtwiz_userclk_rx_reset_in;

Inputs added

    input [0 : 0] gtwiz_userclk_tx_active_in;
    input [0 : 0] gtwiz_userclk_rx_active_in;
    input [3 :0] rxusrclk_in;
    input [3 :0] rxusrclk2_in;
    input [3 :0] txusrclk_in;
    input [3 :0] txusrclk2_in;

Outputs removed

    output [0 : 0] gtwiz_userclk_tx_srcclk_out;
    output [0 : 0] gtwiz_userclk_tx_usrclk_out;
    output [0 : 0] gtwiz_userclk_tx_usrclk2_out;
    output [0 : 0] gtwiz_userclk_tx_active_out;
    output [0 : 0] gtwiz_userclk_rx_srcclk_out;
    output [0 : 0] gtwiz_userclk_rx_usrclk_out;
    output [0 : 0] gtwiz_userclk_rx_usrclk2_out;
    output [0 : 0] gtwiz_userclk_rx_active_out;

Outputs added

    output [3 :0] txoutclk_out;
    output [3 :0] rxoutclk_out;

Full ports:



    input [0 : 0] gtwiz_userclk_tx_active_in;
    input [0 : 0] gtwiz_userclk_rx_active_in;
    input [0 : 0] gtwiz_reset_clk_freerun_in;
    input [0 : 0] gtwiz_reset_all_in;
    input [0 : 0] gtwiz_reset_tx_pll_and_datapath_in;
    input [0 : 0] gtwiz_reset_tx_datapath_in;
    input [0 : 0] gtwiz_reset_rx_pll_and_datapath_in;
    input [0 : 0] gtwiz_reset_rx_datapath_in;
    output [0 : 0] gtwiz_reset_rx_cdr_stable_out;
    output [0 : 0] gtwiz_reset_tx_done_out;
    output [0 : 0] gtwiz_reset_rx_done_out;
    input [0 :0] gtrefclk00_in;
    output [0 :0] qpll0outclk_out;
    output [0 :0] qpll0outrefclk_out;
    input [3 :0] gtyrxn_in;
    input [3 :0] gtyrxp_in;
    input [11 :0] loopback_in;
    output [3 :0] rxrecclkout_out;
    input [3 :0] rxusrclk_in;
    input [3 :0] rxusrclk2_in;
    input [319 :0] gtwiz_userdata_tx_in;
    input [3 :0] txusrclk_in;
    input [3 :0] txusrclk2_in;
    output [3 :0] gtytxn_out;
    output [3 :0] gtytxp_out;
    output [3 :0] gtpowergood_out;
    output [319 :0] gtwiz_userdata_rx_out;
    output [3 :0] rxoutclk_out;
    output [3 :0] rxpmaresetdone_out;
    output [3 :0] txoutclk_out;
    output [3 :0] txprgdivresetdone_out;
*/

  //// ===================================================================================================================
  //// TX/RX USER CLOCKING Helper block integration
  //// ===================================================================================================================

  wire [0 : 0] cmac_gtwiz_userclk_tx_reset_in;
  wire [0 : 0] cmac_gtwiz_userclk_tx_active_out;

  wire [3 :0] txoutclk_out;
  wire [3 :0] rxoutclk_out;

  //// ===================================================================================================================
  //// USER CLOCKING RESETS
  //// ===================================================================================================================

  //// The TX user clocking helper block should be held in reset until the clock source of that block is known to be
  //// stable. The following assignment is an example of how that stability can be determined, based on the selected TX
  //// user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.

  assign cmac_gtwiz_userclk_tx_reset_in = ~((&txprgdivresetdone_out) & (&txpmaresetdone_out));

  //// The RX user clocking helper block should be held in reset until the clock source of that block is known to be
  //// stable. The following assignment is an example of how that stability can be determined, based on the selected RX
  //// user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.
  //// Note that, if the clock source is derived from the received data, this is indicated by a combination of the
  //// appropriate reset done signal and the reset helper block's RX CDR stable indicator.

  //// ===================================================================================================================
  //// USER CLOCKING Source clocks
  //// ===================================================================================================================
  //// Generate a single module instance which is driven by a clock source associated with the master transmitter channel,
  //// and which drives TXUSRCLK and TXUSRCLK2 for all channels

  //// The source clock is TXOUTCLK from the master transmitter channel

  assign gtwiz_userclk_tx_srcclk_out = txoutclk_out[0];

  //// Generate a single module instance which is driven by a clock source associated with the master receiver channel,
  //// and which drives RXUSRCLK and RXUSRCLK2 for all channels

  //// The source clock is RXOUTCLK from the master receiver channel

  assign gtwiz_userclk_rx_srcclk_out = rxoutclk_out[0];
  assign cmac_gtwiz_userclk_rx_reset_in = ~(&rxpmaresetdone_out);

  //// Multi_Lane GT Buffer Bypass Mode  
  //// Instantiate a single instance of the transmitter user clocking network helper block
  cmac_usplus_1_ultrascale_tx_userclk #(
    .P_CONTENTS                     (0),
    .P_FREQ_RATIO_SOURCE_TO_USRCLK  (1),
    .P_FREQ_RATIO_USRCLK_TO_USRCLK2 (1)
  ) cmac_gtwiz_userclk_tx_inst (
    .gtwiz_userclk_tx_srcclk_in   (gtwiz_userclk_tx_srcclk_out),
    .gtwiz_userclk_tx_reset_in    (cmac_gtwiz_userclk_tx_reset_in),
    .gtwiz_userclk_tx_usrclk_out  (gtwiz_userclk_tx_usrclk_out),
    .gtwiz_userclk_tx_usrclk2_out (gtwiz_userclk_tx_usrclk2_out),
    .gtwiz_userclk_tx_active_out  (cmac_gtwiz_userclk_tx_active_out)
  );

  //// Instantiate a single instance of the receiver user clocking network helper block
  cmac_usplus_1_ultrascale_rx_userclk #(
    .P_CONTENTS                     (0),
    .P_FREQ_RATIO_SOURCE_TO_USRCLK  (1),
    .P_FREQ_RATIO_USRCLK_TO_USRCLK2 (1)
  ) cmac_gtwiz_userclk_rx_inst (
    .gtwiz_userclk_rx_srcclk_in   (gtwiz_userclk_rx_srcclk_out),
    .gtwiz_userclk_rx_reset_in    (cmac_gtwiz_userclk_rx_reset_in),
    .gtwiz_userclk_rx_usrclk_out  (gtwiz_userclk_rx_usrclk_out),
    .gtwiz_userclk_rx_usrclk2_out (gtwiz_userclk_rx_usrclk2_out),
    .gtwiz_userclk_rx_active_out  (cmac_gtwiz_userclk_rx_active_out)
  );

  assign gtwiz_userclk_tx_active_in    = cmac_gtwiz_userclk_tx_active_out;

  //// Drive TXUSRCLK and TXUSRCLK2 for all channels with the respective helper block outputs

  assign txusrclk_in  = {4{gtwiz_userclk_tx_usrclk_out}};
  assign txusrclk2_in = {4{gtwiz_userclk_tx_usrclk2_out}};

  assign gtwiz_userclk_rx_active_in    = cmac_gtwiz_userclk_rx_active_out;

  //// Drive RXUSRCLK and RXUSRCLK2 for all channels with the respective helper block outputs

  assign rxusrclk_in  = {4{gtwiz_userclk_rx_usrclk_out}};
  assign rxusrclk2_in = {4{gtwiz_userclk_rx_usrclk2_out}};



  assign gt_eyescandataerror  = 4'b0 ;
  assign gt_txbufstatus       = 8'b0 ;
  assign gt_rxprbserr         = 4'b0 ;
  assign gt_rxresetdone       = 4'b0 ;
  assign gt_txresetdone       = 4'b0 ;
  assign gt_rxbufstatus       = 12'b0;

  assign gt0_drpdo            = 16'b0;
  assign gt0_drprdy           = 1'b0;
  assign gt1_drpdo            = 16'b0;
  assign gt1_drprdy           = 1'b0;
  assign gt2_drpdo            = 16'b0;
  assign gt2_drprdy           = 1'b0;
  assign gt3_drpdo            = 16'b0;
  assign gt3_drprdy           = 1'b0;

  cmac_usplus_1_gt cmac_usplus_1_gt_i
  (
   .gtpowergood_out(gtpowergood_out),
   .gtrefclk00_in(gtrefclk00_in),
   .gtwiz_reset_all_in(gtwiz_reset_all_in),
   .gtwiz_reset_clk_freerun_in(gtwiz_reset_clk_freerun_in),
   .gtwiz_reset_rx_cdr_stable_out(gtwiz_reset_rx_cdr_stable_out),
   .gtwiz_reset_rx_datapath_in(gtwiz_reset_rx_datapath_in),
   .gtwiz_reset_rx_done_out(gtwiz_reset_rx_done_out),
   .gtwiz_reset_rx_pll_and_datapath_in(gtwiz_reset_rx_pll_and_datapath_in),
   .gtwiz_reset_tx_datapath_in(gtwiz_reset_tx_datapath_in),
   .gtwiz_reset_tx_done_out(gtwiz_reset_tx_done_out),
   .gtwiz_reset_tx_pll_and_datapath_in(gtwiz_reset_tx_pll_and_datapath_in),
   .gtwiz_userclk_rx_active_in(gtwiz_userclk_rx_active_in),
   .gtwiz_userclk_tx_active_in(gtwiz_userclk_tx_active_in),
   .gtyrxn_in(gtyrxn_in),
   .gtyrxp_in(gtyrxp_in),
   .gtytxn_out(gtytxn_out),
   .gtytxp_out(gtytxp_out),
   .loopback_in(loopback_in),
   .qpll0outclk_out(qpll0outclk_out),
   .qpll0outrefclk_out(qpll0outrefclk_out),
   .rxcdrhold_in(rxcdrhold_in),
   .rxctrl0_out(rxctrl0_out),
   .rxctrl1_out(rxctrl1_out),
   .rxdata_out(rxdata_out),
   .rxdfelfhold_in(rxdfelfhold_in),
   .rxoutclk_out(rxoutclk_out),
   .rxpmaresetdone_out(rxpmaresetdone_out),
   .rxrecclkout_out(rxrecclkout_out),
   .rxusrclk2_in(rxusrclk2_in),
   .rxusrclk_in(rxusrclk_in),
   .txctrl0_in(txctrl0_in),
   .txctrl1_in(txctrl1_in),
   .txdata_in(txdata_in),
   .txoutclk_out(txoutclk_out),
   .txpmaresetdone_out(txpmaresetdone_out),
   .txprgdivresetdone_out(txprgdivresetdone_out),
   .txusrclk2_in(txusrclk2_in),
   .txusrclk_in(txusrclk_in)
  );






endmodule


(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_cdc_sync (
   input clk,
   input signal_in,
   output wire signal_out
  );

                               wire sig_in_cdc_from ;
      (* ASYNC_REG = "TRUE" *) reg  s_out_d2_cdc_to;
      (* ASYNC_REG = "TRUE" *) reg  s_out_d3;
      (* max_fanout = 500 *)   reg  s_out_d4;
      
// synthesis translate_off
      
      initial s_out_d2_cdc_to = 1'b0;
      initial s_out_d3        = 1'b0;
      initial s_out_d4        = 1'b0;
      
// synthesis translate_on   
   
      assign sig_in_cdc_from = signal_in;
      assign signal_out      = s_out_d4;

      always @(posedge clk) 
      begin
        s_out_d2_cdc_to  <= sig_in_cdc_from;
        s_out_d3         <= s_out_d2_cdc_to;
        s_out_d4         <= s_out_d3;
      end
  
  endmodule


(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_pipeline_sync_64bit 
      ( input clk, input [63:0] data_in, output reg [63:0] data_out);
  
      always @(posedge clk)
      begin
        data_out[63:0] <= data_in[63:0];
      end
  endmodule

(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_pipeline_sync_512bit 
      ( input clk, input [511:0] data_in, output reg [511:0] data_out);
  
      always @(posedge clk)
      begin
        data_out[511:0] <= data_in[511:0];
      end
  endmodule
  
(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_rx_64bit_pipeline_sync 
      ( input clk, input [63:0] data_in, output reg [63:0] data_out );
   
      always @(posedge clk)
      begin
          data_out[63:0]    <= data_in[63:0];
      end
  endmodule
  
(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_rx_32bit_pipeline_sync 
      ( input clk, input [31:0] data_in, output reg [31:0] data_out );
    
      always @(posedge clk)
      begin
          data_out[31:0]    <= data_in[31:0];
      end
  endmodule
  
(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_rx_16bit_pipeline_sync 
      ( input clk, input [15:0] data_in, output reg [15:0] data_out );
    
      always @(posedge clk)
      begin
          data_out[15:0]    <= data_in[15:0];
      end
  endmodule

(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_tx_sync 
    ( input clk, input [511:0] data_in, input [ 63 : 0] ctrl0_in, input [ 63 : 0] ctrl1_in, 
      output reg [511:0] data_out, output reg [ 63 : 0] ctrl0_out, output reg [ 63 : 0] ctrl1_out );

      (* shreg_extract = "no" *) reg  [511:0] data_in_d1;
      (* shreg_extract = "no" *) reg  [63:0]  ctrl0_in_d1;
      (* shreg_extract = "no" *) reg  [63:0]  ctrl1_in_d1;

      always @(posedge clk)
      begin
          data_out[511:0]   <= data_in_d1[511:0];
          ctrl0_out[63:0]   <= ctrl0_in_d1[63:0];
          ctrl1_out[63:0]   <= ctrl1_in_d1[63:0];

          data_in_d1[511:0] <= data_in[511:0];
          ctrl0_in_d1[63:0] <= ctrl0_in[63:0];
          ctrl1_in_d1[63:0] <= ctrl1_in[63:0];
      end

  endmodule

(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_rx_64bit_sync 
    ( input clk, input [63:0] data_in, output reg [63:0] data_out );
   
    (* shreg_extract = "no" *) reg  [63:0] data_in_d1;
  
     always @(posedge clk)
     begin
         data_in_d1[63:0]  <= data_in[63:0];
         data_out[63:0]    <= data_in_d1[63:0];
     end
  endmodule
  
(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_rx_32bit_sync 
    ( input clk, input [31:0] data_in, output reg [31:0] data_out );
    
    (* shreg_extract = "no" *) reg  [31:0] data_in_d1;
  
     always @(posedge clk)
     begin
         data_in_d1[31:0]  <= data_in[31:0];
         data_out[31:0]    <= data_in_d1[31:0];
     end
  endmodule
  
(* DowngradeIPIdentifiedWarnings="yes" *)
  module cmac_usplus_1_rx_16bit_sync 
    ( input clk, input [15:0] data_in, output reg [15:0] data_out );

    (* shreg_extract = "no" *) reg  [15:0] data_in_d1;
  
     always @(posedge clk)
     begin
         data_in_d1[15:0]  <= data_in[15:0];
         data_out[15:0]    <= data_in_d1[15:0];
     end
  endmodule

module cmac_usplus_1_syncer_reset
#(
  parameter PIPE_LEN = 5
 )
(
  input  wire clk,
  input  wire resetn_async,
  output wire resetn
) ;
(* ASYNC_REG = "TRUE" *) reg  [PIPE_LEN-1:0] pipe /* synthesis syn_preserve = 1 */;

/*
   NOTE: The initial block below is required for Verilog simulation but is
         undesirable for synthesis.  Hence the pragma's.
*/

// pragma translate_off

  initial  pipe = {PIPE_LEN{1'b1}};
 
// pragma translate_on

  assign resetn = pipe[PIPE_LEN-1];

  always @( posedge clk , posedge resetn_async )
    begin
      if ( resetn_async == 1'b1 )
        begin
          pipe <= {PIPE_LEN{1'b1}};
        end
      else
        begin
          pipe <= {pipe[PIPE_LEN-2:0], 1'b0};
        end
    end

endmodule

