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
module cmac_usplus_0_axi4_lite_reg_map
#(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32
 )
(

  input   wire                      tx_clk,
  input   wire                      tx_reset,
  input   wire                      rx_clk,
  input   wire                      rx_reset,
  input   wire                      tx_usrclk2,
  input   wire                      tx_reset_done_inv,
  input   wire                      Bus2IP_Clk,
  input   wire                      Bus2IP_Reset,
  input   wire   [ADDR_WIDTH-1:0]   Bus2IP_Addr,
  input   wire                      Bus2IP_RNW,
  input   wire                      Bus2IP_CS,
  ////input   wire                    Bus2IP_RdCE,
  ////input   wire                    Bus2IP_WrCE,
  input   wire   [DATA_WIDTH-1:0]   Bus2IP_Data,
  input   wire   [DATA_WIDTH/8-1:0] Bus2IP_BE,

  output  reg    [DATA_WIDTH-1:0]   IP2Bus_Data,
  output  reg                       IP2Bus_WrAck,
  output  reg                       IP2Bus_RdAck,
  output  reg                       IP2Bus_WrError,
  output  reg                       IP2Bus_RdError,

  output  wire                      gt_reset_all,
  output  wire   [9:0]              usr_rx_serdes_reset,
  output  wire                      usr_tx_reset,
  output  wire                      usr_rx_reset,
  output  wire                      ctl_gt_loopback,

  output  wire                      ctl_tx_enable,
  output  wire                      ctl_tx_send_lfi,
  output  wire                      ctl_tx_send_rfi,
  output  wire                      ctl_tx_send_idle,
  output  wire                      ctl_tx_test_pattern,
  output  wire   [7:0]              ctl_tx_lane0_vlm_bip7_override_value,
  output  wire                      ctl_tx_lane0_vlm_bip7_override,
  output  wire   [8:0]              ctl_tx_pause_enable,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer0,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer1,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer2,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer3,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer4,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer5,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer6,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer7,
  output  wire   [15:0]             ctl_tx_pause_refresh_timer8,
  output  wire   [15:0]             ctl_tx_pause_quanta0,
  output  wire   [15:0]             ctl_tx_pause_quanta1,
  output  wire   [15:0]             ctl_tx_pause_quanta2,
  output  wire   [15:0]             ctl_tx_pause_quanta3,
  output  wire   [15:0]             ctl_tx_pause_quanta4,
  output  wire   [15:0]             ctl_tx_pause_quanta5,
  output  wire   [15:0]             ctl_tx_pause_quanta6,
  output  wire   [15:0]             ctl_tx_pause_quanta7,
  output  wire   [15:0]             ctl_tx_pause_quanta8,
  output  wire                      ctl_tx_rsfec_enable,
  output  wire                      ctl_rx_enable,
  output  wire                      ctl_rx_force_resync,
  output  wire                      ctl_rx_test_pattern,
  output  wire   [8:0]              ctl_rx_pause_enable,
  output  wire                      ctl_rx_enable_gcp,
  output  wire                      ctl_rx_enable_pcp,
  output  wire                      ctl_rx_enable_gpp,
  output  wire                      ctl_rx_enable_ppp,
  output  wire   [8:0]              ctl_rx_pause_ack,
  output  wire                      ctl_rx_check_mcast_gcp,
  output  wire                      ctl_rx_check_ucast_gcp,
  output  wire                      ctl_rx_check_sa_gcp,
  output  wire                      ctl_rx_check_etype_gcp,
  output  wire                      ctl_rx_check_opcode_gcp,
  output  wire                      ctl_rx_check_mcast_pcp,
  output  wire                      ctl_rx_check_ucast_pcp,
  output  wire                      ctl_rx_check_sa_pcp,
  output  wire                      ctl_rx_check_etype_pcp,
  output  wire                      ctl_rx_check_opcode_pcp,
  output  wire                      ctl_rx_check_mcast_gpp,
  output  wire                      ctl_rx_check_ucast_gpp,
  output  wire                      ctl_rx_check_sa_gpp,
  output  wire                      ctl_rx_check_etype_gpp,
  output  wire                      ctl_rx_check_opcode_gpp,
  output  wire                      ctl_rx_check_opcode_ppp,
  output  wire                      ctl_rx_check_mcast_ppp,
  output  wire                      ctl_rx_check_ucast_ppp,
  output  wire                      ctl_rx_check_sa_ppp,
  output  wire                      ctl_rx_check_etype_ppp,
  output  wire                      ctl_rsfec_ieee_error_indication_mode,
  output  wire                      ctl_rx_rsfec_enable,
  output  wire                      ctl_rx_rsfec_enable_correction,
  output  wire                      ctl_rx_rsfec_enable_indication,
  output  wire   [31:0]             user_reg0,

  input   wire                      stat_tx_local_fault,
  input   wire                      stat_tx_ptp_fifo_read_error,
  input   wire                      stat_tx_ptp_fifo_write_error,
  input   wire                      stat_tx_frame_error,
  input   wire                      stat_tx_total_packets,
  input   wire                      stat_tx_total_good_packets,
  input   wire   [5:0]              stat_tx_total_bytes,
  input   wire   [13:0]             stat_tx_total_good_bytes,
  input   wire                      stat_tx_packet_64_bytes,
  input   wire                      stat_tx_packet_65_127_bytes,
  input   wire                      stat_tx_packet_128_255_bytes,
  input   wire                      stat_tx_packet_256_511_bytes,
  input   wire                      stat_tx_packet_512_1023_bytes,
  input   wire                      stat_tx_packet_1024_1518_bytes,
  input   wire                      stat_tx_packet_1519_1522_bytes,
  input   wire                      stat_tx_packet_1523_1548_bytes,
  input   wire                      stat_tx_packet_1549_2047_bytes,
  input   wire                      stat_tx_packet_2048_4095_bytes,
  input   wire                      stat_tx_packet_4096_8191_bytes,
  input   wire                      stat_tx_packet_8192_9215_bytes,
  input   wire                      stat_tx_packet_large,
  input   wire                      stat_tx_packet_small,
  input   wire                      stat_tx_bad_fcs,
  input   wire                      stat_tx_unicast,
  input   wire                      stat_tx_multicast,
  input   wire                      stat_tx_broadcast,
  input   wire                      stat_tx_vlan,
  input   wire                      stat_tx_pause,
  input   wire                      stat_tx_user_pause,
  input   wire                      stat_rx_status,
  input   wire                      stat_rx_aligned,
  input   wire                      stat_rx_misaligned,
  input   wire                      stat_rx_aligned_err,
  input   wire                      stat_rx_hi_ber,
  input   wire                      stat_rx_remote_fault,
  input   wire                      stat_rx_local_fault,
  input   wire                      stat_rx_internal_local_fault,
  input   wire                      stat_rx_received_local_fault,
  input   wire   [2:0]              stat_rx_test_pattern_mismatch,
  input   wire                      stat_rx_bad_preamble,
  input   wire                      stat_rx_bad_sfd,
  input   wire                      stat_rx_got_signal_os,
  input   wire   [19:0]             stat_rx_block_lock,
  input   wire   [19:0]             stat_rx_synced,
  input   wire   [19:0]             stat_rx_synced_err,
  input   wire   [19:0]             stat_rx_mf_err,
  input   wire   [19:0]             stat_rx_mf_len_err,
  input   wire   [19:0]             stat_rx_mf_repeat_err,
  input   wire   [19:0]             stat_rx_pcsl_demuxed,
  input   wire   [4:0]              stat_rx_pcsl_number_0,
  input   wire   [4:0]              stat_rx_pcsl_number_1,
  input   wire   [4:0]              stat_rx_pcsl_number_2,
  input   wire   [4:0]              stat_rx_pcsl_number_3,
  input   wire   [4:0]              stat_rx_pcsl_number_4,
  input   wire   [4:0]              stat_rx_pcsl_number_5,
  input   wire   [4:0]              stat_rx_pcsl_number_6,
  input   wire   [4:0]              stat_rx_pcsl_number_7,
  input   wire   [4:0]              stat_rx_pcsl_number_8,
  input   wire   [4:0]              stat_rx_pcsl_number_9,
  input   wire   [4:0]              stat_rx_pcsl_number_10,
  input   wire   [4:0]              stat_rx_pcsl_number_11,
  input   wire   [4:0]              stat_rx_pcsl_number_12,
  input   wire   [4:0]              stat_rx_pcsl_number_13,
  input   wire   [4:0]              stat_rx_pcsl_number_14,
  input   wire   [4:0]              stat_rx_pcsl_number_15,
  input   wire   [4:0]              stat_rx_pcsl_number_16,
  input   wire   [4:0]              stat_rx_pcsl_number_17,
  input   wire   [4:0]              stat_rx_pcsl_number_18,
  input   wire   [4:0]              stat_rx_pcsl_number_19,
  input   wire   [7:0]              stat_rx_lane0_vlm_bip7,
  input   wire                      stat_rx_lane0_vlm_bip7_valid,
  input   wire                      stat_rx_bip_err_0,
  input   wire                      stat_rx_bip_err_1,
  input   wire                      stat_rx_bip_err_2,
  input   wire                      stat_rx_bip_err_3,
  input   wire                      stat_rx_bip_err_4,
  input   wire                      stat_rx_bip_err_5,
  input   wire                      stat_rx_bip_err_6,
  input   wire                      stat_rx_bip_err_7,
  input   wire                      stat_rx_bip_err_8,
  input   wire                      stat_rx_bip_err_9,
  input   wire                      stat_rx_bip_err_10,
  input   wire                      stat_rx_bip_err_11,
  input   wire                      stat_rx_bip_err_12,
  input   wire                      stat_rx_bip_err_13,
  input   wire                      stat_rx_bip_err_14,
  input   wire                      stat_rx_bip_err_15,
  input   wire                      stat_rx_bip_err_16,
  input   wire                      stat_rx_bip_err_17,
  input   wire                      stat_rx_bip_err_18,
  input   wire                      stat_rx_bip_err_19,
  input   wire   [1:0]              stat_rx_framing_err_0,
  input   wire                      stat_rx_framing_err_valid_0,
  input   wire   [1:0]              stat_rx_framing_err_1,
  input   wire                      stat_rx_framing_err_valid_1,
  input   wire   [1:0]              stat_rx_framing_err_2,
  input   wire                      stat_rx_framing_err_valid_2,
  input   wire   [1:0]              stat_rx_framing_err_3,
  input   wire                      stat_rx_framing_err_valid_3,
  input   wire   [1:0]              stat_rx_framing_err_4,
  input   wire                      stat_rx_framing_err_valid_4,
  input   wire   [1:0]              stat_rx_framing_err_5,
  input   wire                      stat_rx_framing_err_valid_5,
  input   wire   [1:0]              stat_rx_framing_err_6,
  input   wire                      stat_rx_framing_err_valid_6,
  input   wire   [1:0]              stat_rx_framing_err_7,
  input   wire                      stat_rx_framing_err_valid_7,
  input   wire   [1:0]              stat_rx_framing_err_8,
  input   wire                      stat_rx_framing_err_valid_8,
  input   wire   [1:0]              stat_rx_framing_err_9,
  input   wire                      stat_rx_framing_err_valid_9,
  input   wire   [1:0]              stat_rx_framing_err_10,
  input   wire                      stat_rx_framing_err_valid_10,
  input   wire   [1:0]              stat_rx_framing_err_11,
  input   wire                      stat_rx_framing_err_valid_11,
  input   wire   [1:0]              stat_rx_framing_err_12,
  input   wire                      stat_rx_framing_err_valid_12,
  input   wire   [1:0]              stat_rx_framing_err_13,
  input   wire                      stat_rx_framing_err_valid_13,
  input   wire   [1:0]              stat_rx_framing_err_14,
  input   wire                      stat_rx_framing_err_valid_14,
  input   wire   [1:0]              stat_rx_framing_err_15,
  input   wire                      stat_rx_framing_err_valid_15,
  input   wire   [1:0]              stat_rx_framing_err_16,
  input   wire                      stat_rx_framing_err_valid_16,
  input   wire   [1:0]              stat_rx_framing_err_17,
  input   wire                      stat_rx_framing_err_valid_17,
  input   wire   [1:0]              stat_rx_framing_err_18,
  input   wire                      stat_rx_framing_err_valid_18,
  input   wire   [1:0]              stat_rx_framing_err_19,
  input   wire                      stat_rx_framing_err_valid_19,
  input   wire   [2:0]              stat_rx_bad_code,
  input   wire   [2:0]              stat_rx_total_packets,
  input   wire                      stat_rx_total_good_packets,
  input   wire   [6:0]              stat_rx_total_bytes,
  input   wire   [13:0]             stat_rx_total_good_bytes,
  input   wire                      stat_rx_packet_64_bytes,
  input   wire                      stat_rx_packet_65_127_bytes,
  input   wire                      stat_rx_packet_128_255_bytes,
  input   wire                      stat_rx_packet_256_511_bytes,
  input   wire                      stat_rx_packet_512_1023_bytes,
  input   wire                      stat_rx_packet_1024_1518_bytes,
  input   wire                      stat_rx_packet_1519_1522_bytes,
  input   wire                      stat_rx_packet_1523_1548_bytes,
  input   wire                      stat_rx_packet_1549_2047_bytes,
  input   wire                      stat_rx_packet_2048_4095_bytes,
  input   wire                      stat_rx_packet_4096_8191_bytes,
  input   wire                      stat_rx_packet_8192_9215_bytes,
  input   wire                      stat_rx_packet_large,
  input   wire   [2:0]              stat_rx_packet_small,
  input   wire   [2:0]              stat_rx_undersize,
  input   wire   [2:0]              stat_rx_fragment,
  input   wire                      stat_rx_oversize,
  input   wire                      stat_rx_toolong,
  input   wire                      stat_rx_jabber,
  input   wire   [2:0]              stat_rx_bad_fcs,
  input   wire                      stat_rx_packet_bad_fcs,
  input   wire   [2:0]              stat_rx_stomped_fcs,
  input   wire                      stat_rx_unicast,
  input   wire                      stat_rx_multicast,
  input   wire                      stat_rx_broadcast,
  input   wire                      stat_rx_vlan,
  input   wire                      stat_rx_pause,
  input   wire                      stat_rx_user_pause,
  input   wire                      stat_rx_inrangeerr,
  input   wire                      stat_rx_truncated,
  input   wire                      stat_rx_rsfec_am_lock0,
  input   wire                      stat_rx_rsfec_am_lock1,
  input   wire                      stat_rx_rsfec_am_lock2,
  input   wire                      stat_rx_rsfec_am_lock3,
  input   wire                      stat_rx_rsfec_corrected_cw_inc,
  input   wire                      stat_rx_rsfec_cw_inc,
  input   wire [2:0]                stat_rx_rsfec_err_count0_inc,
  input   wire [2:0]                stat_rx_rsfec_err_count1_inc,
  input   wire [2:0]                stat_rx_rsfec_err_count2_inc,
  input   wire [2:0]                stat_rx_rsfec_err_count3_inc,
  input   wire                      stat_rx_rsfec_hi_ser,
  input   wire                      stat_rx_rsfec_lane_alignment_status,
  input   wire [13:0]               stat_rx_rsfec_lane_fill_0,
  input   wire [13:0]               stat_rx_rsfec_lane_fill_1,
  input   wire [13:0]               stat_rx_rsfec_lane_fill_2,
  input   wire [13:0]               stat_rx_rsfec_lane_fill_3,
  input   wire [7:0]                stat_rx_rsfec_lane_mapping,
  input   wire                      stat_rx_rsfec_uncorrected_cw_inc,
  input   wire                      pm_tick
  );


  reg            GT_RESET_REG;
  reg  [11:0]    RESET_REG;
  reg            GT_LOOPBACK_REG;
  reg  [1:0]     CORE_MODE_REG;

  reg  [4:0]     CONFIGURATION_TX_REG1;
  reg  [8:0]     CONFIGURATION_TX_BIP_OVERRIDE;
  reg  [8:0]     CONFIGURATION_TX_FLOW_CONTROL_CONTROL_REG1;
  reg  [31:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1;
  reg  [31:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2;
  reg  [31:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3;
  reg  [31:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4;
  reg  [15:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG5;
  reg  [31:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1;
  reg  [31:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2;
  reg  [31:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3;
  reg  [31:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4;
  reg  [15:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG5;

  wire [4:0]     CONFIGURATION_TX_REG1_sync;
  wire [8:0]     CONFIGURATION_TX_BIP_OVERRIDE_sync;
  wire [8:0]     CONFIGURATION_TX_FLOW_CONTROL_CONTROL_REG1_sync;
  wire [31:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1_sync;
  wire [31:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2_sync;
  wire [31:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3_sync;
  wire [31:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4_sync;
  wire [15:0]    CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG5_sync;
  wire [31:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1_sync;
  wire [31:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2_sync;
  wire [31:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3_sync;
  wire [31:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4_sync;
  wire [15:0]    CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG5_sync;
  reg  [2:0]     CONFIGURATION_RX_REG1;
  reg  [21:0]    CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1;
  reg  [19:0]    CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2;

  wire [2:0]     CONFIGURATION_RX_REG1_sync;
  wire [21:0]    CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1_sync;
  wire [19:0]    CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync;

  reg  [1:0]     RSFEC_CONFIG_ENABLE;
  wire           RSFEC_CONFIG_TX_ENABLE_sync;
  reg  [2:0]     RSFEC_CONFIG_INDICATION_CORRECTION;
  wire [2:0]     RSFEC_CONFIG_INDICATION_CORRECTION_sync;
  wire           RSFEC_CONFIG_RX_ENABLE_sync;


  reg  [31:0]             USER_REG0;
  wire [31:0]             USER_REG0_sync;
  reg                     TICK_REG;
  
  reg [ADDR_WIDTH-1:0]    Bus2IP_Addr_reg;
  reg                     Bus2IP_RNW_reg;
  reg                     Bus2IP_CS_reg;
  reg [DATA_WIDTH-1:0]    Bus2IP_Data_reg;
  wire                    write_req;
  reg                     write_req_d1  = 0;
  reg                     write_req_d2  = 0;
  wire                    AXI_write;
  wire                    AXI_write_rise_edge;
  reg                     AXI_write_reg = 0;
  wire                    Bus2IP_CS_rise_edge;

 always @ (posedge Bus2IP_Clk)
   begin   
      Bus2IP_Addr_reg     <= Bus2IP_Addr;
      Bus2IP_RNW_reg      <= Bus2IP_RNW;
      Bus2IP_CS_reg       <= Bus2IP_CS;
      Bus2IP_Data_reg     <= Bus2IP_Data;
   end

 
  reg                     tick_r;
  reg  [3:0]              tick_rr;

 
  wire                    pm_tick_sync;
  wire                    rx_clk_tick_r;
  wire                    tx_clk_tick_r;
  wire                    tx_usrclk2_tick_r;

  wire                    usr_tx_reset_sync;
  wire                    usr_rx_reset_sync;

  assign  gt_reset_all        = GT_RESET_REG;
  assign  usr_rx_serdes_reset = RESET_REG[9:0];
  assign  usr_tx_reset        = usr_tx_reset_sync;
  assign  usr_rx_reset        = usr_rx_reset_sync;
  assign  ctl_gt_loopback     = GT_LOOPBACK_REG;

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_cmac_usr_tx_reset_syncer (
    .clk          (tx_clk ),
    .signal_in    (RESET_REG[11]),
    .signal_out   (usr_tx_reset_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_cmac_usr_rx_reset_syncer (
    .clk          (rx_clk ),
    .signal_in    (RESET_REG[10]),
    .signal_out   (usr_rx_reset_sync)
  );


  assign  ctl_tx_enable = CONFIGURATION_TX_REG1_sync[0];
  assign  ctl_tx_send_lfi = CONFIGURATION_TX_REG1_sync[1];
  assign  ctl_tx_send_rfi = CONFIGURATION_TX_REG1_sync[2];
  assign  ctl_tx_send_idle = CONFIGURATION_TX_REG1_sync[3];
  assign  ctl_tx_test_pattern = CONFIGURATION_TX_REG1_sync[4];
  assign  ctl_tx_lane0_vlm_bip7_override_value = CONFIGURATION_TX_BIP_OVERRIDE_sync[7:0];
  assign  ctl_tx_lane0_vlm_bip7_override = CONFIGURATION_TX_BIP_OVERRIDE_sync[8];
  assign  ctl_tx_pause_enable = CONFIGURATION_TX_FLOW_CONTROL_CONTROL_REG1_sync[8:0];

  assign  ctl_tx_pause_refresh_timer0 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1_sync[15:0];
  assign  ctl_tx_pause_refresh_timer1 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1_sync[31:16];
  assign  ctl_tx_pause_refresh_timer2 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2_sync[15:0];
  assign  ctl_tx_pause_refresh_timer3 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2_sync[31:16];
  assign  ctl_tx_pause_refresh_timer4 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3_sync[15:0];
  assign  ctl_tx_pause_refresh_timer5 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3_sync[31:16];
  assign  ctl_tx_pause_refresh_timer6 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4_sync[15:0];
  assign  ctl_tx_pause_refresh_timer7 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4_sync[31:16];
  assign  ctl_tx_pause_refresh_timer8 = CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG5_sync[15:0];

  assign  ctl_tx_pause_quanta0 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1_sync[15:0];
  assign  ctl_tx_pause_quanta1 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1_sync[31:16];
  assign  ctl_tx_pause_quanta2 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2_sync[15:0];
  assign  ctl_tx_pause_quanta3 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2_sync[31:16];
  assign  ctl_tx_pause_quanta4 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3_sync[15:0];
  assign  ctl_tx_pause_quanta5 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3_sync[31:16];
  assign  ctl_tx_pause_quanta6 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4_sync[15:0];
  assign  ctl_tx_pause_quanta7 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4_sync[31:16];
  assign  ctl_tx_pause_quanta8 = CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG5_sync[15:0];


  assign  ctl_tx_rsfec_enable = RSFEC_CONFIG_TX_ENABLE_sync;

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_cmac_config_tx_reg1_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_REG1),
    .signal_out   (CONFIGURATION_TX_REG1_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (9)
  ) i_cmac_usplus_0_cmac_config_tx_bip_override_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_BIP_OVERRIDE),
    .signal_out   (CONFIGURATION_TX_BIP_OVERRIDE_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (9)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_ctrl_reg1_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_CONTROL_REG1),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_CONTROL_REG1_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_refresh_reg1_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_refresh_reg2_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_refresh_reg3_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_refresh_reg4_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (16)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_refresh_reg5_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG5),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG5_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_quanta_reg1_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_quanta_reg2_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_quanta_reg3_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_quanta_reg4_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (16)
  ) i_cmac_usplus_0_cmac_config_tx_flow_ctrl_quanta_reg5_syncer (
    .clk          (tx_clk ),
    .signal_in    (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG5),
    .signal_out   (CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG5_sync)
  );


  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_cmac_rsfec_config_tx_en_syncer (
    .clk          (tx_clk ),
    .signal_in    (RSFEC_CONFIG_ENABLE[1]),
    .signal_out   (RSFEC_CONFIG_TX_ENABLE_sync)
  );

  assign  ctl_rx_enable = CONFIGURATION_RX_REG1_sync[0];
  assign  ctl_rx_force_resync = CONFIGURATION_RX_REG1_sync[1];
  assign  ctl_rx_test_pattern = CONFIGURATION_RX_REG1_sync[2];
  assign  ctl_rx_pause_enable = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1_sync[8:0];
  assign  ctl_rx_enable_gcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1_sync[9];
  assign  ctl_rx_enable_pcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1_sync[10];
  assign  ctl_rx_enable_gpp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1_sync[11];
  assign  ctl_rx_enable_ppp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1_sync[12];
  assign  ctl_rx_pause_ack = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1_sync[21:13];

  assign  ctl_rx_check_mcast_gcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[0];
  assign  ctl_rx_check_ucast_gcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[1];
  assign  ctl_rx_check_sa_gcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[2];
  assign  ctl_rx_check_etype_gcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[3];
  assign  ctl_rx_check_opcode_gcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[4];
  assign  ctl_rx_check_mcast_pcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[5];
  assign  ctl_rx_check_ucast_pcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[6];
  assign  ctl_rx_check_sa_pcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[7];
  assign  ctl_rx_check_etype_pcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[8];
  assign  ctl_rx_check_opcode_pcp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[9];
  assign  ctl_rx_check_mcast_gpp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[10];
  assign  ctl_rx_check_ucast_gpp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[11];
  assign  ctl_rx_check_sa_gpp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[12];
  assign  ctl_rx_check_etype_gpp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[13];
  assign  ctl_rx_check_opcode_gpp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[14];
  assign  ctl_rx_check_opcode_ppp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[15];
  assign  ctl_rx_check_mcast_ppp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[16];
  assign  ctl_rx_check_ucast_ppp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[17];
  assign  ctl_rx_check_sa_ppp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[18];
  assign  ctl_rx_check_etype_ppp = CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync[19];

  assign  ctl_rx_rsfec_enable = RSFEC_CONFIG_RX_ENABLE_sync;
  assign  ctl_rx_rsfec_enable_correction = RSFEC_CONFIG_INDICATION_CORRECTION_sync[0];
  assign  ctl_rx_rsfec_enable_indication = RSFEC_CONFIG_INDICATION_CORRECTION_sync[1];
  assign  ctl_rsfec_ieee_error_indication_mode = RSFEC_CONFIG_INDICATION_CORRECTION_sync[2];

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (3)
  ) i_cmac_usplus_0_cmac_config_rx_reg1_syncer (
    .clk          (rx_clk ),
    .signal_in    (CONFIGURATION_RX_REG1),
    .signal_out   (CONFIGURATION_RX_REG1_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (22)
  ) i_cmac_usplus_0_cmac_config_rx_flow_ctrl_ctrl_reg1_syncer (
    .clk          (rx_clk ),
    .signal_in    (CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1),
    .signal_out   (CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (20)
  ) i_cmac_usplus_0_cmac_config_rx_flow_ctrl_ctrl_reg2_syncer (
    .clk          (rx_clk ),
    .signal_in    (CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2),
    .signal_out   (CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_cmac_rsfec_config_rx_en_syncer (
    .clk          (rx_clk ),
    .signal_in    (RSFEC_CONFIG_ENABLE[0]),
    .signal_out   (RSFEC_CONFIG_RX_ENABLE_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (3)
  ) i_cmac_usplus_0_cmac_rsfec_config_ind_cor_syncer (
    .clk          (rx_clk ),
    .signal_in    (RSFEC_CONFIG_INDICATION_CORRECTION),
    .signal_out   (RSFEC_CONFIG_INDICATION_CORRECTION_sync)
  );


  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (32)
  ) i_cmac_usplus_0_cmac_user_reg0_syncer (
    .clk          (tx_clk ),
    .signal_in    (USER_REG0),
    .signal_out   (USER_REG0_sync)
  );
  assign  user_reg0       =  USER_REG0_sync;

  
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_pm_tick_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (pm_tick),
    .signal_out   (pm_tick_sync)
  );

  cmac_usplus_0_axi4_syncer_pulse i_cmac_usplus_0_pmtick_rx_clk_syncer (

  .clkin        ( Bus2IP_Clk ),
  .clkin_reset  ( Bus2IP_Reset ),
  .clkout       ( rx_clk ),
  .clkout_reset ( rx_reset ),
  .pulsein      ( tick_r ),  //// clkin domain
  .pulseout     ( rx_clk_tick_r )  //// clkout domain
);

  cmac_usplus_0_axi4_syncer_pulse i_cmac_usplus_0_pmtick_tx_clk_syncer (

  .clkin        ( Bus2IP_Clk ),
  .clkin_reset  ( Bus2IP_Reset ),
  .clkout       ( tx_clk ),
  .clkout_reset ( tx_reset ),
  .pulsein      ( tick_r ),  //// clkin domain
  .pulseout     ( tx_clk_tick_r )  //// clkout domain
);

  cmac_usplus_0_axi4_syncer_pulse i_cmac_usplus_0_pmtick_tx_usrclk2_syncer (

  .clkin        ( Bus2IP_Clk ),
  .clkin_reset  ( Bus2IP_Reset ),
  .clkout       ( tx_usrclk2 ),
  .clkout_reset ( tx_reset_done_inv ),
  .pulsein      ( tick_r ),  //// clkin domain
  .pulseout     ( tx_usrclk2_tick_r )  //// clkout domain
);

 always @( posedge Bus2IP_Clk )
    begin
      if ( Bus2IP_Reset == 1'b1 )
    begin
      tick_rr <= 'd0;
      tick_r  <= 1'b0;
    end
  else
    begin
      tick_rr <= {tick_rr[2:0],(TICK_REG | pm_tick_sync)};
      tick_r  <= ~tick_rr[3] & tick_rr[2];
    end
 end

 assign write_req = Bus2IP_CS_reg & ~Bus2IP_RNW_reg;
 assign AXI_write = write_req & write_req_d2;

 always @ (posedge Bus2IP_Clk )
   begin
       AXI_write_reg <= AXI_write;
   end          
 assign AXI_write_rise_edge = AXI_write & (~ AXI_write_reg);


 always @ (posedge Bus2IP_Clk)
    begin 
        if (Bus2IP_Reset == 1'b1)
           begin
             write_req_d1         <= 1'b0;
             write_req_d2         <= 1'b0;
           end
        else 
           begin
             write_req_d1         <= write_req;
             write_req_d2         <= write_req_d1;  
           end
    end 



  //////- Write side
  always @( posedge Bus2IP_Clk ) begin
      if ( Bus2IP_Reset == 1'b1 ) begin
          IP2Bus_WrAck                               <=  1'b0;
          IP2Bus_WrError                             <=  1'b0;

          GT_RESET_REG                               <=  1'b0;
          RESET_REG                                  <=  'd0;
          GT_LOOPBACK_REG                            <=  1'b0;
          CONFIGURATION_TX_REG1                       <=  'd0;
          CONFIGURATION_TX_BIP_OVERRIDE               <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_CONTROL_REG1  <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1  <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2  <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3  <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4  <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG5  <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1   <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2   <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3   <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4   <=  'd0;
          CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG5   <=  'd0;
          CONFIGURATION_RX_REG1  <=  'd0;
          CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1  <=  'd0;
          CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2  <=  'd0;
          RSFEC_CONFIG_INDICATION_CORRECTION          <=  'd0;
          RSFEC_CONFIG_ENABLE                         <=  'd0;
          USER_REG0                                   <=  'd0;
          TICK_REG                                    <=  0;
       end
       else begin
           //////- Self Clearing
           TICK_REG                                   <=  0;
           GT_RESET_REG                               <=  0;
           IP2Bus_WrError                             <=  1'b0;
           //////- Write transaction
           if ( AXI_write_rise_edge) begin
              case (Bus2IP_Addr_reg[15:0])

                 'h0000 : begin
                                 GT_RESET_REG         <=  Bus2IP_Data_reg[0];
                                 IP2Bus_WrError  <=  1'b0;
                              end
                 'h0004 : begin
                                 RESET_REG            <=  {Bus2IP_Data_reg[31:30],Bus2IP_Data_reg[9:0]};
                                 IP2Bus_WrError  <=  1'b0;
                              end
                 'h000C : begin
                                 CONFIGURATION_TX_REG1 <=  {Bus2IP_Data_reg[16],Bus2IP_Data_reg[5:3],Bus2IP_Data_reg[0]};
                                 IP2Bus_WrError  <=  1'b0;
                              end
                 'h0014 : begin
                                 CONFIGURATION_RX_REG1  <=  {Bus2IP_Data_reg[8:7],Bus2IP_Data_reg[0]};
                                 IP2Bus_WrError  <=  1'b0;
                              end
                 'h002C : begin
                                 CONFIGURATION_TX_BIP_OVERRIDE  <=  Bus2IP_Data_reg[8:0];
                                 IP2Bus_WrError  <=  1'b0;
                              end
                 'h0030 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_CONTROL_REG1  <=  Bus2IP_Data_reg[8:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0034 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1  <=  Bus2IP_Data_reg;
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0038 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2  <=  Bus2IP_Data_reg;
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h003C : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3  <=  Bus2IP_Data_reg;
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0040 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4  <=  Bus2IP_Data_reg;
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0044 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG5  <=  Bus2IP_Data_reg[15:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0048 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1   <=  Bus2IP_Data_reg[31:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h004C : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2   <=  Bus2IP_Data_reg[31:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0050 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3   <=  Bus2IP_Data_reg[31:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0054 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4   <=  Bus2IP_Data_reg[31:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0058 : begin
                                 CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG5   <=  Bus2IP_Data_reg[15:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0084 : begin
                                 CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1  <=  {Bus2IP_Data_reg[23:15],Bus2IP_Data_reg[13:10],Bus2IP_Data_reg[8:0]};
                                 IP2Bus_WrError    <= 1'b0;
                              end
                 'h0088 : begin
                                 CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2  <=  Bus2IP_Data_reg[19:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h0090 : begin
                                 GT_LOOPBACK_REG   <=  Bus2IP_Data_reg[0];
                                 IP2Bus_WrError   <= 1'b0;
                              end
                 'h00CC : begin
                                 USER_REG0       <=  Bus2IP_Data_reg[31:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h02B0 : begin
                                 TICK_REG        <=  Bus2IP_Data_reg[0];
                                 IP2Bus_WrError  <=  1'b0;
                              end
////////////////////////////////////////////////////////////////
                 'h1000 : begin
                                 RSFEC_CONFIG_INDICATION_CORRECTION  <=  Bus2IP_Data_reg[2:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
                 'h107C : begin
                                 RSFEC_CONFIG_ENABLE  <=  Bus2IP_Data_reg[1:0];
                                 IP2Bus_WrError  <= 1'b0;
                              end
////////////////////////////////////////////////////////////////
                    default : begin
                                 IP2Bus_WrError  <= 1'b1;
                              end

              endcase
                                 IP2Bus_WrAck    <= 1'b1;
           end //// CS && RNW
           else begin
                                 IP2Bus_WrAck    <= 1'b0;
           end //// CS && RNW
       end //// reset
   end //// always block.


  reg   STAT_TX_STATUS_REG_clear_r;
  wire  STAT_TX_STATUS_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_TX_STATUS_REG_clear_syncer (
    .clk          (tx_clk ),
    .signal_in    (STAT_TX_STATUS_REG_clear_r),
    .signal_out   (STAT_TX_STATUS_REG_clear_sync)
  );

  reg   stat_tx_local_fault_lh_r;
  wire  stat_tx_local_fault_lh_r_sync;
  always @( posedge tx_clk ) begin
      if ( tx_reset == 1'b1 ) begin
          stat_tx_local_fault_lh_r <= 1'b0;
      end
      else begin
          stat_tx_local_fault_lh_r <= STAT_TX_STATUS_REG_clear_sync ? 1'b0 : (stat_tx_local_fault_lh_r | stat_tx_local_fault) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_cmac_stat_tx_local_fault_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_tx_local_fault_lh_r),
    .signal_out   (stat_tx_local_fault_lh_r_sync)
  );

  reg   STAT_STATUS_REG1_clear_r;
  wire  STAT_STATUS_REG1_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_STATUS_REG1_clear_syncer (
    .clk          (tx_clk ),
    .signal_in    (STAT_STATUS_REG1_clear_r),
    .signal_out   (STAT_STATUS_REG1_clear_sync)
  );

  reg   stat_tx_ptp_fifo_read_error_lh_r;
  wire  stat_tx_ptp_fifo_read_error_lh_r_sync;
  always @( posedge tx_clk ) begin
      if ( tx_reset == 1'b1 ) begin
          stat_tx_ptp_fifo_read_error_lh_r <= 1'b0;
      end
      else begin
          stat_tx_ptp_fifo_read_error_lh_r <= STAT_STATUS_REG1_clear_sync ? 1'b0 : (stat_tx_ptp_fifo_read_error_lh_r | stat_tx_ptp_fifo_read_error) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_cmac_stat_tx_ptp_fifo_read_error_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_tx_ptp_fifo_read_error_lh_r),
    .signal_out   (stat_tx_ptp_fifo_read_error_lh_r_sync)
  );

  reg   stat_tx_ptp_fifo_write_error_lh_r;
  wire  stat_tx_ptp_fifo_write_error_lh_r_sync;
  always @( posedge tx_clk ) begin
      if ( tx_reset == 1'b1 ) begin
          stat_tx_ptp_fifo_write_error_lh_r <= 1'b0;
      end
      else begin
          stat_tx_ptp_fifo_write_error_lh_r <= STAT_STATUS_REG1_clear_sync ? 1'b0 : (stat_tx_ptp_fifo_write_error_lh_r | stat_tx_ptp_fifo_write_error) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_cmac_stat_tx_ptp_fifo_write_error_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_tx_ptp_fifo_write_error_lh_r),
    .signal_out   (stat_tx_ptp_fifo_write_error_lh_r_sync)
  );


  reg   STAT_RX_STATUS_REG_clear_r;
  wire  STAT_RX_STATUS_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_RX_STATUS_REG_clear_syncer (
    .clk          (rx_clk ),
    .signal_in    (STAT_RX_STATUS_REG_clear_r),
    .signal_out   (STAT_RX_STATUS_REG_clear_sync)
  );

  reg   STAT_RX_RSFEC_STATUS_REG_clear_r;
  wire  STAT_RX_RSFEC_STATUS_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_RX_RSFEC_STATUS_REG_clear_syncer (
    .clk          (rx_clk ),
    .signal_in    (STAT_RX_RSFEC_STATUS_REG_clear_r),
    .signal_out   (STAT_RX_RSFEC_STATUS_REG_clear_sync)
  );

  reg   stat_rx_status_ll_r;
  wire  stat_rx_status_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_status_ll_r <= 1'b1;
      end
      else begin
          stat_rx_status_ll_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_status_ll_r & stat_rx_status) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_status_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_status_ll_r),
    .signal_out   (stat_rx_status_ll_r_sync)
  );

  reg   stat_rx_aligned_ll_r;
  wire  stat_rx_aligned_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_aligned_ll_r <= 1'b1;
      end
      else begin
          stat_rx_aligned_ll_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_aligned_ll_r & stat_rx_aligned) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_aligned_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_aligned_ll_r),
    .signal_out   (stat_rx_aligned_ll_r_sync)
  );

  reg   stat_rx_misaligned_lh_r;
  wire  stat_rx_misaligned_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_misaligned_lh_r <= 1'b0;
      end
      else begin
          stat_rx_misaligned_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_misaligned_lh_r | stat_rx_misaligned) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_misaligned_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_misaligned_lh_r),
    .signal_out   (stat_rx_misaligned_lh_r_sync)
  );

  reg   stat_rx_aligned_err_lh_r;
  wire  stat_rx_aligned_err_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_aligned_err_lh_r <= 1'b0;
      end
      else begin
          stat_rx_aligned_err_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_aligned_err_lh_r | stat_rx_aligned_err) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_aligned_err_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_aligned_err_lh_r),
    .signal_out   (stat_rx_aligned_err_lh_r_sync)
  );

  reg   stat_rx_hi_ber_lh_r;
  wire  stat_rx_hi_ber_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_hi_ber_lh_r <= 1'b0;
      end
      else begin
          stat_rx_hi_ber_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_hi_ber_lh_r | stat_rx_hi_ber) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_hi_ber_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_hi_ber_lh_r),
    .signal_out   (stat_rx_hi_ber_lh_r_sync)
  );

  reg   stat_rx_remote_fault_lh_r;
  wire  stat_rx_remote_fault_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_remote_fault_lh_r <= 1'b0;
      end
      else begin
          stat_rx_remote_fault_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_remote_fault_lh_r | stat_rx_remote_fault) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_remote_fault_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_remote_fault_lh_r),
    .signal_out   (stat_rx_remote_fault_lh_r_sync)
  );

  reg   stat_rx_local_fault_lh_r;
  wire  stat_rx_local_fault_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_local_fault_lh_r <= 1'b0;
      end
      else begin
          stat_rx_local_fault_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_local_fault_lh_r | stat_rx_local_fault) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_local_fault_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_local_fault_lh_r),
    .signal_out   (stat_rx_local_fault_lh_r_sync)
  );

  reg   stat_rx_internal_local_fault_lh_r;
  wire  stat_rx_internal_local_fault_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_internal_local_fault_lh_r <= 1'b0;
      end
      else begin
          stat_rx_internal_local_fault_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_internal_local_fault_lh_r | stat_rx_internal_local_fault) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_internal_local_fault_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_internal_local_fault_lh_r),
    .signal_out   (stat_rx_internal_local_fault_lh_r_sync)
  );

  reg   stat_rx_received_local_fault_lh_r;
  wire  stat_rx_received_local_fault_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_received_local_fault_lh_r <= 1'b0;
      end
      else begin
          stat_rx_received_local_fault_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_received_local_fault_lh_r | stat_rx_received_local_fault) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_received_local_fault_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_received_local_fault_lh_r),
    .signal_out   (stat_rx_received_local_fault_lh_r_sync)
  );

  reg  [2:0] stat_rx_test_pattern_mismatch_lh_r;
  wire [2:0] stat_rx_test_pattern_mismatch_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_test_pattern_mismatch_lh_r <= 'd0;
      end
      else begin
          stat_rx_test_pattern_mismatch_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 3'd0 : (stat_rx_test_pattern_mismatch_lh_r | stat_rx_test_pattern_mismatch) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (3)
  ) i_cmac_usplus_0_reg_stat_rx_test_pattern_mismatch_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_test_pattern_mismatch_lh_r),
    .signal_out   (stat_rx_test_pattern_mismatch_lh_r_sync)
  );

  reg   stat_rx_bad_preamble_lh_r;
  wire  stat_rx_bad_preamble_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_bad_preamble_lh_r <= 1'b0;
      end
      else begin
          stat_rx_bad_preamble_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_bad_preamble_lh_r | stat_rx_bad_preamble) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_bad_preamble_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_bad_preamble_lh_r),
    .signal_out   (stat_rx_bad_preamble_lh_r_sync)
  );

  reg   stat_rx_bad_sfd_lh_r;
  wire  stat_rx_bad_sfd_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_bad_sfd_lh_r <= 1'b0;
      end
      else begin
          stat_rx_bad_sfd_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_bad_sfd_lh_r | stat_rx_bad_sfd) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_bad_sfd_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_bad_sfd_lh_r),
    .signal_out   (stat_rx_bad_sfd_lh_r_sync)
  );

  reg   stat_rx_got_signal_os_lh_r;
  wire  stat_rx_got_signal_os_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_got_signal_os_lh_r <= 1'b0;
      end
      else begin
          stat_rx_got_signal_os_lh_r <= STAT_RX_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_got_signal_os_lh_r | stat_rx_got_signal_os) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_got_signal_os_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_got_signal_os_lh_r),
    .signal_out   (stat_rx_got_signal_os_lh_r_sync)
  );

  reg   STAT_RX_BLOCK_LOCK_REG_clear_r;
  wire  STAT_RX_BLOCK_LOCK_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_RX_BLOCK_LOCK_REG_clear_syncer (
    .clk          (rx_clk ),
    .signal_in    (STAT_RX_BLOCK_LOCK_REG_clear_r),
    .signal_out   (STAT_RX_BLOCK_LOCK_REG_clear_sync)
  );

  reg  [19:0] stat_rx_block_lock_ll_r;
  wire [19:0] stat_rx_block_lock_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_block_lock_ll_r <= {20{1'b1}};
      end
      else begin
          stat_rx_block_lock_ll_r <= STAT_RX_BLOCK_LOCK_REG_clear_sync ? {20{1'b1}} : (stat_rx_block_lock_ll_r & stat_rx_block_lock) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (20)
  ) i_cmac_usplus_0_reg_stat_rx_block_lock_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_block_lock_ll_r),
    .signal_out   (stat_rx_block_lock_ll_r_sync)
  );

  reg   STAT_RX_LANE_SYNC_REG_clear_r;
  wire  STAT_RX_LANE_SYNC_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_RX_LANE_SYNC_REG_clear_syncer (
    .clk          (rx_clk ),
    .signal_in    (STAT_RX_LANE_SYNC_REG_clear_r),
    .signal_out   (STAT_RX_LANE_SYNC_REG_clear_sync)
  );

  reg  [19:0] stat_rx_synced_ll_r;
  wire [19:0] stat_rx_synced_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_synced_ll_r <= {20{1'b1}};
      end
      else begin
          stat_rx_synced_ll_r <= STAT_RX_LANE_SYNC_REG_clear_sync ? {20{1'b1}} : (stat_rx_synced_ll_r & stat_rx_synced) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (20)
  ) i_cmac_usplus_0_reg_stat_rx_synced_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_synced_ll_r),
    .signal_out   (stat_rx_synced_ll_r_sync)
  );

  reg  STAT_RX_LANE_SYNC_ERR_REG_clear_r;
  wire STAT_RX_LANE_SYNC_ERR_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_RX_LANE_SYNC_ERR_REG_clear_syncer (
    .clk          (rx_clk ),
    .signal_in    (STAT_RX_LANE_SYNC_ERR_REG_clear_r),
    .signal_out   (STAT_RX_LANE_SYNC_ERR_REG_clear_sync)
  );

  reg  [19:0] stat_rx_synced_err_lh_r;
  wire [19:0] stat_rx_synced_err_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_synced_err_lh_r <= {20{1'b0}};
      end
      else begin
          stat_rx_synced_err_lh_r <= STAT_RX_LANE_SYNC_ERR_REG_clear_sync ? {20{1'b0}} : (stat_rx_synced_err_lh_r | stat_rx_synced_err ) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (20)
  ) i_cmac_usplus_0_reg_stat_rx_synced_err_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_synced_err_lh_r),
    .signal_out   (stat_rx_synced_err_lh_r_sync)
  );

  reg   STAT_RX_LANE_AM_ERR_REG_clear_r;
  wire  STAT_RX_LANE_AM_ERR_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_RX_LANE_AM_ERR_REG_clear_syncer (
    .clk          (rx_clk ),
    .signal_in    (STAT_RX_LANE_AM_ERR_REG_clear_r),
    .signal_out   (STAT_RX_LANE_AM_ERR_REG_clear_sync)
  );

  reg  [19:0] stat_rx_mf_err_lh_r;
  wire [19:0] stat_rx_mf_err_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_mf_err_lh_r <= {20{1'b0}};
      end
      else begin
          stat_rx_mf_err_lh_r <= STAT_RX_LANE_AM_ERR_REG_clear_sync ? {20{1'b0}} : (stat_rx_mf_err_lh_r | stat_rx_mf_err );
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (20)
  ) i_cmac_usplus_0_reg_stat_rx_mf_err_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_mf_err_lh_r),
    .signal_out   (stat_rx_mf_err_lh_r_sync)
  );

  reg   STAT_RX_LANE_AM_LEN_ERR_REG_clear_r;
  wire  STAT_RX_LANE_AM_LEN_ERR_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_RX_LANE_AM_LEN_ERR_REG_clear_syncer (
    .clk          (rx_clk ),
    .signal_in    (STAT_RX_LANE_AM_LEN_ERR_REG_clear_r),
    .signal_out   (STAT_RX_LANE_AM_LEN_ERR_REG_clear_sync)
  );

  reg  [19:0] stat_rx_mf_len_err_lh_r;
  wire [19:0] stat_rx_mf_len_err_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_mf_len_err_lh_r <= {20{1'b0}};
      end
      else begin
          stat_rx_mf_len_err_lh_r <= STAT_RX_LANE_AM_LEN_ERR_REG_clear_sync ? {20{1'b0}} : (stat_rx_mf_len_err_lh_r | stat_rx_mf_len_err);
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (20)
  ) i_cmac_usplus_0_reg_stat_rx_mf_len_err_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_mf_len_err_lh_r),
    .signal_out   (stat_rx_mf_len_err_lh_r_sync)
  );

  reg   STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_r;
  wire  STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_syncer (
    .clk          (rx_clk ),
    .signal_in    (STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_r),
    .signal_out   (STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_sync)
  );

  reg  [19:0] stat_rx_mf_repeat_err_lh_r;
  wire [19:0] stat_rx_mf_repeat_err_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 ) begin
          stat_rx_mf_repeat_err_lh_r <= {20{1'b0}};
      end
    else begin
        stat_rx_mf_repeat_err_lh_r <= STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_sync ? {20{1'b0}} : (stat_rx_mf_repeat_err_lh_r | stat_rx_mf_repeat_err );
      end
  end

  wire  stat_rx_rsfec_hi_ser_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_hi_ser_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_hi_ser),
    .signal_out   (stat_rx_rsfec_hi_ser_sync)
  );

  reg   stat_rx_rsfec_hi_ser_lh_r;
  wire  stat_rx_rsfec_hi_ser_lh_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_hi_ser_lh_r <= 1'b0;
      end
      else begin
          stat_rx_rsfec_hi_ser_lh_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b0 : (stat_rx_rsfec_hi_ser_lh_r & stat_rx_rsfec_hi_ser) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_hi_ser_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_hi_ser_lh_r),
    .signal_out   (stat_rx_rsfec_hi_ser_lh_r_sync)
  );

  reg   stat_rx_rsfec_am_lock0_ll_r;
  wire  stat_rx_rsfec_am_lock0_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_am_lock0_ll_r <= 1'b1;
      end
      else begin
          stat_rx_rsfec_am_lock0_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_am_lock0_ll_r & stat_rx_rsfec_am_lock0) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_am_lock0_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_am_lock0_ll_r),
    .signal_out   (stat_rx_rsfec_am_lock0_ll_r_sync)
  );

  reg   stat_rx_rsfec_am_lock1_ll_r;
  wire  stat_rx_rsfec_am_lock1_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_am_lock1_ll_r <= 1'b1;
      end
      else begin
          stat_rx_rsfec_am_lock1_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_am_lock1_ll_r & stat_rx_rsfec_am_lock1) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_am_lock1_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_am_lock1_ll_r),
    .signal_out   (stat_rx_rsfec_am_lock1_ll_r_sync)
  );

  reg   stat_rx_rsfec_am_lock2_ll_r;
  wire  stat_rx_rsfec_am_lock2_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_am_lock2_ll_r <= 1'b1;
      end
      else begin
          stat_rx_rsfec_am_lock2_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_am_lock2_ll_r & stat_rx_rsfec_am_lock2) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_am_lock2_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_am_lock2_ll_r),
    .signal_out   (stat_rx_rsfec_am_lock2_ll_r_sync)
  );

  reg   stat_rx_rsfec_am_lock3_ll_r;
  wire  stat_rx_rsfec_am_lock3_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_am_lock3_ll_r <= 1'b1;
      end
      else begin
          stat_rx_rsfec_am_lock3_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_am_lock3_ll_r & stat_rx_rsfec_am_lock3) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_am_lock3_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_am_lock3_ll_r),
    .signal_out   (stat_rx_rsfec_am_lock3_ll_r_sync)
  );

  reg   stat_rx_rsfec_lane_alignment_status_ll_r;
  wire  stat_rx_rsfec_lane_alignment_status_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_lane_alignment_status_ll_r <= 1'b1;
      end
      else begin
          stat_rx_rsfec_lane_alignment_status_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_lane_alignment_status_ll_r & stat_rx_rsfec_lane_alignment_status) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_lane_alignment_status_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_lane_alignment_status_ll_r),
    .signal_out   (stat_rx_rsfec_lane_alignment_status_ll_r_sync)
  );

  reg  [1:0] stat_rx_rsfec_lane_mapping0_ll_r;
  wire [1:0] stat_rx_rsfec_lane_mapping0_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_lane_mapping0_ll_r <= 'd1;
      end
      else begin
          stat_rx_rsfec_lane_mapping0_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_lane_mapping0_ll_r & stat_rx_rsfec_lane_mapping[1:0]) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (2)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_lane_mapping0_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_lane_mapping0_ll_r),
    .signal_out   (stat_rx_rsfec_lane_mapping0_ll_r_sync)
  );

  reg  [1:0] stat_rx_rsfec_lane_mapping1_ll_r;
  wire [1:0] stat_rx_rsfec_lane_mapping1_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_lane_mapping1_ll_r <= 'd1;
      end
      else begin
          stat_rx_rsfec_lane_mapping1_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_lane_mapping1_ll_r & stat_rx_rsfec_lane_mapping[3:2]) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (2)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_lane_mapping1_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_lane_mapping1_ll_r),
    .signal_out   (stat_rx_rsfec_lane_mapping1_ll_r_sync)
  );

  reg  [1:0] stat_rx_rsfec_lane_mapping2_ll_r;
  wire [1:0] stat_rx_rsfec_lane_mapping2_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_lane_mapping2_ll_r <= 'd1;
      end
      else begin
          stat_rx_rsfec_lane_mapping2_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_lane_mapping2_ll_r & stat_rx_rsfec_lane_mapping[5:4]) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (2)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_lane_mapping2_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_lane_mapping2_ll_r),
    .signal_out   (stat_rx_rsfec_lane_mapping2_ll_r_sync)
  );

  reg  [1:0] stat_rx_rsfec_lane_mapping3_ll_r;
  wire [1:0] stat_rx_rsfec_lane_mapping3_ll_r_sync;
  always @( posedge rx_clk ) begin
      if ( rx_reset == 1'b1 )
      begin
          stat_rx_rsfec_lane_mapping3_ll_r <= 'd1;
      end
      else begin
          stat_rx_rsfec_lane_mapping3_ll_r <= STAT_RX_RSFEC_STATUS_REG_clear_sync ? 1'b1 : (stat_rx_rsfec_lane_mapping3_ll_r & stat_rx_rsfec_lane_mapping[7:6]) ;
      end
  end

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (2)
  ) i_cmac_usplus_0_reg_stat_rx_rsfec_lane_mapping3_ll_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_rsfec_lane_mapping3_ll_r),
    .signal_out   (stat_rx_rsfec_lane_mapping3_ll_r_sync)
  );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (20)
  ) i_cmac_usplus_0_reg_stat_rx_mf_repeat_err_lh_r_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_mf_repeat_err_lh_r),
    .signal_out   (stat_rx_mf_repeat_err_lh_r_sync)
  );

  wire [19:0] stat_rx_pcsl_demuxed_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (20)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_demuxed_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_demuxed),
    .signal_out   (stat_rx_pcsl_demuxed_sync)
  );

  wire [4:0] stat_rx_pcsl_number_0_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_0_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_0),
    .signal_out   (stat_rx_pcsl_number_0_sync)
  );

  wire [4:0] stat_rx_pcsl_number_1_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_1_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_1),
    .signal_out   (stat_rx_pcsl_number_1_sync)
  );

  wire [4:0] stat_rx_pcsl_number_2_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_2_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_2),
    .signal_out   (stat_rx_pcsl_number_2_sync)
  );

  wire [4:0] stat_rx_pcsl_number_3_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_3_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_3),
    .signal_out   (stat_rx_pcsl_number_3_sync)
  );

  wire [4:0] stat_rx_pcsl_number_4_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_4_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_4),
    .signal_out   (stat_rx_pcsl_number_4_sync)
  );

  wire [4:0] stat_rx_pcsl_number_5_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_5_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_5),
    .signal_out   (stat_rx_pcsl_number_5_sync)
  );

  wire [4:0] stat_rx_pcsl_number_6_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_6_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_6),
    .signal_out   (stat_rx_pcsl_number_6_sync)
  );

  wire [4:0] stat_rx_pcsl_number_7_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_7_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_7),
    .signal_out   (stat_rx_pcsl_number_7_sync)
  );

  wire [4:0] stat_rx_pcsl_number_8_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_8_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_8),
    .signal_out   (stat_rx_pcsl_number_8_sync)
  );

  wire [4:0] stat_rx_pcsl_number_9_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_9_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_9),
    .signal_out   (stat_rx_pcsl_number_9_sync)
  );

  wire [4:0] stat_rx_pcsl_number_10_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_10_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_10),
    .signal_out   (stat_rx_pcsl_number_10_sync)
  );

  wire [4:0] stat_rx_pcsl_number_11_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_11_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_11),
    .signal_out   (stat_rx_pcsl_number_11_sync)
  );

  wire [4:0] stat_rx_pcsl_number_12_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_12_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_12),
    .signal_out   (stat_rx_pcsl_number_12_sync)
  );

  wire [4:0] stat_rx_pcsl_number_13_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_13_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_13),
    .signal_out   (stat_rx_pcsl_number_13_sync)
  );

  wire [4:0] stat_rx_pcsl_number_14_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_14_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_14),
    .signal_out   (stat_rx_pcsl_number_14_sync)
  );

  wire [4:0] stat_rx_pcsl_number_15_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_15_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_15),
    .signal_out   (stat_rx_pcsl_number_15_sync)
  );

  wire [4:0] stat_rx_pcsl_number_16_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_16_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_16),
    .signal_out   (stat_rx_pcsl_number_16_sync)
  );

  wire [4:0] stat_rx_pcsl_number_17_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_17_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_17),
    .signal_out   (stat_rx_pcsl_number_17_sync)
  );

  wire [4:0] stat_rx_pcsl_number_18_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_18_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_18),
    .signal_out   (stat_rx_pcsl_number_18_sync)
  );

  wire [4:0] stat_rx_pcsl_number_19_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (5)
  ) i_cmac_usplus_0_reg_stat_rx_pcsl_number_19_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_pcsl_number_19),
    .signal_out   (stat_rx_pcsl_number_19_sync)
  );

  wire [7:0] stat_rx_lane0_vlm_bip7_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (8)
  ) i_cmac_usplus_0_reg_stat_rx_lane0_vlm_bip7_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_lane0_vlm_bip7),
    .signal_out   (stat_rx_lane0_vlm_bip7_sync)
  );

  wire  stat_rx_lane0_vlm_bip7_valid_sync;
  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (1)
  ) i_cmac_usplus_0_reg_stat_rx_lane0_vlm_bip7_valid_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (stat_rx_lane0_vlm_bip7_valid),
    .signal_out   (stat_rx_lane0_vlm_bip7_valid_sync)
  );

  ///////////////////////
  wire  [31:0]    STAT_CYCLE_COUNT_LSB;
  wire  [15:0]    STAT_CYCLE_COUNT_MSB;
  wire  [47:0]    STAT_CYCLE_COUNT_int;
  wire  [47:0]    STAT_CYCLE_COUNT_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_cycle_count_accumulator (
      .clk      ( tx_usrclk2 ),
      .reset    ( tx_reset_done_inv ),
      .PM_tick  ( tx_usrclk2_tick_r ),
      .pulsein  ( 1'b1 ),
      .statsout ( STAT_CYCLE_COUNT_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_cycle_count_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_CYCLE_COUNT_int),
    .signal_out   (STAT_CYCLE_COUNT_int_sync)
  );

  assign   STAT_CYCLE_COUNT_LSB = STAT_CYCLE_COUNT_int_sync[31:0];
  assign   STAT_CYCLE_COUNT_MSB = STAT_CYCLE_COUNT_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_0_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_0_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_0_int;
  wire  [47:0]    STAT_RX_BIP_ERR_0_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_0_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_0 ),
      .statsout ( STAT_RX_BIP_ERR_0_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_bip_err_0_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_0_int),
    .signal_out   (STAT_RX_BIP_ERR_0_int_sync)
  );

  assign   STAT_RX_BIP_ERR_0_LSB = STAT_RX_BIP_ERR_0_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_0_MSB = STAT_RX_BIP_ERR_0_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_1_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_1_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_1_int;
  wire  [47:0]    STAT_RX_BIP_ERR_1_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_1_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_1 ),
      .statsout ( STAT_RX_BIP_ERR_1_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_1_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_1_int),
    .signal_out   (STAT_RX_BIP_ERR_1_int_sync)
  );

  assign   STAT_RX_BIP_ERR_1_LSB = STAT_RX_BIP_ERR_1_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_1_MSB = STAT_RX_BIP_ERR_1_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_2_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_2_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_2_int;
  wire  [47:0]    STAT_RX_BIP_ERR_2_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_2_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_2 ),
      .statsout ( STAT_RX_BIP_ERR_2_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_2_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_2_int),
    .signal_out   (STAT_RX_BIP_ERR_2_int_sync)
  );

  assign   STAT_RX_BIP_ERR_2_LSB = STAT_RX_BIP_ERR_2_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_2_MSB = STAT_RX_BIP_ERR_2_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_3_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_3_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_3_int;
  wire  [47:0]    STAT_RX_BIP_ERR_3_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_3_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_3 ),
      .statsout ( STAT_RX_BIP_ERR_3_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_3_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_3_int),
    .signal_out   (STAT_RX_BIP_ERR_3_int_sync)
  );

  assign   STAT_RX_BIP_ERR_3_LSB = STAT_RX_BIP_ERR_3_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_3_MSB = STAT_RX_BIP_ERR_3_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_4_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_4_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_4_int;
  wire  [47:0]    STAT_RX_BIP_ERR_4_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_4_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_4 ),
      .statsout ( STAT_RX_BIP_ERR_4_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_4_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_4_int),
    .signal_out   (STAT_RX_BIP_ERR_4_int_sync)
  );

  assign   STAT_RX_BIP_ERR_4_LSB = STAT_RX_BIP_ERR_4_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_4_MSB = STAT_RX_BIP_ERR_4_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_5_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_5_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_5_int;
  wire  [47:0]    STAT_RX_BIP_ERR_5_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_5_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_5 ),
      .statsout ( STAT_RX_BIP_ERR_5_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_5_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_5_int),
    .signal_out   (STAT_RX_BIP_ERR_5_int_sync)
  );

  assign   STAT_RX_BIP_ERR_5_LSB = STAT_RX_BIP_ERR_5_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_5_MSB = STAT_RX_BIP_ERR_5_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_6_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_6_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_6_int;
  wire  [47:0]    STAT_RX_BIP_ERR_6_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_6_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_6 ),
      .statsout ( STAT_RX_BIP_ERR_6_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_6_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_6_int),
    .signal_out   (STAT_RX_BIP_ERR_6_int_sync)
  );

  assign   STAT_RX_BIP_ERR_6_LSB = STAT_RX_BIP_ERR_6_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_6_MSB = STAT_RX_BIP_ERR_6_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_7_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_7_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_7_int;
  wire  [47:0]    STAT_RX_BIP_ERR_7_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_7_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_7 ),
      .statsout ( STAT_RX_BIP_ERR_7_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_7_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_7_int),
    .signal_out   (STAT_RX_BIP_ERR_7_int_sync)
  );

  assign   STAT_RX_BIP_ERR_7_LSB = STAT_RX_BIP_ERR_7_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_7_MSB = STAT_RX_BIP_ERR_7_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_8_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_8_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_8_int;
  wire  [47:0]    STAT_RX_BIP_ERR_8_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_8_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_8 ),
      .statsout ( STAT_RX_BIP_ERR_8_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_8_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_8_int),
    .signal_out   (STAT_RX_BIP_ERR_8_int_sync)
  );

  assign   STAT_RX_BIP_ERR_8_LSB = STAT_RX_BIP_ERR_8_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_8_MSB = STAT_RX_BIP_ERR_8_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_9_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_9_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_9_int;
  wire  [47:0]    STAT_RX_BIP_ERR_9_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_9_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_9 ),
      .statsout ( STAT_RX_BIP_ERR_9_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_9_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_9_int),
    .signal_out   (STAT_RX_BIP_ERR_9_int_sync)
  );

  assign   STAT_RX_BIP_ERR_9_LSB = STAT_RX_BIP_ERR_9_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_9_MSB = STAT_RX_BIP_ERR_9_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_10_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_10_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_10_int;
  wire  [47:0]    STAT_RX_BIP_ERR_10_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_10_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_10 ),
      .statsout ( STAT_RX_BIP_ERR_10_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_10_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_10_int),
    .signal_out   (STAT_RX_BIP_ERR_10_int_sync)
  );

  assign   STAT_RX_BIP_ERR_10_LSB = STAT_RX_BIP_ERR_10_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_10_MSB = STAT_RX_BIP_ERR_10_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_11_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_11_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_11_int;
  wire  [47:0]    STAT_RX_BIP_ERR_11_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_11_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_11 ),
      .statsout ( STAT_RX_BIP_ERR_11_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_11_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_11_int),
    .signal_out   (STAT_RX_BIP_ERR_11_int_sync)
  );

  assign   STAT_RX_BIP_ERR_11_LSB = STAT_RX_BIP_ERR_11_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_11_MSB = STAT_RX_BIP_ERR_11_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_12_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_12_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_12_int;
  wire  [47:0]    STAT_RX_BIP_ERR_12_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_12_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_12 ),
      .statsout ( STAT_RX_BIP_ERR_12_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_12_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_12_int),
    .signal_out   (STAT_RX_BIP_ERR_12_int_sync)
  );

  assign   STAT_RX_BIP_ERR_12_LSB = STAT_RX_BIP_ERR_12_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_12_MSB = STAT_RX_BIP_ERR_12_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_13_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_13_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_13_int;
  wire  [47:0]    STAT_RX_BIP_ERR_13_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_13_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_13 ),
      .statsout ( STAT_RX_BIP_ERR_13_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_13_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_13_int),
    .signal_out   (STAT_RX_BIP_ERR_13_int_sync)
  );

  assign   STAT_RX_BIP_ERR_13_LSB = STAT_RX_BIP_ERR_13_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_13_MSB = STAT_RX_BIP_ERR_13_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_14_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_14_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_14_int;
  wire  [47:0]    STAT_RX_BIP_ERR_14_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_14_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_14 ),
      .statsout ( STAT_RX_BIP_ERR_14_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_14_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_14_int),
    .signal_out   (STAT_RX_BIP_ERR_14_int_sync)
  );

  assign   STAT_RX_BIP_ERR_14_LSB = STAT_RX_BIP_ERR_14_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_14_MSB = STAT_RX_BIP_ERR_14_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_15_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_15_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_15_int;
  wire  [47:0]    STAT_RX_BIP_ERR_15_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_15_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_15 ),
      .statsout ( STAT_RX_BIP_ERR_15_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_15_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_15_int),
    .signal_out   (STAT_RX_BIP_ERR_15_int_sync)
  );

  assign   STAT_RX_BIP_ERR_15_LSB = STAT_RX_BIP_ERR_15_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_15_MSB = STAT_RX_BIP_ERR_15_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_16_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_16_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_16_int;
  wire  [47:0]    STAT_RX_BIP_ERR_16_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_16_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_16 ),
      .statsout ( STAT_RX_BIP_ERR_16_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_16_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_16_int),
    .signal_out   (STAT_RX_BIP_ERR_16_int_sync)
  );

  assign   STAT_RX_BIP_ERR_16_LSB = STAT_RX_BIP_ERR_16_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_16_MSB = STAT_RX_BIP_ERR_16_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_17_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_17_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_17_int;
  wire  [47:0]    STAT_RX_BIP_ERR_17_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_17_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_17 ),
      .statsout ( STAT_RX_BIP_ERR_17_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_17_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_17_int),
    .signal_out   (STAT_RX_BIP_ERR_17_int_sync)
  );

  assign   STAT_RX_BIP_ERR_17_LSB = STAT_RX_BIP_ERR_17_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_17_MSB = STAT_RX_BIP_ERR_17_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_18_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_18_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_18_int;
  wire  [47:0]    STAT_RX_BIP_ERR_18_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_18_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_18 ),
      .statsout ( STAT_RX_BIP_ERR_18_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_18_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_18_int),
    .signal_out   (STAT_RX_BIP_ERR_18_int_sync)
  );

  assign   STAT_RX_BIP_ERR_18_LSB = STAT_RX_BIP_ERR_18_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_18_MSB = STAT_RX_BIP_ERR_18_int_sync[47:32];

  wire  [31:0]    STAT_RX_BIP_ERR_19_LSB;
  wire  [15:0]    STAT_RX_BIP_ERR_19_MSB;
  wire  [47:0]    STAT_RX_BIP_ERR_19_int;
  wire  [47:0]    STAT_RX_BIP_ERR_19_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bip_err_19_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bip_err_19 ),
      .statsout ( STAT_RX_BIP_ERR_19_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_stat_rx_bip_err_19_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BIP_ERR_19_int),
    .signal_out   (STAT_RX_BIP_ERR_19_int_sync)
  );

  assign   STAT_RX_BIP_ERR_19_LSB = STAT_RX_BIP_ERR_19_int_sync[31:0];
  assign   STAT_RX_BIP_ERR_19_MSB = STAT_RX_BIP_ERR_19_int_sync[47:32];

