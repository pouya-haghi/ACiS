-- (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:cmac_usplus:3.1
-- IP Revision: 2

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT cmac_usplus_0
  PORT (
    gt_txp_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    gt_txn_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    gt_rxp_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    gt_rxn_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    gt_txusrclk2 : OUT STD_LOGIC;
    gt_loopback_in : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    gt_ref_clk_out : OUT STD_LOGIC;
    gt_rxrecclkout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    gt_powergoodout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    gtwiz_reset_tx_datapath : IN STD_LOGIC;
    gtwiz_reset_rx_datapath : IN STD_LOGIC;
    s_axi_aclk : IN STD_LOGIC;
    s_axi_sreset : IN STD_LOGIC;
    pm_tick : IN STD_LOGIC;
    s_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_awready : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_wvalid : IN STD_LOGIC;
    s_axi_wready : OUT STD_LOGIC;
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_arready : OUT STD_LOGIC;
    s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_rready : IN STD_LOGIC;
    stat_rx_rsfec_am_lock0 : OUT STD_LOGIC;
    stat_rx_rsfec_am_lock1 : OUT STD_LOGIC;
    stat_rx_rsfec_am_lock2 : OUT STD_LOGIC;
    stat_rx_rsfec_am_lock3 : OUT STD_LOGIC;
    stat_rx_rsfec_corrected_cw_inc : OUT STD_LOGIC;
    stat_rx_rsfec_cw_inc : OUT STD_LOGIC;
    stat_rx_rsfec_err_count0_inc : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_rsfec_err_count1_inc : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_rsfec_err_count2_inc : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_rsfec_err_count3_inc : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_rsfec_hi_ser : OUT STD_LOGIC;
    stat_rx_rsfec_lane_alignment_status : OUT STD_LOGIC;
    stat_rx_rsfec_lane_fill_0 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    stat_rx_rsfec_lane_fill_1 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    stat_rx_rsfec_lane_fill_2 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    stat_rx_rsfec_lane_fill_3 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    stat_rx_rsfec_lane_mapping : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    stat_rx_rsfec_uncorrected_cw_inc : OUT STD_LOGIC;
    user_reg0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    sys_reset : IN STD_LOGIC;
    gt_ref_clk_p : IN STD_LOGIC;
    gt_ref_clk_n : IN STD_LOGIC;
    init_clk : IN STD_LOGIC;
    rx_axis_tvalid : OUT STD_LOGIC;
    rx_axis_tdata : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    rx_axis_tlast : OUT STD_LOGIC;
    rx_axis_tkeep : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rx_axis_tuser : OUT STD_LOGIC;
    rx_otn_bip8_0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_otn_bip8_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_otn_bip8_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_otn_bip8_3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_otn_bip8_4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_otn_data_0 : OUT STD_LOGIC_VECTOR(65 DOWNTO 0);
    rx_otn_data_1 : OUT STD_LOGIC_VECTOR(65 DOWNTO 0);
    rx_otn_data_2 : OUT STD_LOGIC_VECTOR(65 DOWNTO 0);
    rx_otn_data_3 : OUT STD_LOGIC_VECTOR(65 DOWNTO 0);
    rx_otn_data_4 : OUT STD_LOGIC_VECTOR(65 DOWNTO 0);
    rx_otn_ena : OUT STD_LOGIC;
    rx_otn_lane0 : OUT STD_LOGIC;
    rx_otn_vlmarker : OUT STD_LOGIC;
    rx_preambleout : OUT STD_LOGIC_VECTOR(55 DOWNTO 0);
    usr_rx_reset : OUT STD_LOGIC;
    gt_rxusrclk2 : OUT STD_LOGIC;
    stat_rx_aligned : OUT STD_LOGIC;
    stat_rx_aligned_err : OUT STD_LOGIC;
    stat_rx_bad_code : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_bad_fcs : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_bad_preamble : OUT STD_LOGIC;
    stat_rx_bad_sfd : OUT STD_LOGIC;
    stat_rx_bip_err_0 : OUT STD_LOGIC;
    stat_rx_bip_err_1 : OUT STD_LOGIC;
    stat_rx_bip_err_10 : OUT STD_LOGIC;
    stat_rx_bip_err_11 : OUT STD_LOGIC;
    stat_rx_bip_err_12 : OUT STD_LOGIC;
    stat_rx_bip_err_13 : OUT STD_LOGIC;
    stat_rx_bip_err_14 : OUT STD_LOGIC;
    stat_rx_bip_err_15 : OUT STD_LOGIC;
    stat_rx_bip_err_16 : OUT STD_LOGIC;
    stat_rx_bip_err_17 : OUT STD_LOGIC;
    stat_rx_bip_err_18 : OUT STD_LOGIC;
    stat_rx_bip_err_19 : OUT STD_LOGIC;
    stat_rx_bip_err_2 : OUT STD_LOGIC;
    stat_rx_bip_err_3 : OUT STD_LOGIC;
    stat_rx_bip_err_4 : OUT STD_LOGIC;
    stat_rx_bip_err_5 : OUT STD_LOGIC;
    stat_rx_bip_err_6 : OUT STD_LOGIC;
    stat_rx_bip_err_7 : OUT STD_LOGIC;
    stat_rx_bip_err_8 : OUT STD_LOGIC;
    stat_rx_bip_err_9 : OUT STD_LOGIC;
    stat_rx_block_lock : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    stat_rx_broadcast : OUT STD_LOGIC;
    stat_rx_fragment : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_framing_err_0 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_10 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_11 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_12 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_13 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_14 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_15 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_16 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_17 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_18 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_19 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_2 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_3 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_4 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_5 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_6 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_7 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_8 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_9 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stat_rx_framing_err_valid_0 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_1 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_10 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_11 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_12 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_13 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_14 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_15 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_16 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_17 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_18 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_19 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_2 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_3 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_4 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_5 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_6 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_7 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_8 : OUT STD_LOGIC;
    stat_rx_framing_err_valid_9 : OUT STD_LOGIC;
    stat_rx_got_signal_os : OUT STD_LOGIC;
    stat_rx_hi_ber : OUT STD_LOGIC;
    stat_rx_inrangeerr : OUT STD_LOGIC;
    stat_rx_internal_local_fault : OUT STD_LOGIC;
    stat_rx_jabber : OUT STD_LOGIC;
    stat_rx_local_fault : OUT STD_LOGIC;
    stat_rx_mf_err : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    stat_rx_mf_len_err : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    stat_rx_mf_repeat_err : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    stat_rx_misaligned : OUT STD_LOGIC;
    stat_rx_multicast : OUT STD_LOGIC;
    stat_rx_oversize : OUT STD_LOGIC;
    stat_rx_packet_1024_1518_bytes : OUT STD_LOGIC;
    stat_rx_packet_128_255_bytes : OUT STD_LOGIC;
    stat_rx_packet_1519_1522_bytes : OUT STD_LOGIC;
    stat_rx_packet_1523_1548_bytes : OUT STD_LOGIC;
    stat_rx_packet_1549_2047_bytes : OUT STD_LOGIC;
    stat_rx_packet_2048_4095_bytes : OUT STD_LOGIC;
    stat_rx_packet_256_511_bytes : OUT STD_LOGIC;
    stat_rx_packet_4096_8191_bytes : OUT STD_LOGIC;
    stat_rx_packet_512_1023_bytes : OUT STD_LOGIC;
    stat_rx_packet_64_bytes : OUT STD_LOGIC;
    stat_rx_packet_65_127_bytes : OUT STD_LOGIC;
    stat_rx_packet_8192_9215_bytes : OUT STD_LOGIC;
    stat_rx_packet_bad_fcs : OUT STD_LOGIC;
    stat_rx_packet_large : OUT STD_LOGIC;
    stat_rx_packet_small : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_pause : OUT STD_LOGIC;
    stat_rx_pause_quanta0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_quanta1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_quanta2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_quanta3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_quanta4 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_quanta5 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_quanta6 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_quanta7 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_quanta8 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    stat_rx_pause_req : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    stat_rx_pause_valid : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    stat_rx_user_pause : OUT STD_LOGIC;
    core_rx_reset : IN STD_LOGIC;
    rx_clk : IN STD_LOGIC;
    stat_rx_received_local_fault : OUT STD_LOGIC;
    stat_rx_remote_fault : OUT STD_LOGIC;
    stat_rx_status : OUT STD_LOGIC;
    stat_rx_stomped_fcs : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_synced : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    stat_rx_synced_err : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    stat_rx_test_pattern_mismatch : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_toolong : OUT STD_LOGIC;
    stat_rx_total_bytes : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    stat_rx_total_good_bytes : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    stat_rx_total_good_packets : OUT STD_LOGIC;
    stat_rx_total_packets : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_truncated : OUT STD_LOGIC;
    stat_rx_undersize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stat_rx_unicast : OUT STD_LOGIC;
    stat_rx_vlan : OUT STD_LOGIC;
    stat_rx_pcsl_demuxed : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    stat_rx_pcsl_number_0 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_1 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_10 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_11 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_12 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_13 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_14 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_15 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_16 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_17 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_18 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_19 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_2 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_3 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_4 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_5 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_6 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_7 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_8 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_rx_pcsl_number_9 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    stat_tx_bad_fcs : OUT STD_LOGIC;
    stat_tx_broadcast : OUT STD_LOGIC;
    stat_tx_frame_error : OUT STD_LOGIC;
    stat_tx_local_fault : OUT STD_LOGIC;
    stat_tx_multicast : OUT STD_LOGIC;
    stat_tx_packet_1024_1518_bytes : OUT STD_LOGIC;
    stat_tx_packet_128_255_bytes : OUT STD_LOGIC;
    stat_tx_packet_1519_1522_bytes : OUT STD_LOGIC;
    stat_tx_packet_1523_1548_bytes : OUT STD_LOGIC;
    stat_tx_packet_1549_2047_bytes : OUT STD_LOGIC;
    stat_tx_packet_2048_4095_bytes : OUT STD_LOGIC;
    stat_tx_packet_256_511_bytes : OUT STD_LOGIC;
    stat_tx_packet_4096_8191_bytes : OUT STD_LOGIC;
    stat_tx_packet_512_1023_bytes : OUT STD_LOGIC;
    stat_tx_packet_64_bytes : OUT STD_LOGIC;
    stat_tx_packet_65_127_bytes : OUT STD_LOGIC;
    stat_tx_packet_8192_9215_bytes : OUT STD_LOGIC;
    stat_tx_packet_large : OUT STD_LOGIC;
    stat_tx_packet_small : OUT STD_LOGIC;
    stat_tx_total_bytes : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    stat_tx_total_good_bytes : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    stat_tx_total_good_packets : OUT STD_LOGIC;
    stat_tx_total_packets : OUT STD_LOGIC;
    stat_tx_unicast : OUT STD_LOGIC;
    stat_tx_vlan : OUT STD_LOGIC;
    ctl_tx_send_idle : IN STD_LOGIC;
    ctl_tx_send_rfi : IN STD_LOGIC;
    ctl_tx_send_lfi : IN STD_LOGIC;
    core_tx_reset : IN STD_LOGIC;
    stat_tx_pause_valid : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    stat_tx_pause : OUT STD_LOGIC;
    stat_tx_user_pause : OUT STD_LOGIC;
    ctl_tx_pause_req : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    ctl_tx_resend_pause : IN STD_LOGIC;
    tx_axis_tready : OUT STD_LOGIC;
    tx_axis_tvalid : IN STD_LOGIC;
    tx_axis_tdata : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    tx_axis_tlast : IN STD_LOGIC;
    tx_axis_tkeep : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    tx_axis_tuser : IN STD_LOGIC;
    tx_ovfout : OUT STD_LOGIC;
    tx_unfout : OUT STD_LOGIC;
    tx_preamblein : IN STD_LOGIC_VECTOR(55 DOWNTO 0);
    usr_tx_reset : OUT STD_LOGIC;
    core_drp_reset : IN STD_LOGIC;
    drp_clk : IN STD_LOGIC;
    drp_addr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    drp_di : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    drp_en : IN STD_LOGIC;
    drp_do : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    drp_rdy : OUT STD_LOGIC;
    drp_we : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : cmac_usplus_0
  PORT MAP (
    gt_txp_out => gt_txp_out,
    gt_txn_out => gt_txn_out,
    gt_rxp_in => gt_rxp_in,
    gt_rxn_in => gt_rxn_in,
    gt_txusrclk2 => gt_txusrclk2,
    gt_loopback_in => gt_loopback_in,
    gt_ref_clk_out => gt_ref_clk_out,
    gt_rxrecclkout => gt_rxrecclkout,
    gt_powergoodout => gt_powergoodout,
    gtwiz_reset_tx_datapath => gtwiz_reset_tx_datapath,
    gtwiz_reset_rx_datapath => gtwiz_reset_rx_datapath,
    s_axi_aclk => s_axi_aclk,
    s_axi_sreset => s_axi_sreset,
    pm_tick => pm_tick,
    s_axi_awaddr => s_axi_awaddr,
    s_axi_awvalid => s_axi_awvalid,
    s_axi_awready => s_axi_awready,
    s_axi_wdata => s_axi_wdata,
    s_axi_wstrb => s_axi_wstrb,
    s_axi_wvalid => s_axi_wvalid,
    s_axi_wready => s_axi_wready,
    s_axi_bresp => s_axi_bresp,
    s_axi_bvalid => s_axi_bvalid,
    s_axi_bready => s_axi_bready,
    s_axi_araddr => s_axi_araddr,
    s_axi_arvalid => s_axi_arvalid,
    s_axi_arready => s_axi_arready,
    s_axi_rdata => s_axi_rdata,
    s_axi_rresp => s_axi_rresp,
    s_axi_rvalid => s_axi_rvalid,
    s_axi_rready => s_axi_rready,
    stat_rx_rsfec_am_lock0 => stat_rx_rsfec_am_lock0,
    stat_rx_rsfec_am_lock1 => stat_rx_rsfec_am_lock1,
    stat_rx_rsfec_am_lock2 => stat_rx_rsfec_am_lock2,
    stat_rx_rsfec_am_lock3 => stat_rx_rsfec_am_lock3,
    stat_rx_rsfec_corrected_cw_inc => stat_rx_rsfec_corrected_cw_inc,
    stat_rx_rsfec_cw_inc => stat_rx_rsfec_cw_inc,
    stat_rx_rsfec_err_count0_inc => stat_rx_rsfec_err_count0_inc,
    stat_rx_rsfec_err_count1_inc => stat_rx_rsfec_err_count1_inc,
    stat_rx_rsfec_err_count2_inc => stat_rx_rsfec_err_count2_inc,
    stat_rx_rsfec_err_count3_inc => stat_rx_rsfec_err_count3_inc,
    stat_rx_rsfec_hi_ser => stat_rx_rsfec_hi_ser,
    stat_rx_rsfec_lane_alignment_status => stat_rx_rsfec_lane_alignment_status,
    stat_rx_rsfec_lane_fill_0 => stat_rx_rsfec_lane_fill_0,
    stat_rx_rsfec_lane_fill_1 => stat_rx_rsfec_lane_fill_1,
    stat_rx_rsfec_lane_fill_2 => stat_rx_rsfec_lane_fill_2,
    stat_rx_rsfec_lane_fill_3 => stat_rx_rsfec_lane_fill_3,
    stat_rx_rsfec_lane_mapping => stat_rx_rsfec_lane_mapping,
    stat_rx_rsfec_uncorrected_cw_inc => stat_rx_rsfec_uncorrected_cw_inc,
    user_reg0 => user_reg0,
    sys_reset => sys_reset,
    gt_ref_clk_p => gt_ref_clk_p,
    gt_ref_clk_n => gt_ref_clk_n,
    init_clk => init_clk,
    rx_axis_tvalid => rx_axis_tvalid,
    rx_axis_tdata => rx_axis_tdata,
    rx_axis_tlast => rx_axis_tlast,
    rx_axis_tkeep => rx_axis_tkeep,
    rx_axis_tuser => rx_axis_tuser,
    rx_otn_bip8_0 => rx_otn_bip8_0,
    rx_otn_bip8_1 => rx_otn_bip8_1,
    rx_otn_bip8_2 => rx_otn_bip8_2,
    rx_otn_bip8_3 => rx_otn_bip8_3,
    rx_otn_bip8_4 => rx_otn_bip8_4,
    rx_otn_data_0 => rx_otn_data_0,
    rx_otn_data_1 => rx_otn_data_1,
    rx_otn_data_2 => rx_otn_data_2,
    rx_otn_data_3 => rx_otn_data_3,
    rx_otn_data_4 => rx_otn_data_4,
    rx_otn_ena => rx_otn_ena,
    rx_otn_lane0 => rx_otn_lane0,
    rx_otn_vlmarker => rx_otn_vlmarker,
    rx_preambleout => rx_preambleout,
    usr_rx_reset => usr_rx_reset,
    gt_rxusrclk2 => gt_rxusrclk2,
    stat_rx_aligned => stat_rx_aligned,
    stat_rx_aligned_err => stat_rx_aligned_err,
    stat_rx_bad_code => stat_rx_bad_code,
    stat_rx_bad_fcs => stat_rx_bad_fcs,
    stat_rx_bad_preamble => stat_rx_bad_preamble,
    stat_rx_bad_sfd => stat_rx_bad_sfd,
    stat_rx_bip_err_0 => stat_rx_bip_err_0,
    stat_rx_bip_err_1 => stat_rx_bip_err_1,
    stat_rx_bip_err_10 => stat_rx_bip_err_10,
    stat_rx_bip_err_11 => stat_rx_bip_err_11,
    stat_rx_bip_err_12 => stat_rx_bip_err_12,
    stat_rx_bip_err_13 => stat_rx_bip_err_13,
    stat_rx_bip_err_14 => stat_rx_bip_err_14,
    stat_rx_bip_err_15 => stat_rx_bip_err_15,
    stat_rx_bip_err_16 => stat_rx_bip_err_16,
    stat_rx_bip_err_17 => stat_rx_bip_err_17,
    stat_rx_bip_err_18 => stat_rx_bip_err_18,
    stat_rx_bip_err_19 => stat_rx_bip_err_19,
    stat_rx_bip_err_2 => stat_rx_bip_err_2,
    stat_rx_bip_err_3 => stat_rx_bip_err_3,
    stat_rx_bip_err_4 => stat_rx_bip_err_4,
    stat_rx_bip_err_5 => stat_rx_bip_err_5,
    stat_rx_bip_err_6 => stat_rx_bip_err_6,
    stat_rx_bip_err_7 => stat_rx_bip_err_7,
    stat_rx_bip_err_8 => stat_rx_bip_err_8,
    stat_rx_bip_err_9 => stat_rx_bip_err_9,
    stat_rx_block_lock => stat_rx_block_lock,
    stat_rx_broadcast => stat_rx_broadcast,
    stat_rx_fragment => stat_rx_fragment,
    stat_rx_framing_err_0 => stat_rx_framing_err_0,
    stat_rx_framing_err_1 => stat_rx_framing_err_1,
    stat_rx_framing_err_10 => stat_rx_framing_err_10,
    stat_rx_framing_err_11 => stat_rx_framing_err_11,
    stat_rx_framing_err_12 => stat_rx_framing_err_12,
    stat_rx_framing_err_13 => stat_rx_framing_err_13,
    stat_rx_framing_err_14 => stat_rx_framing_err_14,
    stat_rx_framing_err_15 => stat_rx_framing_err_15,
    stat_rx_framing_err_16 => stat_rx_framing_err_16,
    stat_rx_framing_err_17 => stat_rx_framing_err_17,
    stat_rx_framing_err_18 => stat_rx_framing_err_18,
    stat_rx_framing_err_19 => stat_rx_framing_err_19,
    stat_rx_framing_err_2 => stat_rx_framing_err_2,
    stat_rx_framing_err_3 => stat_rx_framing_err_3,
    stat_rx_framing_err_4 => stat_rx_framing_err_4,
    stat_rx_framing_err_5 => stat_rx_framing_err_5,
    stat_rx_framing_err_6 => stat_rx_framing_err_6,
    stat_rx_framing_err_7 => stat_rx_framing_err_7,
    stat_rx_framing_err_8 => stat_rx_framing_err_8,
    stat_rx_framing_err_9 => stat_rx_framing_err_9,
    stat_rx_framing_err_valid_0 => stat_rx_framing_err_valid_0,
    stat_rx_framing_err_valid_1 => stat_rx_framing_err_valid_1,
    stat_rx_framing_err_valid_10 => stat_rx_framing_err_valid_10,
    stat_rx_framing_err_valid_11 => stat_rx_framing_err_valid_11,
    stat_rx_framing_err_valid_12 => stat_rx_framing_err_valid_12,
    stat_rx_framing_err_valid_13 => stat_rx_framing_err_valid_13,
    stat_rx_framing_err_valid_14 => stat_rx_framing_err_valid_14,
    stat_rx_framing_err_valid_15 => stat_rx_framing_err_valid_15,
    stat_rx_framing_err_valid_16 => stat_rx_framing_err_valid_16,
    stat_rx_framing_err_valid_17 => stat_rx_framing_err_valid_17,
    stat_rx_framing_err_valid_18 => stat_rx_framing_err_valid_18,
    stat_rx_framing_err_valid_19 => stat_rx_framing_err_valid_19,
    stat_rx_framing_err_valid_2 => stat_rx_framing_err_valid_2,
    stat_rx_framing_err_valid_3 => stat_rx_framing_err_valid_3,
    stat_rx_framing_err_valid_4 => stat_rx_framing_err_valid_4,
    stat_rx_framing_err_valid_5 => stat_rx_framing_err_valid_5,
    stat_rx_framing_err_valid_6 => stat_rx_framing_err_valid_6,
    stat_rx_framing_err_valid_7 => stat_rx_framing_err_valid_7,
    stat_rx_framing_err_valid_8 => stat_rx_framing_err_valid_8,
    stat_rx_framing_err_valid_9 => stat_rx_framing_err_valid_9,
    stat_rx_got_signal_os => stat_rx_got_signal_os,
    stat_rx_hi_ber => stat_rx_hi_ber,
    stat_rx_inrangeerr => stat_rx_inrangeerr,
    stat_rx_internal_local_fault => stat_rx_internal_local_fault,
    stat_rx_jabber => stat_rx_jabber,
    stat_rx_local_fault => stat_rx_local_fault,
    stat_rx_mf_err => stat_rx_mf_err,
    stat_rx_mf_len_err => stat_rx_mf_len_err,
    stat_rx_mf_repeat_err => stat_rx_mf_repeat_err,
    stat_rx_misaligned => stat_rx_misaligned,
    stat_rx_multicast => stat_rx_multicast,
    stat_rx_oversize => stat_rx_oversize,
    stat_rx_packet_1024_1518_bytes => stat_rx_packet_1024_1518_bytes,
    stat_rx_packet_128_255_bytes => stat_rx_packet_128_255_bytes,
    stat_rx_packet_1519_1522_bytes => stat_rx_packet_1519_1522_bytes,
    stat_rx_packet_1523_1548_bytes => stat_rx_packet_1523_1548_bytes,
    stat_rx_packet_1549_2047_bytes => stat_rx_packet_1549_2047_bytes,
    stat_rx_packet_2048_4095_bytes => stat_rx_packet_2048_4095_bytes,
    stat_rx_packet_256_511_bytes => stat_rx_packet_256_511_bytes,
    stat_rx_packet_4096_8191_bytes => stat_rx_packet_4096_8191_bytes,
    stat_rx_packet_512_1023_bytes => stat_rx_packet_512_1023_bytes,
    stat_rx_packet_64_bytes => stat_rx_packet_64_bytes,
    stat_rx_packet_65_127_bytes => stat_rx_packet_65_127_bytes,
    stat_rx_packet_8192_9215_bytes => stat_rx_packet_8192_9215_bytes,
    stat_rx_packet_bad_fcs => stat_rx_packet_bad_fcs,
    stat_rx_packet_large => stat_rx_packet_large,
    stat_rx_packet_small => stat_rx_packet_small,
    stat_rx_pause => stat_rx_pause,
    stat_rx_pause_quanta0 => stat_rx_pause_quanta0,
    stat_rx_pause_quanta1 => stat_rx_pause_quanta1,
    stat_rx_pause_quanta2 => stat_rx_pause_quanta2,
    stat_rx_pause_quanta3 => stat_rx_pause_quanta3,
    stat_rx_pause_quanta4 => stat_rx_pause_quanta4,
    stat_rx_pause_quanta5 => stat_rx_pause_quanta5,
    stat_rx_pause_quanta6 => stat_rx_pause_quanta6,
    stat_rx_pause_quanta7 => stat_rx_pause_quanta7,
    stat_rx_pause_quanta8 => stat_rx_pause_quanta8,
    stat_rx_pause_req => stat_rx_pause_req,
    stat_rx_pause_valid => stat_rx_pause_valid,
    stat_rx_user_pause => stat_rx_user_pause,
    core_rx_reset => core_rx_reset,
    rx_clk => rx_clk,
    stat_rx_received_local_fault => stat_rx_received_local_fault,
    stat_rx_remote_fault => stat_rx_remote_fault,
    stat_rx_status => stat_rx_status,
    stat_rx_stomped_fcs => stat_rx_stomped_fcs,
    stat_rx_synced => stat_rx_synced,
    stat_rx_synced_err => stat_rx_synced_err,
    stat_rx_test_pattern_mismatch => stat_rx_test_pattern_mismatch,
    stat_rx_toolong => stat_rx_toolong,
    stat_rx_total_bytes => stat_rx_total_bytes,
    stat_rx_total_good_bytes => stat_rx_total_good_bytes,
    stat_rx_total_good_packets => stat_rx_total_good_packets,
    stat_rx_total_packets => stat_rx_total_packets,
    stat_rx_truncated => stat_rx_truncated,
    stat_rx_undersize => stat_rx_undersize,
    stat_rx_unicast => stat_rx_unicast,
    stat_rx_vlan => stat_rx_vlan,
    stat_rx_pcsl_demuxed => stat_rx_pcsl_demuxed,
    stat_rx_pcsl_number_0 => stat_rx_pcsl_number_0,
    stat_rx_pcsl_number_1 => stat_rx_pcsl_number_1,
    stat_rx_pcsl_number_10 => stat_rx_pcsl_number_10,
    stat_rx_pcsl_number_11 => stat_rx_pcsl_number_11,
    stat_rx_pcsl_number_12 => stat_rx_pcsl_number_12,
    stat_rx_pcsl_number_13 => stat_rx_pcsl_number_13,
    stat_rx_pcsl_number_14 => stat_rx_pcsl_number_14,
    stat_rx_pcsl_number_15 => stat_rx_pcsl_number_15,
    stat_rx_pcsl_number_16 => stat_rx_pcsl_number_16,
    stat_rx_pcsl_number_17 => stat_rx_pcsl_number_17,
    stat_rx_pcsl_number_18 => stat_rx_pcsl_number_18,
    stat_rx_pcsl_number_19 => stat_rx_pcsl_number_19,
    stat_rx_pcsl_number_2 => stat_rx_pcsl_number_2,
    stat_rx_pcsl_number_3 => stat_rx_pcsl_number_3,
    stat_rx_pcsl_number_4 => stat_rx_pcsl_number_4,
    stat_rx_pcsl_number_5 => stat_rx_pcsl_number_5,
    stat_rx_pcsl_number_6 => stat_rx_pcsl_number_6,
    stat_rx_pcsl_number_7 => stat_rx_pcsl_number_7,
    stat_rx_pcsl_number_8 => stat_rx_pcsl_number_8,
    stat_rx_pcsl_number_9 => stat_rx_pcsl_number_9,
    stat_tx_bad_fcs => stat_tx_bad_fcs,
    stat_tx_broadcast => stat_tx_broadcast,
    stat_tx_frame_error => stat_tx_frame_error,
    stat_tx_local_fault => stat_tx_local_fault,
    stat_tx_multicast => stat_tx_multicast,
    stat_tx_packet_1024_1518_bytes => stat_tx_packet_1024_1518_bytes,
    stat_tx_packet_128_255_bytes => stat_tx_packet_128_255_bytes,
    stat_tx_packet_1519_1522_bytes => stat_tx_packet_1519_1522_bytes,
    stat_tx_packet_1523_1548_bytes => stat_tx_packet_1523_1548_bytes,
    stat_tx_packet_1549_2047_bytes => stat_tx_packet_1549_2047_bytes,
    stat_tx_packet_2048_4095_bytes => stat_tx_packet_2048_4095_bytes,
    stat_tx_packet_256_511_bytes => stat_tx_packet_256_511_bytes,
    stat_tx_packet_4096_8191_bytes => stat_tx_packet_4096_8191_bytes,
    stat_tx_packet_512_1023_bytes => stat_tx_packet_512_1023_bytes,
    stat_tx_packet_64_bytes => stat_tx_packet_64_bytes,
    stat_tx_packet_65_127_bytes => stat_tx_packet_65_127_bytes,
    stat_tx_packet_8192_9215_bytes => stat_tx_packet_8192_9215_bytes,
    stat_tx_packet_large => stat_tx_packet_large,
    stat_tx_packet_small => stat_tx_packet_small,
    stat_tx_total_bytes => stat_tx_total_bytes,
    stat_tx_total_good_bytes => stat_tx_total_good_bytes,
    stat_tx_total_good_packets => stat_tx_total_good_packets,
    stat_tx_total_packets => stat_tx_total_packets,
    stat_tx_unicast => stat_tx_unicast,
    stat_tx_vlan => stat_tx_vlan,
    ctl_tx_send_idle => ctl_tx_send_idle,
    ctl_tx_send_rfi => ctl_tx_send_rfi,
    ctl_tx_send_lfi => ctl_tx_send_lfi,
    core_tx_reset => core_tx_reset,
    stat_tx_pause_valid => stat_tx_pause_valid,
    stat_tx_pause => stat_tx_pause,
    stat_tx_user_pause => stat_tx_user_pause,
    ctl_tx_pause_req => ctl_tx_pause_req,
    ctl_tx_resend_pause => ctl_tx_resend_pause,
    tx_axis_tready => tx_axis_tready,
    tx_axis_tvalid => tx_axis_tvalid,
    tx_axis_tdata => tx_axis_tdata,
    tx_axis_tlast => tx_axis_tlast,
    tx_axis_tkeep => tx_axis_tkeep,
    tx_axis_tuser => tx_axis_tuser,
    tx_ovfout => tx_ovfout,
    tx_unfout => tx_unfout,
    tx_preamblein => tx_preamblein,
    usr_tx_reset => usr_tx_reset,
    core_drp_reset => core_drp_reset,
    drp_clk => drp_clk,
    drp_addr => drp_addr,
    drp_di => drp_di,
    drp_en => drp_en,
    drp_do => drp_do,
    drp_rdy => drp_rdy,
    drp_we => drp_we
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file cmac_usplus_0.vhd when simulating
-- the core, cmac_usplus_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

