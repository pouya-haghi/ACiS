`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

// This is a generated file. Use and modify at your own risk.
////////////////////////////////////////////////////////////////////////////////

// Description:
// This is an AXI4 read master module example. The module demonstrates how to
// issue AXI read transactions to a memory mapped slave.  Given a starting
// address offset and a transfer size in bytes, it will issue one or more AXI
// transactions and return the data over an AXI4-Stream interface.
//
// Theory of operation:
// It uses a minimum subset of the AXI4 protocol by omitting AXI4 signals that
// are not used.  When packaged as a kernel or IP, this allows for
// optimizations to occur within the AXI Interconnect system to increase Fmax,
// potentially increase performance, and reduce latency/area. When
// C_INCLUDE_DATA_FIFO is set to 1, a data FIFO is included and configured so
// that all transactions that are issued can fit into the FIFO.  This allows
// for m_axi_rready to be tied high, and ensures that an unexpected stall
// internally does not cause the AXI Interconnect system to become
// inadvertantly deadlocked or cause head of line blocking to other AXI masters
// in the system.
//
// When ctrl_start is asserted, the ctrl_addr_offset (assumed 4kb aligned) and
// the transfer size in bytes is registered into the module.  the The bulk of the
// logic consists of counters to track how many transfers/transactions have been
// issued.  When the transfer size is reached, and all transactions are
// committed, then done is asserted.
//
// Usage:
// 1) assign ctrl_addr_offset to a 4kB aligned starting address.
// 2) assign ctrl_xfer_size_in_bytes to the size in bytes of the requested transfer.
//    This value will be rounded up to the nearest multiple of the interface width.
//    For example a request of 100 bytes will be rounded up to 128 bytes on a 64 byte
//    (512 bits) wide interface.
// 3) Assert ctrl_start for once cycle.  At the posedge, the ctrl_addr_offset and
//    ctrl_xfer_size_in_bytes will be registered in the module, and will start
//    issue read address transfers.  If the the transfer size is larger than 4096
//    bytes, multiple transactions will be issued.  There may be up to the
//    C_MAX_OUTSTANDING issued in succession.  Once the limit is hit
//    no more read address transfers on the AR channel will be issued until
//    R channel transactions have completed as indicated by the RLAST signal.
// 4) Read Data will appear on the AXI4-Stream interface (m_axis) as signalled by
//    an assertion of the m_axis_tvalid signal.
// 5) When the final R-channel transaction has completed, the module will assert
//    the ctrl_done signal for one cycle.  If a data FIFO is present, data may
//    still be present in the FIFO.
// 6) Jump to step 1.
////////////////////////////////////////////////////////////////////////////////

// default_nettype of none prevents implicit wire declaration.
`default_nettype none

module rtl_kernel_wizard_0_runtimeLoadTable #(
  // Set to the address width of the interface
  parameter integer C_M_AXI_ADDR_WIDTH  = 64,

  // Set the data width of the interface
  // Range: 32, 64, 128, 256, 512, 1024
  parameter integer C_M_AXI_DATA_WIDTH  = 512,

  // Width of the ctrl_xfer_size_in_bytes input
  // Range: 16:C_M_AXI_ADDR_WIDTH
  parameter integer C_XFER_SIZE_WIDTH   = C_M_AXI_ADDR_WIDTH,

  // Specifies the maximum number of AXI4 transactions that may be outstanding.
  // Affects FIFO depth if data FIFO is enabled.
  parameter integer C_MAX_OUTSTANDING   = 16,

  // Includes a data fifo between the AXI4 read channel master and the AXI4-Stream
  // master.  It will be sized to hold C_MAX_OUTSTANDING transactions. If no
  // FIFO is instantiated then the AXI4 read channel is passed through to the
  // AXI4-Stream slave interface.
  // Range: 0, 1
  parameter integer C_INCLUDE_DATA_FIFO = 1
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
  input  wire [C_XFER_SIZE_WIDTH-1:0]  ctrl_xfer_size_in_bytes, // Length in number of bytes, limited by the address width.

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
  // input  wire                          m_axis_aclk,
  // input  wire                          m_axis_areset,
  // output wire                          m_axis_tvalid,
  // input  wire                          m_axis_tready,
  // output wire [C_M_AXI_DATA_WIDTH-1:0] m_axis_tdata,
  // output wire                          m_axis_tlast
  input wire [num_col-1:0] clken_PC,
  input wire [num_col-1:0] load_PC,
  input wire [num_col-1:0] incr_PC,
  input wire [(num_col*12)-1:0] load_value_PC,
  output wire [dwidth_int-1:0] cycle_register,
  output wire [(num_col*dwidth_int)-1:0] instr
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
localparam integer LP_TOTAL_LEN_WIDTH            = C_XFER_SIZE_WIDTH-LP_LOG_DW_BYTES;
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
logic                                     done = '0;
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
logic [(num_col*12)-1:0]                  PC_ptr;
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

logic t_is_zero;
///////////////////////////////////////////////////////////////////////////////
// Control Logic
///////////////////////////////////////////////////////////////////////////////

assign m_axi_rready = 1'b1;

always @(posedge aclk) begin
    if (areset) begin
        done <= '0;
    end else begin
        done <= rxfer & m_axi_rlast & r_final_transaction ? 1'b1 : ctrl_done ? 1'b0 : done;
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
// start
// PH
///////////////////////////////////////////////////////////////////////////////