//////////
  wire  [31:0]    STAT_RX_FRAMING_ERR_0_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_0_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_0_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_0_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_0_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_0 & {2{stat_rx_framing_err_valid_0}} ),
      .statsout ( STAT_RX_FRAMING_ERR_0_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_0_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_0_int),
    .signal_out   (STAT_RX_FRAMING_ERR_0_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_0_LSB = STAT_RX_FRAMING_ERR_0_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_0_MSB = STAT_RX_FRAMING_ERR_0_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_1_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_1_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_1_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_1_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_1_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_1 & {2{stat_rx_framing_err_valid_1}} ),
      .statsout ( STAT_RX_FRAMING_ERR_1_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_1_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_1_int),
    .signal_out   (STAT_RX_FRAMING_ERR_1_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_1_LSB = STAT_RX_FRAMING_ERR_1_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_1_MSB = STAT_RX_FRAMING_ERR_1_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_2_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_2_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_2_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_2_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_2_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_2 & {2{stat_rx_framing_err_valid_2}} ),
      .statsout ( STAT_RX_FRAMING_ERR_2_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_2_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_2_int),
    .signal_out   (STAT_RX_FRAMING_ERR_2_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_2_LSB = STAT_RX_FRAMING_ERR_2_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_2_MSB = STAT_RX_FRAMING_ERR_2_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_3_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_3_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_3_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_3_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_3_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_3 & {2{stat_rx_framing_err_valid_3}} ),
      .statsout ( STAT_RX_FRAMING_ERR_3_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_3_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_3_int),
    .signal_out   (STAT_RX_FRAMING_ERR_3_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_3_LSB = STAT_RX_FRAMING_ERR_3_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_3_MSB = STAT_RX_FRAMING_ERR_3_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_4_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_4_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_4_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_4_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_4_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_4 & {2{stat_rx_framing_err_valid_4}}),
      .statsout ( STAT_RX_FRAMING_ERR_4_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_4_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_4_int),
    .signal_out   (STAT_RX_FRAMING_ERR_4_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_4_LSB = STAT_RX_FRAMING_ERR_4_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_4_MSB = STAT_RX_FRAMING_ERR_4_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_5_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_5_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_5_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_5_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_5_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_5 & {2{stat_rx_framing_err_valid_5}} ),
      .statsout ( STAT_RX_FRAMING_ERR_5_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_5_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_5_int),
    .signal_out   (STAT_RX_FRAMING_ERR_5_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_5_LSB = STAT_RX_FRAMING_ERR_5_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_5_MSB = STAT_RX_FRAMING_ERR_5_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_6_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_6_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_6_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_6_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_6_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_6 & {2{stat_rx_framing_err_valid_6}} ),
      .statsout ( STAT_RX_FRAMING_ERR_6_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_6_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_6_int),
    .signal_out   (STAT_RX_FRAMING_ERR_6_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_6_LSB = STAT_RX_FRAMING_ERR_6_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_6_MSB = STAT_RX_FRAMING_ERR_6_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_7_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_7_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_7_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_7_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_7_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_7 & {2{stat_rx_framing_err_valid_7}} ),
      .statsout ( STAT_RX_FRAMING_ERR_7_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_7_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_7_int),
    .signal_out   (STAT_RX_FRAMING_ERR_7_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_7_LSB = STAT_RX_FRAMING_ERR_7_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_7_MSB = STAT_RX_FRAMING_ERR_7_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_8_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_8_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_8_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_8_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_8_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_8 & {2{stat_rx_framing_err_valid_8}} ),
      .statsout ( STAT_RX_FRAMING_ERR_8_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_8_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_8_int),
    .signal_out   (STAT_RX_FRAMING_ERR_8_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_8_LSB = STAT_RX_FRAMING_ERR_8_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_8_MSB = STAT_RX_FRAMING_ERR_8_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_9_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_9_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_9_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_9_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_9_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_9 & {2{stat_rx_framing_err_valid_9}} ),
      .statsout ( STAT_RX_FRAMING_ERR_9_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_9_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_9_int),
    .signal_out   (STAT_RX_FRAMING_ERR_9_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_9_LSB = STAT_RX_FRAMING_ERR_9_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_9_MSB = STAT_RX_FRAMING_ERR_9_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_10_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_10_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_10_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_10_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_10_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_10 & {2{stat_rx_framing_err_valid_10}} ),
      .statsout ( STAT_RX_FRAMING_ERR_10_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_10_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_10_int),
    .signal_out   (STAT_RX_FRAMING_ERR_10_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_10_LSB = STAT_RX_FRAMING_ERR_10_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_10_MSB = STAT_RX_FRAMING_ERR_10_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_11_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_11_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_11_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_11_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_11_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_11 & {2{stat_rx_framing_err_valid_11}} ),
      .statsout ( STAT_RX_FRAMING_ERR_11_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_11_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_11_int),
    .signal_out   (STAT_RX_FRAMING_ERR_11_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_11_LSB = STAT_RX_FRAMING_ERR_11_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_11_MSB = STAT_RX_FRAMING_ERR_11_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_12_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_12_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_12_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_12_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_12_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_12 & {2{stat_rx_framing_err_valid_12}} ),
      .statsout ( STAT_RX_FRAMING_ERR_12_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_12_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_12_int),
    .signal_out   (STAT_RX_FRAMING_ERR_12_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_12_LSB = STAT_RX_FRAMING_ERR_12_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_12_MSB = STAT_RX_FRAMING_ERR_12_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_13_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_13_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_13_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_13_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_13_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_13 & {2{stat_rx_framing_err_valid_13}} ),
      .statsout ( STAT_RX_FRAMING_ERR_13_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_13_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_13_int),
    .signal_out   (STAT_RX_FRAMING_ERR_13_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_13_LSB = STAT_RX_FRAMING_ERR_13_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_13_MSB = STAT_RX_FRAMING_ERR_13_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_14_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_14_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_14_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_14_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_14_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_14 & {2{stat_rx_framing_err_valid_14}} ),
      .statsout ( STAT_RX_FRAMING_ERR_14_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_14_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_14_int),
    .signal_out   (STAT_RX_FRAMING_ERR_14_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_14_LSB = STAT_RX_FRAMING_ERR_14_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_14_MSB = STAT_RX_FRAMING_ERR_14_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_15_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_15_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_15_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_15_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_15_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_15 & {2{stat_rx_framing_err_valid_15}} ),
      .statsout ( STAT_RX_FRAMING_ERR_15_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_15_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_15_int),
    .signal_out   (STAT_RX_FRAMING_ERR_15_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_15_LSB = STAT_RX_FRAMING_ERR_15_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_15_MSB = STAT_RX_FRAMING_ERR_15_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_16_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_16_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_16_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_16_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_16_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_16 & {2{stat_rx_framing_err_valid_16}} ),
      .statsout ( STAT_RX_FRAMING_ERR_16_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_16_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_16_int),
    .signal_out   (STAT_RX_FRAMING_ERR_16_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_16_LSB = STAT_RX_FRAMING_ERR_16_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_16_MSB = STAT_RX_FRAMING_ERR_16_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_17_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_17_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_17_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_17_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_17_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_17 & {2{stat_rx_framing_err_valid_17}} ),
      .statsout ( STAT_RX_FRAMING_ERR_17_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_17_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_17_int),
    .signal_out   (STAT_RX_FRAMING_ERR_17_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_17_LSB = STAT_RX_FRAMING_ERR_17_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_17_MSB = STAT_RX_FRAMING_ERR_17_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_18_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_18_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_18_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_18_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_18_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_18 & {2{stat_rx_framing_err_valid_18}} ),
      .statsout ( STAT_RX_FRAMING_ERR_18_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_18_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_18_int),
    .signal_out   (STAT_RX_FRAMING_ERR_18_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_18_LSB = STAT_RX_FRAMING_ERR_18_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_18_MSB = STAT_RX_FRAMING_ERR_18_int_sync[47:32];

  wire  [31:0]    STAT_RX_FRAMING_ERR_19_LSB;
  wire  [15:0]    STAT_RX_FRAMING_ERR_19_MSB;
  wire  [47:0]    STAT_RX_FRAMING_ERR_19_int;
  wire  [47:0]    STAT_RX_FRAMING_ERR_19_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(2),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_framing_err_19_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_framing_err_19 & {2{stat_rx_framing_err_valid_19}} ),
      .statsout ( STAT_RX_FRAMING_ERR_19_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_framing_err_19_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAMING_ERR_19_int),
    .signal_out   (STAT_RX_FRAMING_ERR_19_int_sync)
  );

  assign   STAT_RX_FRAMING_ERR_19_LSB = STAT_RX_FRAMING_ERR_19_int_sync[31:0];
  assign   STAT_RX_FRAMING_ERR_19_MSB = STAT_RX_FRAMING_ERR_19_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_BAD_CODE_LSB;
  wire  [15:0]    STAT_RX_BAD_CODE_MSB;
  wire  [47:0]    STAT_RX_BAD_CODE_int;
  wire  [47:0]    STAT_RX_BAD_CODE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bad_code_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bad_code ),
      .statsout ( STAT_RX_BAD_CODE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_bad_code_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BAD_CODE_int),
    .signal_out   (STAT_RX_BAD_CODE_int_sync)
  );

  assign   STAT_RX_BAD_CODE_LSB = STAT_RX_BAD_CODE_int_sync[31:0];
  assign   STAT_RX_BAD_CODE_MSB = STAT_RX_BAD_CODE_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_FRAME_ERROR_LSB;
  wire  [15:0]    STAT_TX_FRAME_ERROR_MSB;
  wire  [47:0]    STAT_TX_FRAME_ERROR_int;
  wire  [47:0]    STAT_TX_FRAME_ERROR_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_frame_error_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_frame_error ),
      .statsout ( STAT_TX_FRAME_ERROR_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_frame_error_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_FRAME_ERROR_int),
    .signal_out   (STAT_TX_FRAME_ERROR_int_sync)
  );

  assign   STAT_TX_FRAME_ERROR_LSB = STAT_TX_FRAME_ERROR_int_sync[31:0];
  assign   STAT_TX_FRAME_ERROR_MSB = STAT_TX_FRAME_ERROR_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_TOTAL_PACKETS_LSB;
  wire  [15:0]    STAT_TX_TOTAL_PACKETS_MSB;
  wire  [47:0]    STAT_TX_TOTAL_PACKETS_int;
  wire  [47:0]    STAT_TX_TOTAL_PACKETS_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_total_packets_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_total_packets ),
      .statsout ( STAT_TX_TOTAL_PACKETS_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_total_packets_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_TOTAL_PACKETS_int),
    .signal_out   (STAT_TX_TOTAL_PACKETS_int_sync)
  );

  assign   STAT_TX_TOTAL_PACKETS_LSB = STAT_TX_TOTAL_PACKETS_int_sync[31:0];
  assign   STAT_TX_TOTAL_PACKETS_MSB = STAT_TX_TOTAL_PACKETS_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_TOTAL_GOOD_PACKETS_LSB;
  wire  [15:0]    STAT_TX_TOTAL_GOOD_PACKETS_MSB;
  wire  [47:0]    STAT_TX_TOTAL_GOOD_PACKETS_int;
  wire  [47:0]    STAT_TX_TOTAL_GOOD_PACKETS_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_total_good_packets_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_total_good_packets ),
      .statsout ( STAT_TX_TOTAL_GOOD_PACKETS_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_total_good_packets_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_TOTAL_GOOD_PACKETS_int),
    .signal_out   (STAT_TX_TOTAL_GOOD_PACKETS_int_sync)
  );

  assign   STAT_TX_TOTAL_GOOD_PACKETS_LSB = STAT_TX_TOTAL_GOOD_PACKETS_int_sync[31:0];
  assign   STAT_TX_TOTAL_GOOD_PACKETS_MSB = STAT_TX_TOTAL_GOOD_PACKETS_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_TOTAL_BYTES_LSB;
  wire  [15:0]    STAT_TX_TOTAL_BYTES_MSB;
  wire  [47:0]    STAT_TX_TOTAL_BYTES_int;
  wire  [47:0]    STAT_TX_TOTAL_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(6),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_total_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_total_bytes ),
      .statsout ( STAT_TX_TOTAL_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_total_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_TOTAL_BYTES_int),
    .signal_out   (STAT_TX_TOTAL_BYTES_int_sync)
  );

  assign   STAT_TX_TOTAL_BYTES_LSB = STAT_TX_TOTAL_BYTES_int_sync[31:0];
  assign   STAT_TX_TOTAL_BYTES_MSB = STAT_TX_TOTAL_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_TOTAL_GOOD_BYTES_LSB;
  wire  [15:0]    STAT_TX_TOTAL_GOOD_BYTES_MSB;
  wire  [47:0]    STAT_TX_TOTAL_GOOD_BYTES_int;
  wire  [47:0]    STAT_TX_TOTAL_GOOD_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(14),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_total_good_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_total_good_bytes ),
      .statsout ( STAT_TX_TOTAL_GOOD_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_total_good_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_TOTAL_GOOD_BYTES_int),
    .signal_out   (STAT_TX_TOTAL_GOOD_BYTES_int_sync)
  );

  assign   STAT_TX_TOTAL_GOOD_BYTES_LSB = STAT_TX_TOTAL_GOOD_BYTES_int_sync[31:0];
  assign   STAT_TX_TOTAL_GOOD_BYTES_MSB = STAT_TX_TOTAL_GOOD_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_64_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_64_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_64_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_64_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_64_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_64_bytes ),
      .statsout ( STAT_TX_PACKET_64_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_64_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_64_BYTES_int),
    .signal_out   (STAT_TX_PACKET_64_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_64_BYTES_LSB = STAT_TX_PACKET_64_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_64_BYTES_MSB = STAT_TX_PACKET_64_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_65_127_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_65_127_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_65_127_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_65_127_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_65_127_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_65_127_bytes ),
      .statsout ( STAT_TX_PACKET_65_127_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_65_127_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_65_127_BYTES_int),
    .signal_out   (STAT_TX_PACKET_65_127_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_65_127_BYTES_LSB = STAT_TX_PACKET_65_127_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_65_127_BYTES_MSB = STAT_TX_PACKET_65_127_BYTES_int_sync[47:32];


//////////

  wire  [31:0]    STAT_TX_PACKET_128_255_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_128_255_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_128_255_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_128_255_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_128_255_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_128_255_bytes ),
      .statsout ( STAT_TX_PACKET_128_255_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_128_255_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_128_255_BYTES_int),
    .signal_out   (STAT_TX_PACKET_128_255_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_128_255_BYTES_LSB = STAT_TX_PACKET_128_255_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_128_255_BYTES_MSB = STAT_TX_PACKET_128_255_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_256_511_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_256_511_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_256_511_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_256_511_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_256_511_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_256_511_bytes ),
      .statsout ( STAT_TX_PACKET_256_511_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_256_511_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_256_511_BYTES_int),
    .signal_out   (STAT_TX_PACKET_256_511_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_256_511_BYTES_LSB = STAT_TX_PACKET_256_511_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_256_511_BYTES_MSB = STAT_TX_PACKET_256_511_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_512_1023_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_512_1023_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_512_1023_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_512_1023_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_512_1023_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_512_1023_bytes ),
      .statsout ( STAT_TX_PACKET_512_1023_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_512_1023_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_512_1023_BYTES_int),
    .signal_out   (STAT_TX_PACKET_512_1023_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_512_1023_BYTES_LSB = STAT_TX_PACKET_512_1023_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_512_1023_BYTES_MSB = STAT_TX_PACKET_512_1023_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_1024_1518_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_1024_1518_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_1024_1518_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_1024_1518_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_1024_1518_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_1024_1518_bytes ),
      .statsout ( STAT_TX_PACKET_1024_1518_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_1024_1518_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_1024_1518_BYTES_int),
    .signal_out   (STAT_TX_PACKET_1024_1518_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_1024_1518_BYTES_LSB = STAT_TX_PACKET_1024_1518_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_1024_1518_BYTES_MSB = STAT_TX_PACKET_1024_1518_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_1519_1522_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_1519_1522_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_1519_1522_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_1519_1522_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_1519_1522_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_1519_1522_bytes ),
      .statsout ( STAT_TX_PACKET_1519_1522_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_1519_1522_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_1519_1522_BYTES_int),
    .signal_out   (STAT_TX_PACKET_1519_1522_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_1519_1522_BYTES_LSB = STAT_TX_PACKET_1519_1522_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_1519_1522_BYTES_MSB = STAT_TX_PACKET_1519_1522_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_1523_1548_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_1523_1548_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_1523_1548_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_1523_1548_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_1523_1548_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_1523_1548_bytes ),
      .statsout ( STAT_TX_PACKET_1523_1548_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_1523_1548_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_1523_1548_BYTES_int),
    .signal_out   (STAT_TX_PACKET_1523_1548_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_1523_1548_BYTES_LSB = STAT_TX_PACKET_1523_1548_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_1523_1548_BYTES_MSB = STAT_TX_PACKET_1523_1548_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_1549_2047_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_1549_2047_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_1549_2047_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_1549_2047_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_1549_2047_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_1549_2047_bytes ),
      .statsout ( STAT_TX_PACKET_1549_2047_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_1549_2047_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_1549_2047_BYTES_int),
    .signal_out   (STAT_TX_PACKET_1549_2047_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_1549_2047_BYTES_LSB = STAT_TX_PACKET_1549_2047_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_1549_2047_BYTES_MSB = STAT_TX_PACKET_1549_2047_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_2048_4095_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_2048_4095_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_2048_4095_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_2048_4095_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_2048_4095_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_2048_4095_bytes ),
      .statsout ( STAT_TX_PACKET_2048_4095_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_2048_4095_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_2048_4095_BYTES_int),
    .signal_out   (STAT_TX_PACKET_2048_4095_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_2048_4095_BYTES_LSB = STAT_TX_PACKET_2048_4095_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_2048_4095_BYTES_MSB = STAT_TX_PACKET_2048_4095_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_4096_8191_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_4096_8191_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_4096_8191_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_4096_8191_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_4096_8191_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_4096_8191_bytes ),
      .statsout ( STAT_TX_PACKET_4096_8191_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_4096_8191_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_4096_8191_BYTES_int),
    .signal_out   (STAT_TX_PACKET_4096_8191_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_4096_8191_BYTES_LSB = STAT_TX_PACKET_4096_8191_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_4096_8191_BYTES_MSB = STAT_TX_PACKET_4096_8191_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_8192_9215_BYTES_LSB;
  wire  [15:0]    STAT_TX_PACKET_8192_9215_BYTES_MSB;
  wire  [47:0]    STAT_TX_PACKET_8192_9215_BYTES_int;
  wire  [47:0]    STAT_TX_PACKET_8192_9215_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_8192_9215_bytes_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_8192_9215_bytes ),
      .statsout ( STAT_TX_PACKET_8192_9215_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_8192_9215_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_8192_9215_BYTES_int),
    .signal_out   (STAT_TX_PACKET_8192_9215_BYTES_int_sync)
  );

  assign   STAT_TX_PACKET_8192_9215_BYTES_LSB = STAT_TX_PACKET_8192_9215_BYTES_int_sync[31:0];
  assign   STAT_TX_PACKET_8192_9215_BYTES_MSB = STAT_TX_PACKET_8192_9215_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_LARGE_LSB;
  wire  [15:0]    STAT_TX_PACKET_LARGE_MSB;
  wire  [47:0]    STAT_TX_PACKET_LARGE_int;
  wire  [47:0]    STAT_TX_PACKET_LARGE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_large_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_large ),
      .statsout ( STAT_TX_PACKET_LARGE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_large_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_LARGE_int),
    .signal_out   (STAT_TX_PACKET_LARGE_int_sync)
  );

  assign   STAT_TX_PACKET_LARGE_LSB = STAT_TX_PACKET_LARGE_int_sync[31:0];
  assign   STAT_TX_PACKET_LARGE_MSB = STAT_TX_PACKET_LARGE_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PACKET_SMALL_LSB;
  wire  [15:0]    STAT_TX_PACKET_SMALL_MSB;
  wire  [47:0]    STAT_TX_PACKET_SMALL_int;
  wire  [47:0]    STAT_TX_PACKET_SMALL_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_packet_small_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_packet_small ),
      .statsout ( STAT_TX_PACKET_SMALL_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_packet_small_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PACKET_SMALL_int),
    .signal_out   (STAT_TX_PACKET_SMALL_int_sync)
  );

  assign   STAT_TX_PACKET_SMALL_LSB = STAT_TX_PACKET_SMALL_int_sync[31:0];
  assign   STAT_TX_PACKET_SMALL_MSB = STAT_TX_PACKET_SMALL_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_BAD_FCS_LSB;
  wire  [15:0]    STAT_TX_BAD_FCS_MSB;
  wire  [47:0]    STAT_TX_BAD_FCS_int;
  wire  [47:0]    STAT_TX_BAD_FCS_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_bad_fcs_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_bad_fcs ),
      .statsout ( STAT_TX_BAD_FCS_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_bad_fcs_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_BAD_FCS_int),
    .signal_out   (STAT_TX_BAD_FCS_int_sync)
  );

  assign   STAT_TX_BAD_FCS_LSB = STAT_TX_BAD_FCS_int_sync[31:0];
  assign   STAT_TX_BAD_FCS_MSB = STAT_TX_BAD_FCS_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_UNICAST_LSB;
  wire  [15:0]    STAT_TX_UNICAST_MSB;
  wire  [47:0]    STAT_TX_UNICAST_int;
  wire  [47:0]    STAT_TX_UNICAST_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_unicast_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_unicast ),
      .statsout ( STAT_TX_UNICAST_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_unicast_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_UNICAST_int),
    .signal_out   (STAT_TX_UNICAST_int_sync)
  );

  assign   STAT_TX_UNICAST_LSB = STAT_TX_UNICAST_int_sync[31:0];
  assign   STAT_TX_UNICAST_MSB = STAT_TX_UNICAST_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_MULTICAST_LSB;
  wire  [15:0]    STAT_TX_MULTICAST_MSB;
  wire  [47:0]    STAT_TX_MULTICAST_int;
  wire  [47:0]    STAT_TX_MULTICAST_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_multicast_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_multicast ),
      .statsout ( STAT_TX_MULTICAST_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_cmac_stat_tx_multicast_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_MULTICAST_int),
    .signal_out   (STAT_TX_MULTICAST_int_sync)
  );

  assign   STAT_TX_MULTICAST_LSB = STAT_TX_MULTICAST_int_sync[31:0];
  assign   STAT_TX_MULTICAST_MSB = STAT_TX_MULTICAST_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_BROADCAST_LSB;
  wire  [15:0]    STAT_TX_BROADCAST_MSB;
  wire  [47:0]    STAT_TX_BROADCAST_int;
  wire  [47:0]    STAT_TX_BROADCAST_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_broadcast_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_broadcast ),
      .statsout ( STAT_TX_BROADCAST_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_tx_broadcast_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_BROADCAST_int),
    .signal_out   (STAT_TX_BROADCAST_int_sync)
  );

  assign   STAT_TX_BROADCAST_LSB = STAT_TX_BROADCAST_int_sync[31:0];
  assign   STAT_TX_BROADCAST_MSB = STAT_TX_BROADCAST_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_VLAN_LSB;
  wire  [15:0]    STAT_TX_VLAN_MSB;
  wire  [47:0]    STAT_TX_VLAN_int;
  wire  [47:0]    STAT_TX_VLAN_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_vlan_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_vlan ),
      .statsout ( STAT_TX_VLAN_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_tx_vlan_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_VLAN_int),
    .signal_out   (STAT_TX_VLAN_int_sync)
  );

  assign   STAT_TX_VLAN_LSB = STAT_TX_VLAN_int_sync[31:0];
  assign   STAT_TX_VLAN_MSB = STAT_TX_VLAN_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_PAUSE_LSB;
  wire  [15:0]    STAT_TX_PAUSE_MSB;
  wire  [47:0]    STAT_TX_PAUSE_int;
  wire  [47:0]    STAT_TX_PAUSE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_pause_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_pause ),
      .statsout ( STAT_TX_PAUSE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_tx_pause_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_PAUSE_int),
    .signal_out   (STAT_TX_PAUSE_int_sync)
  );

  assign   STAT_TX_PAUSE_LSB = STAT_TX_PAUSE_int_sync[31:0];
  assign   STAT_TX_PAUSE_MSB = STAT_TX_PAUSE_int_sync[47:32];

