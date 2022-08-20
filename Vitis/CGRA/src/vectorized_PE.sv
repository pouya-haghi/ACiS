`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module vectorized_PE(
    input logic [phit_size-1:0] i1_PE_typeC,
    input logic [phit_size-1:0] i2_PE_typeC,    
    input logic [phit_size-1:0] i3_PE_typeC, // Added as 3rd input
    input logic [SIMD_degree-1:0] i_tlast1_PE_typeC,
    input logic [SIMD_degree-1:0] i_tlast2_PE_typeC,
    input logic [SIMD_degree-1:0] i_tvalid1_PE_typeC,
    input logic [SIMD_degree-1:0] i_tvalid2_PE_typeC,  
//    input logic [SIMD_degree-1:0] i_tvalid3_PE_typeC,
    input logic clk,
    input logic rst,
    input logic [2:0] op,
    output logic [phit_size-1:0] o_PE_typeC,
    output logic [SIMD_degree-1:0] o_tlast_PE_typeC,
    output logic [SIMD_degree-1:0] o_tvalid_PE_typeC
    );
    
    logic [2:0] nop = 3'b100;
    
    genvar i;
    generate
    for (i=0; i<SIMD_degree; i++) begin
        PE_typeC #(latencyPEC) PE_typeC_inst0(
            .inp1(i1_PE_typeC[((i+1)*dwidth_float)-1:(i*dwidth_float)]), 
            .inp2(i2_PE_typeC[((i+1)*dwidth_float)-1:(i*dwidth_float)]),
            .inp3(i3_PE_typeC[((i+1)*dwidth_float)-1:(i*dwidth_float)]), 
            .t_last1_in(i_tlast1_PE_typeC[i]),
            .t_last2_in(i_tlast2_PE_typeC[i]),
            .t_valid_inp1(i_tvalid1_PE_typeC[i]),
            .t_valid_inp2(i_tvalid2_PE_typeC[i]),
//            .t_valid_inp3(i_tvalid3_PE_typeC[i]),
            .clk(clk),
            .rst(rst),
            .op((i_tvalid1_PE_typeC[i] && i_tvalid2_PE_typeC[i]) ? op[2:0] : nop), 
            .out(o_PE_typeC[((i+1)*dwidth_float)-1:(i*dwidth_float)]), 
            .t_last_out(o_tlast_PE_typeC[i]),
            .t_valid_out(o_tvalid_PE_typeC[i])
            );
    end
    endgenerate
endmodule
