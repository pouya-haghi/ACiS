`timescale 1ns / 1ps

// default_nettype of none prevents implicit wire declaration.
`default_nettype none

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module HBM_read_master #(
  // Set to the address width of the interface
  parameter integer C_M_AXI_ADDR_WIDTH  = 64,

  // Set the data width of the interface
  // Range: 32, 64, 128, 256, 512, 1024
  parameter integer C_M_AXI_DATA_WIDTH  = 512,
  // Width of the ctrl_xfer_size_in_bytes input
  // Range: 16:C_M_AXI_ADDR_WIDTH
//  parameter integer C_XFER_SIZE_WIDTH   = C_M_AXI_ADDR_WIDTH,
  // Specifies the maximum number of AXI4 transactions that may be outstanding.
  // Affects FIFO depth if data FIFO is enabled.
  parameter integer C_MAX_OUTSTANDING   = 16
)
(
  // System signals
  input  wire                          aclk,
  input  wire                          areset,
  // Control signals
  input  wire                          ctrl_start,              // Pulse high for one cycle to begin reading
  output wire                          ctrl_done,               // Pulses high for one cycle when transfer request is complete
  // The following ctrl signals are sampled when ctrl_start is asserted
  input  wire [C_M_AXI_ADDR_WIDTH-1:0] ctrl_addr_offset,        // Starting Address offset
  input  wire [C_M_AXI_ADDR_WIDTH-1:0]  ctrl_xfer_size_in_bytes, // Length in number of bytes, limited by the address width.
  // AXI4 master interface (read only)
  output wire                          m_axi_arvalid,
  input  wire                          m_axi_arready,
  output wire [C_M_AXI_ADDR_WIDTH-1:0] m_axi_araddr,
  output wire [8-1:0]                  m_axi_arlen,
  input  wire                          m_axi_rvalid,
  output wire                          m_axi_rready,
  input  wire [C_M_AXI_DATA_WIDTH-1:0] m_axi_rdata,
  input  wire                          m_axi_rlast,
  // AXI4-Stream master interface
  output wire                          m_axis_tvalid,
  input wire                           m_axis_tready,
  output wire [C_M_AXI_DATA_WIDTH-1:0] m_axis_tdata
//  output wire                          m_axis_tlast,
//  input wire                           is_vle32_vv
);

///////////////////////////////////////////////////////////////////////////////
// Local Parameters
///////////////////////////////////////////////////////////////////////////////
localparam integer LP_DW_BYTES                   = C_M_AXI_DATA_WIDTH/8;
localparam integer LP_LOG_DW_BYTES               = $clog2(LP_DW_BYTES);
localparam integer LP_MAX_BURST_LENGTH           = 256;   // Max AXI Protocol burst length
localparam integer LP_MAX_BURST_BYTES            = 4096;  // Max AXI Protocol burst size in bytes
localparam integer LP_AXI_BURST_LEN              = f_min(LP_MAX_BURST_BYTES/LP_DW_BYTES, LP_MAX_BURST_LENGTH);
localparam integer LP_LOG_BURST_LEN              = $clog2(LP_AXI_BURST_LEN);
localparam integer LP_OUTSTANDING_CNTR_WIDTH     = $clog2(C_MAX_OUTSTANDING+1);
localparam integer LP_TOTAL_LEN_WIDTH            = C_M_AXI_ADDR_WIDTH-LP_LOG_DW_BYTES;
localparam integer LP_TRANSACTION_CNTR_WIDTH     = LP_TOTAL_LEN_WIDTH-LP_LOG_BURST_LEN;
localparam [C_M_AXI_ADDR_WIDTH-1:0] LP_ADDR_MASK = LP_DW_BYTES*LP_AXI_BURST_LEN - 1;
// FIFO Parameters
localparam integer LP_FIFO_DEPTH                 = 2**($clog2(LP_AXI_BURST_LEN*C_MAX_OUTSTANDING)); // Ensure power of 2
localparam integer LP_FIFO_READ_LATENCY          = 2; // 2: Registered output on BRAM, 1: Registered output on LUTRAM
localparam integer LP_FIFO_COUNT_WIDTH           = $clog2(LP_FIFO_DEPTH)+1;