//////////

  wire  [31:0]    STAT_TX_USER_PAUSE_LSB;
  wire  [15:0]    STAT_TX_USER_PAUSE_MSB;
  wire  [47:0]    STAT_TX_USER_PAUSE_int;
  wire  [47:0]    STAT_TX_USER_PAUSE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_tx_user_pause_accumulator (
      .clk      ( tx_clk ),
      .reset    ( tx_reset ),
      .PM_tick  ( tx_clk_tick_r ),
      .pulsein  ( stat_tx_user_pause ),
      .statsout ( STAT_TX_USER_PAUSE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_tx_user_pause_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_TX_USER_PAUSE_int),
    .signal_out   (STAT_TX_USER_PAUSE_int_sync)
  );

  assign   STAT_TX_USER_PAUSE_LSB = STAT_TX_USER_PAUSE_int_sync[31:0];
  assign   STAT_TX_USER_PAUSE_MSB = STAT_TX_USER_PAUSE_int_sync[47:32];

//////////


//////////

  wire  [31:0]    STAT_RX_TOTAL_PACKETS_LSB;
  wire  [15:0]    STAT_RX_TOTAL_PACKETS_MSB;
  wire  [47:0]    STAT_RX_TOTAL_PACKETS_int;
  wire  [47:0]    STAT_RX_TOTAL_PACKETS_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_total_packets_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_total_packets ),
      .statsout ( STAT_RX_TOTAL_PACKETS_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_total_packets_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_TOTAL_PACKETS_int),
    .signal_out   (STAT_RX_TOTAL_PACKETS_int_sync)
  );

  assign   STAT_RX_TOTAL_PACKETS_LSB = STAT_RX_TOTAL_PACKETS_int_sync[31:0];
  assign   STAT_RX_TOTAL_PACKETS_MSB = STAT_RX_TOTAL_PACKETS_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_TOTAL_GOOD_PACKETS_LSB;
  wire  [15:0]    STAT_RX_TOTAL_GOOD_PACKETS_MSB;
  wire  [47:0]    STAT_RX_TOTAL_GOOD_PACKETS_int;
  wire  [47:0]    STAT_RX_TOTAL_GOOD_PACKETS_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_total_good_packets_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_total_good_packets ),
      .statsout ( STAT_RX_TOTAL_GOOD_PACKETS_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_total_good_packets_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_TOTAL_GOOD_PACKETS_int),
    .signal_out   (STAT_RX_TOTAL_GOOD_PACKETS_int_sync)
  );

  assign   STAT_RX_TOTAL_GOOD_PACKETS_LSB = STAT_RX_TOTAL_GOOD_PACKETS_int_sync[31:0];
  assign   STAT_RX_TOTAL_GOOD_PACKETS_MSB = STAT_RX_TOTAL_GOOD_PACKETS_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_TOTAL_BYTES_LSB;
  wire  [15:0]    STAT_RX_TOTAL_BYTES_MSB;
  wire  [47:0]    STAT_RX_TOTAL_BYTES_int;
  wire  [47:0]    STAT_RX_TOTAL_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(7),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_total_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_total_bytes ),
      .statsout ( STAT_RX_TOTAL_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_total_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_TOTAL_BYTES_int),
    .signal_out   (STAT_RX_TOTAL_BYTES_int_sync)
  );

  assign   STAT_RX_TOTAL_BYTES_LSB = STAT_RX_TOTAL_BYTES_int_sync[31:0];
  assign   STAT_RX_TOTAL_BYTES_MSB = STAT_RX_TOTAL_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_TOTAL_GOOD_BYTES_LSB;
  wire  [15:0]    STAT_RX_TOTAL_GOOD_BYTES_MSB;
  wire  [47:0]    STAT_RX_TOTAL_GOOD_BYTES_int;
  wire  [47:0]    STAT_RX_TOTAL_GOOD_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(14),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_total_good_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_total_good_bytes ),
      .statsout ( STAT_RX_TOTAL_GOOD_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_total_good_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_TOTAL_GOOD_BYTES_int),
    .signal_out   (STAT_RX_TOTAL_GOOD_BYTES_int_sync)
  );

  assign   STAT_RX_TOTAL_GOOD_BYTES_LSB = STAT_RX_TOTAL_GOOD_BYTES_int_sync[31:0];
  assign   STAT_RX_TOTAL_GOOD_BYTES_MSB = STAT_RX_TOTAL_GOOD_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_64_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_64_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_64_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_64_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_64_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_64_bytes ),
      .statsout ( STAT_RX_PACKET_64_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_64_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_64_BYTES_int),
    .signal_out   (STAT_RX_PACKET_64_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_64_BYTES_LSB = STAT_RX_PACKET_64_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_64_BYTES_MSB = STAT_RX_PACKET_64_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_65_127_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_65_127_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_65_127_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_65_127_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_65_127_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_65_127_bytes ),
      .statsout ( STAT_RX_PACKET_65_127_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_65_127_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_65_127_BYTES_int),
    .signal_out   (STAT_RX_PACKET_65_127_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_65_127_BYTES_LSB = STAT_RX_PACKET_65_127_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_65_127_BYTES_MSB = STAT_RX_PACKET_65_127_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_128_255_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_128_255_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_128_255_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_128_255_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_128_255_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_128_255_bytes ),
      .statsout ( STAT_RX_PACKET_128_255_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_128_255_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_128_255_BYTES_int),
    .signal_out   (STAT_RX_PACKET_128_255_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_128_255_BYTES_LSB = STAT_RX_PACKET_128_255_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_128_255_BYTES_MSB = STAT_RX_PACKET_128_255_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_256_511_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_256_511_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_256_511_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_256_511_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_256_511_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_256_511_bytes ),
      .statsout ( STAT_RX_PACKET_256_511_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_256_511_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_256_511_BYTES_int),
    .signal_out   (STAT_RX_PACKET_256_511_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_256_511_BYTES_LSB = STAT_RX_PACKET_256_511_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_256_511_BYTES_MSB = STAT_RX_PACKET_256_511_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_512_1023_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_512_1023_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_512_1023_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_512_1023_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_512_1023_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_512_1023_bytes ),
      .statsout ( STAT_RX_PACKET_512_1023_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_512_1023_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_512_1023_BYTES_int),
    .signal_out   (STAT_RX_PACKET_512_1023_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_512_1023_BYTES_LSB = STAT_RX_PACKET_512_1023_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_512_1023_BYTES_MSB = STAT_RX_PACKET_512_1023_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_1024_1518_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_1024_1518_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_1024_1518_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_1024_1518_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_1024_1518_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_1024_1518_bytes ),
      .statsout ( STAT_RX_PACKET_1024_1518_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_1024_1518_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_1024_1518_BYTES_int),
    .signal_out   (STAT_RX_PACKET_1024_1518_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_1024_1518_BYTES_LSB = STAT_RX_PACKET_1024_1518_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_1024_1518_BYTES_MSB = STAT_RX_PACKET_1024_1518_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_1519_1522_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_1519_1522_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_1519_1522_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_1519_1522_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_1519_1522_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_1519_1522_bytes ),
      .statsout ( STAT_RX_PACKET_1519_1522_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_1519_1522_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_1519_1522_BYTES_int),
    .signal_out   (STAT_RX_PACKET_1519_1522_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_1519_1522_BYTES_LSB = STAT_RX_PACKET_1519_1522_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_1519_1522_BYTES_MSB = STAT_RX_PACKET_1519_1522_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_1523_1548_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_1523_1548_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_1523_1548_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_1523_1548_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_1523_1548_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_1523_1548_bytes ),
      .statsout ( STAT_RX_PACKET_1523_1548_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_1523_1548_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_1523_1548_BYTES_int),
    .signal_out   (STAT_RX_PACKET_1523_1548_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_1523_1548_BYTES_LSB = STAT_RX_PACKET_1523_1548_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_1523_1548_BYTES_MSB = STAT_RX_PACKET_1523_1548_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_1549_2047_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_1549_2047_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_1549_2047_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_1549_2047_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_1549_2047_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_1549_2047_bytes ),
      .statsout ( STAT_RX_PACKET_1549_2047_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_1549_2047_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_1549_2047_BYTES_int),
    .signal_out   (STAT_RX_PACKET_1549_2047_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_1549_2047_BYTES_LSB = STAT_RX_PACKET_1549_2047_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_1549_2047_BYTES_MSB = STAT_RX_PACKET_1549_2047_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_2048_4095_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_2048_4095_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_2048_4095_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_2048_4095_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_2048_4095_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_2048_4095_bytes ),
      .statsout ( STAT_RX_PACKET_2048_4095_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_2048_4095_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_2048_4095_BYTES_int),
    .signal_out   (STAT_RX_PACKET_2048_4095_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_2048_4095_BYTES_LSB = STAT_RX_PACKET_2048_4095_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_2048_4095_BYTES_MSB = STAT_RX_PACKET_2048_4095_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_4096_8191_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_4096_8191_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_4096_8191_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_4096_8191_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_4096_8191_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_4096_8191_bytes ),
      .statsout ( STAT_RX_PACKET_4096_8191_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_4096_8191_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_4096_8191_BYTES_int),
    .signal_out   (STAT_RX_PACKET_4096_8191_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_4096_8191_BYTES_LSB = STAT_RX_PACKET_4096_8191_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_4096_8191_BYTES_MSB = STAT_RX_PACKET_4096_8191_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_8192_9215_BYTES_LSB;
  wire  [15:0]    STAT_RX_PACKET_8192_9215_BYTES_MSB;
  wire  [47:0]    STAT_RX_PACKET_8192_9215_BYTES_int;
  wire  [47:0]    STAT_RX_PACKET_8192_9215_BYTES_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_8192_9215_bytes_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_8192_9215_bytes ),
      .statsout ( STAT_RX_PACKET_8192_9215_BYTES_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_8192_9215_bytes_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_8192_9215_BYTES_int),
    .signal_out   (STAT_RX_PACKET_8192_9215_BYTES_int_sync)
  );

  assign   STAT_RX_PACKET_8192_9215_BYTES_LSB = STAT_RX_PACKET_8192_9215_BYTES_int_sync[31:0];
  assign   STAT_RX_PACKET_8192_9215_BYTES_MSB = STAT_RX_PACKET_8192_9215_BYTES_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_LARGE_LSB;
  wire  [15:0]    STAT_RX_PACKET_LARGE_MSB;
  wire  [47:0]    STAT_RX_PACKET_LARGE_int;
  wire  [47:0]    STAT_RX_PACKET_LARGE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_large_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_large ),
      .statsout ( STAT_RX_PACKET_LARGE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_large_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_LARGE_int),
    .signal_out   (STAT_RX_PACKET_LARGE_int_sync)
  );

  assign   STAT_RX_PACKET_LARGE_LSB = STAT_RX_PACKET_LARGE_int_sync[31:0];
  assign   STAT_RX_PACKET_LARGE_MSB = STAT_RX_PACKET_LARGE_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_SMALL_LSB;
  wire  [15:0]    STAT_RX_PACKET_SMALL_MSB;
  wire  [47:0]    STAT_RX_PACKET_SMALL_int;
  wire  [47:0]    STAT_RX_PACKET_SMALL_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_small_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_small ),
      .statsout ( STAT_RX_PACKET_SMALL_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_small_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_SMALL_int),
    .signal_out   (STAT_RX_PACKET_SMALL_int_sync)
  );

  assign   STAT_RX_PACKET_SMALL_LSB = STAT_RX_PACKET_SMALL_int_sync[31:0];
  assign   STAT_RX_PACKET_SMALL_MSB = STAT_RX_PACKET_SMALL_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_UNDERSIZE_LSB;
  wire  [15:0]    STAT_RX_UNDERSIZE_MSB;
  wire  [47:0]    STAT_RX_UNDERSIZE_int;
  wire  [47:0]    STAT_RX_UNDERSIZE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_undersize_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_undersize ),
      .statsout ( STAT_RX_UNDERSIZE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_undersize_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_UNDERSIZE_int),
    .signal_out   (STAT_RX_UNDERSIZE_int_sync)
  );

  assign   STAT_RX_UNDERSIZE_LSB = STAT_RX_UNDERSIZE_int_sync[31:0];
  assign   STAT_RX_UNDERSIZE_MSB = STAT_RX_UNDERSIZE_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_FRAGMENT_LSB;
  wire  [15:0]    STAT_RX_FRAGMENT_MSB;
  wire  [47:0]    STAT_RX_FRAGMENT_int;
  wire  [47:0]    STAT_RX_FRAGMENT_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_fragment_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_fragment ),
      .statsout ( STAT_RX_FRAGMENT_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_fragment_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_FRAGMENT_int),
    .signal_out   (STAT_RX_FRAGMENT_int_sync)
  );

  assign   STAT_RX_FRAGMENT_LSB = STAT_RX_FRAGMENT_int_sync[31:0];
  assign   STAT_RX_FRAGMENT_MSB = STAT_RX_FRAGMENT_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_OVERSIZE_LSB;
  wire  [15:0]    STAT_RX_OVERSIZE_MSB;
  wire  [47:0]    STAT_RX_OVERSIZE_int;
  wire  [47:0]    STAT_RX_OVERSIZE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_oversize_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_oversize ),
      .statsout ( STAT_RX_OVERSIZE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_oversize_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_OVERSIZE_int),
    .signal_out   (STAT_RX_OVERSIZE_int_sync)
  );

  assign   STAT_RX_OVERSIZE_LSB = STAT_RX_OVERSIZE_int_sync[31:0];
  assign   STAT_RX_OVERSIZE_MSB = STAT_RX_OVERSIZE_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_TOOLONG_LSB;
  wire  [15:0]    STAT_RX_TOOLONG_MSB;
  wire  [47:0]    STAT_RX_TOOLONG_int;
  wire  [47:0]    STAT_RX_TOOLONG_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_toolong_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_toolong ),
      .statsout ( STAT_RX_TOOLONG_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_toolong_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_TOOLONG_int),
    .signal_out   (STAT_RX_TOOLONG_int_sync)
  );

  assign   STAT_RX_TOOLONG_LSB = STAT_RX_TOOLONG_int_sync[31:0];
  assign   STAT_RX_TOOLONG_MSB = STAT_RX_TOOLONG_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_JABBER_LSB;
  wire  [15:0]    STAT_RX_JABBER_MSB;
  wire  [47:0]    STAT_RX_JABBER_int;
  wire  [47:0]    STAT_RX_JABBER_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_jabber_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_jabber ),
      .statsout ( STAT_RX_JABBER_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_jabber_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_JABBER_int),
    .signal_out   (STAT_RX_JABBER_int_sync)
  );

  assign   STAT_RX_JABBER_LSB = STAT_RX_JABBER_int_sync[31:0];
  assign   STAT_RX_JABBER_MSB = STAT_RX_JABBER_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_BAD_FCS_LSB;
  wire  [15:0]    STAT_RX_BAD_FCS_MSB;
  wire  [47:0]    STAT_RX_BAD_FCS_int;
  wire  [47:0]    STAT_RX_BAD_FCS_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_bad_fcs_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_bad_fcs ),
      .statsout ( STAT_RX_BAD_FCS_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_bad_fcs_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BAD_FCS_int),
    .signal_out   (STAT_RX_BAD_FCS_int_sync)
  );

  assign   STAT_RX_BAD_FCS_LSB = STAT_RX_BAD_FCS_int_sync[31:0];
  assign   STAT_RX_BAD_FCS_MSB = STAT_RX_BAD_FCS_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PACKET_BAD_FCS_LSB;
  wire  [15:0]    STAT_RX_PACKET_BAD_FCS_MSB;
  wire  [47:0]    STAT_RX_PACKET_BAD_FCS_int;
  wire  [47:0]    STAT_RX_PACKET_BAD_FCS_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_packet_bad_fcs_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_packet_bad_fcs ),
      .statsout ( STAT_RX_PACKET_BAD_FCS_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_packet_bad_fcs_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PACKET_BAD_FCS_int),
    .signal_out   (STAT_RX_PACKET_BAD_FCS_int_sync)
  );

  assign   STAT_RX_PACKET_BAD_FCS_LSB = STAT_RX_PACKET_BAD_FCS_int_sync[31:0];
  assign   STAT_RX_PACKET_BAD_FCS_MSB = STAT_RX_PACKET_BAD_FCS_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_STOMPED_FCS_LSB;
  wire  [15:0]    STAT_RX_STOMPED_FCS_MSB;
  wire  [47:0]    STAT_RX_STOMPED_FCS_int;
  wire  [47:0]    STAT_RX_STOMPED_FCS_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_stomped_fcs_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_stomped_fcs ),
      .statsout ( STAT_RX_STOMPED_FCS_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_stomped_fcs_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_STOMPED_FCS_int),
    .signal_out   (STAT_RX_STOMPED_FCS_int_sync)
  );

  assign   STAT_RX_STOMPED_FCS_LSB = STAT_RX_STOMPED_FCS_int_sync[31:0];
  assign   STAT_RX_STOMPED_FCS_MSB = STAT_RX_STOMPED_FCS_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_UNICAST_LSB;
  wire  [15:0]    STAT_RX_UNICAST_MSB;
  wire  [47:0]    STAT_RX_UNICAST_int;
  wire  [47:0]    STAT_RX_UNICAST_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_unicast_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_unicast ),
      .statsout ( STAT_RX_UNICAST_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_unicast_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_UNICAST_int),
    .signal_out   (STAT_RX_UNICAST_int_sync)
  );

  assign   STAT_RX_UNICAST_LSB = STAT_RX_UNICAST_int_sync[31:0];
  assign   STAT_RX_UNICAST_MSB = STAT_RX_UNICAST_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_MULTICAST_LSB;
  wire  [15:0]    STAT_RX_MULTICAST_MSB;
  wire  [47:0]    STAT_RX_MULTICAST_int;
  wire  [47:0]    STAT_RX_MULTICAST_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_multicast_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_multicast ),
      .statsout ( STAT_RX_MULTICAST_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_multicast_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_MULTICAST_int),
    .signal_out   (STAT_RX_MULTICAST_int_sync)
  );

  assign   STAT_RX_MULTICAST_LSB = STAT_RX_MULTICAST_int_sync[31:0];
  assign   STAT_RX_MULTICAST_MSB = STAT_RX_MULTICAST_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_BROADCAST_LSB;
  wire  [15:0]    STAT_RX_BROADCAST_MSB;
  wire  [47:0]    STAT_RX_BROADCAST_int;
  wire  [47:0]    STAT_RX_BROADCAST_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_broadcast_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_broadcast ),
      .statsout ( STAT_RX_BROADCAST_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_broadcast_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_BROADCAST_int),
    .signal_out   (STAT_RX_BROADCAST_int_sync)
  );

  assign   STAT_RX_BROADCAST_LSB = STAT_RX_BROADCAST_int_sync[31:0];
  assign   STAT_RX_BROADCAST_MSB = STAT_RX_BROADCAST_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_VLAN_LSB;
  wire  [15:0]    STAT_RX_VLAN_MSB;
  wire  [47:0]    STAT_RX_VLAN_int;
  wire  [47:0]    STAT_RX_VLAN_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_vlan_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_vlan ),
      .statsout ( STAT_RX_VLAN_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_vlan_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_VLAN_int),
    .signal_out   (STAT_RX_VLAN_int_sync)
  );

  assign   STAT_RX_VLAN_LSB = STAT_RX_VLAN_int_sync[31:0];
  assign   STAT_RX_VLAN_MSB = STAT_RX_VLAN_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_PAUSE_LSB;
  wire  [15:0]    STAT_RX_PAUSE_MSB;
  wire  [47:0]    STAT_RX_PAUSE_int;
  wire  [47:0]    STAT_RX_PAUSE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_pause_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_pause ),
      .statsout ( STAT_RX_PAUSE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_pause_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_PAUSE_int),
    .signal_out   (STAT_RX_PAUSE_int_sync)
  );

  assign   STAT_RX_PAUSE_LSB = STAT_RX_PAUSE_int_sync[31:0];
  assign   STAT_RX_PAUSE_MSB = STAT_RX_PAUSE_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_USER_PAUSE_LSB;
  wire  [15:0]    STAT_RX_USER_PAUSE_MSB;
  wire  [47:0]    STAT_RX_USER_PAUSE_int;
  wire  [47:0]    STAT_RX_USER_PAUSE_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_user_pause_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_user_pause ),
      .statsout ( STAT_RX_USER_PAUSE_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_user_pause_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_USER_PAUSE_int),
    .signal_out   (STAT_RX_USER_PAUSE_int_sync)
  );

  assign   STAT_RX_USER_PAUSE_LSB = STAT_RX_USER_PAUSE_int_sync[31:0];
  assign   STAT_RX_USER_PAUSE_MSB = STAT_RX_USER_PAUSE_int_sync[47:32];


