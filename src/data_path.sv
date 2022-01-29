`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module data_path(
    // NOTE: one characteristics of inbound is that it is runtime; you can use the array temp two times for two 
    // different HL collective and their value is loaded to the tables at runtime.
    // In the new version, there is no inbound
//    input logic [phit_size-1:0] inbound,
    input logic [phit_size-1:0] stream_in,
    input logic [((num_col)*dwidth_double)-1:0] itr,
    input logic [num_col-1:0] isItr,
    input logic [((num_col)*dwidth_double)-1:0] imm,
    input logic [((num_col)*4)-1:0] sel_mux4,
    input logic [((num_col)*2)-1:0] op,
    input logic [num_col-1:0] wen_RF,
    input logic [(dwidth_RFadd*(num_col))-1:0] rd_addr_RF,
    input logic [(dwidth_RFadd*(num_col))-1:0] wr_addr_RF,
    input logic clk,
    input logic rst,
    input logic wr_en_RF_runtimeLoadTable,
    input logic [phit_size-1:0] wr_data, // will be mapped to RFs
    output logic [phit_size-1:0] stream_out,
    // TODO: support for outbound
    // DEBUG
    output logic [phit_size-1:0] stream_out_PEa0,
    output logic [phit_size-1:0] stream_out_PEa1,
    output logic [phit_size-1:0] stream_out_PEb,
    output logic [phit_size-1:0] stream_out_PEc0, 
    output logic [phit_size-1:0] stream_out_PEc1
    );
    
//    data_channel d_ch0;
//    control_channel c_ch0;
    // TypeC: 
    logic [phit_size-1:0] o_PE_typeA_n0, o_PE_typeA_n1, o_PE_typeA_n2, o_PE_typeB, o_PE_typeC_n0, o_PE_typeC_n1, o_PE_typeD;
    logic [phit_size-1:0] i_PE_typeA_i0_n0, i_PE_typeA_i0_n1, i_PE_typeB, i_PE_typeC_i0_n0, i_PE_typeC_i0_n1, i_PE_typeD_i0;
    logic [phit_size-1:0] i_PE_typeA_i1_n0, i_PE_typeA_i1_n1, i_PE_typeC_i1_n0, i_PE_typeC_i1_n1, i_PE_typeD_i1;
    logic [phit_size-1:0] o_RF0, o_RF1, o_RF3, o_RF4, o_RF5;
    logic [phit_size-1:0] inbound_PEA1, inbound_PEB, inbound_PEC0, inbound_PEC1, inbound_PED;
    
    //******************** first stage *********************
    // There is no inbound in the new version
    // imm and itr is identical for each SIMD lane
    mux4 #(phit_size) mux4_inst0 ({phit_size{1'b0}}, {SIMD_degree{itr[dwidth_double-1:0]}}, {SIMD_degree{imm[dwidth_double-1:0]}}, o_RF0, sel_mux4[3:2], i_PE_typeA_i0_n0);
    mux4 #(phit_size) mux4_inst1 (stream_in, {SIMD_degree{itr[dwidth_double-1:0]}}, {SIMD_degree{imm[dwidth_double-1:0]}}, o_RF0, sel_mux4[1:0], i_PE_typeA_i1_n0);
    
    genvar i;
    generate
    for (i=0; i<SIMD_degree; i++) begin
        PE_typeA #(latencyPEA) PE_typeA_inst0(.inp1(i_PE_typeA_i0_n0[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .inp2(i_PE_typeA_i1_n0[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .clk(clk),
                    .rst(rst),
                    .out1(o_PE_typeA_n0[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .op(op[1:0]));
    end
    endgenerate
    
    regFile RF_inst0( .d_in((wr_en_RF_runtimeLoadTable)?wr_data:o_PE_typeA_n0),
                .clk(clk),
                .rd_addr((isItr[0])?itr[dwidth_RFadd-1:0]:rd_addr_RF[dwidth_RFadd-1:0]),
                .wr_addr(wr_addr_RF[dwidth_RFadd-1:0]),
                .wen(wen_RF[0]),
                .d_out(o_RF0));
                
    //******************** second stage *********************            
    mux4 #(phit_size) mux4_inst2 (o_PE_typeA_n0, {SIMD_degree{itr[(2*dwidth_double)-1:dwidth_double]}}, {SIMD_degree{imm[2*dwidth_double-1:dwidth_double]}}, o_RF1, sel_mux4[7:6], i_PE_typeA_i0_n1);
    mux4 #(phit_size) mux4_inst3 (o_PE_typeA_n0, {SIMD_degree{itr[(2*dwidth_double)-1:dwidth_double]}}, {SIMD_degree{imm[2*dwidth_double-1:dwidth_double]}}, o_RF1, sel_mux4[5:4], i_PE_typeA_i1_n1);
    
    generate
    for (i=0; i<SIMD_degree; i++) begin
        PE_typeA  #(latencyPEA) PE_typeA_inst1(  .inp1(i_PE_typeA_i0_n1[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .inp2(i_PE_typeA_i1_n1[((i+1)*dwidth_double)-1:i*dwidth_double]),
                    .clk(clk),
                    .rst(rst), 
                    .out1(o_PE_typeA_n1[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .op(op[3:2]));
    end
    endgenerate
                
    regFile RF_inst1(.d_in((wr_en_RF_runtimeLoadTable)?wr_data:o_PE_typeA_n1),
                .clk(clk),
                .rd_addr((isItr[1])?itr[dwidth_double+dwidth_RFadd-1:dwidth_double]:rd_addr_RF[2*dwidth_RFadd-1:dwidth_RFadd]),
                .wr_addr(wr_addr_RF[2*dwidth_RFadd-1:dwidth_RFadd]),
                .wen(wen_RF[1]),
                .d_out(o_RF1));
                
//    **********************  third stage *********************
    mux4 #(phit_size) mux4_inst4 (o_PE_typeA_n1, {phit_size{1'b0}}, {phit_size{1'b0}}, {phit_size{1'b0}}, sel_mux4[11:10], i_PE_typeB);
    
    generate
    for (i=0; i<SIMD_degree; i++) begin
        PE_typeB #(latencyPEB) PE_typeB_inst(.inp1(i_PE_typeB[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                                .out1(o_PE_typeB[((i+1)*dwidth_double)-1:i*dwidth_double]),
                                .clk(clk),
                                .rst(rst),
                                .op(op[5:4]));
    end
    endgenerate
    
    
                
    //********************  fourth stage **********************
    
    mux4 #(phit_size) mux4_inst6 (o_PE_typeB, {phit_size{1'b0}}, {SIMD_degree{imm[4*dwidth_double-1:3*dwidth_double]}}, o_RF3, sel_mux4[15:14], i_PE_typeC_i0_n0);
    mux4 #(phit_size) mux4_inst7 (o_PE_typeB, {phit_size{1'b0}}, {SIMD_degree{imm[4*dwidth_double-1:3*dwidth_double]}}, o_RF3, sel_mux4[13:12], i_PE_typeC_i1_n0);
    
    generate
    for (i=0; i<SIMD_degree; i++) begin
        PE_typeC #(latencyPEC) PE_typeC_inst0(.inp1(i_PE_typeC_i0_n0[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .inp2(i_PE_typeC_i1_n0[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .out1(o_PE_typeC_n0[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .clk(clk),
                    .op(op[7:6]));
    end
    endgenerate
    
    regFile RF_inst2(.d_in((wr_en_RF_runtimeLoadTable)?wr_data:o_PE_typeC_n0),
                .clk(clk),
                .rd_addr((isItr[3])?itr[(3*dwidth_double)+dwidth_RFadd-1:(3*dwidth_double)]:rd_addr_RF[4*dwidth_RFadd-1:3*dwidth_RFadd]),
                .wr_addr(wr_addr_RF[4*dwidth_RFadd-1:3*dwidth_RFadd]),
                .wen(wen_RF[3]),
                .d_out(o_RF3));
    
        //********************  fifth stage **********************
    
    mux4 #(phit_size) mux4_inst8 (o_PE_typeC_n0, {phit_size{1'b0}}, {SIMD_degree{imm[5*dwidth_double-1:4*dwidth_double]}}, o_RF4, sel_mux4[19:18], i_PE_typeC_i0_n1);
    mux4 #(phit_size) mux4_inst9 (o_PE_typeC_n0, {phit_size{1'b0}}, {SIMD_degree{imm[5*dwidth_double-1:4*dwidth_double]}}, o_RF4, sel_mux4[17:16], i_PE_typeC_i1_n1);
    
    generate
    for (i=0; i<SIMD_degree; i++) begin
        PE_typeC #(latencyPEC) PE_typeC_inst1(.inp1(i_PE_typeC_i0_n1[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .inp2(i_PE_typeC_i1_n1[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .out1(o_PE_typeC_n1[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .clk(clk),
                    .op(op[9:8]));
    end
    endgenerate
    
        regFile RF_inst3(.d_in((wr_en_RF_runtimeLoadTable)?wr_data:o_PE_typeC_n1),
                .clk(clk),
                .rd_addr((isItr[4])?itr[(4*dwidth_double)+dwidth_RFadd-1:(4*dwidth_double)]:rd_addr_RF[5*dwidth_RFadd-1:4*dwidth_RFadd]),
                .wr_addr(wr_addr_RF[5*dwidth_RFadd-1:4*dwidth_RFadd]),
                .wen(wen_RF[4]),
                .d_out(o_RF4));
                
    //********************  sixth stage **********************
    
    mux4 #(phit_size) mux4_inst10 (o_PE_typeC_n1, {phit_size{1'b0}}, {SIMD_degree{imm[6*dwidth_double-1:5*dwidth_double]}}, o_RF5, sel_mux4[23:22], i_PE_typeD_i0);
    mux4 #(phit_size) mux4_inst11 (o_PE_typeC_n1, {phit_size{1'b0}}, {SIMD_degree{imm[6*dwidth_double-1:5*dwidth_double]}}, o_RF5, sel_mux4[21:20], i_PE_typeD_i1);
    
    generate
    for (i=0; i<SIMD_degree; i++) begin
        PE_typeD #(latencyPED) PE_typeD_inst1(.inp1(i_PE_typeD_i0[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .inp2(i_PE_typeD_i1[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .out1(o_PE_typeD[((i+1)*dwidth_double)-1:i*dwidth_double]), 
                    .clk(clk),
                    .rst(rst),
                    .op(op[11:10]));
    end
    endgenerate
    
        regFile RF_inst4(.d_in((wr_en_RF_runtimeLoadTable)?wr_data:o_PE_typeD),
                .clk(clk),
                .rd_addr((isItr[5])?itr[(5*dwidth_double)+dwidth_RFadd-1:(5*dwidth_double)]:rd_addr_RF[6*dwidth_RFadd-1:5*dwidth_RFadd]),
                .wr_addr(wr_addr_RF[6*dwidth_RFadd-1:5*dwidth_RFadd]),
                .wen(wen_RF[5]),
                .d_out(o_RF5));
    
    //TODO: use for loop            
//    register_pipe #(.width(phit_size), .numPipeStage(latencyPEA))   
//        register_pipe_inst0(.din(inbound), .clk(clk), .rst(rst), .dout(inbound_PEA1));  
        
//    register_pipe #(.width(phit_size), .numPipeStage(latencyPEA)) 
//        register_pipe_inst1(.din(inbound_PEA1), .clk(clk), .rst(rst), .dout(inbound_PEB));
        
//    register_pipe #(.width(phit_size), .numPipeStage(latencyPEB)) 
//        register_pipe_inst2(.din(inbound_PEB), .clk(clk), .rst(rst), .dout(inbound_PEC0)); 
    
//    register_pipe #(.width(phit_size), .numPipeStage(latencyPEC)) 
//        register_pipe_inst3(.din(inbound_PEC0), .clk(clk), .rst(rst), .dout(inbound_PEC1));             
    
//    register_pipe #(.width(phit_size), .numPipeStage(latencyPEC)) 
//        register_pipe_inst4(.din(inbound_PEC1), .clk(clk), .rst(rst), .dout(inbound_PED));    
        
    assign stream_out = o_PE_typeD;
    // DEBUG    
    assign stream_out_PEa0 = o_PE_typeA_n0;
    assign stream_out_PEa1 = o_PE_typeA_n1;
    assign stream_out_PEb = o_PE_typeB;
    assign stream_out_PEc0 = o_PE_typeC_n0;
    assign stream_out_PEc1 = o_PE_typeC_n1;
    
 
//    assign stream_out_PEc = o_PE_typeC_n1;
//    assign stream_out_PEa = o_PE_typeA_n0;
endmodule