///////////////////////////////////////////////////////////////////////////////
// Variables
///////////////////////////////////////////////////////////////////////////////
// Control logic
logic                                     done;
logic                                     has_partial_bursts;
logic                                     start_d1 = 1'b0;
logic [C_M_AXI_ADDR_WIDTH-1:0]            addr_offset_r;
logic                                     start    = 1'b0;
logic [LP_TOTAL_LEN_WIDTH-1:0]            total_len_r;
logic [LP_TRANSACTION_CNTR_WIDTH-1:0]     num_transactions;
logic [LP_LOG_BURST_LEN-1:0]              final_burst_len;
logic                                     single_transaction;
logic                                     ar_idle = 1'b1;
logic                                     ar_done;
// AXI Read Address Channel
logic                                     arxfer;
logic                                     arvalid_r = 1'b0;
logic [C_M_AXI_ADDR_WIDTH-1:0]            addr;
logic [LP_TRANSACTION_CNTR_WIDTH-1:0]     ar_transactions_to_go;
logic                                     ar_final_transaction;
logic                                     stall_ar;
// AXI Data Channel
logic                                     rxfer;
logic                                     r_completed;
logic                                     decr_r_transaction_cntr;
logic [LP_TRANSACTION_CNTR_WIDTH-1:0]     r_transactions_to_go;
logic                                     r_final_transaction;
logic [LP_OUTSTANDING_CNTR_WIDTH-1:0]     outstanding_vacancy_count;

///////////////////////////////////////////////////////////////////////////////
// Control Logic
///////////////////////////////////////////////////////////////////////////////

always @(posedge aclk) begin
  if (areset) begin
    done <= 1'b0;
  end
  else begin
    done <= (rxfer & m_axi_rlast & r_final_transaction) ? 1'b1 : (ctrl_done ? 1'b0 : done);
  end
end

assign ctrl_done = done;

always @(posedge aclk) begin
  start_d1 <= ctrl_start;
end

// Store the address and transfer size after some pre-processing.
always @(posedge aclk) begin
  if (ctrl_start) begin
    // Round transfer size up to integer value of the axi interface data width. Convert to axi_arlen format which is length -1.
    total_len_r <= ctrl_xfer_size_in_bytes[0+:LP_LOG_DW_BYTES] > 0
                      ? ctrl_xfer_size_in_bytes[LP_LOG_DW_BYTES+:LP_TOTAL_LEN_WIDTH]
                      : ctrl_xfer_size_in_bytes[LP_LOG_DW_BYTES+:LP_TOTAL_LEN_WIDTH] - 1'b1;
    // Align transfer to 4kB to avoid AXI protocol issues if starting address is not correctly aligned.
    addr_offset_r <= ctrl_addr_offset & ~LP_ADDR_MASK;
  end
end

