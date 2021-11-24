`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 09:55:46 AM
// Design Name: 
// Module Name: control_plane
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module control_plane(
    input logic clk, 
    input logic [dwidth_RFadd-1:0] rd_add,
    input logic [dwidth_RFadd-1:0] wr_add,
    input logic [num_col-1:0] wr_en,
    input logic [phit_size-1:0] wr_data,
    output logic [(21*(num_col-1))-1:0] rd_data_ctrl,
    output logic [(phit_size*(num_col-1))-1:0] rd_data_imm,
    output logic [54:0] rd_data_state
    );
    
    //state_table
    state_table state_table_inst0 (.clk(clk),
       .rd_add(rd_add),
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
            .rd_add(rd_add), 
            .wr_add(wr_add), 
            .wr_en(wr_en[i+1]),
            .wr_data(wr_data),
            .rd_data_ctrl(rd_data_ctrl[(21*(i+1))-1:21*i]),
            .rd_data_imm(rd_data_imm[(phit_size*(i+1))-1:phit_size*i]));
         // same rd_add, wr_add, wr_data but different wr_en
    endgenerate
    

    
endmodule