//////////

  wire  [31:0]    STAT_RX_INRANGEERR_LSB;
  wire  [15:0]    STAT_RX_INRANGEERR_MSB;
  wire  [47:0]    STAT_RX_INRANGEERR_int;
  wire  [47:0]    STAT_RX_INRANGEERR_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_inrangeerr_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_inrangeerr ),
      .statsout ( STAT_RX_INRANGEERR_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_inrangeerr_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_INRANGEERR_int),
    .signal_out   (STAT_RX_INRANGEERR_int_sync)
  );

  assign   STAT_RX_INRANGEERR_LSB = STAT_RX_INRANGEERR_int_sync[31:0];
  assign   STAT_RX_INRANGEERR_MSB = STAT_RX_INRANGEERR_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_TRUNCATED_LSB;
  wire  [15:0]    STAT_RX_TRUNCATED_MSB;
  wire  [47:0]    STAT_RX_TRUNCATED_int;
  wire  [47:0]    STAT_RX_TRUNCATED_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_truncated_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_truncated ),
      .statsout ( STAT_RX_TRUNCATED_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_truncated_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_TRUNCATED_int),
    .signal_out   (STAT_RX_TRUNCATED_int_sync)
  );

  assign   STAT_RX_TRUNCATED_LSB = STAT_RX_TRUNCATED_int_sync[31:0];
  assign   STAT_RX_TRUNCATED_MSB = STAT_RX_TRUNCATED_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_RSFEC_CORRECTED_CW_INC_LSB;
  wire  [15:0]    STAT_RX_RSFEC_CORRECTED_CW_INC_MSB;
  wire  [47:0]    STAT_RX_RSFEC_CORRECTED_CW_INC_int;
  wire  [47:0]    STAT_RX_RSFEC_CORRECTED_CW_INC_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_rsfec_corrected_cw_inc_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_rsfec_corrected_cw_inc ),
      .statsout ( STAT_RX_RSFEC_CORRECTED_CW_INC_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_rsfec_corrected_cw_inc_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_RSFEC_CORRECTED_CW_INC_int),
    .signal_out   (STAT_RX_RSFEC_CORRECTED_CW_INC_int_sync)
  );

  assign   STAT_RX_RSFEC_CORRECTED_CW_INC_LSB = STAT_RX_RSFEC_CORRECTED_CW_INC_int_sync[31:0];
  assign   STAT_RX_RSFEC_CORRECTED_CW_INC_MSB = STAT_RX_RSFEC_CORRECTED_CW_INC_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_RSFEC_UNCORRECTED_CW_INC_LSB;
  wire  [15:0]    STAT_RX_RSFEC_UNCORRECTED_CW_INC_MSB;
  wire  [47:0]    STAT_RX_RSFEC_UNCORRECTED_CW_INC_int;
  wire  [47:0]    STAT_RX_RSFEC_UNCORRECTED_CW_INC_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_rsfec_uncorrected_cw_inc_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_rsfec_uncorrected_cw_inc ),
      .statsout ( STAT_RX_RSFEC_UNCORRECTED_CW_INC_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_rsfec_uncorrected_cw_inc_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_RSFEC_UNCORRECTED_CW_INC_int),
    .signal_out   (STAT_RX_RSFEC_UNCORRECTED_CW_INC_int_sync)
  );

  assign   STAT_RX_RSFEC_UNCORRECTED_CW_INC_LSB = STAT_RX_RSFEC_UNCORRECTED_CW_INC_int_sync[31:0];
  assign   STAT_RX_RSFEC_UNCORRECTED_CW_INC_MSB = STAT_RX_RSFEC_UNCORRECTED_CW_INC_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_RSFEC_ERR_COUNT0_INC_LSB;
  wire  [15:0]    STAT_RX_RSFEC_ERR_COUNT0_INC_MSB;
  wire  [47:0]    STAT_RX_RSFEC_ERR_COUNT0_INC_int;
  wire  [47:0]    STAT_RX_RSFEC_ERR_COUNT0_INC_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_rsfec_err_count0_inc_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_rsfec_err_count0_inc ),
      .statsout ( STAT_RX_RSFEC_ERR_COUNT0_INC_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_rsfec_err_count0_inc_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_RSFEC_ERR_COUNT0_INC_int),
    .signal_out   (STAT_RX_RSFEC_ERR_COUNT0_INC_int_sync)
  );

  assign   STAT_RX_RSFEC_ERR_COUNT0_INC_LSB = STAT_RX_RSFEC_ERR_COUNT0_INC_int_sync[31:0];
  assign   STAT_RX_RSFEC_ERR_COUNT0_INC_MSB = STAT_RX_RSFEC_ERR_COUNT0_INC_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_RSFEC_ERR_COUNT1_INC_LSB;
  wire  [15:0]    STAT_RX_RSFEC_ERR_COUNT1_INC_MSB;
  wire  [47:0]    STAT_RX_RSFEC_ERR_COUNT1_INC_int;
  wire  [47:0]    STAT_RX_RSFEC_ERR_COUNT1_INC_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_rsfec_err_count1_inc_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_rsfec_err_count1_inc ),
      .statsout ( STAT_RX_RSFEC_ERR_COUNT1_INC_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_rsfec_err_count1_inc_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_RSFEC_ERR_COUNT1_INC_int),
    .signal_out   (STAT_RX_RSFEC_ERR_COUNT1_INC_int_sync)
  );

  assign   STAT_RX_RSFEC_ERR_COUNT1_INC_LSB = STAT_RX_RSFEC_ERR_COUNT1_INC_int_sync[31:0];
  assign   STAT_RX_RSFEC_ERR_COUNT1_INC_MSB = STAT_RX_RSFEC_ERR_COUNT1_INC_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_RSFEC_ERR_COUNT2_INC_LSB;
  wire  [15:0]    STAT_RX_RSFEC_ERR_COUNT2_INC_MSB;
  wire  [47:0]    STAT_RX_RSFEC_ERR_COUNT2_INC_int;
  wire  [47:0]    STAT_RX_RSFEC_ERR_COUNT2_INC_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_rsfec_err_count2_inc_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_rsfec_err_count2_inc ),
      .statsout ( STAT_RX_RSFEC_ERR_COUNT2_INC_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_rsfec_err_count2_inc_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_RSFEC_ERR_COUNT2_INC_int),
    .signal_out   (STAT_RX_RSFEC_ERR_COUNT2_INC_int_sync)
  );

  assign   STAT_RX_RSFEC_ERR_COUNT2_INC_LSB = STAT_RX_RSFEC_ERR_COUNT2_INC_int_sync[31:0];
  assign   STAT_RX_RSFEC_ERR_COUNT2_INC_MSB = STAT_RX_RSFEC_ERR_COUNT2_INC_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_RSFEC_ERR_COUNT3_INC_LSB;
  wire  [15:0]    STAT_RX_RSFEC_ERR_COUNT3_INC_MSB;
  wire  [47:0]    STAT_RX_RSFEC_ERR_COUNT3_INC_int;
  wire  [47:0]    STAT_RX_RSFEC_ERR_COUNT3_INC_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(3),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_rsfec_err_count3_inc_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_rsfec_err_count3_inc ),
      .statsout ( STAT_RX_RSFEC_ERR_COUNT3_INC_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_rsfec_err_count3_inc_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_RSFEC_ERR_COUNT3_INC_int),
    .signal_out   (STAT_RX_RSFEC_ERR_COUNT3_INC_int_sync)
  );

  assign   STAT_RX_RSFEC_ERR_COUNT3_INC_LSB = STAT_RX_RSFEC_ERR_COUNT3_INC_int_sync[31:0];
  assign   STAT_RX_RSFEC_ERR_COUNT3_INC_MSB = STAT_RX_RSFEC_ERR_COUNT3_INC_int_sync[47:32];

