`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PC_logic(
    input logic is_not_vect,
    input logic done_auto_incr,
    input logic is_beq,
    input logic flag_eq,
    input logic [11:0] branch_immediate,
    output logic clken_PC,
    output logic load_PC,
    output logic incr_PC,
    output logic [11:0] load_value_PC
);


assign clken_PC = (!is_not_vect & !done_auto_incr)? 1'b0: 1'b1; 
assign load_PC = (is_beq & flag_eq)? 1'b1: 1'b0;
assign incr_PC = (is_beq & flag_eq)? 1'b0: 1'b1;
assign load_value_PC = branch_immediate;


endmodule