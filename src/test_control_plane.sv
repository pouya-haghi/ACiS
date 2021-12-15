`timescale 1ns / 1ps

module test_control_plane;
    reg clk; 
    reg rst;
    reg [phit_size-1:0] wr_data;
    reg start_loader; // start signal to write to state/config tables and inbound
    reg start_stream_in;
    reg [dwidth_RFadd-1:0] num_entry_config_table; //comes from a header specialized for packet processing 
    reg [dwidth_RFadd-1:0] num_entry_inbound;
    wire [(21*(num_col-1))-1:0] rd_data_ctrl;
    wire [(phit_size*(num_col-1))-1:0] rd_data_imm;
    wire [entry_sz_state-1:0] rd_data_state;
    wire [dwidth_double-1:0] itr;
    wire ready; // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
    wire done;
    wire wr_en_RF;
    wire [dwidth_RFadd-1:0] wr_add_RF;
    //
    
    integer i;       
           
 control_plane control_plane_inst0 (.*);
 
 always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
 initial begin
    rst = 0;
    start_loader = 0;
    start_stream_in = 1; // I want to check that stream-in should not come (ready=0) until after loading tables
    #40; 
    rst = 1;
    wr_data = 0;
    num_entry_config_table = 2;
    num_entry_inbound = 1;
    
    #20;
    rst = 0;
    // FIR example
    start_loader = 1;
    // ----------state table----------
    #20; // delay for one cycle to sample start_loader
    wr_data[511:464] = 48'h8000_00000010; //state_immediate; first entry
    #20;
    wr_data[511:464] = 48'h8002_00000000; //state_immediate; second entry
    #20;
    // ----------config table--------
    //  -----PEA0-----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h880000_000000; // state_dontcare; second entry
    // immediate data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
    #20;
    // ------PEA1----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h880000_000000; // state_dontcare; second entry
    // immediate data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
    #20;
    // ------PEB-----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h800000_000000; // state_dontcare; second entry
    // immediate data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
    #20;
    // ------PEC0----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h908004_000000; // state_dontcare; second entry
    // immediate data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
    #20;
    // ------PEC1----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'hA00000_000000; // state_dontcare; second entry
    // immediate data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
    #20;
    // ------PED----
    // ctrl data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h900000_000000; // state_dontcare; second entry
    // immediate data
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
    #20;
    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
    #20;
    // ----------inbound buffer--------
    wr_data = 512'hF; //state_immediate second entry
    

    
    #2000;
    $finish;
    
 end

endmodule
