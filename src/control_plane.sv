`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module control_plane(
    input logic clk, 
    input logic rst,
    input logic [phit_size-1:0] wr_data,
    output logic [(24*(num_col))-1:0] rd_data_ctrl,
    output logic [(phit_size*(num_col-1))-1:0] rd_data_imm,
    output logic [entry_sz_state-1:0] rd_data_state,
    output logic [dwidth_double-1:0] itr,
    input logic start_loader, // start signal to write to state/config tables and inbound
    input logic start_stream_in,
    input logic [dwidth_RFadd-1:0] num_entry_config_table, //comes from a header specialized for packet processing 
    input logic [dwidth_RFadd-1:0] num_entry_inbound,
    output logic ready, // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
    output logic done,
    output logic wr_en_RF,
    output logic [dwidth_RFadd-1:0] wr_add_RF,
    output logic keep_start_stream_in
    );
    
    logic [dwidth_RFadd-1:0] smart_ptr; // ptr to state_table and config_table
    logic [dwidth_int-1:0] itr_i; // outer-most loop
    logic [dwidth_int-1:0] itr_j;
    logic [dwidth_int-1:0] itr_k; // inner-most loop
    
    logic [num_col*2:0] wr_en;
    logic [dwidth_RFadd-1:0] wr_add;
    logic done_loader;
    
    
    //state_table
    state_table state_table_inst0 (.clk(clk),
       .rd_add(smart_ptr),
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
            .rd_add(smart_ptr), 
            .wr_add(wr_add), 
            .wr_en(wr_en[(2*i)+2:(2*i)+1]),
            .wr_data(wr_data),
            .rd_data_ctrl(rd_data_ctrl[(24*(i+1))-1:24*i]),
            .rd_data_imm(rd_data_imm[(phit_size*(i+1))-1:phit_size*i]));
         // same rd_add, wr_add, wr_data but different wr_en
    endgenerate
    
    
    
    FSM  FSM_inst0(.entry_table(rd_data_state),
                   .clk(clk),
                   .rst(rst),
                   .itr_i(itr_i), // outer-most loop
                   .itr_j(itr_j),
                   .itr_k(itr_k), // inner-most loop
                   .smart_ptr(smart_ptr), // ptr to state_table and config_table
                   .done(done),
                   .start_inbound(done_loader),
                   .start_stream_in(start_stream_in),
                   .ready(ready),
                   .keep_start_stream_in(keep_start_stream_in));
                   
    // For now, we discard the other two itr (itr_j, itr_k) and only use itr_k
    // TODO: use a mux and have all three itr forwarded
    assign itr = {32'b0, itr_k};     
    
    
    // Load state table, configuration_tables, and inbound
    // revised: inbound buffer are mapped to the first half of each RF
    runtimeLoadtable runtimeLoadtable_inst0(
        .clk(clk), 
        .rst(rst),
        .start(start_loader),
        .num_entry_config_table(num_entry_config_table), //comes from a header specialized for packet processing 
        .num_entry_inbound(num_entry_inbound),
        .wr_add_inbound(wr_add_RF),
        .wr_add(wr_add),
        .wr_en(wr_en),
        .wr_en_inbound(wr_en_RF), // b/c inbound buffer is mapped to RF
        .done(done_loader)
    );    
    
    
endmodule
