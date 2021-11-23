`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

//organized in 512 bit write to facilitate easy writing to the table (512 bit wr_data matches AXIS QDMA)
module state_table(
    input logic clk,
    input logic [dwidth_RFadd-1:0] rd_add,
    input logic [dwidth_RFadd-1:0] wr_add,
    input logic wr_en,
    input logic [phit_size-1:0] wr_data,
    output logic [54:0] rd_data
    );
    // valid || L (level) || CB ||  || SC   || #CB   || #SC    || Triggered on || NoP (dont care)
    // 1 bit || 2 bit     || 5 bit || 5 bit || 5 bit || 5 bit  || 32 bit         || 457 bit
    // CB (Control Block) is for defining a scope
    // SC (Sub-Configuration) is for when parallelism is not enough and you need to do multiple operation with the same PE
    // triggered on => is for knowing the number of loop iterations (we need a counter)
    // NoP to fill the 512 bits
    logic [phit_size-1:0] mem [depth_RF];
    
    //for simulation
    integer i;
    initial begin
        for (i=0; i<depth_RF; i=i+1)
            mem [i] = 0;
//        mem = 0;
    end
    // end simulation
    
    always@(posedge clk) begin
        if (wr_en)  
            mem[wr_add] = wr_data;
    end
    
//    mux16 #(state_table_width) mux16_inst0(mem, rd_addr, rd_data);
    assign rd_data = mem[rd_add][54:0]; 
    
endmodule