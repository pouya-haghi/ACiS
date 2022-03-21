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


// IP VLNV: xilinx.com:ip:ecc:2.0
// IP Revision: 13

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module qdma_subsystem_c2h_ecc (
  ecc_clk,
  ecc_reset,
  ecc_clken,
  ecc_data_in,
  ecc_data_out,
  ecc_chkbits_out
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ecc_clk, ASSOCIATED_BUSIF ECC_DATA_IN:ECC_DATA_OUT:ECC_CHKBITS_OUT:ECC_CHKBITS_IN, ASSOCIATED_RESET ecc_reset, FREQ_HZ 100000000, ASSOCIATED_CLKEN ecc_clken, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ecc_clk CLK" *)
input wire ecc_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ecc_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ecc_reset RST" *)
input wire ecc_reset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ecc_clken, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ecc_clken CE" *)
input wire ecc_clken;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ECC_DATA_IN, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 ECC_DATA_IN DATA" *)
input wire [56 : 0] ecc_data_in;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ECC_DATA_OUT, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 ECC_DATA_OUT DATA" *)
output wire [56 : 0] ecc_data_out;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ECC_CHKBITS_OUT, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 ECC_CHKBITS_OUT DATA" *)
output wire [6 : 0] ecc_chkbits_out;

  ecc_v2_0_13 #(
    .C_FAMILY("virtexuplusHBM"),
    .C_COMPONENT_NAME("qdma_subsystem_c2h_ecc"),
    .C_ECC_MODE(0),
    .C_ECC_TYPE(0),
    .C_DATA_WIDTH(57),
    .C_CHK_BIT_WIDTH(7),
    .C_REG_INPUT(0),
    .C_REG_OUTPUT(1),
    .C_PIPELINE(0),
    .C_USE_CLK_ENABLE(1)
  ) inst (
    .ecc_clk(ecc_clk),
    .ecc_reset(ecc_reset),
    .ecc_encode(1'B0),
    .ecc_correct_n(1'B0),
    .ecc_clken(ecc_clken),
    .ecc_data_in(ecc_data_in),
    .ecc_data_out(ecc_data_out),
    .ecc_chkbits_out(ecc_chkbits_out),
    .ecc_chkbits_in(7'B0),
    .ecc_sbit_err(),
    .ecc_dbit_err()
  );
endmodule
