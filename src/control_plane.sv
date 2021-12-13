`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module control_plane(
    input logic clk, 
    input logic rst,
    input logic [dwidth_RFadd-1:0] wr_add,
    input logic [num_col-1:0] wr_en,
    input logic [phit_size-1:0] wr_data,
    output logic [(21*(num_col-1))-1:0] rd_data_ctrl,
    output logic [(phit_size*(num_col-1))-1:0] rd_data_imm,
    output logic [entry_sz_state-1:0] rd_data_state,
    output logic [dwidth_double-1:0] itr,
    input logic start_inbound,
    input logic start_stream_in,
    output logic ready, // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
    output logic done
    );
    
    logic [dwidth_RFadd-1:0] smart_ptr; // ptr to state_table and config_table
    logic [dwidth_int-1:0] itr_i; // outer-most loop
    logic [dwidth_int-1:0] itr_j;
    logic [dwidth_int-1:0] itr_k; // inner-most loop
    
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
        for(i=0; i<num_col-1; i++)
            config_table config_table_inst(.clk(clk), 
            .rd_add(smart_ptr), 
            .wr_add(wr_add), 
            .wr_en(wr_en[i+1]),
            .wr_data(wr_data),
            .rd_data_ctrl(rd_data_ctrl[(21*(i+1))-1:21*i]),
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
                   .start_inbound(start_inbound),
                   .start_stream_in(start_stream_in),
                   .ready(ready));
                   
    // For now, we discard the other two itr (itr_j, itr_k) and only use itr_k
    // TODO: use a mux and have all three itr forwarded
    assign itr = {32'b0, itr_k};                
    
    
endmodule
