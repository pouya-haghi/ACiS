`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 05:33:36 PM
// Design Name: 
// Module Name: top
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


module top(
    input logic [phit_size-1:0] inbound,
    input logic [phit_size-1:0] stream_in,
    input logic clk,
    output logic [phit_size-1:0] stream_out
    );
                                           
    logic [dwidth_RFadd-1:0] rd_add,                 
    logic [dwidth_RFadd-1:0] wr_add,                 
    logic [num_col-1:0] wr_en,                       
    logic [phit_size-1:0] wr_data,                   
    logic [(21*(num_col-1))-1:0] rd_data_ctrl,      
    logic [(phit_size*(num_col-1))-1:0] rd_data_imm,
    logic [54:0] rd_data_state          
    
    
    logic [(2*phit_size)-1:0] itr;                        
    logic [((num_col-1)*phit_size)-1:0] imm;              
    logic [((num_col-1)*4)-1:0] sel_mux4;                 
    logic [((num_col-1)*2)-1:0] op;                       
    logic [num_col-1:0] wen_RF;                           
    logic [(dwidth_RFadd*(num_col-1))-1:0] rd_addr_RF;    
    logic [(dwidth_RFadd*(num_col-1))-1:0] wr_addr_RF;                
    
    data_path data_path_inst0 (
    .inbound(),
    .stream_in(),
    .itr(),
    .imm(),
    .sel_mux4(),
    .op()
    
    );
    
    control_plane control_plane_inst0 (.*);
    
endmodule