//////////

  wire  [31:0]    STAT_RX_RSFEC_CW_INC_LSB;
  wire  [15:0]    STAT_RX_RSFEC_CW_INC_MSB;
  wire  [47:0]    STAT_RX_RSFEC_CW_INC_int;
  wire  [47:0]    STAT_RX_RSFEC_CW_INC_int_sync;

  cmac_usplus_0_pmtick_statsreg
   #(
      .INWIDTH(1),
      .OUTWIDTH(48)
   ) i_cmac_usplus_0_stat_rx_rsfec_cw_inc_accumulator (
      .clk      ( rx_clk ),
      .reset    ( rx_reset ),
      .PM_tick  ( rx_clk_tick_r ),
      .pulsein  ( stat_rx_rsfec_cw_inc ),
      .statsout ( STAT_RX_RSFEC_CW_INC_int )
   );

  cmac_usplus_0_axi4_cdc_sync_2stage 
  #(
    .WIDTH        (48)
  ) i_cmac_usplus_0_stat_rx_rsfec_cw_inc_syncer (
    .clk          (Bus2IP_Clk ),
    .signal_in    (STAT_RX_RSFEC_CW_INC_int),
    .signal_out   (STAT_RX_RSFEC_CW_INC_int_sync)
  );

  assign   STAT_RX_RSFEC_CW_INC_LSB = STAT_RX_RSFEC_CW_INC_int_sync[31:0];
  assign   STAT_RX_RSFEC_CW_INC_MSB = STAT_RX_RSFEC_CW_INC_int_sync[47:32];

