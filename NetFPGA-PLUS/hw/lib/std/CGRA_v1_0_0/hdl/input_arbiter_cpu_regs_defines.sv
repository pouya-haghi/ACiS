`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2022 11:22:46 AM
// Design Name: 
// Module Name: input_arbiter_cpu_regs_defines
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


           `define  REG_ID_BITS				31:0
           `define  REG_ID_WIDTH				32
           `define  REG_ID_DEFAULT			32'h0000DA01
           `define  REG_ID_ADDR				32'h0

           `define  REG_VERSION_BITS				31:0
           `define  REG_VERSION_WIDTH				32
           `define  REG_VERSION_DEFAULT			32'h1
           `define  REG_VERSION_ADDR				32'h4

           `define  REG_RESET_BITS				15:0
           `define  REG_RESET_WIDTH				16
           `define  REG_RESET_DEFAULT			16'h0
           `define  REG_RESET_ADDR				32'h8

           `define  REG_FLIP_BITS				31:0
           `define  REG_FLIP_WIDTH				32
           `define  REG_FLIP_DEFAULT			32'h0
           `define  REG_FLIP_ADDR				32'hC

           `define  REG_DEBUG_BITS				31:0
           `define  REG_DEBUG_WIDTH				32
           `define  REG_DEBUG_DEFAULT			32'h0
           `define  REG_DEBUG_ADDR				32'h10

           `define  REG_PKTIN_BITS				31:0
           `define  REG_PKTIN_WIDTH				32
           `define  REG_PKTIN_DEFAULT			32'h0
           `define  REG_PKTIN_ADDR				32'h14

           `define  REG_PKTOUT_BITS				31:0
           `define  REG_PKTOUT_WIDTH				32
           `define  REG_PKTOUT_DEFAULT			32'h0
           `define  REG_PKTOUT_ADDR				32'h18