// Determine how many full burst to issue and if there are any partial bursts.
assign num_transactions = total_len_r[LP_LOG_BURST_LEN+:LP_TRANSACTION_CNTR_WIDTH];
assign has_partial_bursts = total_len_r[0+:LP_LOG_BURST_LEN] == {LP_LOG_BURST_LEN{1'b1}} ? 1'b0 : 1'b1;

always @(posedge aclk) begin
  start <= start_d1;
  final_burst_len <=  total_len_r[0+:LP_LOG_BURST_LEN];
end

// Special case if there is only 1 AXI transaction.
assign single_transaction = (num_transactions == {LP_TRANSACTION_CNTR_WIDTH{1'b0}}) ? 1'b1 : 1'b0;

///////////////////////////////////////////////////////////////////////////////
// AXI Read Address Channel
///////////////////////////////////////////////////////////////////////////////
assign m_axi_arvalid = arvalid_r;
assign m_axi_araddr = addr;
assign m_axi_arlen  = ar_final_transaction || (start & single_transaction) ? final_burst_len : LP_AXI_BURST_LEN - 1;

assign arxfer = m_axi_arvalid & m_axi_arready;

always @(posedge aclk) begin
  if (areset) begin
    arvalid_r <= 1'b0;
  end
  else begin
    arvalid_r <= ~ar_idle & ~stall_ar & ~arvalid_r ? 1'b1 :
                 m_axi_arready ? 1'b0 : arvalid_r;
  end
end

// When ar_idle, there are no transactions to issue.
always @(posedge aclk) begin
  if (areset) begin
    ar_idle <= 1'b1;
  end
  else begin
    ar_idle <= start   ? 1'b0 :
               ar_done ? 1'b1 :
                         ar_idle;
  end
end

// Increment to next address after each transaction is issued.
always @(posedge aclk) begin
  addr <= start ? addr_offset_r :
          arxfer     ? addr + LP_AXI_BURST_LEN*C_M_AXI_DATA_WIDTH/8 :
                       addr;
end

// Counts down the number of transactions to send.
rtl_kernel_wizard_0_example_counter #(
  .C_WIDTH ( LP_TRANSACTION_CNTR_WIDTH         ) ,
  .C_INIT  ( {LP_TRANSACTION_CNTR_WIDTH{1'b0}} )
)
inst_ar_transaction_cntr (
  .clk        ( aclk                   ) ,
  .clken      ( 1'b1                   ) ,
  .rst        ( areset                 ) ,
  .load       ( start                  ) ,
  .incr       ( 1'b0                   ) ,
  .decr       ( arxfer                 ) ,
  .load_value ( num_transactions       ) ,
  .count      ( ar_transactions_to_go  ) ,
  .is_zero    ( ar_final_transaction   )
);

assign ar_done = ar_final_transaction && arxfer;

// Keeps track of the number of outstanding transactions. Stalls
// when the value is reached so that the FIFO won't overflow.
// If no FIFO present, then just limit at max outstanding transactions.
rtl_kernel_wizard_0_example_counter #(
  .C_WIDTH ( LP_OUTSTANDING_CNTR_WIDTH                       ) ,
  .C_INIT  ( C_MAX_OUTSTANDING[0+:LP_OUTSTANDING_CNTR_WIDTH] )
)
inst_ar_to_r_transaction_cntr (
  .clk        ( aclk                              ) ,
  .clken      ( 1'b1                              ) ,
  .rst        ( areset                            ) ,
  .load       ( 1'b0                              ) ,
  .incr       ( r_completed                       ) ,
  .decr       ( arxfer                            ) ,
  .load_value ( {LP_OUTSTANDING_CNTR_WIDTH{1'b0}} ) ,
  .count      ( outstanding_vacancy_count         ) ,
  .is_zero    ( stall_ar                          )
);

///////////////////////////////////////////////////////////////////////////////
// AXI Read Channel
///////////////////////////////////////////////////////////////////////////////
  // All signals pass through.
  assign m_axis_tvalid = m_axi_rvalid;
  assign m_axis_tdata  = m_axi_rdata;
  assign m_axi_rready  = m_axis_tready;
//  assign m_axis_tlast  = m_axi_rlast;

assign rxfer = m_axi_rready & m_axi_rvalid;

assign r_completed = m_axi_rvalid & m_axi_rready & m_axi_rlast;

always_comb begin
  decr_r_transaction_cntr = rxfer & m_axi_rlast;
end

rtl_kernel_wizard_0_example_counter #(
  .C_WIDTH ( LP_TRANSACTION_CNTR_WIDTH         ) ,
  .C_INIT  ( {LP_TRANSACTION_CNTR_WIDTH{1'b0}} )
)
inst_r_transaction_cntr (
  .clk        ( aclk                          ) ,
  .clken      ( 1'b1                          ) ,
  .rst        ( areset                        ) ,
  .load       ( start                         ) ,
  .incr       ( 1'b0                          ) ,
  .decr       ( decr_r_transaction_cntr       ) ,
  .load_value ( num_transactions              ) ,
  .count      ( r_transactions_to_go          ) ,
  .is_zero    ( r_final_transaction           )
);

endmodule : HBM_read_master

`default_nettype wire