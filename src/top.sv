`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module top(
    input logic [phit_size-1:0] inbound,
    input logic [phit_size-1:0] stream_in,
    input logic [dwidth_RFadd-1:0] rd_addr_ctrl_plane,
    input logic [dwidth_RFadd-1:0] wr_addr_ctrl_plane,
    input logic [num_col-1:0] wr_en_ctrl_plane,
    input logic [phit_size-1:0] wr_data_ctrl_plane, 
    input logic clk,
    input logic rst,
    output logic [phit_size-1:0] stream_out,
    output logic [54:0] rd_data_state // needs another module   
    );
                                                             
    logic [(21*(num_col-1))-1:0] rd_data_ctrl;      
    logic [(phit_size*(num_col-1))-1:0] rd_data_imm;
       
    
    logic [((num_col-1)*dwidth_int)-1:0] itr;                                     
    logic [((num_col-1)*4)-1:0] sel_mux4;                 
    logic [((num_col-1)*2)-1:0] op;                       
    logic [num_col-1:0] wen_RF;                           
    logic [(dwidth_RFadd*(num_col-1))-1:0] addr_RF;    
//    logic [(dwidth_RFadd*(num_col-1))-1:0] wr_addr_RF;    

//    logic [dwidth_int-1:0] itr_k, itr_k_PEA1, itr_k_PEB, itr_k_PEC0, itr_k_PEC1, itr_k_PED;            
    logic [dwidth_int-1:0] smart_ptr, smart_ptr_PEA1, smart_ptr_PEB, smart_ptr_PEC0, smart_ptr_PEC1, smart_ptr_PED;
    
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
    
    
    // register_pipe for itr
    // For now, lets only pipe itr_k, 
    // in the next version, I will pipe itr_i, itr_j, itr_k and I need a mux at each stage to select which itr I need, also I need a field in the config table to tell me which itr do I need to select
    register_pipe #(.width(dwidth_int), .numPipeStage(latencyPEA)) 
        register_pipe_inst0(itr[dwidth_int-1:0], clk, rst, itr[(2*dwidth_int)-1:dwidth_int]);
        
    register_pipe #(.width(dwidth_int), .numPipeStage(latencyPEA+latencyPEB)) 
        register_pipe_inst1(itr[(2*dwidth_int)-1:dwidth_int], clk, rst, itr[(3*dwidth_int)-1:2*dwidth_int]);
        
//    register_pipe #(.width(dwidth_int), .numPipeStage(latencyPEB)) 
//        register_pipe_inst2(itr_k_PEB, clk, rst, itr_k_PEC0); 
        
    register_pipe #(.width(dwidth_int), .numPipeStage(latencyPEC)) 
        register_pipe_inst3(itr[(3*dwidth_int)-1:2*dwidth_int], clk, rst, itr[(4*dwidth_int)-1:3*dwidth_int]);     
     
    register_pipe #(.width(dwidth_int), .numPipeStage(latencyPEC)) 
        register_pipe_inst4(itr[(4*dwidth_int)-1:3*dwidth_int], clk, rst, itr[(5*dwidth_int)-1:4*dwidth_int]);  
        
    //register_pipe for smart_ptr
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEA)) 
        register_pipe_inst5(smart_ptr, clk, rst, smart_ptr_PEA1);
        
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEA)) 
        register_pipe_inst6(smart_ptr_PEA1, clk, rst, smart_ptr_PEB);
        
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEB)) 
        register_pipe_inst7(smart_ptr_PEB, clk, rst, smart_ptr_PEC0); 
        
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEC)) 
        register_pipe_inst8(smart_ptr_PEC0, clk, rst, smart_ptr_PEC1);     
     
    register_pipe #(.width(dwidth_RFadd), .numPipeStage(latencyPEC)) 
        register_pipe_inst9(smart_ptr_PEC1, clk, rst, smart_ptr_PED);   
    
endmodule
