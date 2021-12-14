`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module runtimeLoadtable(
    input logic clk, 
    input logic rst,
    input logic start,
    input logic [dwidth_RFadd-1:0] num_entry_config_table, //comes from a header specialized for packet processing 
    input logic [dwidth_RFadd-1:0] num_entry_inbound,
    output logic [dwidth_RFadd-1:0] wr_add_inbound,
    output logic [dwidth_RFadd-1:0] wr_add,
    output logic [num_col*2:0] wr_en,
    output logic wr_en_inbound,
    output logic done
    );
    
    // This is the order of loading:
    // state_table: add =0 then add= 1 then add =...
    // configuration table: First table: add=0 then add=1 then ... Second table:
    // inbound data: first add=0, then add=1
    
    logic [1:0] curr_state, next_state;
    localparam [1:0] init = 2'b00;
    localparam [1:0] execution = 2'b01;
    localparam [1:0] finished_config_table = 2'b10;
    localparam [1:0] finished_inbound = 2'b10;
//    counter #(.width_counter(dwidth_counter_config))
//    counter_inst0(.clk(clk),
//                  .rst(rst),
//                  .counter(wr_add),
//                  .threshold(num_entry_config_table));
                  
//    counter_trigger #(.width_counter(dwidth_counter_config),
//                      .threshold((num_col*2)+1))
//    counter_trigger_inst0(.clk(clk),
//                          .rst(rst),
//                          .trigger(),
//                          .counter());
    // generating wr_add for config_tables and state table                      
    always@(posedge clk) begin
        if (rst)
            wr_add = 0;
            
        else begin
            if (wr_add == num_entry_config_table - 1 && curr_state == execution) begin
                wr_add = 0;
            end
            else if (curr_state == execution) begin
                wr_add = wr_add + 1;
            end
        end
    end
    

    // generating wr_en for selecting the correct configuration/state tables
    always@(posedge clk) begin
        if (rst)
            wr_en = 0;
            
        else begin
            if (wr_add == num_entry_config_table - 1 && wr_en == ((num_col*2)+1)-1 && curr_state == execution)
                wr_en = 0;
            else if (wr_add == num_entry_config_table - 1 && curr_state == execution) 
                wr_en = wr_en + 1;
        end
    end
    
    // Loading inbound data
    always@(posedge clk) begin
        if (rst)
            wr_add_inbound = 0;
            
        else begin
            if (wr_add_inbound == num_entry_inbound - 1 && curr_state == finished_config_table) begin
                wr_add_inbound = 0;
            end
            else if (curr_state == finished_config_table) begin
                wr_add_inbound = wr_add_inbound + 1;
            end
        end
    end
    
    // state machine
    always @(posedge clk) begin
        if (rst) 
            curr_state = init;
        else 
            curr_state = next_state;
            
    end
    
    always@(*) begin
        if (curr_state == init && start == 1'b1)
            next_state = execution;
        else if (curr_state == execution && (wr_add == num_entry_config_table-1 && wr_en == ((num_col*2)+1)-1))
            next_state = finished_config_table;
        else if (curr_state == finished_config_table && wr_add_inbound == num_entry_inbound - 1)
            next_state = finished_inbound;
        else if (curr_state == finished_inbound) // we assert done for one clock cycle
            next_state = init;
    end
    
    assign done = (curr_state == finished_inbound)? 1'b1: 1'b0; // we assert done for one clock cycle
    assign wr_en_inbound = (curr_state == finished_config_table)? 1'b1: 1'b0;
    
endmodule
