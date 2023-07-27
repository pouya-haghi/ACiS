`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PC_logic(
    input logic is_not_vect,
    input logic done_auto_incr,
    input logic is_bne,
    input logic is_vstreamout,
    input logic flag_neq,
    input logic [11:0] branch_immediate,
    input logic done_steady,
    input logic supplier,
    output logic clken_PC,
    output logic load_PC,
    output logic incr_PC,
    output logic [11:0] load_value_PC
);

    logic is_vect;

    assign is_vect = !is_not_vect;
    assign clken_PC = done_steady & (!(is_vect & !done_auto_incr) || (is_vstreamout & done_auto_incr & supplier)); // if its vstreamout only allow PC to advance when done_auto_incr=1 and curr_supplier=1 
    assign load_PC = (is_not_vect & is_bne & flag_neq)? 1'b1: 1'b0;
    assign incr_PC = ((is_vect & done_auto_incr) || (is_not_vect & !(is_bne & flag_neq)))? 1'b1: 1'b0;
    assign load_value_PC = branch_immediate;

endmodule