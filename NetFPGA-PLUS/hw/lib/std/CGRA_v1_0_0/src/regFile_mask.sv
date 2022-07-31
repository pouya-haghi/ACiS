`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module regFile_mask( // support multibit wen (resolution at the granularity of PEs)
    input logic [phit_size-1:0]         d_in,
    input logic [SIMD_degree-1:0]       tlast_in,
    input logic                         clk,
    input logic [dwidth_RFadd-1:0]      rd_addr1,
    input logic [dwidth_RFadd-1:0]      rd_addr2,
    input logic [dwidth_RFadd-1:0]      wr_addr,
    input logic [SIMD_degree-1:0]       wen,
    output logic [phit_size-1:0]        d_out1,
    output logic [phit_size-1:0]        d_out2,
    output logic [SIMD_degree-1:0]      tlast_out1,
    output logic [SIMD_degree-1:0]      tlast_out2
    );
    
    logic [phit_size+SIMD_degree-1:0] mem [depth_RF-1:0];
    integer k;
    
    // This is for simulation
    initial begin
        for (k=0;k<depth_RF;k=k+1)
            mem[k] <= 0;
//            mem[i] <= i*10;
    end
    // End of simulation
    genvar i;
    generate for (i = 0; i< SIMD_degree; i++) begin
        always_ff @(posedge clk) begin
            if(wen[i]) 
                mem[wr_addr][dwidth_float*(i+1) - 1:dwidth_float*i] <= d_in[dwidth_float*(i+1) - 1:dwidth_float*i];
        end
    end
    endgenerate
    
    always_ff @(posedge clk) begin
        if(|wen) 
            mem[wr_addr][phit_size+SIMD_degree-1:phit_size] <= tlast_in;
    end
    
    assign {tlast_out1,d_out1} = mem[rd_addr1];
    assign {tlast_out2,d_out2} = mem[rd_addr2];
    
endmodule