//////////


assign Bus2IP_CS_rise_edge = Bus2IP_CS & (~ Bus2IP_CS_reg);


//////- Read side
  always @( posedge Bus2IP_Clk ) begin
       if ( Bus2IP_Reset == 1'b1 ) begin
          IP2Bus_Data                             <=  'd0;
          IP2Bus_RdAck                            <=  1'b0;
          IP2Bus_RdError                          <=  1'b0;

          STAT_TX_STATUS_REG_clear_r              <=  1'b0;
          STAT_STATUS_REG1_clear_r                <=  1'b0;
          STAT_RX_STATUS_REG_clear_r              <=  1'b0;
          STAT_RX_BLOCK_LOCK_REG_clear_r          <=  1'b0;
          STAT_RX_LANE_SYNC_REG_clear_r           <=  1'b0;
          STAT_RX_LANE_SYNC_ERR_REG_clear_r       <=  1'b0;
          STAT_RX_LANE_AM_ERR_REG_clear_r         <=  1'b0;
          STAT_RX_LANE_AM_LEN_ERR_REG_clear_r     <=  1'b0;
          STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_r  <=  1'b0;
          STAT_RX_RSFEC_STATUS_REG_clear_r        <=  1'b0;
          CORE_MODE_REG                           <=  2'b01;  //// CAUI4  = 2'b01
       end
       else begin
          CORE_MODE_REG                           <=  2'b01;  //// CAUI4  = 2'b01

          //////- Clear on read
          IP2Bus_Data                             <=  'd0;
          IP2Bus_RdAck                            <=  1'b0;
          IP2Bus_RdError                          <=  1'b0;

          STAT_TX_STATUS_REG_clear_r              <=  1'b0;
          STAT_STATUS_REG1_clear_r                <=  1'b0;
          STAT_RX_STATUS_REG_clear_r              <=  1'b0;
          STAT_RX_BLOCK_LOCK_REG_clear_r          <=  1'b0;
          STAT_RX_LANE_SYNC_REG_clear_r           <=  1'b0;
          STAT_RX_LANE_SYNC_ERR_REG_clear_r       <=  1'b0;
          STAT_RX_LANE_AM_ERR_REG_clear_r         <=  1'b0;
          STAT_RX_LANE_AM_LEN_ERR_REG_clear_r     <=  1'b0;
          STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_r  <=  1'b0;
          STAT_RX_RSFEC_STATUS_REG_clear_r        <=  1'b0;

           //////- Read transaction
           if ( (Bus2IP_CS_rise_edge) & (Bus2IP_RNW) ) begin
              case (Bus2IP_Addr_reg[15:0])

                  'h0000 : begin
                                 IP2Bus_Data      <=  {31'd0,GT_RESET_REG};
                                 IP2Bus_RdError   <=  1'b0;
                               end 
                  'h0004 : begin
                                 IP2Bus_Data      <=  {RESET_REG[11:10],20'd0,RESET_REG[9:0]};
                                 IP2Bus_RdError   <=  1'b0;
                               end
                  'h000C : begin
                                 IP2Bus_Data     <=  {15'd0,CONFIGURATION_TX_REG1[4],9'd0,CONFIGURATION_TX_REG1[3:1],2'd0,CONFIGURATION_TX_REG1[0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0014 : begin
                                 IP2Bus_Data     <=  {23'd0,CONFIGURATION_RX_REG1[2:1],6'd0,CONFIGURATION_RX_REG1[0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0020 : begin
                                 IP2Bus_Data     <=  {30'd0,CORE_MODE_REG};  //// For CAUI10 = 2'b00; CAUI4 = 2'b01; Runtime Switch CAUI10 = 2'b10; Runtime Switch CAUI4 = 2'b11;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0024 : begin
                                 IP2Bus_Data     <=  {16'd0,8'd3,8'd1};  //// Core version field. Current version cmac_usplus_v3_1_2.
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h002C : begin
                                 IP2Bus_Data     <=  {23'd0,CONFIGURATION_TX_BIP_OVERRIDE[8:0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0030 : begin
                                 IP2Bus_Data     <=  {23'd0,CONFIGURATION_TX_FLOW_CONTROL_CONTROL_REG1[8:0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0034 : begin
                                 IP2Bus_Data     <=  CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG1;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0038 : begin
                                 IP2Bus_Data     <=  CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG2;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h003C : begin
                                 IP2Bus_Data     <=  CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG3;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0040 : begin
                                 IP2Bus_Data     <=  CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG4;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0044 : begin
                                 IP2Bus_Data     <=  {16'd0,CONFIGURATION_TX_FLOW_CONTROL_REFRESH_REG5[15:0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0048 : begin
                                 IP2Bus_Data     <=  CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG1;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h004C : begin
                                 IP2Bus_Data     <=  CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG2;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0050 : begin
                                 IP2Bus_Data     <=  CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG3;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0054 : begin
                                 IP2Bus_Data     <=  CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG4;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0058 : begin
                                 IP2Bus_Data     <=  {16'd0,CONFIGURATION_TX_FLOW_CONTROL_QUANTA_REG5[15:0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0084 : begin
                                 IP2Bus_Data     <=  {8'd0,CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1[21:13],1'b0,CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1[12:9],1'b0,CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG1[8:0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0088 : begin
                                 IP2Bus_Data     <=  {12'd0,CONFIGURATION_RX_FLOW_CONTROL_CONTROL_REG2[19:0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0090 : begin
                                 IP2Bus_Data     <=  {31'd0,GT_LOOPBACK_REG};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                 'h00CC : begin
                                 IP2Bus_Data     <=  USER_REG0;
                                 IP2Bus_RdError  <=  1'b0;
                              end
////////////////////////////////////////////////////////////////
                  'h1000 : begin
                                 IP2Bus_Data     <=  {29'd0,RSFEC_CONFIG_INDICATION_CORRECTION[2:0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h107C : begin
                                 IP2Bus_Data     <=  {30'd0,RSFEC_CONFIG_ENABLE[1:0]};
                                 IP2Bus_RdError  <=  1'b0;
                               end
////////////////////////////////////////////////////////////////
                  'h0200 : begin
                                 IP2Bus_Data                <=  {31'd0,stat_tx_local_fault_lh_r_sync};
                                 IP2Bus_RdError             <=  1'b0;
                                 STAT_TX_STATUS_REG_clear_r <=  1'b1;
                               end
                  'h0204 : begin
                                 IP2Bus_Data[0]             <=  stat_rx_status_ll_r_sync;
                                 IP2Bus_Data[1]             <=  stat_rx_aligned_ll_r_sync;
                                 IP2Bus_Data[2]             <=  stat_rx_misaligned_lh_r_sync;
                                 IP2Bus_Data[3]             <=  stat_rx_aligned_err_lh_r_sync;
                                 IP2Bus_Data[4]             <=  stat_rx_hi_ber_lh_r_sync;
                                 IP2Bus_Data[5]             <=  stat_rx_remote_fault_lh_r_sync;
                                 IP2Bus_Data[6]             <=  stat_rx_local_fault_lh_r_sync;
                                 IP2Bus_Data[7]             <=  stat_rx_internal_local_fault_lh_r_sync;
                                 IP2Bus_Data[8]             <=  stat_rx_received_local_fault_lh_r_sync;
                                 IP2Bus_Data[11:9]          <=  stat_rx_test_pattern_mismatch_lh_r_sync[2:0];
                                 IP2Bus_Data[12]            <=  stat_rx_bad_preamble_lh_r_sync;
                                 IP2Bus_Data[13]            <=  stat_rx_bad_sfd_lh_r_sync;
                                 IP2Bus_Data[14]            <=  stat_rx_got_signal_os_lh_r_sync;
                                 IP2Bus_Data[31:15]         <=  'd0;
                                 IP2Bus_RdError             <=  1'b0;
                                 STAT_RX_STATUS_REG_clear_r <=  1'b1;
                               end
                  'h0208 : begin
                                 IP2Bus_Data[3:0]           <=  4'd0;
                                 IP2Bus_Data[4]             <=  stat_tx_ptp_fifo_read_error_lh_r_sync;
                                 IP2Bus_Data[5]             <=  stat_tx_ptp_fifo_write_error_lh_r_sync;
                                 IP2Bus_Data[31:6]          <=  'd0;
                                 IP2Bus_RdError             <=  1'b0;
                                 STAT_STATUS_REG1_clear_r   <=  1'b1;
                               end
                  'h020C : begin
                                 IP2Bus_Data                     <=  {12'd0,stat_rx_block_lock_ll_r_sync};
                                 IP2Bus_RdError                  <=  1'b0;
                                 STAT_RX_BLOCK_LOCK_REG_clear_r  <=  1'b1;
                               end
                  'h0210 : begin
                                 IP2Bus_Data                     <=  {12'd0,stat_rx_synced_ll_r_sync};
                                 IP2Bus_RdError                  <=  1'b0;
                                 STAT_RX_LANE_SYNC_REG_clear_r   <=  1'b1;
                               end
                  'h0214 : begin
                                 IP2Bus_Data                        <=  {12'd0,stat_rx_synced_err_lh_r_sync};
                                 IP2Bus_RdError                     <=  1'b0;
                                 STAT_RX_LANE_SYNC_ERR_REG_clear_r  <=  1'b1;
                               end
                  'h0218 : begin
                                 IP2Bus_Data                      <=  {12'd0,stat_rx_mf_err_lh_r_sync};
                                 IP2Bus_RdError                   <=  1'b0;
                                 STAT_RX_LANE_AM_ERR_REG_clear_r  <=  1'b1;
                               end
                  'h021C : begin
                                 IP2Bus_Data                          <=  {12'd0,stat_rx_mf_len_err_lh_r_sync};
                                 IP2Bus_RdError                       <=  1'b0;
                                 STAT_RX_LANE_AM_LEN_ERR_REG_clear_r  <=  1'b1;
                               end
                  'h0220 : begin
                                 IP2Bus_Data                             <=  {12'd0,stat_rx_mf_repeat_err_lh_r_sync};
                                 IP2Bus_RdError                          <=  1'b0;
                                 STAT_RX_LANE_AM_REPEAT_ERR_REG_clear_r  <=  1'b1;
                               end
                  'h0224 : begin
                                 IP2Bus_Data     <=  {12'd0,stat_rx_pcsl_demuxed_sync};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0228 : begin
                                 IP2Bus_Data[4:0]    <=  stat_rx_pcsl_number_0_sync;
                                 IP2Bus_Data[9:5]    <=  stat_rx_pcsl_number_1_sync;
                                 IP2Bus_Data[14:10]  <=  stat_rx_pcsl_number_2_sync;
                                 IP2Bus_Data[19:15]  <=  stat_rx_pcsl_number_3_sync;
                                 IP2Bus_Data[24:20]  <=  stat_rx_pcsl_number_4_sync;
                                 IP2Bus_Data[29:25]  <=  stat_rx_pcsl_number_5_sync;
                                 IP2Bus_Data[31:30]  <=  'd0;
                                 IP2Bus_RdError      <=  1'b0;
                               end
                  'h022C : begin
                                 IP2Bus_Data[4:0]    <=  stat_rx_pcsl_number_6_sync;
                                 IP2Bus_Data[9:5]    <=  stat_rx_pcsl_number_7_sync;
                                 IP2Bus_Data[14:10]  <=  stat_rx_pcsl_number_8_sync;
                                 IP2Bus_Data[19:15]  <=  stat_rx_pcsl_number_9_sync;
                                 IP2Bus_Data[24:20]  <=  stat_rx_pcsl_number_10_sync;
                                 IP2Bus_Data[29:25]  <=  stat_rx_pcsl_number_11_sync;
                                 IP2Bus_Data[31:30]  <=  'd0;
                                 IP2Bus_RdError      <=  1'b0;
                               end
                  'h0230 : begin
                                 IP2Bus_Data[4:0]    <=  stat_rx_pcsl_number_12_sync;
                                 IP2Bus_Data[9:5]    <=  stat_rx_pcsl_number_13_sync;
                                 IP2Bus_Data[14:10]  <=  stat_rx_pcsl_number_14_sync;
                                 IP2Bus_Data[19:15]  <=  stat_rx_pcsl_number_15_sync;
                                 IP2Bus_Data[24:20]  <=  stat_rx_pcsl_number_16_sync;
                                 IP2Bus_Data[29:25]  <=  stat_rx_pcsl_number_17_sync;
                                 IP2Bus_Data[31:30]  <=  'd0;
                                 IP2Bus_RdError      <=  1'b0;
                               end
                  'h0234 : begin
                                 IP2Bus_Data[4:0]    <=  stat_rx_pcsl_number_18_sync;
                                 IP2Bus_Data[9:5]    <=  stat_rx_pcsl_number_19_sync;
                                 IP2Bus_Data[31:10]  <=  'd0;
                                 IP2Bus_RdError      <=  1'b0;
                               end
                  'h0238 : begin
                                 IP2Bus_Data        <=  {23'd0,stat_rx_lane0_vlm_bip7_valid_sync,stat_rx_lane0_vlm_bip7_sync[7:0]};
                                 IP2Bus_RdError     <=  1'b0;
                               end
                  ///////////////////////
                  'h02B8 : begin
                                 IP2Bus_Data     <=  STAT_CYCLE_COUNT_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02BC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_CYCLE_COUNT_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02C0 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_0_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02C4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_0_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02C8 : begin  
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_1_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02CC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_1_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02D0 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_2_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02D4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_2_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02D8 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_3_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02DC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_3_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02E0 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_4_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02E4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_4_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02E8 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_5_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02EC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_5_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02F0 : begin 
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_6_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02F4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_6_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02F8 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_7_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h02FC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_7_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0300 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_8_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0304 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_8_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0308 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_9_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h030C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_9_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0310 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_10_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0314 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_10_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0318 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_11_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h031C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_11_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0320 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_12_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0324 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_12_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0328 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_13_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h032C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_13_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0330 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_14_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0334 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_14_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0338 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_15_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h033C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_15_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0340 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_16_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0344 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_16_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0348 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_17_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h034C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_17_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0350 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_18_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0354 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_18_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0358 : begin
                                 IP2Bus_Data     <=  STAT_RX_BIP_ERR_19_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h035C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BIP_ERR_19_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0360 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_0_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0364 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_0_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0368 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_1_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h036C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_1_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0370 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_2_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0374 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_2_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0378 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_3_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h037C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_3_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0380 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_4_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0384 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_4_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0388 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_5_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h038C : begin  
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_5_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0390 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_6_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0394 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_6_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0398 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_7_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h039C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_7_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03A0 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_8_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03A4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_8_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03A8 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_9_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03AC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_9_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03B0 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_10_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03B4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_10_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03B8 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_11_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03BC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_11_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03C0 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_12_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03C4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_12_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03C8 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_13_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03CC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_13_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03D0 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_14_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03D4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_14_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03D8 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_15_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03DC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_15_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03E0 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_16_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03E4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_16_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03E8 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_17_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03EC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_17_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03F0 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_18_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03F4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_18_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03F8 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAMING_ERR_19_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h03FC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAMING_ERR_19_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0418 : begin
                                 IP2Bus_Data     <=  STAT_RX_BAD_CODE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h041C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BAD_CODE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0458 : begin
                                 IP2Bus_Data     <=  STAT_TX_FRAME_ERROR_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h045C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_FRAME_ERROR_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0500 : begin
                                 IP2Bus_Data     <=  STAT_TX_TOTAL_PACKETS_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0504 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_TOTAL_PACKETS_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0508 : begin
                                 IP2Bus_Data     <=  STAT_TX_TOTAL_GOOD_PACKETS_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h050C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_TOTAL_GOOD_PACKETS_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0510 : begin
                                 IP2Bus_Data     <=  STAT_TX_TOTAL_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0514 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_TOTAL_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0518 : begin
                                 IP2Bus_Data     <=  STAT_TX_TOTAL_GOOD_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h051C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_TOTAL_GOOD_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0520 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_64_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0524 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_64_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0528 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_65_127_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h052C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_65_127_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0530 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_128_255_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0534 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_128_255_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0538 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_256_511_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h053C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_256_511_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0540 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_512_1023_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0544 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_512_1023_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0548 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_1024_1518_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h054C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_1024_1518_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0550 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_1519_1522_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0554 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_1519_1522_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0558 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_1523_1548_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h055C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_1523_1548_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0560 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_1549_2047_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0564 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_1549_2047_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0568 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_2048_4095_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h056C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_2048_4095_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0570 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_4096_8191_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0574 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_4096_8191_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0578 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_8192_9215_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h057C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_8192_9215_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0580 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_LARGE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0584 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_LARGE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0588 : begin
                                 IP2Bus_Data     <=  STAT_TX_PACKET_SMALL_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h058C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PACKET_SMALL_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05B8 : begin
                                 IP2Bus_Data     <=  STAT_TX_BAD_FCS_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05BC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_BAD_FCS_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05D0 : begin
                                 IP2Bus_Data     <=  STAT_TX_UNICAST_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05D4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_UNICAST_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05D8 : begin
                                 IP2Bus_Data     <=  STAT_TX_MULTICAST_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05DC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_MULTICAST_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05E0 : begin
                                 IP2Bus_Data     <=  STAT_TX_BROADCAST_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05E4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_BROADCAST_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05E8 : begin
                                 IP2Bus_Data     <=  STAT_TX_VLAN_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05EC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_VLAN_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05F0 : begin
                                 IP2Bus_Data     <=  STAT_TX_PAUSE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05F4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_PAUSE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05F8 : begin
                                 IP2Bus_Data     <=  STAT_TX_USER_PAUSE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h05FC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_TX_USER_PAUSE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0608 : begin
                                 IP2Bus_Data     <=  STAT_RX_TOTAL_PACKETS_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h060C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_TOTAL_PACKETS_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0610 : begin
                                 IP2Bus_Data     <=  STAT_RX_TOTAL_GOOD_PACKETS_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0614 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_TOTAL_GOOD_PACKETS_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0618 : begin
                                 IP2Bus_Data     <=  STAT_RX_TOTAL_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h061C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_TOTAL_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0620 : begin
                                 IP2Bus_Data     <=  STAT_RX_TOTAL_GOOD_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0624 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_TOTAL_GOOD_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0628 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_64_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h062C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_64_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0630 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_65_127_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0634 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_65_127_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0638 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_128_255_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h063C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_128_255_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0640 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_256_511_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0644 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_256_511_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0648 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_512_1023_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h064C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_512_1023_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0650 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_1024_1518_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0654 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_1024_1518_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0658 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_1519_1522_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h065C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_1519_1522_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0660 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_1523_1548_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0664 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_1523_1548_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0668 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_1549_2047_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h066C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_1549_2047_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0670 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_2048_4095_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0674 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_2048_4095_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0678 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_4096_8191_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h067C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_4096_8191_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0680 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_8192_9215_BYTES_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0684 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_8192_9215_BYTES_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0688 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_LARGE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h068C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_LARGE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0690 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_SMALL_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0694 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_SMALL_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0698 : begin
                                 IP2Bus_Data     <=  STAT_RX_UNDERSIZE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h069C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_UNDERSIZE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06A0 : begin
                                 IP2Bus_Data     <=  STAT_RX_FRAGMENT_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06A4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_FRAGMENT_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06A8 : begin
                                 IP2Bus_Data     <=  STAT_RX_OVERSIZE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06AC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_OVERSIZE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06B0 : begin
                                 IP2Bus_Data     <=  STAT_RX_TOOLONG_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06B4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_TOOLONG_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06B8 : begin
                                 IP2Bus_Data     <=  STAT_RX_JABBER_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06BC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_JABBER_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06C0 : begin
                                 IP2Bus_Data     <=  STAT_RX_BAD_FCS_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06C4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BAD_FCS_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06C8 : begin
                                 IP2Bus_Data     <=  STAT_RX_PACKET_BAD_FCS_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06CC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PACKET_BAD_FCS_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06D0 : begin
                                 IP2Bus_Data     <=  STAT_RX_STOMPED_FCS_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06D4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_STOMPED_FCS_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06D8 : begin
                                 IP2Bus_Data     <=  STAT_RX_UNICAST_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06DC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_UNICAST_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06E0 : begin
                                 IP2Bus_Data     <=  STAT_RX_MULTICAST_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06E4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_MULTICAST_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06E8 : begin
                                 IP2Bus_Data     <=  STAT_RX_BROADCAST_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06EC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_BROADCAST_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06F0 : begin
                                 IP2Bus_Data     <=  STAT_RX_VLAN_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06F4 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_VLAN_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06F8 : begin
                                 IP2Bus_Data     <=  STAT_RX_PAUSE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h06FC : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_PAUSE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0700 : begin
                                 IP2Bus_Data     <=  STAT_RX_USER_PAUSE_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0704 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_USER_PAUSE_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end                                            
                  'h0708 : begin
                                 IP2Bus_Data     <=  STAT_RX_INRANGEERR_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h070C : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_INRANGEERR_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0710 : begin
                                 IP2Bus_Data     <=  STAT_RX_TRUNCATED_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h0714 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_TRUNCATED_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  ///////////////////////
////////////////////////////////////////////////////////////////
                  'h1004 : begin
                                 IP2Bus_Data[1:0]                  <=  'd0;
                                 IP2Bus_Data[2]                    <=  stat_rx_rsfec_hi_ser_sync;
                                 IP2Bus_Data[3]                    <=  stat_rx_rsfec_hi_ser_lh_r_sync;
                                 IP2Bus_Data[7:4]                  <=  'd0;
                                 IP2Bus_Data[8]                    <=  stat_rx_rsfec_am_lock0_ll_r_sync;
                                 IP2Bus_Data[9]                    <=  stat_rx_rsfec_am_lock1_ll_r_sync;
                                 IP2Bus_Data[10]                   <=  stat_rx_rsfec_am_lock2_ll_r_sync;
                                 IP2Bus_Data[11]                   <=  stat_rx_rsfec_am_lock3_ll_r_sync;
                                 IP2Bus_Data[13:12]                <=  'd0;
                                 IP2Bus_Data[14]                   <=  stat_rx_rsfec_lane_alignment_status_ll_r_sync;
                                 IP2Bus_Data[31:15]                <=  'd0;
                                 IP2Bus_RdError                    <=  1'b0;
                                 STAT_RX_RSFEC_STATUS_REG_clear_r  <=  1'b1;
                               end
                  ///////////////////////
                  'h1008 : begin
                                 IP2Bus_Data                       <=  STAT_RX_RSFEC_CORRECTED_CW_INC_LSB;
                                 IP2Bus_RdError                    <=  1'b0;
                               end
                  'h100C : begin 
                                 IP2Bus_Data                       <=  {16'd0,STAT_RX_RSFEC_CORRECTED_CW_INC_MSB};
                                 IP2Bus_RdError                    <=  1'b0;
                               end
                  'h1010 : begin
                                 IP2Bus_Data                       <=  STAT_RX_RSFEC_UNCORRECTED_CW_INC_LSB;
                                 IP2Bus_RdError                    <=  1'b0;
                               end
                  'h1014 : begin
                                 IP2Bus_Data                       <=  {16'd0,STAT_RX_RSFEC_UNCORRECTED_CW_INC_MSB};
                                 IP2Bus_RdError                    <=  1'b0;
                               end
                  ///////////////////////
                  'h1018 : begin
                                 IP2Bus_Data[1:0]                  <=  stat_rx_rsfec_lane_mapping0_ll_r_sync;
                                 IP2Bus_Data[3:2]                  <=  stat_rx_rsfec_lane_mapping1_ll_r_sync;
                                 IP2Bus_Data[5:4]                  <=  stat_rx_rsfec_lane_mapping2_ll_r_sync;
                                 IP2Bus_Data[7:6]                  <=  stat_rx_rsfec_lane_mapping3_ll_r_sync;
                                 IP2Bus_Data[31:8]                 <=  'd0;
                                 IP2Bus_RdError                    <=  1'b0;
                                 STAT_RX_RSFEC_STATUS_REG_clear_r  <=  1'b1;
                               end
                  ///////////////////////
                  'h101C : begin
                                 IP2Bus_Data     <=  STAT_RX_RSFEC_ERR_COUNT0_INC_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h1020 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_RSFEC_ERR_COUNT0_INC_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h1024 : begin
                                 IP2Bus_Data     <=  STAT_RX_RSFEC_ERR_COUNT1_INC_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h1028 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_RSFEC_ERR_COUNT1_INC_MSB};
                                 IP2Bus_RdError  <= 1'b0;
                               end
                  'h102C : begin
                                 IP2Bus_Data     <=  STAT_RX_RSFEC_ERR_COUNT2_INC_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h1030 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_RSFEC_ERR_COUNT2_INC_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h1034 : begin
                                 IP2Bus_Data     <=  STAT_RX_RSFEC_ERR_COUNT3_INC_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h1038 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_RSFEC_ERR_COUNT3_INC_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h103C : begin
                                 IP2Bus_Data     <=  STAT_RX_RSFEC_CW_INC_LSB;
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  'h1040 : begin
                                 IP2Bus_Data     <=  {16'd0,STAT_RX_RSFEC_CW_INC_MSB};
                                 IP2Bus_RdError  <=  1'b0;
                               end
                  ///////////////////////
////////////////////////////////////////////////////////////////
                     default : begin
                                 IP2Bus_Data     <= 'd0;
                                 IP2Bus_RdError  <= 1'b1;
                               end

              endcase
                                 IP2Bus_RdAck    <=  1'b1;
           end // CS && RNW
           else begin
                                 IP2Bus_RdAck  <= 1'b0;
           end // CS && RNW
       end // reset
   end // always block.


endmodule



//////////////////////////////////////////////////////////////////////////////
(* DowngradeIPIdentifiedWarnings="yes" *)
module cmac_usplus_0_pmtick_statsreg
#(
  parameter OUTWIDTH = 16,
  parameter INWIDTH  = 16
 )
(
   input wire                 clk,
   input wire                 reset,
   input wire                 PM_tick,
   input wire [INWIDTH-1:0]   pulsein,
   output reg [OUTWIDTH-1:0]  statsout
);

   reg                     PM_tick_d1;

   reg [OUTWIDTH-1:0]      statsout_next;
   reg [OUTWIDTH/2-1:0]    counter_lsb, counter_lsb_next;
   reg [OUTWIDTH/2-1:0]    counter_lsb_d1;
   reg                     counter_lsb_ovf, counter_lsb_ovf_next;
   reg [OUTWIDTH/2-1:0]    counter_msb, counter_msb_next;
   reg                     overflow;
   reg                     overflow_next;
   reg [INWIDTH-1:0]       pulsein_r;

   always @( posedge clk ) begin
      pulsein_r <= pulsein;
   end

   always @* begin
      //// LSB counter
      if ( PM_tick ) begin
         counter_lsb_next = pulsein_r;
         counter_lsb_ovf_next = 1'b0;
      end
      else begin
         {counter_lsb_ovf_next, counter_lsb_next} = counter_lsb + pulsein_r;
      end

      //// MSB counter
      if ( PM_tick_d1 ) begin
         counter_msb_next = 'd0;
         overflow_next = 1'b0;
         statsout_next = {counter_msb, counter_lsb_d1};
      end
      else begin
         {overflow_next, counter_msb_next} = ( !overflow ) ? counter_msb + counter_lsb_ovf : {1'b1,{(OUTWIDTH/2){1'b1}}};
         statsout_next = statsout;
      end

   end

   always @( posedge clk ) begin
      counter_lsb_d1 <= ( !overflow ) ? counter_lsb : {(OUTWIDTH/2){1'b1}};
   end

   always @( posedge clk ) begin
      if ( reset == 1'b1 ) begin
         PM_tick_d1       <=  1'b0;
         counter_lsb      <=  'd0;
         counter_lsb_ovf  <=  1'b0;
         counter_msb      <=  'd0;
         overflow         <=  1'b0;
         statsout         <=  'd0;
      end
      else begin
         PM_tick_d1       <=  PM_tick;
         counter_lsb      <=  counter_lsb_next;
         counter_lsb_ovf  <=  counter_lsb_ovf_next;
         counter_msb      <=  counter_msb_next;
         overflow         <=  overflow_next;
         statsout         <=  statsout_next;
      end
   end


endmodule //// pmtick_statsreg
//////////////////////////////////////////////////////////////////////////////

(* DowngradeIPIdentifiedWarnings="yes" *)
module cmac_usplus_0_axi4_syncer_level
#(
  parameter WIDTH       = 1,
  parameter RESET_VALUE = 1'b0
 )
(
  input  wire clk,
  input  wire reset,

  input  wire [WIDTH-1:0] datain,
  output wire [WIDTH-1:0] dataout
);

  (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] dataout_reg;
  reg  [WIDTH-1:0] meta_nxt;
  wire [WIDTH-1:0] dataout_nxt;

`ifdef SARANCE_RTL_DEBUG
// pragma translate_off

  integer i;
  integer seed;
  (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] meta;
  (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] meta2;
  reg  [WIDTH-1:0] meta_state;
  reg  [WIDTH-1:0] meta_state_nxt;
  reg  [WIDTH-1:0] last_datain;

  initial seed       = `SEED;
  initial meta_state = {WIDTH{RESET_VALUE}};

  always @*
    begin
      for (i=0; i < WIDTH; i = i + 1)
        begin
          if ( meta_state[i] !== 1'b1 &&
               last_datain[i] !== datain[i] &&
               $dist_uniform(seed,0,9999) < 5000 &&
               meta[i] !== datain[i] )
            begin
              meta_nxt[i]       = meta[i];
              meta_state_nxt[i] = 1'b1;
            end
          else
            begin
              meta_nxt[i]       = datain[i];
              meta_state_nxt[i] = 1'b0;
            end
        end // for

      last_datain = datain;
    end

  always @( posedge clk )
    begin
      meta_state <= meta_state_nxt;
    end


// pragma translate_on
`else
  (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] meta;
  (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] meta2;
  always @*
    begin
      meta_nxt = datain;
    end

`endif

  always @( posedge clk )
    begin
      if ( reset == 1'b1 )
        begin
          meta  <= {WIDTH{RESET_VALUE}};
          meta2 <= {WIDTH{RESET_VALUE}};
        end
      else
        begin
          meta  <= meta_nxt;
          meta2 <= meta;
        end
    end

  assign dataout_nxt = meta2;

  always @( posedge clk )
    begin
      if ( reset == 1'b1 )
        begin
          dataout_reg <= {WIDTH{RESET_VALUE}};
        end
      else
        begin
          dataout_reg <= dataout_nxt;
        end
    end

  assign dataout = dataout_reg;

`ifdef SARANCE_RTL_DEBUG
// pragma translate_off

// pragma translate_on
`endif

endmodule // axi4_syncer_level
//////////////////////////////////////////////////////////////////////////////

(* DowngradeIPIdentifiedWarnings="yes" *)
module cmac_usplus_0_axi4_syncer_pulse (

  input  wire clkin,
  input  wire clkin_reset,
  input  wire clkout,
  input  wire clkout_reset,

  input  wire pulsein,  // clkin domain
  output reg  pulseout  // clkout domain
);

  reg  pulsein_d1;
  reg  pulsein_d1_nxt;
  reg  pulseout_nxt;

  reg  req_event;
  reg  req_event_nxt;
  wire sync_req_event;
  reg  ack_event;
  reg  ack_event_nxt;
  wire sync_ack_event;


  cmac_usplus_0_axi4_syncer_level i_cmac_usplus_0_REQ (

    .clk        (clkout),
    .reset      (clkout_reset),

    .datain     (req_event),
    .dataout    (sync_req_event)

  ); // i_REQ


  cmac_usplus_0_axi4_syncer_level i_cmac_usplus_0_ACK (

    .clk        (clkin),
    .reset      (clkin_reset),

    .datain     (ack_event),
    .dataout    (sync_ack_event)

  ); // i_ACK


  always @*
    begin
      pulsein_d1_nxt = pulsein;
      req_event_nxt  = req_event;

      if (pulsein && !pulsein_d1 && req_event == sync_ack_event)
        begin
          req_event_nxt = ~req_event;
        end
    end


  always @*
    begin
      ack_event_nxt = sync_req_event;
      pulseout_nxt  = (ack_event != sync_req_event);
    end


  always @( posedge clkin )
    begin
      if ( clkin_reset == 1'b1 )
        begin
          pulsein_d1 <= 1'b0;
          req_event  <= 1'b0;
        end
      else
        begin
          pulsein_d1 <= pulsein_d1_nxt;
          req_event  <= req_event_nxt;
        end
    end


  always @( posedge clkout )
    begin
      if ( clkout_reset == 1'b1 )
        begin
          ack_event <= 1'b0;
          pulseout  <= 1'b0;
        end
      else
        begin
          ack_event <= ack_event_nxt;
          pulseout  <= pulseout_nxt;
        end
    end

`ifdef SARANCE_RTL_DEBUG
`endif


endmodule // axi4_syncer_pulse
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////

(* DowngradeIPIdentifiedWarnings="yes" *)
module cmac_usplus_0_axi4_cdc_sync_2stage
#(
 parameter WIDTH  = 1
)
(
 input  clk,
 input  [WIDTH-1:0] signal_in,
 output wire [WIDTH-1:0]  signal_out
);

                          wire [WIDTH-1:0] sig_in_cdc_from;
 (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] s_out_d2_cdc_to;
 (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] data_out_d3;

assign sig_in_cdc_from = signal_in;
assign signal_out      = data_out_d3;

always @(posedge clk) 
begin
  s_out_d2_cdc_to  <= sig_in_cdc_from;
  data_out_d3      <= s_out_d2_cdc_to;
end

endmodule // axi4_cdc_sync_2stage
//////////////////////////////////////////////////////////////////////////////

