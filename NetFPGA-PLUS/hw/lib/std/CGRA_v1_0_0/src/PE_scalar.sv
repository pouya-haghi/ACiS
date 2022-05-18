`timescale 1ns / 1ps

module PE_scalar(
    input logic [dwidth_int-1:0] inp1,
    input logic [dwidth_int-1:0] inp2,
    input logic [dwidth_int-1:0] R_immediate,
    input logic [2:0] op_scalar,
    output logic [dwidth_int-1:0] out1,
    output logic flag_eq
    );
    
    localparam [2:0] is_lui = 3'b000, is_addi = 3'b001, is_beq = 3'b010; 
    
    assign out1 = (op_scalar == is_addi)? inp1+R_immediate: {(dwidth_int){1'b0}};
    assign flag_eq = (inp1 == inp2) & (op_scalar == is_beq);
    
endmodule
