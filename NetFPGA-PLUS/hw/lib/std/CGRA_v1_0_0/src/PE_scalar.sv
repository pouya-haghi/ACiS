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
    output logic [dwidth_int-1:0] out1,
    output logic flag_neq
    );
    
    localparam [2:0] is_lui = 3'b000, is_addi = 3'b001, is_bne = 3'b010, is_add = 3'b011; 
    logic [dwidth_int-1:0] R_immediate_q;
    
    reg_r #(dwidth_int) reg_r_inst0 (R_immediate, clk, rst, R_immediate_q);// delay R_immediate for 1 cycle b/c addi is not a single-cycle instr (we should first read RF)
    
    assign out1 = (op_scalar == is_addi)? inp1+R_immediate_q: ((op_scalar == is_add)? inp1+inp2 : {(dwidth_int){1'b0}});
    assign flag_neq = ((inp1 != inp2) & (op_scalar == is_bne))? 1'b1: 1'b0;
    
endmodule
