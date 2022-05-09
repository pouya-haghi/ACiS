`timescale 1ns / 1ps

module test_PE_typeC(
    );
    reg aclk, aresetn, s_axis_a_tvalid, s_axis_a_tlast;
    reg [31:0] s_axis_a_tdata;
    wire m_axis_result_tvalid, m_axis_result_tlast;
    wire [31:0] m_axis_result_tdata;
    
    PE_typeC fpacc_inst0 (.*);
    
     
 always begin
        aclk = 1;
        #5;
        aclk = 0;
        #5;
    end
    
  initial begin
    s_axis_a_tvalid <= 0; //dont care
    s_axis_a_tlast <= 0;
    s_axis_a_tdata <= 32'h40000000; //dont care
    aresetn = 1;
    #80; 
    aresetn = 0;
    #80;
    aresetn = 1;
    #40;
    s_axis_a_tvalid <= 1;
    #160;
    s_axis_a_tlast<= 0;
    #10;
    s_axis_a_tlast<= 0;
    s_axis_a_tvalid <= 0;
    #1000;
    $finish;
    
 end
    
endmodule
