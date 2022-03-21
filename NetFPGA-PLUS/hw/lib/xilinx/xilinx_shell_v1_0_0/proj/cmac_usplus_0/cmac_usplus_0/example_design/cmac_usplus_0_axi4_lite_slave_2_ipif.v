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
////////////////////////////////////////////////////////////////////////////
//
// AXI4-Lite Slave interface example
//
// The purpose of this design is to provide a simple AXI4-Lite Slave interface.
//
// The AXI4-Lite interface is a subset of the AXI4 interface intended for
// communication with control registers in components.
// The key features of the AXI4-Lite interface are:
//         >> all transactions are burst length of 1
//         >> all data accesses are the same size as the width of the data bus
//         >> support for data bus width of 32-bit or 64-bit
//
// This design implements AXI Slave to IPIF master
//
////////////////////////////////////////////////////////////////////////////
`timescale 1ps/1ps

(* DowngradeIPIdentifiedWarnings="yes" *)
module cmac_usplus_0_axi4_lite_slave_2_ipif #(
  parameter C_S_AXI_ADDR_WIDTH = 32,   // Width of M_AXI address bus
  parameter C_S_AXI_DATA_WIDTH = 32    // Width of M_AXI data bus
)
(
  ////////////////////////////////////////////////////////////////////////////
  // System Signals

  ////////////////////////////////////////////////////////////////////////////
  // AXI clock signal
  input wire S_AXI_ACLK,
  ////////////////////////////////////////////////////////////////////////////
  // AXI active high reset signal
  input wire S_AXI_SRESET,

  ////////////////////////////////////////////////////////////////////////////
  // Slave Interface Write Address channel Ports

  ////////////////////////////////////////////////////////////////////////////
  // Master Interface Write Address Channel ports
  // Write address (issued by master, acceped by Slave)
  input  wire [C_S_AXI_ADDR_WIDTH - 1:0] S_AXI_AWADDR,
  ////////////////////////////////////////////////////////////////////////////
  // Write address valid. This signal indicates that the master signaling
  // valid write address and control information.
  input  wire                          S_AXI_AWVALID,
  ////////////////////////////////////////////////////////////////////////////
  // Write address ready. This signal indicates that the slave is ready
  // to accept an address and associated control signals.
  output wire                          S_AXI_AWREADY,

  ////////////////////////////////////////////////////////////////////////////
  // Slave Interface Write Data channel Ports
  // Write data (issued by master, acceped by Slave)
  input  wire [C_S_AXI_DATA_WIDTH-1:0] S_AXI_WDATA,
  ////////////////////////////////////////////////////////////////////////////
  // Write strobes. This signal indicates which byte lanes hold
  // valid data. There is one write strobe bit for each eight
  // bits of the write data bus.
  input  wire [C_S_AXI_DATA_WIDTH/8-1:0] S_AXI_WSTRB,
  ////////////////////////////////////////////////////////////////////////////
  //Write valid. This signal indicates that valid write
  // data and strobes are available.
  input  wire                          S_AXI_WVALID,
  ////////////////////////////////////////////////////////////////////////////
  // Write ready. This signal indicates that the slave
  // can accept the write data.
  output wire                          S_AXI_WREADY,

  ////////////////////////////////////////////////////////////////////////////
  // Slave Interface Write Response channel Ports

  ////////////////////////////////////////////////////////////////////////////
  // Write response. This signal indicates the status
  // of the write transaction.
  output wire [1:0]                    S_AXI_BRESP,
  ////////////////////////////////////////////////////////////////////////////
  // Write response valid. This signal indicates that the channel
  // is signaling a valid write response.
  output wire                          S_AXI_BVALID,
  ////////////////////////////////////////////////////////////////////////////
  // Response ready. This signal indicates that the master
  // can accept a write response.
  input  wire                          S_AXI_BREADY,

  ////////////////////////////////////////////////////////////////////////////
  // Slave Interface Read Address channel Ports
  // Read address (issued by master, acceped by Slave)
  input  wire [C_S_AXI_ADDR_WIDTH - 1:0] S_AXI_ARADDR,
  ////////////////////////////////////////////////////////////////////////////
  // Read address valid. This signal indicates that the channel
  // is signaling valid read address and control information.
  input  wire                          S_AXI_ARVALID,
  ////////////////////////////////////////////////////////////////////////////
  // Read address ready. This signal indicates that the slave is
  // ready to accept an address and associated control signals.
  output wire                          S_AXI_ARREADY,

  ////////////////////////////////////////////////////////////////////////////
  // Slave Interface Read Data channel Ports
  // Read data (issued by slave)
  output wire [C_S_AXI_DATA_WIDTH-1:0] S_AXI_RDATA,
  ////////////////////////////////////////////////////////////////////////////
  // Read response. This signal indicates the status of the
  // read transfer.
  output wire [1:0]                    S_AXI_RRESP,
  ////////////////////////////////////////////////////////////////////////////
  // Read valid. This signal indicates that the channel is
  // signaling the required read data.
  output wire                          S_AXI_RVALID,
  ////////////////////////////////////////////////////////////////////////////
  // Read ready. This signal indicates that the master can
  // accept the read data and response information.
  input  wire                          S_AXI_RREADY,

  output wire                            Bus2IP_Clk,
  output wire                            Bus2IP_Reset,
  output wire [C_S_AXI_ADDR_WIDTH-1:0]   Bus2IP_Addr,
  output wire                            Bus2IP_RNW,
  output wire                            Bus2IP_CS,
  output wire                            Bus2IP_RdCE,    // Not used
  output wire                            Bus2IP_WrCE,    // Not used
  output wire [C_S_AXI_DATA_WIDTH-1:0]   Bus2IP_Data,
  output wire [C_S_AXI_DATA_WIDTH/8-1:0] Bus2IP_BE,
  input       [C_S_AXI_DATA_WIDTH-1:0]   IP2Bus_Data,
  input                                  IP2Bus_WrAck,
  input                                  IP2Bus_RdAck,
  input                                  IP2Bus_WrError,
  input                                  IP2Bus_RdError
);

////////////////////////////////////////////////////////////////////////////
// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
// ADDR_LSB is used for addressing 32/64 bit registers/memories
// ADDR_LSB = 2 for 32 bits (n downto 2)
// ADDR_LSB = 3 for 64 bits (n downto 3)

////////////////////////////////////////////////////////////////////////////
// function called clogb2 that returns an integer which has the
// value of the ceiling of the log base 2.
function integer clogb2 (input integer bd);
integer bit_depth;
begin
  bit_depth = bd;
  for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
    bit_depth = bit_depth >> 1;
  end
endfunction

localparam integer ADDR_LSB = clogb2(C_S_AXI_DATA_WIDTH/8)-1;
localparam integer ADDR_MSB = C_S_AXI_ADDR_WIDTH;

localparam P_AXI_RESP_OKAY  = 2'b0;
localparam P_AXI_RESP_SLVERR = 2'b10;


////////////////////////////////////////////////////////////////////////////
// AXI4 Lite internal signals

////////////////////////////////////////////////////////////////////////////
// read response
reg [1 :0]                   axi_rresp;
////////////////////////////////////////////////////////////////////////////
// write response
reg [1 :0]                   axi_bresp;
////////////////////////////////////////////////////////////////////////////
// write address acceptance
reg                          axi_awready;
////////////////////////////////////////////////////////////////////////////
// write data acceptance
reg                          axi_wready;
////////////////////////////////////////////////////////////////////////////
// write response valid
reg                          axi_bvalid;
////////////////////////////////////////////////////////////////////////////
// read data valid
reg                          axi_rvalid;
////////////////////////////////////////////////////////////////////////////
// write address
reg [ADDR_MSB-1:0] axi_awaddr;

////////////////////////////////////////////////////////////////////////////
// write data
reg [C_S_AXI_DATA_WIDTH-1:0] axi_wdata;

////////////////////////////////////////////////////////////////////////////
// write strobe
reg [C_S_AXI_DATA_WIDTH/8-1:0] axi_wstrb_reg;
reg [C_S_AXI_DATA_WIDTH/8-1:0] axi_wstrb;

////////////////////////////////////////////////////////////////////////////
// read address valid
reg [ADDR_MSB-1:0] axi_araddr;
////////////////////////////////////////////////////////////////////////////
// read data
reg [C_S_AXI_DATA_WIDTH-1:0] axi_rdata;

////////////////////////////////////////////////////////////////////////////
// read address acceptance
reg                          axi_arready;

////////////////////////////////////////////////////////////////////////////
// Example-specific design signals


////////////////////////////////////////////////////////////////////////////
// Signals for user logic chip select generation

////////////////////////////////////////////////////////////////////////////
// Signals for user logic register space example
// Four slave register

////////////////////////////////////////////////////////////////////////////
// Slave register read enable
reg                             slv_reg_rden;
////////////////////////////////////////////////////////////////////////////
// Slave register write enable
reg                             slv_reg_wren;
////////////////////////////////////////////////////////////////////////////

integer                         byte_index;

////////////////////////////////////////////////////////////////////////////
//I/O Connections assignments

////////////////////////////////////////////////////////////////////////////
//Write Address Ready (AWREADY)
assign S_AXI_AWREADY = axi_awready;

////////////////////////////////////////////////////////////////////////////
//Write Data Ready(WREADY)
assign S_AXI_WREADY  = axi_wready;

////////////////////////////////////////////////////////////////////////////
//Write Response (BResp)and response valid (BVALID)
assign S_AXI_BRESP  = axi_bresp;
assign S_AXI_BVALID = axi_bvalid;

////////////////////////////////////////////////////////////////////////////
//Read Address Ready(AREADY)
assign S_AXI_ARREADY = axi_arready;

////////////////////////////////////////////////////////////////////////////
//Read and Read Data (RDATA), Read Valid (RVALID) and Response (RRESP)
assign S_AXI_RDATA  = axi_rdata;
assign S_AXI_RVALID = axi_rvalid;
assign S_AXI_RRESP  = axi_rresp;


////////////////////////////////////////////////////////////////////////////
// Implement axi_awready generation
//
//  axi_awready is asserted for one S_AXI_ACLK clock cycle when both
//  S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
//  de-asserted when reset is low.

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_awready <= 1'b0;
      end
    else
      begin
        if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && ~slv_reg_wren)
          begin
            ////////////////////////////////////////////////////////////////////////////
            // slave is ready to accept write address when
            // there is a valid write address and write data
            // on the write address and data bus. This design
            // expects no outstanding transactions.
            axi_awready <= 1'b1;
          end
        else
          begin
            axi_awready <= 1'b0;
          end
      end
  end

////////////////////////////////////////////////////////////////////////////
// Implement axi_awaddr latching
//
//  This process is used to latch the address when both
//  S_AXI_AWVALID and S_AXI_WVALID are valid.

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_awaddr <= 0;
      end
    else
      begin
        if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
          begin
            ////////////////////////////////////////////////////////////////////////////
            // address latching
            axi_awaddr <= S_AXI_AWADDR;
          end
      end
  end


// -------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////
// Implement axi_wdata latching
//
//  This process is used to latch the address when both
//  S_AXI_WVALID and S_AXI_WREADY are valid.

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_wdata <= 0;
      end
    else
      begin
        if (~axi_wready && S_AXI_WVALID)
          begin
            ////////////////////////////////////////////////////////////////////////////
            // data latching
            axi_wdata <= S_AXI_WDATA;
          end
      end
  end

////////////////////////////////////////////////////////////////////////////
// Registering axi_wstrb

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_wstrb_reg <= 0;
        axi_wstrb     <= 0;
      end
    else
      begin
        axi_wstrb_reg <= S_AXI_WSTRB;
        axi_wstrb     <= axi_wstrb_reg;
      end
  end
// -------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////
// Implement axi_wready generation
//
//  axi_wready is asserted for one S_AXI_ACLK clock cycle when both
//  S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is
//  de-asserted when reset is low.

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_wready <= 1'b0;
      end
    else
      begin
        if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && ~slv_reg_wren)
          begin
            ////////////////////////////////////////////////////////////////////////////
            // slave is ready to accept write data when
            // there is a valid write address and write data
            // on the write address and data bus. This design
            // expects no outstanding transactions.
            axi_wready <= 1'b1;
          end
        else
          begin
            axi_wready <= 1'b0;
          end
      end
  end

// Slave register write enable is asserted when valid address and data are available
// and the slave is ready to accept the write address and write data.
  always @ (posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1)
      slv_reg_wren <= 0;
    else if (axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID)
      slv_reg_wren <= 1;
    else if (IP2Bus_WrAck || IP2Bus_WrError)
      slv_reg_wren <= 0;
  end

////////////////////////////////////////////////////////////////////////////
// Implement write response logic generation
//
//  The write response and response valid signals are asserted by the slave
//  when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.
//  This marks the acceptance of address and indicates the status of
//  write transaction.

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_bvalid  <= 0;
        axi_bresp   <= P_AXI_RESP_OKAY;
      end
    else
      begin
        // if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
        // ------------------------
        // write response is set to 2'b10 when there is a write error/failure
        if (S_AXI_BREADY && axi_bvalid)
          begin
            axi_bvalid <= 1'b0;
            axi_bresp  <= P_AXI_RESP_OKAY; 
          end
        // ------------------------
        else if (slv_reg_wren && IP2Bus_WrAck)
          begin
            // indicates a valid write response is available
            axi_bvalid <= 1'b1;
            axi_bresp  <= {IP2Bus_WrError , 1'b0}; // 'OKAY' response or 'SLVERR' response
          end
        end
  end


////////////////////////////////////////////////////////////////////////////
// Implement axi_arready generation
//
//  axi_arready is asserted for one S_AXI_ACLK clock cycle when
//  S_AXI_ARVALID is asserted. axi_awready is
//  de-asserted when reset (active low) is asserted.
//  The read address is also latched when S_AXI_ARVALID is
//  asserted. axi_araddr is reset to zero on reset assertion.

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_arready <= 1'b0;
        axi_araddr  <= {ADDR_MSB{1'b0}};
      end
    else
      begin
        if (~axi_arready && S_AXI_ARVALID && ~axi_rvalid && ~slv_reg_rden)
          begin
            // indicates that the slave has acceped the valid read address
            axi_arready <= 1'b1;
            axi_araddr  <= S_AXI_ARADDR;
          end
        else
          begin
            axi_arready <= 1'b0;
          end
      end
  end

////////////////////////////////////////////////////////////////////////////
// Implement memory mapped register select and read logic generation
//
//  axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both
//  a read is outstand (slv_reg_rden) and the IPIF Read is acknolwedged 
//  (IP2Bus_RdAck). It is deasserted on reset (active low). 
//  axi_rresp and axi_rdata are cleared to zero on reset (active low).

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_rvalid <= 0;
        axi_rresp  <= 0;
      end
    else
      begin
        // if (axi_arready && S_AXI_ARVALID && ~axi_rvalid && IP2Bus_RdAck)
        // ------------------------
        //read response is set to 2'b10 when there is a read error/failure
        if (axi_rvalid && S_AXI_RREADY)
          begin
            axi_rvalid <= 1'b0;
            axi_rresp  <= P_AXI_RESP_OKAY; 
          end
        // ------------------------
        else if (slv_reg_rden && IP2Bus_RdAck)
          begin
            // Valid read data is available at the read data bus
            axi_rvalid <= 1'b1;
            axi_rresp  <= {IP2Bus_RdError , 1'b0}; // 'OKAY' response or 'SLVERR' response
          end
        end
  end


////////////////////////////////////////////////////////////////////////////
// Slave register read enable is asserted when valid address is available
// and the slave is ready to accept the read address.
  always @ (posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1)
      slv_reg_rden <= 0;
    else if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
      slv_reg_rden <= 1;
    else if (IP2Bus_RdAck || IP2Bus_RdError)
      slv_reg_rden <= 0;
  end

  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_SRESET == 1'b1 )
      begin
        axi_rdata  <= 0;
      end
    else
      begin
        ////////////////////////////////////////////////////////////////////////////
        // When there is a valid read response from the IPIF 
        // output the read dada
        if (slv_reg_rden && IP2Bus_RdAck)
          begin
            axi_rdata <= IP2Bus_Data;     // register read data
          end
      end
  end

  assign Bus2IP_Clk    = S_AXI_ACLK;
  assign Bus2IP_Reset  = S_AXI_SRESET;
  assign Bus2IP_Addr   = slv_reg_wren ? axi_awaddr : axi_araddr ;
  assign Bus2IP_RNW    = slv_reg_rden;
  assign Bus2IP_CS     = slv_reg_rden | slv_reg_wren;
  assign Bus2IP_RdCE   = 1'b0;
  assign Bus2IP_WrCE   = 1'b0;
  //assign Bus2IP_Data   = S_AXI_WDATA;
  assign Bus2IP_Data   = slv_reg_wren ? axi_wdata : 32'd0;
  //assign Bus2IP_BE     = slv_reg_wren ? S_AXI_WSTRB : {C_S_AXI_DATA_WIDTH{1'b1}};
  assign Bus2IP_BE     = slv_reg_wren ? axi_wstrb : {C_S_AXI_DATA_WIDTH{1'b1}};

endmodule


