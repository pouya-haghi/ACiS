`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

//organized in 512 bit write to facilitate easy writing to the table (512 bit wr_data matches AXIS QDMA)
module config_table(
    input logic clk,
    input logic [dwidth_RFadd-1:0] rd_add,
    input logic [dwidth_RFadd-1:0] wr_add,
    input logic [1:0] wr_en,
    input logic [phit_size-1:0] wr_data,
    output logic [sz_config-1:0] rd_data_ctrl,
    output logic [phit_size-1:0] rd_data_imm
    );
    // valid || operation || operand1 || operand2 || R/W   || address || itr/add          || NoP   || NoP (dont care) || Immedite data
    // 1 bit || 3 bit     || 2 bit    || 2 bit    || 1 bit || 12 bit  || 1 bit (1 is itr) || 2 bit || 491 bit       || 64*8 = 512 bit
    
    logic [phit_size-1:0] mem1 [depth_RF];
    logic [phit_size-1:0] mem2 [depth_RF];
    
    //for simulation
    integer i;
    initial begin
        for (i=0; i<depth_RF; i=i+1) begin
            mem1 [i] = 0;
            mem2 [i] = 0;
        end
//        mem = 0;
    end
    // end simulation
    
    always@(posedge clk) begin
        if (wr_en[0])  
            mem1[wr_add] = wr_data;
        else if (wr_en[1])
            mem2[wr_add] = wr_data;
    end
    
//    mux16 #(state_table_width) mux16_inst0(mem, rd_addr, rd_data);
    assign rd_data_ctrl = mem1[rd_add][phit_size-1:phit_size-sz_config];//488
    assign rd_data_imm = mem2[rd_add];
    //discard other bits
endmodule
