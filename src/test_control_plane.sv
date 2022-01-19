`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_control_plane;
    reg clk; 
    reg rst;
    reg [phit_size-1:0] wr_data;
    reg start_loader; // start signal to write to state/config tables and inbound
    reg start_stream_in;
    reg [dwidth_RFadd-1:0] num_entry_config_table; //comes from a header specialized for packet processing 
    reg [dwidth_RFadd-1:0] num_entry_inbound;
    wire [(sz_config*(num_col))-1:0] rd_data_ctrl;
    wire [(phit_size*(num_col))-1:0] rd_data_imm;
//    wire [entry_sz_state-1:0] rd_data_state;
    wire [(dwidth_double*num_col)-1:0] itr;
    wire ready_stream_in; // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
//    wire done;
    wire wr_en_RF_runtimeLoadTable;
    wire [dwidth_RFadd-1:0] wr_add_RF_runtimeLoadTable;
//    wire keep_start_stream_in;
    //
    
    wire [sz_config-1:0] rd_data_ctrl_PEC0;
    wire [phit_size-1:0] rd_data_imm_PEC0;
    
    wire [47:0] wr_data_part;
    
    integer i;      
    parameter num_entry_inb = 16; 
           
 control_plane control_plane_inst0 (.*);
 
 assign rd_data_ctrl_PEC0 = rd_data_ctrl[(4*24)-1:3*24];
 assign rd_data_imm_PEC0 = rd_data_imm[(3*phit_size)-1:2*phit_size];
 assign wr_data_part = wr_data[511:464];
 
 always begin
        clk = 1;
        #10;
        clk = 0;
        #10;
    end
    
 initial begin
    rst = 0;
    start_loader = 0;
    start_stream_in = 1; // I want to check that stream-in should not come (ready=0) until after loading tables
    #30; 
    rst = 1;
    wr_data = 0;
    num_entry_config_table = 2; // 6 stage * 2 entry * 2 separate config tables
    num_entry_inbound = 16;
    
    #20;
    rst = 0;
    // FIR example
    start_loader = 1'b1;
    // ----------state table----------
    #20; // delay for one cycle to sample start_loader
    start_loader = 1'b0;
    #20; // one clock delay b/c we have just pulled down start_loader
    #20; // one clk delay to capture wr_add
    wr_data[511:464] = 48'h8000_00000010; //state_immediate; first entry
    #20;
    wr_data[511:464] = 48'h800A_00000000; //state_immediate; second entry
    #20;
    // ----------config table--------
    //  -----PEA0-----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    wr_data[63:0] = '0; // immediate
    #20;
    wr_data[511:464] = 48'h880000_000000; // state_dontcare; second entry
    wr_data[63:0] = '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PEA1----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    wr_data[63:0] = '0; // immediate
    #20;
    wr_data[511:464] = 48'h880000_000000; // state_dontcare; second entry
    wr_data[63:0] = '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PEB-----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    wr_data[63:0] = '0; // immediate
    #20;
    wr_data[511:464] = 48'h800000_000000; // state_dontcare; second entry
    wr_data[63:0] = '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PEC0----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    wr_data[63:0] = '0; // immediate
    #20;
    wr_data[511:464] = 48'h900004_000000; // state_dontcare; second entry
    wr_data[63:0] = '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PEC1----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    wr_data[63:0] = '0; // immediate
    #20;
    wr_data[511:464] = 48'hA00000_000000; // state_dontcare; second entry
    wr_data[63:0] = '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PED----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    wr_data[63:0] = '0; // immediate
    #20;
    wr_data[511:464] = 48'h900000_000000; // state_dontcare; second entry
    wr_data[63:0] = '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ----------inbound buffer--------
    // 16 entries // All inbound data are 1
    for (i=0; i<num_entry_inb; i++) begin
        wr_data = 512'd1; 
        #20;
    end
    
    #160;
    start_stream_in = 0; // deassert again (ideally we should do it based on keep_start_stream_in
    // ----------- stream_in ---------
    // 16 entries // All stream_in are 2
//    for (i=0; i<num_entry_inb; i++) begin
//        stream_in = 512'd2; 
//        #20;
//    end  
    
    // expected output is: 2*1 + 2*1 + ... = 32
    
    #2100;
    $finish;
    
 end

endmodule
