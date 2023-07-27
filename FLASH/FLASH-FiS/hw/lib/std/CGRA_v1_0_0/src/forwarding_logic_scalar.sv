`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module forwarding_logic_scalar(
    input logic [dwidth_inst-1:0] instr,
    input logic clk,
    input logic rst,
    output logic [1:0] is_forward_PE, // LSB is for forwarding src1 operand while MSB is for forwarding scr2 operand
//    output logic [1:0] is_forward_branch // LSB is for forwarding src1 operand while MSB is for forwarding scr2 operand
    output logic [dwidth_inst-1:0] o_instr_q
    );
    
    logic [dwidth_inst-1:0] instr_q, instr_qq;
    logic is_addi_q, is_addi_qq, is_add_q, is_add_qq;
    reg_r #(dwidth_int) reg_r_inst0 (instr, clk, rst, instr_q);
    reg_r #(dwidth_int) reg_r_inst1 (instr_q, clk, rst, instr_qq);
    
    assign is_addi_q = (instr_q[6:0]==7'b0010011 && instr_q[14:12]==3'b000)?1'b1:1'b0;
    assign is_addi_qq = (instr_qq[6:0]==7'b0010011 && instr_qq[14:12]==3'b000)?1'b1:1'b0;
    assign is_add_q = (instr_q[6:0]==7'b0110011 && instr_q[14:12]==3'b000 && instr_q[31:25]==7'b0000000)?1'b1:1'b0;
    assign is_add_qq = (instr_q[6:0]==7'b0110011 && instr_q[14:12]==3'b000 && instr_q[31:25]==7'b0000000)?1'b1:1'b0;
    
    // dest of the second instr == src1 of the first instruction and both instr should be add or addi
    assign is_forward_PE[0] = (instr_qq[11:7]==instr_q[19:15]) && ((is_addi_q&is_addi_qq)|(is_add_q&is_add_qq)|(is_addi_q&is_add_qq)|(is_add_q&is_addi_qq));
    assign is_forward_PE[1] = (instr_qq[11:7]==instr_q[24:20]) && ((is_add_q&is_add_qq)|(is_addi_q&is_add_qq));
    
    assign o_instr_q = instr_q;

endmodule
