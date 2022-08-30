`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module PE_scalar(
    input logic [dwidth_int-1:0] inp1,
    input logic [dwidth_int-1:0] inp2,
    input logic [dwidth_int-1:0] R_immediate,
    input logic [2:0] op_scalar,
//    input logic [dwidth_inst-1:0] instr_q,
//    input logic [1:0] is_forward_PE,
//    input logic clk,
//    input logic rst,
    output logic [dwidth_int-1:0] out1,
    output logic flag_neq
    );
    
    localparam [2:0] is_lui = 3'b000, is_addi = 3'b001, is_bne = 3'b010, is_add = 3'b011; 
//    logic is_addi_q, is_add_q, is_bne_q;
//    logic [dwidth_int-1:0] R_immediate_q;
//    logic [dwidth_int-1:0] out1_q;
    
//    assign is_addi_q = (instr_q[6:0]==7'b0010011 && instr_q[14:12]==3'b000)?1'b1:1'b0;
//    assign is_add_q = (instr_q[6:0]==7'b0110011 && instr_q[14:12]==3'b000 && instr_q[31:25]==7'b0000000)?1'b1:1'b0;
//    assign is_bne_q = (instr_q[6:0]==7'b1100011 && instr_q[14:12]==3'b001)?1'b1:1'b0;
    
//    reg_r #(dwidth_int) reg_r_inst0 (R_immediate, clk, rst, R_immediate_q);// delay R_immediate for 1 cycle b/c addi is not a single-cycle instr (we should first read RF)
    
//    assign out1 = (is_addi_q)? ((is_forward_PE[0])? out1_q+R_immediate_q : inp1+R_immediate_q): 
//    ((is_add_q)?((is_forward_PE[0])? out1_q+inp2: (is_forward_PE[1]? inp1+out1_q : inp1+inp2)) : 
//    {(dwidth_int){1'b0}});
    
    assign out1 = (op_scalar==is_addi)? inp1+R_immediate: 
    ((op_scalar==is_add)? inp1+inp2 : 
    {(dwidth_int){1'b0}});
    
//    assign flag_neq = ((inp1 != inp2) & (is_bne_q))? 1'b1: 1'b0;
    assign flag_neq = ((inp1 != inp2) & (op_scalar==is_bne))? 1'b1: 1'b0;
    
//    reg_r #(dwidth_int) reg_r_inst1 (out1, clk, rst, out1_q); // used for forwarding
    
endmodule
