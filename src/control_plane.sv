`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module control_plane(
    input logic clk, 
    input logic rst,
    input logic [phit_size-1:0] wr_data,
    output logic [(sz_config*(num_col))-1:0] rd_data_ctrl,
    output logic [(dwidth_double*(num_col))-1:0] rd_data_imm,
    output logic [(dwidth_double*num_col)-1:0] itr,
    // start_loader and done_loader (which is done internally by runtimeLoadTable) are single cycle pulse but start_stream_in and ready_stream_in are handshaking signals
    input logic start_loader, // start signal to write to state/config tables and inbound
    input logic start_stream_in,
    input logic [dwidth_RFadd-1:0] num_entry_config_table, //comes from a header specialized for packet processing 
    input logic [dwidth_RFadd-1:0] num_entry_inbound,
    output logic ready_stream_in, // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
    // 4-phase handshaking for ready_stream_in and start_stream_in. when ready becomes high start should be low and the next cycle after deasserting start, stream-in should send valid data.
//    output logic done,
    output logic wr_en_RF_runtimeLoadTable, //it is drived by runtimeLoadTable
    output logic [dwidth_RFadd-1:0] wr_add_RF_runtimeLoadTable // it is drived by runtimeLoadTable
    );
    
    logic [(dwidth_RFadd*num_col)-1:0] smart_ptr; // ptr to state_table and config_table
    logic [dwidth_int-1:0] itr_i; // outer-most loop
    logic [dwidth_int-1:0] itr_j;
    logic [dwidth_int-1:0] itr_k; // inner-most loop
    logic [entry_sz_state-1:0] rd_data_state;
    
    logic [num_col:0] wr_en;
    logic [dwidth_RFadd-1:0] wr_add;
    logic done_loader;
    
    
    //state_table
    state_table state_table_inst0 (.clk(clk),
       .rd_add(smart_ptr[dwidth_RFadd-1:0]),
       .wr_add(wr_add),
       .wr_en(wr_en[0]),
       .wr_data(wr_data),
       .rd_data(rd_data_state)
    );
    // wr_en[0] is with state_table
    
    // config_table
    genvar i;
    generate 
        for(i=0; i<num_col; i++)
            config_table config_table_inst(.clk(clk), 
            .rd_add(smart_ptr[(dwidth_RFadd*(i+1))-1:dwidth_RFadd*i]), 
            .wr_add(wr_add), 
            .wr_en(wr_en[i+1]),
            .wr_data(wr_data),
            .rd_data_ctrl(rd_data_ctrl[(sz_config*(i+1))-1:sz_config*i]),
            .rd_data_imm(rd_data_imm[(dwidth_double*(i+1))-1:dwidth_double*i]));
         // same rd_add, wr_add, wr_data but different wr_en
    endgenerate
    
    
    // prioritize completion of loading tables over stream_in and asserts smart_ptr
    FSM  FSM_inst0(.entry_table(rd_data_state),
                   .clk(clk),
                   .rst(rst),
                   .itr_i(itr_i), // outer-most loop
                   .itr_j(itr_j),
                   .itr_k(itr_k), // inner-most loop
                   .smart_ptr(smart_ptr[dwidth_RFadd-1:0]), // ptr to state_table and config_table
//                   .done(done),
                   .done_loader(done_loader),
                   .start_stream_in(start_stream_in),
                   .ready_stream_in(ready_stream_in)
//                   .keep_start_stream_in(keep_start_stream_in)
                   );
                   
    // For now, we discard the other two itr (itr_j, itr_k) and only use itr_k
    // TODO: use a mux and have all three itr forwarded
    assign itr[dwidth_double-1:0] = {32'b0, itr_k};     
    
    
    // Load state table, configuration_tables, and inbound
    // revised: inbound buffer are mapped to the first half of each RF
    runtimeLoadtable runtimeLoadtable_inst0(
        .clk(clk), 
        .rst(rst),
        .start(start_loader),
        .num_entry_config_table(num_entry_config_table), //comes from a header specialized for packet processing 
        .num_entry_inbound(num_entry_inbound),
        .wr_add_inbound(wr_add_RF_runtimeLoadTable),
        .wr_add(wr_add),
        .wr_en(wr_en),
        .wr_en_inbound(wr_en_RF_runtimeLoadTable), // b/c inbound buffer is mapped to RF
        .done(done_loader)
    );    
    
    
        // register_pipe for itr
    // For now, lets only pipe itr_k, 
    // in the next version, I will pipe itr_i, itr_j, itr_k and I need a mux at each stage to select which itr I need, also I need a field in the config table to tell me which itr do I need to select
    // TODO: you can have a for loop here
    register_pipe #(.width(dwidth_double), .numPipeStage(latencyPEA)) 
        register_pipe_inst0(itr[dwidth_double-1:0], clk, rst, itr[(2*dwidth_double)-1:dwidth_double]);
        
    register_pipe #(.width(dwidth_double), .numPipeStage(latencyPEA)) 
        register_pipe_inst1(itr[(2*dwidth_double)-1:dwidth_double], clk, rst, itr[(3*dwidth_double)-1:2*dwidth_double]);
 
    register_pipe #(.width(dwidth_double), .numPipeStage(latencyPEB)) 
        register_pipe_inst2(itr[(3*dwidth_double)-1:2*dwidth_double], clk, rst, itr[(4*dwidth_double)-1:3*dwidth_double]);       
        
    register_pipe #(.width(dwidth_double), .numPipeStage(latencyPEC)) 
        register_pipe_inst3(itr[(4*dwidth_double)-1:3*dwidth_double], clk, rst, itr[(5*dwidth_double)-1:4*dwidth_double]);     
     
    register_pipe #(.width(dwidth_double), .numPipeStage(latencyPEC)) 
        register_pipe_inst4(itr[(5*dwidth_double)-1:4*dwidth_double], clk, rst, itr[(6*dwidth_double)-1:5*dwidth_double]);  
        
    //register_pipe for smart_ptr
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEA)) 
        register_pipe_inst5(smart_ptr[dwidth_RFadd-1:0], 
        clk, 
        rst, 
        smart_ptr[(dwidth_RFadd*2)-1:dwidth_RFadd]);
        
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEA)) 
        register_pipe_inst6(smart_ptr[(dwidth_RFadd*2)-1:dwidth_RFadd], 
        clk, 
        rst, 
        smart_ptr[(dwidth_RFadd*3)-1:dwidth_RFadd*2]);
        
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEB)) 
        register_pipe_inst7(smart_ptr[(dwidth_RFadd*3)-1:dwidth_RFadd*2], 
        clk, 
        rst, 
        smart_ptr[(dwidth_RFadd*4)-1:dwidth_RFadd*3]); 
        
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEC)) 
        register_pipe_inst8(smart_ptr[(dwidth_RFadd*4)-1:dwidth_RFadd*3], 
        clk, 
        rst, 
        smart_ptr[(dwidth_RFadd*5)-1:dwidth_RFadd*4]);     
     
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEC)) 
        register_pipe_inst9(smart_ptr[(dwidth_RFadd*5)-1:dwidth_RFadd*4], 
        clk, 
        rst, 
        smart_ptr[(dwidth_RFadd*6)-1:dwidth_RFadd*5]); 
    
    
endmodule
