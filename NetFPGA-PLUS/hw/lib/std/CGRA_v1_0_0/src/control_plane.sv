`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module control_plane(
    // Common
    input logic ap_clk,
    input logic ap_rst_n,
    
    // Control
    input  logic [dwidth_HBMadd-1:0]        AWADDR    ,
    input  logic                            AWVALID   ,
    input  logic [phit_size-1:0]            WDATA     ,
    input  logic [phit_size/8-1:0]          WSTRB     ,
    input  logic                            WVALID    ,
    input  logic                            BREADY    ,
    input  logic [dwidth_HBMadd-1:0]        ARADDR    ,
    input  logic                            ARVALID   ,
    input  logic                            RREADY    ,
    output logic                            AWREADY   ,
    output logic                            WREADY    ,
    output logic [1:0]                      BRESP     ,
    output logic                            BVALID    ,
    output logic                            ARREADY   ,
    output logic [phit_size-1:0]            RDATA     ,
    output logic [1:0]                      RRESP     ,
    output logic                            RVALID    ,
    output logic                            interrupt ,
    
    // runtimeLoadTable
    input  logic [dwidth_HBMadd-1:0]        ctrl_addr_offset         ,
    input  logic [phit_size-1:0]            ctrl_xfer_size_in_bytes  ,
    input  logic                            m_axi_arready            ,
    input  logic                            m_axi_rvalid             ,
    input  logic [phit_size-1:0]            m_axi_rdata              ,
    input  logic                            m_axi_rlast              ,
    input  logic [num_col-1:0]              clken_PC                 ,
    input  logic [num_col-1:0]              load_PC                  ,
    input  logic [num_col-1:0]              incr_PC                  ,
    input  logic [num_col*12-1:0]           load_value_PC            ,
    output logic                            m_axi_arvalid            ,
    output logic [dwidth_HBMadd-1:0]        m_axi_araddr             ,
    output logic [8-1:0]                    m_axi_arlen              ,
    output logic                            m_axi_rready             ,
    output logic [num_col*12-1:0]           PC                       ,
    output logic [dwidth_int-1:0]           cycle_register           ,
    output logic [(num_col*dwidth_int)-1:0] instr                    

    );

logic areset;
logic ap_done, ap_done_r, ap_done_i;
logic ap_ready;
logic ap_idle, ap_idle_r;
logic ap_start, ap_start_r, ap_start_pulse;
logic [63:0] axi00_ptr0;
logic [63:0] xfer_size_bytes = total_instr;








rtl_kernel_wizard_0_control_s_axi control_s_axi_inst0 (
    .ACLK      (ap_clk), //input
    .ARESET    (areset), //input
    .ACLK_EN   (clken_PC), //input
    .AWADDR    (AWADDR  ), //input*
    .AWVALID   (AWVALID ), //input
    .WDATA     (WDATA   ), //input*
    .WSTRB     (WSTRB   ), //input*
    .WVALID    (WVALID  ), //input
    .BREADY    (BREADY  ), //input
    .ARADDR    (ARADDR  ), //input*
    .ARVALID   (ARVALID), //input
    .RREADY    (RREADY), //input
    .ap_done   (ap_done), //input
    .ap_ready  (ap_ready), //input
    .ap_idle   (ap_idle), //input
    .AWREADY   (AWREADY), //output
    .WREADY    (WREADY), //output
    .BRESP     (BRESP ), //output*
    .BVALID    (BVALID), //output
    .ARREADY   (ARREADY), //output
    .RDATA     (RDATA ), //output*
    .RRESP     (RRESP ), //output*
    .RVALID    (RVALID), //output
    .interrupt (interrupt), //output
    .axi00_ptr0(axi00_ptr0), //output*
    .ap_start  (ap_start));//output
    
rtl_kernel_wizard_0_runtimeLoadTable runtimeLoadTable_inst0(
    .aclk                   (ap_clk), //input
    .areset                 (areset), //input
    .ctrl_start             (ap_start), //input
    .ctrl_addr_offset       (axi00_ptr0), //input*
    .ctrl_xfer_size_in_bytes(xfer_size_bytes), //input*
    .m_axi_arready          (m_axi_arready), //input
    .m_axi_rvalid           (m_axi_rvalid), //input
    .m_axi_rdata            (m_axi_rdata), //input*
    .m_axi_rlast            (m_axi_rlast), //input
    .clken_PC               (clken_PC), //input
    .load_PC                (load_PC), //input
    .incr_PC                (incr_PC), //input
    .load_value_PC          (load_value_PC), //input*
    .ctrl_done              (done_loader), //output
    .m_axi_arvalid          (m_axi_arvalid), //output
    .m_axi_araddr           (m_axi_araddr), //output*
    .m_axi_arlen            (m_axi_arlen), //output*
    .m_axi_rready           (m_axi_rready), //output
    .PC                     (PC), //output
    .cycle_register         (cycle_register), //output
    .instr                  (instr));//output
  
  
  
always @(posedge ap_clk) begin
  areset <= ~ap_rst_n;
end

always @(posedge ap_clk) begin
  begin
    ap_start_r <= ap_start;
  end
end
assign ap_start_pulse = ap_start & ~ap_start_r;
// ap_idle is asserted when done is asserted, it is de-asserted when ap_start_pulse
// is asserted
always @(posedge ap_clk) begin
  if (areset) begin
    ap_idle_r <= 1'b1;
  end
  else begin
    ap_idle_r <= ap_done ? 1'b1 :
      ap_start_pulse ? 1'b0 : ap_idle;
  end
end
assign ap_idle = ap_idle_r;
// Done logic
always @(posedge ap_clk) begin
  if (areset) begin
    ap_done_r <= '0;
  end
  else begin
    ap_done_r <= (ap_done) ? '0 : ap_done_r | ap_done_i;
  end
end
assign ap_done = &ap_done_r;
// Ready Logic (non-pipelined case)
assign ap_ready = ap_done;
  
  
  
  
  
  
  
endmodule






// ---------------------------- Old Code ---------------------------- //

//module control_plane(
//    input logic clk, 
//    input logic rst,
//    input logic [phit_size-1:0] wr_data,
////    output logic [(sz_config*(num_col))-1:0] rd_data_ctrl,
////    output logic [(dwidth_float*(num_col))-1:0] rd_data_imm,
//    output logic [(dwidth_float*(num_col))-1:0] rd_data,
//    output logic [(dwidth_float*num_col)-1:0] itr,
//    // start_loader and done_loader (which is done internally by runtimeLoadTable) are single cycle pulse but start_stream_in and ready_stream_in are handshaking signals
//    input logic start_loader, // start signal to write to state/config tables and inbound
//    input logic start_stream_in,
//    input logic [dwidth_RFadd-1:0] num_entry_config_table, //comes from a header specialized for packet processing 
//    input logic [dwidth_RFadd-1:0] num_entry_inbound,
//    output logic ready_stream_in, // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
//    // 4-phase handshaking for ready_stream_in and start_stream_in. when ready becomes high start should be low and the next cycle after deasserting start, stream-in should send valid data.
////    output logic done,
//    output logic wr_en_RF_runtimeLoadTable, //it is drived by runtimeLoadTable
//    output logic [dwidth_RFadd-1:0] wr_add_RF_runtimeLoadTable // it is drived by runtimeLoadTable
//    );
    
//    logic [(dwidth_RFadd*num_col)-1:0] smart_ptr; // ptr to state_table and config_table
//    logic [dwidth_int-1:0] itr_i; // outer-most loop
//    logic [dwidth_int-1:0] itr_j;
//    logic [dwidth_int-1:0] itr_k; // inner-most loop
//    logic [entry_sz_state-1:0] rd_data_state;
    
//    logic [num_col:0] wr_en;
//    logic [dwidth_RFadd-1:0] wr_add;
//    logic done_loader;
    
    
//    //state_table
//    state_table state_table_inst0 (.clk(clk),
//       .rd_add(smart_ptr[dwidth_RFadd-1:0]),
//       .wr_add(wr_add),
//       .wr_en(wr_en[0]),
//       .wr_data(wr_data),
//       .rd_data(rd_data_state)
//    );
//    // wr_en[0] is with state_table
    
//    // config_table
//    genvar i;
//    generate 
//        for(i=0; i<num_col; i++)
//            config_table config_table_inst(.clk(clk), 
//            .rd_add(smart_ptr[(dwidth_RFadd*(i+1))-1:dwidth_RFadd*i]), 
//            .wr_add(wr_add), 
//            .wr_en(wr_en[i+1]),
//            .wr_data(wr_data),
//            .rd_data(rd_data[(dwidth_float*(i+1))-1:dwidth_float*i])
////            .rd_data_ctrl(rd_data_ctrl[(sz_config*(i+1))-1:sz_config*i]),
////            .rd_data_imm(rd_data_imm[(dwidth_float*(i+1))-1:dwidth_float*i])
//            );
//         // same rd_add, wr_add, wr_data but different wr_en
//    endgenerate
    
    
//    // prioritize completion of loading tables over stream_in and asserts smart_ptr
//    FSM  FSM_inst0(.entry_table(rd_data_state),
//        .clk(clk),
//        .rst(rst),
//        .itr_i(itr_i), // outer-most loop
//        .itr_j(itr_j),
//        .itr_k(itr_k), // inner-most loop
//        .smart_ptr(smart_ptr[dwidth_RFadd-1:0]), // ptr to state_table and config_table
////                   .done(done),
//        .done_loader(done_loader),
//        .start_stream_in(start_stream_in),
//        .ready_stream_in(ready_stream_in)
////                   .keep_start_stream_in(keep_start_stream_in)
//        );
                   
//    // For now, we discard the other two itr (itr_j, itr_k) and only use itr_k
//    // TODO: use a mux and have all three itr forwarded
//    assign itr[dwidth_float-1:0] = {32'b0, itr_k};     
    
    
//    // Load state table, configuration_tables, and inbound
//    // revised: inbound buffer are mapped to the first half of each RF
//    runtimeLoadtable runtimeLoadtable_inst0(
//        .clk(clk), 
//        .rst(rst),
//        .start(start_loader),
//        .num_entry_config_table(num_entry_config_table), //comes from a header specialized for packet processing 
//        .num_entry_inbound(num_entry_inbound),
//        .wr_add_inbound(wr_add_RF_runtimeLoadTable),
//        .wr_add(wr_add),
//        .wr_en(wr_en),
//        .wr_en_inbound(wr_en_RF_runtimeLoadTable), // b/c inbound buffer is mapped to RF
//        .done(done_loader)
//    );    
    
    
//        // register_pipe for itr
//    // For now, lets only pipe itr_k, 
//    // in the next version, I will pipe itr_i, itr_j, itr_k and I need a mux at each stage to select which itr I need, also I need a field in the config table to tell me which itr do I need to select
//    // TODO: you can have a for loop here
//    register_pipe #(.width(dwidth_float), .numPipeStage(latencyPEA)) 
//        register_pipe_inst0(clk, rst, itr[dwidth_float-1:0], itr[(2*dwidth_float)-1:dwidth_float]);
        
////    register_pipe #(.width(dwidth_float), .numPipeStage(latencyPEA)) 
////        register_pipe_inst1(itr[(2*dwidth_float)-1:dwidth_float], clk, rst, itr[(3*dwidth_float)-1:2*dwidth_float]);
 
////    register_pipe #(.width(dwidth_float), .numPipeStage(latencyPEB)) 
////        register_pipe_inst2(itr[(3*dwidth_float)-1:2*dwidth_float], clk, rst, itr[(4*dwidth_float)-1:3*dwidth_float]);       
        
////    register_pipe #(.width(dwidth_float), .numPipeStage(latencyPEC)) 
////        register_pipe_inst3(itr[(4*dwidth_float)-1:3*dwidth_float], clk, rst, itr[(5*dwidth_float)-1:4*dwidth_float]);     
     
////    register_pipe #(.width(dwidth_float), .numPipeStage(latencyPEC)) 
////        register_pipe_inst4(itr[(5*dwidth_float)-1:4*dwidth_float], clk, rst, itr[(6*dwidth_float)-1:5*dwidth_float]);  
        
//    //register_pipe for smart_ptr
//    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEA)) 
//        register_pipe_inst5(
//        clk, 
//        rst, 
//        smart_ptr[dwidth_RFadd-1:0], 
//        smart_ptr[(dwidth_RFadd*2)-1:dwidth_RFadd]);
        
////    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEA)) 
////        register_pipe_inst6(smart_ptr[(dwidth_RFadd*2)-1:dwidth_RFadd], 
////        clk, 
////        rst, 
////        smart_ptr[(dwidth_RFadd*3)-1:dwidth_RFadd*2]);
        
////    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEB)) 
////        register_pipe_inst7(smart_ptr[(dwidth_RFadd*3)-1:dwidth_RFadd*2], 
////        clk, 
////        rst, 
////        smart_ptr[(dwidth_RFadd*4)-1:dwidth_RFadd*3]); 
        
////    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEC)) 
////        register_pipe_inst8(smart_ptr[(dwidth_RFadd*4)-1:dwidth_RFadd*3], 
////        clk, 
////        rst, 
////        smart_ptr[(dwidth_RFadd*5)-1:dwidth_RFadd*4]);     
     
////    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEC)) 
////        register_pipe_inst9(smart_ptr[(dwidth_RFadd*5)-1:dwidth_RFadd*4], 
////        clk, 
////        rst, 
////        smart_ptr[(dwidth_RFadd*6)-1:dwidth_RFadd*5]); 
    
    
//endmodule