// We dont need AXI stream anymore
// assign m_axis_tvalid = m_axi_rvalid;
// assign m_axis_tdata  = m_axi_rdata;
// assign m_axi_rready  = m_axis_tready;
// assign m_axis_tlast  = m_axi_rlast;

  localparam [dwidth_configadd-1:0] num_entry_config_table = depth_config;
  localparam [1:0] init = 2'b00, first_sixteen_column = 2'b01, second_sixteen_column =2'b10;
  logic [1:0] config_state, config_state_next;
  // logic transition_signal;
  logic [dwidth_configadd-1:0] wr_add; // for state_table and config table
  logic [num_col-1:0] wr_en; // for state_table and config tables

    // config_table
    genvar i;
    generate 
        for(i=0; i<num_col; i++) begin
            config_table config_table_inst(
            .clk(aclk), 
            .rd_add(PC_ptr[(dwidth_configadd*(i+1))-1:dwidth_configadd*i]), 
            .wr_add(wr_add), 
            .wr_en(wr_en[i] & rxfer), // wr_en[i] & m_axi_rvalid
            .wr_data(m_axi_rdata[((i+1)*dwidth_int)-1:i*dwidth_int]),
            .rd_data(instr[((i+1)*dwidth_int)-1:i*dwidth_int])
            );
         // same rd_add, wr_add, wr_data but different wr_en
            
            PC #(dwidth_configadd) PC_inst( // 12 because we have 12 bits immediate in beq
            .clk(aclk),
            .clken(clken_PC[i]), // stall when vle32.vv or vse32.vv is seen but load_done or store_done signal is not.
            //  if it is macc wait for done signal from auto_incr
            .rst(areset),
            .load(load_PC[i]),
            .incr(incr_PC[i]),
            .load_value(load_value_PC[((i+1)*dwidth_configadd)-1:i*dwidth_configadd]), // 12 because we have 12 bits immediate in beq
            .count(PC_ptr[((i+1)*dwidth_configadd)-1:i*dwidth_configadd])
            );
         end
    endgenerate

    // CSR counter (cycle)
    rtl_kernel_wizard_0_example_counter #(
      .C_WIDTH ( dwidth_int         ) ,
      .C_INIT  ( {dwidth_int{1'b0}} )
      )
      inst_r_transaction_cntr2 (
        .clk        ( aclk                          ) ,
        .clken      ( 1'b1                          ) ,
        .rst        ( areset                        ) ,
        .load       ( ctrl_start                    ) ,
        .incr       ( 1'b1                          ) ,
        .decr       ( 1'b0                          ) ,
        .load_value ( {dwidth_int{1'b0}}            ) ,
        .count      ( cycle_register                ) ,
        .is_zero    ( t_is_zero                     )
      );

    logic [dwidth_RFadd-1:0] t_num_entry_config_table;
    assign t_num_entry_config_table = num_entry_config_table - 1;

    // generating wr_add for config_tables and state table                      
    always_ff @(posedge aclk) begin
        if (areset)
            wr_add <= 0;
        else begin
            if (wr_add == t_num_entry_config_table && rxfer) 
                wr_add <= 0;
            else if (wr_add != t_num_entry_config_table && rxfer)
                wr_add <= wr_add + 1;
            else if (done) // m_axi_rlast
                wr_add <= 0;
        end
    end
    
    // generating wr_en for selecting the correct configuration/state tables
    // assign transition_signal = (wr_en == '0 && rxfer)? 1'b1: 1'b0;
    always_ff @(posedge aclk) begin
        if (areset)
            config_state <= init;
        else
            config_state <= config_state_next;
    end

    always_ff @(posedge aclk) begin 
        case(config_state)
            init: config_state_next <= (rxfer) ? first_sixteen_column : init;
            // first_sixteen_column: // wr_en is  {num_col-16} '0's and 16 '1's. enable 16 config tables at the same time (if num_col<16 verilog doesnt make a bug)
            first_sixteen_column: config_state_next <= (wr_add == t_num_entry_config_table && rxfer)? second_sixteen_column : first_sixteen_column;
            // second_sixteen_column: // wr_en is  {num_col-16} '1's and 16 '0's. enable 16 config tables at the same time
            second_sixteen_column: config_state_next <= (done)? init: second_sixteen_column;
            default: config_state_next <= init;
        endcase
    end

    assign wr_en = ((config_state == init && rxfer)|(config_state == first_sixteen_column)) ? {{(num_col-(phit_size/dwidth_int)){1'b0}}, {(phit_size/dwidth_int){1'b1}}} : ((config_state == second_sixteen_column) ? {{(num_col-(phit_size/dwidth_int)){1'b1}}, {(phit_size/dwidth_int){1'b0}}} : 'b0);

//     always_ff @(posedge aclk) begin
//         if (areset)
// //            wr_en <= 0;
//         else begin
//             if (transition_signal)
// //                wr_en <= {{(num_col-(phit_size/dwidth_int)){1'b0}}, {(phit_size/dwidth_int){1'b1}}}; // 16 '0's and 16 '1's. enable 16 config tables at the same time
//                 // This is b/c axi is wide (512 bits) and it can support multiple parallel tables
//             else if (wr_en != 0 && wr_add == t_num_entry_config_table && rxfer) //num_entry_config_table - 1
// //                wr_en <= wr_en << (phit_size/dwidth_int);
//             else if (done)// done state, m_axi_rlast
// //                wr_en <= 0; //avoid keeping wr_en high
//         end
//     end

// end
// PH
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////

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

endmodule

`default_nettype wire