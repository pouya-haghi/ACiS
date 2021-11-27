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
    input logic [dwidth_RFadd-1:0] rd_addr_ctrl_plane,
    input logic [dwidth_RFadd-1:0] wr_addr_ctrl_plane,
    input logic [num_col-1:0] wr_en_ctrl_plane,
    input logic [phit_size-1:0] wr_data_ctrl_plane, 
    input logic clk,
    output logic [phit_size-1:0] stream_out,
    output logic [54:0] rd_data_state // needs another module   
    );
                                                             
    logic [(21*(num_col-1))-1:0] rd_data_ctrl;      
    logic [(phit_size*(num_col-1))-1:0] rd_data_imm;
       
    
    logic [(2*phit_size)-1:0] itr;                                     
    logic [((num_col-1)*4)-1:0] sel_mux4;                 
    logic [((num_col-1)*2)-1:0] op;                       
    logic [num_col-1:0] wen_RF;                           
    logic [(dwidth_RFadd*(num_col-1))-1:0] addr_RF;    
//    logic [(dwidth_RFadd*(num_col-1))-1:0] wr_addr_RF;                
    
    control_plane control_plane_inst0 (
    .clk(clk),
    .rd_add(rd_addr_ctrl_plane),
    .wr_add(wr_addr_ctrl_plane),
    .wr_en(wr_en_ctrl_plane),
    .wr_data(wr_data_ctrl_plane),
    .rd_data_ctrl(rd_data_ctrl),
    .rd_data_imm(rd_data_imm),
    .rd_data_state(rd_data_state));
    
    data_path data_path_inst0 (
    .inbound(inbound),
    .stream_in(stream_in),
    .itr(itr),
    .imm(rd_data_imm),
    .sel_mux4(sel_mux4),
    .op(op),
    .wen_RF(wen_RF),
    .rd_addr_RF(addr_RF),
    .wr_addr_RF(addr_RF),// same address
    .clk(clk),
    .stream_out(stream_out)
    );
    
    //unpacking data
    genvar i;
    generate
        for(i=0; i< num_col-1; i++) begin
            //op
            assign op[((i+1)*2)-1:i*2] = rd_data_ctrl[((i*21)+3):(i*21)+1];
            //sel_mux4
            assign sel_mux4[((i+1)*4)-1:i*4] = rd_data_ctrl[((i*21)+7):(i*21)+4];
            //wen_RF
            assign wen_RF[i] = rd_data_ctrl[(i*21)+8];
            //add_RF
            assign addr_RF[((i+1)*dwidth_RFadd)-1:i*dwidth_RFadd] = rd_data_ctrl[((i*21)+20):(i*21)+9];
        end
    endgenerate
    
    
endmodule
