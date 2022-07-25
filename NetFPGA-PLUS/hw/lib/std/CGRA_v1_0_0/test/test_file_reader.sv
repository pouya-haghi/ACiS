`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2022 11:21:19 AM
// Design Name: 
// Module Name: test_file_reader
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


module test_file_reader(

    );
    logic [phit_size-1:0] m00_axi_rdata;
    logic m00_axi_rvalid, m00_axi_rlast;
    logic [dwidth_int-1:0] read_inst;
    int fd[0:(num_col-1)];
    int i,j,k;
    string s,line;
    initial begin
        for (i=0; i<num_col; i++)
            fd[i] = $fopen({"./instructions/gcn_",s.inttoa(i),".bin","rb"});
        // Start instructions write
        m00_axi_rvalid <= 1'b1; 
        //start instructions
        for (j=0; j<depth_config; j++) begin
            for (k=0; j<num_col; k++) begin
                m00_axi_rdata <= '0;
                if (!$feof(fd[k])) begin
                    $fread(read_inst,fd[k]);
                    m00_axi_rdata <= {m00_axi_rdata[phit_size-dwidth_int-1:0],read_inst};
                end
            end
            if (i==(total_instr-1))
                m00_axi_rlast <= 1'b1;
            #clk_pd;
            m00_axi_rlast <= 1'b0;
        end
        
        $finish;
    end
endmodule
