`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

// TODO: map manually the tables to BRAMs b/c BRAMs were not implied
//organized in 512 bit write to facilitate easy writing to the table (512 bit wr_data matches AXIS QDMA)
module config_table(
    input logic clk,
    input logic [dwidth_configadd-1:0] rd_add,
    input logic [dwidth_configadd-1:0] wr_add,
    input logic wr_en,
    input logic [dwidth_int-1:0] wr_data,
    output logic [dwidth_int-1:0] rd_data
    // output logic [sz_config-1:0] rd_data_ctrl,
    // output logic [dwidth_double-1:0] rd_data_imm
    );
    // valid || NoP   || operation || operand1 || operand2 || wr_address || rd_addr || R/W   ||  itr/add          || NoP   || NoP (dont care) || Immedite data
    // 1 bit || 1 bit ||  2 bit    || 2 bit    || 2 bit    || 12 bit     || 12 bit  || 1 bit ||   1 bit (1 is itr) || 2 bit || 427 bit       || 64 bit

    // first 512 bits of memory => feed to first entry of 16 parallel config tables (instructions)
    // next 512 bits => feed to the second entry
    
    logic [dwidth_int-1:0] mem1 [depth_config-1:0];
//    logic [phit_size-1:0] mem2 [depth_RF];
    
    //for simulation
    integer i;
    initial begin
        for (i=0; i<depth_config; i=i+1) begin
            mem1 [i] <= 0;
//            mem2 [i] <= 0;
        end
//        mem = 0;
    end
    // end simulation
    
    always@(posedge clk) begin
        if (wr_en)  
            mem1[wr_add] <= wr_data;
//        else if (wr_en[1])
//            mem2[wr_add] <= wr_data;
    end
    
//    mux16 #(state_table_width) mux16_inst0(mem, rd_addr, rd_data);
    // assign rd_data_ctrl = mem1[rd_add][phit_size-1:phit_size-sz_config];//488
    // assign rd_data_imm = mem1[rd_add][dwidth_double-1:0];
    assign rd_data = mem1[rd_add];
    //discard other bits
endmodule
