`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_file_reader;
    logic [phit_size-1:0] m00_axi_rdata;
    logic m00_axi_rlast;

    logic [phit_size-1:0] instructions[0:depth_config-1];
    logic [dwidth_int-1:0] mem[0:num_col-1][0:(depth_config)-1];
    
    genvar c;
    generate
    for (c=0;c<num_col;c++) begin
        logic [dwidth_int-1:0] read_inst[0:depth_config-1];
        string s, path;
        initial begin
            s.itoa(c);
            path = {"./instructions/gcn_",s,".bin"};
            $readmemb(path,read_inst);
            mem[c] = read_inst;
        end
    end
    endgenerate
    
    genvar i,j;
    generate
    for (i=0;i<num_col;i++) begin
        for (j=0;j<depth_config;j++) begin
            assign instructions[j][dwidth_int*(i+1)-1:dwidth_int*i] = mem[i][j];
        end
    end 
    endgenerate   
    
    int k;
    initial begin
        instructions = '{default:0};
        #10;
        
        //start instructions
        for (k=0; k<depth_config; k++) begin
            m00_axi_rdata <= instructions[k];
            if (k==(depth_config-1))
                m00_axi_rlast <= 1'b1;
            #clk_pd;
            m00_axi_rlast <= 1'b0;
        end
        $finish;
    end
endmodule
