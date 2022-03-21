// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
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

// IP VLNV: xilinx.com:ip:qdma:4.0
// IP Revision: 2

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
qdma_no_sriov your_instance_name (
  .sys_clk(sys_clk),                                                            // input wire sys_clk
  .sys_clk_gt(sys_clk_gt),                                                      // input wire sys_clk_gt
  .sys_rst_n(sys_rst_n),                                                        // input wire sys_rst_n
  .user_lnk_up(user_lnk_up),                                                    // output wire user_lnk_up
  .pci_exp_txp(pci_exp_txp),                                                    // output wire [15 : 0] pci_exp_txp
  .pci_exp_txn(pci_exp_txn),                                                    // output wire [15 : 0] pci_exp_txn
  .pci_exp_rxp(pci_exp_rxp),                                                    // input wire [15 : 0] pci_exp_rxp
  .pci_exp_rxn(pci_exp_rxn),                                                    // input wire [15 : 0] pci_exp_rxn
  .axi_aclk(axi_aclk),                                                          // output wire axi_aclk
  .axi_aresetn(axi_aresetn),                                                    // output wire axi_aresetn
  .usr_irq_in_vld(usr_irq_in_vld),                                              // input wire usr_irq_in_vld
  .usr_irq_in_vec(usr_irq_in_vec),                                              // input wire [10 : 0] usr_irq_in_vec
  .usr_irq_in_fnc(usr_irq_in_fnc),                                              // input wire [7 : 0] usr_irq_in_fnc
  .usr_irq_out_ack(usr_irq_out_ack),                                            // output wire usr_irq_out_ack
  .usr_irq_out_fail(usr_irq_out_fail),                                          // output wire usr_irq_out_fail
  .h2c_byp_out_dsc(h2c_byp_out_dsc),                                            // output wire [255 : 0] h2c_byp_out_dsc
  .h2c_byp_out_st_mm(h2c_byp_out_st_mm),                                        // output wire h2c_byp_out_st_mm
  .h2c_byp_out_dsc_sz(h2c_byp_out_dsc_sz),                                      // output wire [1 : 0] h2c_byp_out_dsc_sz
  .h2c_byp_out_qid(h2c_byp_out_qid),                                            // output wire [10 : 0] h2c_byp_out_qid
  .h2c_byp_out_error(h2c_byp_out_error),                                        // output wire h2c_byp_out_error
  .h2c_byp_out_func(h2c_byp_out_func),                                          // output wire [7 : 0] h2c_byp_out_func
  .h2c_byp_out_cidx(h2c_byp_out_cidx),                                          // output wire [15 : 0] h2c_byp_out_cidx
  .h2c_byp_out_port_id(h2c_byp_out_port_id),                                    // output wire [2 : 0] h2c_byp_out_port_id
  .h2c_byp_out_vld(h2c_byp_out_vld),                                            // output wire h2c_byp_out_vld
  .h2c_byp_out_rdy(h2c_byp_out_rdy),                                            // input wire h2c_byp_out_rdy
  .h2c_byp_out_fmt(h2c_byp_out_fmt),                                            // output wire [3 : 0] h2c_byp_out_fmt
  .c2h_byp_out_dsc(c2h_byp_out_dsc),                                            // output wire [255 : 0] c2h_byp_out_dsc
  .c2h_byp_out_st_mm(c2h_byp_out_st_mm),                                        // output wire c2h_byp_out_st_mm
  .c2h_byp_out_qid(c2h_byp_out_qid),                                            // output wire [10 : 0] c2h_byp_out_qid
  .c2h_byp_out_dsc_sz(c2h_byp_out_dsc_sz),                                      // output wire [1 : 0] c2h_byp_out_dsc_sz
  .c2h_byp_out_error(c2h_byp_out_error),                                        // output wire c2h_byp_out_error
  .c2h_byp_out_func(c2h_byp_out_func),                                          // output wire [7 : 0] c2h_byp_out_func
  .c2h_byp_out_cidx(c2h_byp_out_cidx),                                          // output wire [15 : 0] c2h_byp_out_cidx
  .c2h_byp_out_port_id(c2h_byp_out_port_id),                                    // output wire [2 : 0] c2h_byp_out_port_id
  .c2h_byp_out_vld(c2h_byp_out_vld),                                            // output wire c2h_byp_out_vld
  .c2h_byp_out_rdy(c2h_byp_out_rdy),                                            // input wire c2h_byp_out_rdy
  .c2h_byp_out_fmt(c2h_byp_out_fmt),                                            // output wire [3 : 0] c2h_byp_out_fmt
  .c2h_byp_out_pfch_tag(c2h_byp_out_pfch_tag),                                  // output wire [6 : 0] c2h_byp_out_pfch_tag
  .c2h_byp_in_st_csh_addr(c2h_byp_in_st_csh_addr),                              // input wire [63 : 0] c2h_byp_in_st_csh_addr
  .c2h_byp_in_st_csh_port_id(c2h_byp_in_st_csh_port_id),                        // input wire [2 : 0] c2h_byp_in_st_csh_port_id
  .c2h_byp_in_st_csh_qid(c2h_byp_in_st_csh_qid),                                // input wire [10 : 0] c2h_byp_in_st_csh_qid
  .c2h_byp_in_st_csh_error(c2h_byp_in_st_csh_error),                            // input wire c2h_byp_in_st_csh_error
  .c2h_byp_in_st_csh_func(c2h_byp_in_st_csh_func),                              // input wire [7 : 0] c2h_byp_in_st_csh_func
  .c2h_byp_in_st_csh_vld(c2h_byp_in_st_csh_vld),                                // input wire c2h_byp_in_st_csh_vld
  .c2h_byp_in_st_csh_rdy(c2h_byp_in_st_csh_rdy),                                // output wire c2h_byp_in_st_csh_rdy
  .c2h_byp_in_st_csh_pfch_tag(c2h_byp_in_st_csh_pfch_tag),                      // input wire [6 : 0] c2h_byp_in_st_csh_pfch_tag
  .h2c_byp_in_st_addr(h2c_byp_in_st_addr),                                      // input wire [63 : 0] h2c_byp_in_st_addr
  .h2c_byp_in_st_len(h2c_byp_in_st_len),                                        // input wire [15 : 0] h2c_byp_in_st_len
  .h2c_byp_in_st_eop(h2c_byp_in_st_eop),                                        // input wire h2c_byp_in_st_eop
  .h2c_byp_in_st_sop(h2c_byp_in_st_sop),                                        // input wire h2c_byp_in_st_sop
  .h2c_byp_in_st_mrkr_req(h2c_byp_in_st_mrkr_req),                              // input wire h2c_byp_in_st_mrkr_req
  .h2c_byp_in_st_port_id(h2c_byp_in_st_port_id),                                // input wire [2 : 0] h2c_byp_in_st_port_id
  .h2c_byp_in_st_sdi(h2c_byp_in_st_sdi),                                        // input wire h2c_byp_in_st_sdi
  .h2c_byp_in_st_qid(h2c_byp_in_st_qid),                                        // input wire [10 : 0] h2c_byp_in_st_qid
  .h2c_byp_in_st_error(h2c_byp_in_st_error),                                    // input wire h2c_byp_in_st_error
  .h2c_byp_in_st_func(h2c_byp_in_st_func),                                      // input wire [7 : 0] h2c_byp_in_st_func
  .h2c_byp_in_st_cidx(h2c_byp_in_st_cidx),                                      // input wire [15 : 0] h2c_byp_in_st_cidx
  .h2c_byp_in_st_no_dma(h2c_byp_in_st_no_dma),                                  // input wire h2c_byp_in_st_no_dma
  .h2c_byp_in_st_vld(h2c_byp_in_st_vld),                                        // input wire h2c_byp_in_st_vld
  .h2c_byp_in_st_rdy(h2c_byp_in_st_rdy),                                        // output wire h2c_byp_in_st_rdy
  .tm_dsc_sts_vld(tm_dsc_sts_vld),                                              // output wire tm_dsc_sts_vld
  .tm_dsc_sts_port_id(tm_dsc_sts_port_id),                                      // output wire [2 : 0] tm_dsc_sts_port_id
  .tm_dsc_sts_qen(tm_dsc_sts_qen),                                              // output wire tm_dsc_sts_qen
  .tm_dsc_sts_byp(tm_dsc_sts_byp),                                              // output wire tm_dsc_sts_byp
  .tm_dsc_sts_dir(tm_dsc_sts_dir),                                              // output wire tm_dsc_sts_dir
  .tm_dsc_sts_mm(tm_dsc_sts_mm),                                                // output wire tm_dsc_sts_mm
  .tm_dsc_sts_error(tm_dsc_sts_error),                                          // output wire tm_dsc_sts_error
  .tm_dsc_sts_qid(tm_dsc_sts_qid),                                              // output wire [10 : 0] tm_dsc_sts_qid
  .tm_dsc_sts_avl(tm_dsc_sts_avl),                                              // output wire [15 : 0] tm_dsc_sts_avl
  .tm_dsc_sts_qinv(tm_dsc_sts_qinv),                                            // output wire tm_dsc_sts_qinv
  .tm_dsc_sts_irq_arm(tm_dsc_sts_irq_arm),                                      // output wire tm_dsc_sts_irq_arm
  .tm_dsc_sts_rdy(tm_dsc_sts_rdy),                                              // input wire tm_dsc_sts_rdy
  .tm_dsc_sts_pidx(tm_dsc_sts_pidx),                                            // output wire [15 : 0] tm_dsc_sts_pidx
  .dsc_crdt_in_crdt(dsc_crdt_in_crdt),                                          // input wire [15 : 0] dsc_crdt_in_crdt
  .dsc_crdt_in_qid(dsc_crdt_in_qid),                                            // input wire [10 : 0] dsc_crdt_in_qid
  .dsc_crdt_in_dir(dsc_crdt_in_dir),                                            // input wire dsc_crdt_in_dir
  .dsc_crdt_in_fence(dsc_crdt_in_fence),                                        // input wire dsc_crdt_in_fence
  .dsc_crdt_in_vld(dsc_crdt_in_vld),                                            // input wire dsc_crdt_in_vld
  .dsc_crdt_in_rdy(dsc_crdt_in_rdy),                                            // output wire dsc_crdt_in_rdy
  .m_axil_awaddr(m_axil_awaddr),                                                // output wire [31 : 0] m_axil_awaddr
  .m_axil_awuser(m_axil_awuser),                                                // output wire [54 : 0] m_axil_awuser
  .m_axil_awprot(m_axil_awprot),                                                // output wire [2 : 0] m_axil_awprot
  .m_axil_awvalid(m_axil_awvalid),                                              // output wire m_axil_awvalid
  .m_axil_awready(m_axil_awready),                                              // input wire m_axil_awready
  .m_axil_wdata(m_axil_wdata),                                                  // output wire [31 : 0] m_axil_wdata
  .m_axil_wstrb(m_axil_wstrb),                                                  // output wire [3 : 0] m_axil_wstrb
  .m_axil_wvalid(m_axil_wvalid),                                                // output wire m_axil_wvalid
  .m_axil_wready(m_axil_wready),                                                // input wire m_axil_wready
  .m_axil_bvalid(m_axil_bvalid),                                                // input wire m_axil_bvalid
  .m_axil_bresp(m_axil_bresp),                                                  // input wire [1 : 0] m_axil_bresp
  .m_axil_bready(m_axil_bready),                                                // output wire m_axil_bready
  .m_axil_araddr(m_axil_araddr),                                                // output wire [31 : 0] m_axil_araddr
  .m_axil_aruser(m_axil_aruser),                                                // output wire [54 : 0] m_axil_aruser
  .m_axil_arprot(m_axil_arprot),                                                // output wire [2 : 0] m_axil_arprot
  .m_axil_arvalid(m_axil_arvalid),                                              // output wire m_axil_arvalid
  .m_axil_arready(m_axil_arready),                                              // input wire m_axil_arready
  .m_axil_rdata(m_axil_rdata),                                                  // input wire [31 : 0] m_axil_rdata
  .m_axil_rresp(m_axil_rresp),                                                  // input wire [1 : 0] m_axil_rresp
  .m_axil_rvalid(m_axil_rvalid),                                                // input wire m_axil_rvalid
  .m_axil_rready(m_axil_rready),                                                // output wire m_axil_rready
  .m_axis_h2c_tdata(m_axis_h2c_tdata),                                          // output wire [511 : 0] m_axis_h2c_tdata
  .m_axis_h2c_tcrc(m_axis_h2c_tcrc),                                            // output wire [31 : 0] m_axis_h2c_tcrc
  .m_axis_h2c_tuser_qid(m_axis_h2c_tuser_qid),                                  // output wire [10 : 0] m_axis_h2c_tuser_qid
  .m_axis_h2c_tuser_port_id(m_axis_h2c_tuser_port_id),                          // output wire [2 : 0] m_axis_h2c_tuser_port_id
  .m_axis_h2c_tuser_err(m_axis_h2c_tuser_err),                                  // output wire m_axis_h2c_tuser_err
  .m_axis_h2c_tuser_mdata(m_axis_h2c_tuser_mdata),                              // output wire [31 : 0] m_axis_h2c_tuser_mdata
  .m_axis_h2c_tuser_mty(m_axis_h2c_tuser_mty),                                  // output wire [5 : 0] m_axis_h2c_tuser_mty
  .m_axis_h2c_tuser_zero_byte(m_axis_h2c_tuser_zero_byte),                      // output wire m_axis_h2c_tuser_zero_byte
  .m_axis_h2c_tvalid(m_axis_h2c_tvalid),                                        // output wire m_axis_h2c_tvalid
  .m_axis_h2c_tlast(m_axis_h2c_tlast),                                          // output wire m_axis_h2c_tlast
  .m_axis_h2c_tready(m_axis_h2c_tready),                                        // input wire m_axis_h2c_tready
  .s_axis_c2h_tdata(s_axis_c2h_tdata),                                          // input wire [511 : 0] s_axis_c2h_tdata
  .s_axis_c2h_tcrc(s_axis_c2h_tcrc),                                            // input wire [31 : 0] s_axis_c2h_tcrc
  .s_axis_c2h_ctrl_marker(s_axis_c2h_ctrl_marker),                              // input wire s_axis_c2h_ctrl_marker
  .s_axis_c2h_ctrl_port_id(s_axis_c2h_ctrl_port_id),                            // input wire [2 : 0] s_axis_c2h_ctrl_port_id
  .s_axis_c2h_ctrl_ecc(s_axis_c2h_ctrl_ecc),                                    // input wire [6 : 0] s_axis_c2h_ctrl_ecc
  .s_axis_c2h_ctrl_len(s_axis_c2h_ctrl_len),                                    // input wire [15 : 0] s_axis_c2h_ctrl_len
  .s_axis_c2h_ctrl_qid(s_axis_c2h_ctrl_qid),                                    // input wire [10 : 0] s_axis_c2h_ctrl_qid
  .s_axis_c2h_ctrl_has_cmpt(s_axis_c2h_ctrl_has_cmpt),                          // input wire s_axis_c2h_ctrl_has_cmpt
  .s_axis_c2h_mty(s_axis_c2h_mty),                                              // input wire [5 : 0] s_axis_c2h_mty
  .s_axis_c2h_tvalid(s_axis_c2h_tvalid),                                        // input wire s_axis_c2h_tvalid
  .s_axis_c2h_tlast(s_axis_c2h_tlast),                                          // input wire s_axis_c2h_tlast
  .s_axis_c2h_tready(s_axis_c2h_tready),                                        // output wire s_axis_c2h_tready
  .s_axis_c2h_cmpt_tdata(s_axis_c2h_cmpt_tdata),                                // input wire [511 : 0] s_axis_c2h_cmpt_tdata
  .s_axis_c2h_cmpt_size(s_axis_c2h_cmpt_size),                                  // input wire [1 : 0] s_axis_c2h_cmpt_size
  .s_axis_c2h_cmpt_dpar(s_axis_c2h_cmpt_dpar),                                  // input wire [15 : 0] s_axis_c2h_cmpt_dpar
  .s_axis_c2h_cmpt_tvalid(s_axis_c2h_cmpt_tvalid),                              // input wire s_axis_c2h_cmpt_tvalid
  .s_axis_c2h_cmpt_ctrl_qid(s_axis_c2h_cmpt_ctrl_qid),                          // input wire [10 : 0] s_axis_c2h_cmpt_ctrl_qid
  .s_axis_c2h_cmpt_ctrl_cmpt_type(s_axis_c2h_cmpt_ctrl_cmpt_type),              // input wire [1 : 0] s_axis_c2h_cmpt_ctrl_cmpt_type
  .s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id(s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id),  // input wire [15 : 0] s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id
  .s_axis_c2h_cmpt_ctrl_port_id(s_axis_c2h_cmpt_ctrl_port_id),                  // input wire [2 : 0] s_axis_c2h_cmpt_ctrl_port_id
  .s_axis_c2h_cmpt_ctrl_marker(s_axis_c2h_cmpt_ctrl_marker),                    // input wire s_axis_c2h_cmpt_ctrl_marker
  .s_axis_c2h_cmpt_ctrl_user_trig(s_axis_c2h_cmpt_ctrl_user_trig),              // input wire s_axis_c2h_cmpt_ctrl_user_trig
  .s_axis_c2h_cmpt_ctrl_col_idx(s_axis_c2h_cmpt_ctrl_col_idx),                  // input wire [2 : 0] s_axis_c2h_cmpt_ctrl_col_idx
  .s_axis_c2h_cmpt_ctrl_err_idx(s_axis_c2h_cmpt_ctrl_err_idx),                  // input wire [2 : 0] s_axis_c2h_cmpt_ctrl_err_idx
  .s_axis_c2h_cmpt_tready(s_axis_c2h_cmpt_tready),                              // output wire s_axis_c2h_cmpt_tready
  .s_axis_c2h_cmpt_ctrl_no_wrb_marker(s_axis_c2h_cmpt_ctrl_no_wrb_marker),      // input wire s_axis_c2h_cmpt_ctrl_no_wrb_marker
  .axis_c2h_status_drop(axis_c2h_status_drop),                                  // output wire axis_c2h_status_drop
  .axis_c2h_status_valid(axis_c2h_status_valid),                                // output wire axis_c2h_status_valid
  .axis_c2h_status_cmp(axis_c2h_status_cmp),                                    // output wire axis_c2h_status_cmp
  .axis_c2h_status_error(axis_c2h_status_error),                                // output wire axis_c2h_status_error
  .axis_c2h_status_last(axis_c2h_status_last),                                  // output wire axis_c2h_status_last
  .axis_c2h_status_qid(axis_c2h_status_qid),                                    // output wire [10 : 0] axis_c2h_status_qid
  .axis_c2h_dmawr_cmp(axis_c2h_dmawr_cmp),                                      // output wire axis_c2h_dmawr_cmp
  .soft_reset_n(soft_reset_n),                                                  // input wire soft_reset_n
  .phy_ready(phy_ready),                                                        // output wire phy_ready
  .qsts_out_op(qsts_out_op),                                                    // output wire [7 : 0] qsts_out_op
  .qsts_out_data(qsts_out_data),                                                // output wire [63 : 0] qsts_out_data
  .qsts_out_port_id(qsts_out_port_id),                                          // output wire [2 : 0] qsts_out_port_id
  .qsts_out_qid(qsts_out_qid),                                                  // output wire [12 : 0] qsts_out_qid
  .qsts_out_vld(qsts_out_vld),                                                  // output wire qsts_out_vld
  .qsts_out_rdy(qsts_out_rdy)                                                  // input wire qsts_out_rdy
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file qdma_no_sriov.v when simulating
// the core, qdma_no_sriov. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

