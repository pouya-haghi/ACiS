`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_top_IS;
    // inputs
    reg clk; 
    reg rst;
    reg [phit_size-1:0] stream_in;
    reg [phit_size-1:0] wr_data_ctrl_plane;
    reg start_loader;
    reg start_stream_in;
    reg [dwidth_RFadd-1:0] num_entry_config_table;
    reg [dwidth_RFadd-1:0] num_entry_inbound;
    reg [SIMD_degree-1:0] t_stream_in_valid;
    
    // outputs
    wire ready_stream_in;
    wire [phit_size-1:0] stream_out;
    wire [SIMD_degree-1:0] t_stream_out_valid;
    
    
    // debug_outputs
    wire [dwidth_double-1:0] stream_out_first_lane;
    wire [phit_size-1:0] stream_out_PEa0;   
    wire [phit_size-1:0] stream_out_PEa1;
    wire [phit_size-1:0] stream_out_PEb;
    wire [phit_size-1:0] stream_out_PEc0;
    wire [phit_size-1:0] stream_out_PEc1;
    
    integer i;      
    parameter num_entry_inb = 16;
    parameter tot_PE_latency = 79; // sum of PE latencies 
    parameter period = 20;
           
 top top_inst0 (.*);

 assign stream_out_first_lane = stream_out[dwidth_double-1:0];
 
    // DEBUG
    wire [dwidth_double-1:0] stream_out_PEa0_word, stream_out_PEa1_word, stream_out_PEb_word;
    wire [dwidth_double-1:0] stream_out_PEc0_word, stream_out_PEc1_word, stream_out_word;
    assign stream_out_PEa0_word = stream_out_PEa0[dwidth_double-1:0];
    assign stream_out_PEa1_word = stream_out_PEa1[dwidth_double-1:0];
    assign stream_out_PEb_word = stream_out_PEb[dwidth_double-1:0];
    assign stream_out_PEc0_word = stream_out_PEc0[dwidth_double-1:0];
    assign stream_out_PEc1_word = stream_out_PEc1[dwidth_double-1:0];
    assign stream_out_word = stream_out[dwidth_double-1:0];
 
 always begin
        clk <= 1;
        #(period/2);
        clk <= 0;
        #(period/2);
    end
    
 initial begin
    t_stream_in_valid <= {SIMD_degree{1'b0}};
    rst <= 0;
    start_loader <= 0;
    start_stream_in <= 1; // I want to check that stream-in should not come (ready=0) until after loading tables
    wr_data_ctrl_plane <= 0;
    num_entry_config_table <= 2; // 6 stage * 2 entry * 2 separate config tables
    num_entry_inbound <= 16;
    #30; 
    rst <= 1;
    #20;
    rst <= 0;
    // FIR example
    start_loader <= 1'b1;
    // ----------state table----------
    #20; // delay for one cycle to sample start_loader
    start_loader <= 1'b0;
    #20; // one clock delay b/c we have just pulled down start_loader
    #20; // one clk delay to capture wr_add
    wr_data_ctrl_plane[511:464] <= 48'h8000_00000080; //state_immediate; first entry
    #20;
    wr_data_ctrl_plane[511:464] <= 48'h800A_00000000; //state_immediate; second entry
    #20;
    // ----------config table--------
    //  -----PEA0-----
    // ctrl data
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h000000000; // state_dontcare; first entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h880000000; // state_dontcare; second entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PEA1----
    // ctrl data
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h000000000; // state_dontcare; first entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h880000000; // state_dontcare; second entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PEB-----
    // ctrl data
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h000000000; // state_dontcare; first entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h800000000; // state_dontcare; second entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PEC0----
    // ctrl data
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h000000000; // state_dontcare; first entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    wr_data_ctrl_plane[511:512-sz_config] <= 36'hA30000004; // state_dontcare; second entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PEC1----
    // ctrl data
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h000000000; // state_dontcare; first entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h900000000; // state_dontcare; second entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ------PED----
    // ctrl data
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h000000000; // state_dontcare; first entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    wr_data_ctrl_plane[511:512-sz_config] <= 36'h900000000; // state_dontcare; second entry
    wr_data_ctrl_plane[63:0] <= '0; // immediate
    #20;
    // immediate data
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; first entry
//    #20;
//    wr_data[511:464] = 48'h000000_000000; // state_dontcare; second entry
//    #20;
    // ----------inbound buffer--------
    // 16 entries // All inbound data are 1
    for (i=0; i<num_entry_inb; i++) begin
        wr_data_ctrl_plane <= {SIMD_degree{64'h3ff0000000000000}}; //= 1 in decimal 
        #20;
    end
    
    #160;
    start_stream_in <= 0; // deassert again (ideally we should do it based on keep_start_stream_in
    #20; // one clock delay b/c in FSM I have to transition from ready_hold to ready state
    t_stream_in_valid <= {SIMD_degree{1'b1}};
    // ----------- stream_in ---------
    // 16 entries // All stream_in are 2
    for (i=0; i<num_entry_inb; i++) begin
        stream_in <= {SIMD_degree{64'h4000000000000000}}; // = 2 in decimal; 
        #20;
    end  
    t_stream_in_valid <= {SIMD_degree{1'b0}};
    
    // expected output is: 2*1 + 2*1 + ... = 32 (4040000000000000 in hex)
    
    #2100;
    
    #(tot_PE_latency*period);
    #80;
    
    $finish;
    
    
    
 end

endmodule
