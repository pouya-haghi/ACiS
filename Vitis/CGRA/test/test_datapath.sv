`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_datapath;
    
    //////// DATAPATH ////////
    reg                                 done_loader;
    reg  [(dwidth_inst*num_col)-1:0]    instr; // vector instruction
    reg                                 clk;
    reg                                 rst;
    wire                                ap_done;
    // stream
    reg  [phit_size-1:0]                tdata_stream_in;
    reg                                 tvalid_stream_in;
    wire                                tready_stream_in;
    reg                                 tlast_stream_in;
    reg  [phit_size/8-1:0]              tkeep_stream_in;
    
    wire [phit_size-1:0]                tdata_stream_out;
    wire                                tvalid_stream_out;
    reg                                 tready_stream_out;
    wire                                tlast_stream_out;
    wire [phit_size/8-1:0]              tkeep_stream_out;
    // AXI read
    wire [(dwidth_aximm*num_col)-1:0]   araddr_HBM;
    reg  [num_col-1:0]                  arready_HBM;
    reg  [num_col-1:0]                  rvalid_HBM;
    reg  [(phit_size*num_col)-1:0]      rdata_HBM;
    wire [num_col-1:0]                  rready_HBM;
    wire [num_col-1:0]                  arvalid_HBM;
    wire [(8*num_col)-1:0]              arlen_HBM;
    reg  [num_col-1:0]                  rlast_HBM;
    // AXI write
    wire [num_col-1:0]                  wvalid_HBM;
    reg  [num_col-1:0]                  wready_HBM;
    wire [num_col-1:0]                  awvalid_HBM;
    wire [(num_col*8)-1:0]              awlen_HBM;
    wire [(num_col*phit_size)-1:0]      wdata_HBM;
    wire [(num_col*(phit_size/8))-1:0]  wstrb_HBM;
    wire [num_col-1:0]                  wlast_HBM;
    reg  [num_col-1:0]                  bvalid_HBM;
    wire [num_col-1:0]                  bready_HBM;
    wire [(dwidth_aximm*num_col)-1:0]   awaddr_HBM;
    reg  [num_col-1:0]                  awready_HBM;
    //PC
    wire [num_col-1:0]                  clken_PC;
    wire [num_col-1:0]                  load_PC;
    wire [num_col-1:0]                  incr_PC;
    wire [(num_col*12)-1:0]             load_value_PC;
    reg  [dwidth_int-1:0]               cycle_register;
    
    data_path data_path_inst1 (.*);
    
    always begin
        #(clk_pd/2);
        clk = !clk;
    end
    
    integer i;
    
 initial begin
    done_loader <= 0;
    instr <= 0;
    clk = 0;
    rst = 0;
    
    tdata_stream_in <= 512'h0;
    tvalid_stream_in <= 1'b0;
    tlast_stream_in <= 1'b0;
    tkeep_stream_in <= {(phit_size/8){1'b0}};
    
    tready_stream_out <= 1'b0;
    
    arready_HBM <= {(num_col){1'b0}};
    rvalid_HBM <= {(num_col){1'b0}};
    rdata_HBM <= {(phit_size*num_col){1'b0}};
    rlast_HBM <= {(num_col){1'b0}};  
    
    wready_HBM <= {(num_col){1'b0}};
    bvalid_HBM <= {(num_col){1'b0}};
    awready_HBM <= {(num_col){1'b0}}; 
    
    cycle_register <= {dwidth_int{1'b0}};
    
    // Reset
    #(4*clk_pd);
    rst = 1;
    #(8*clk_pd);
    rst = 0;
    
    // Done Loader pulse
    done_loader <= 1'b1;
    #clk_pd;
    done_loader <= 1'b0;
    
//    //////////////////////// Test Streamout ////////////////////////
//    // vsetilvi
//    // vlen = 8 = 12'b1000                    1,1         8       0     7     0     inst
//    instr[dwidth_inst-1:0] <=               {2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048 
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048
//    #clk_pd;
    
//    // vstreamout
//    tready_stream_out <= 1'b1;
//    instr[dwidth_inst-1:0] <=               {20'b0, 5'b0, 7'h7F}; 
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {20'b0, 5'b0, 7'h7F};
//    #(clk_pd*16);
    
//    instr <= '0; 
//    #(clk_pd*10);
//    tready_stream_out <= 1'b0;
    
    
    //////////////////////// Vector Instructions ////////////////////////
    
    // Golden Testbench ***************************************
    // vsetilvi
    // vlen = 8 = 12'b1000                    1,1         8       0     7     0     inst
    instr[dwidth_inst-1:0] <=               {2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048 
    instr[(2*dwidth_inst)-1:dwidth_inst] <= {2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048
    #clk_pd;
    // vle32                                     0       rs1      0    rd   inst
    instr[dwidth_inst-1:0] <=               {12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07}; // vle32.vv v0, (x2)
    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07}; // vle32.vv v0, (x2)
    arready_HBM <= {(num_col){1'b1}}; #clk_pd;
//    #(clk_pd*delay_HBM); // 6 cycles delay
    arready_HBM <= {(num_col){1'b0}};
    rvalid_HBM <= {(num_col){1'b1}};
    // stream in data
    rdata_HBM <= {192'b0, 32'h40000000, 288'b0, 192'b0, 32'h40000000, 288'b0}; #clk_pd;//2
    rdata_HBM <= {192'b0, 32'h40400000, 288'b0, 192'b0, 32'h40400000, 288'b0}; #clk_pd;//3
    rdata_HBM <= {192'b0, 32'h40800000, 288'b0, 192'b0, 32'h40800000, 288'b0}; #clk_pd;//4
    rdata_HBM <= {192'b0, 32'h40a00000, 288'b0, 192'b0, 32'h40a00000, 288'b0}; #clk_pd;//5
    rdata_HBM <= {192'b0, 32'h40c00000, 288'b0, 192'b0, 32'h40c00000, 288'b0}; #clk_pd;//6
    rdata_HBM <= {192'b0, 32'h40e00000, 288'b0, 192'b0, 32'h40e00000, 288'b0}; #clk_pd;//7
    rdata_HBM <= {192'b0, 32'h41000000, 288'b0, 192'b0, 32'h41000000, 288'b0}; #clk_pd;//8
    rlast_HBM <= {(num_col){1'b1}};                                                       
    rdata_HBM <= {192'b0, 32'h41100000, 288'b0, 192'b0, 32'h41100000, 288'b0}; #clk_pd;//9
    rvalid_HBM <= {(num_col){1'b0}}; rlast_HBM <= {(num_col){1'b0}};
    
    // vle32                                     0       rs1      0    rd   inst
    instr[dwidth_inst-1:0] <=               {12'b0, 5'b00010 , 3'b0, 5'h3, 7'h07}; // vle32.vv v0, (x2)
    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'b0, 5'b00010 , 3'b0, 5'h3, 7'h07}; // vle32.vv v0, (x2)
    arready_HBM <= {(num_col){1'b1}}; #clk_pd;
//    #(clk_pd*delay_HBM); // 8 cycles delay
    arready_HBM <= {(num_col){1'b0}};
    rvalid_HBM <= {(num_col){1'b1}};
    // stream in data
    rdata_HBM <= {192'b0, 32'h40000000, 288'b0, 192'b0, 32'h40000000, 288'b0}; #clk_pd;//2
    rdata_HBM <= {192'b0, 32'h40400000, 288'b0, 192'b0, 32'h40400000, 288'b0}; #clk_pd;//3
    rdata_HBM <= {192'b0, 32'h40800000, 288'b0, 192'b0, 32'h40800000, 288'b0}; #clk_pd;//4
    rdata_HBM <= {192'b0, 32'h40a00000, 288'b0, 192'b0, 32'h40a00000, 288'b0}; #clk_pd;//5
    rdata_HBM <= {192'b0, 32'h40c00000, 288'b0, 192'b0, 32'h40c00000, 288'b0}; #clk_pd;//6
    rdata_HBM <= {192'b0, 32'h40e00000, 288'b0, 192'b0, 32'h40e00000, 288'b0}; #clk_pd;//7
    rdata_HBM <= {192'b0, 32'h41000000, 288'b0, 192'b0, 32'h41000000, 288'b0}; #clk_pd;//8
    rlast_HBM <= {(num_col){1'b1}};
    rdata_HBM <= {192'b0, 32'h41100000, 288'b0, 192'b0, 32'h41100000, 288'b0}; #clk_pd;//9
    rvalid_HBM <= {(num_col){1'b0}}; rlast_HBM <= {(num_col){1'b0}};
    
    //vmacc                                       func     0   vs2   vs1    000    vd   inst
    instr[dwidth_inst-1:0] <=               {6'b101100, 1'b0, 5'd1, 5'h1 , 3'b0, 5'd3, 7'h57}; // vfmacc.xv v0, (x2)
    instr[(2*dwidth_inst)-1:dwidth_inst] <= {6'b101100, 1'b0, 5'd1, 5'h1 , 3'b0, 5'd3, 7'h57}; // vfmacc.xv v0, (x2)
    //Stream in
    tvalid_stream_in <= 1'b1;
    tkeep_stream_in <= {(phit_size/8){1'b1}};

    // Actual Data stream in (payload)
    tdata_stream_in <= {192'b0, 32'h40000000, 288'h123456789}; #clk_pd;//2 
    tdata_stream_in <= {192'b0, 32'h40400000, 288'b0}; #clk_pd;//3 
    tdata_stream_in <= {192'b0, 32'h40800000, 288'b0}; #clk_pd;//4 
    tdata_stream_in <= {192'b0, 32'h40a00000, 288'b0}; #clk_pd;//5 
    tdata_stream_in <= {192'b0, 32'h40c00000, 288'b0}; #clk_pd;//6 
    tdata_stream_in <= {192'b0, 32'h40e00000, 288'b0}; #clk_pd;//7 
    tdata_stream_in <= {192'b0, 32'h41000000, 288'b0}; #clk_pd;//8 
    tlast_stream_in <= 1'b1;
    tdata_stream_in <= {192'b0, 32'h41100000, 288'b0}; #clk_pd;//9 
    tvalid_stream_in <= '0;
    tkeep_stream_in <= {(phit_size/8){1'b0}};
    tlast_stream_in <= 1'b0;
    #(clk_pd*18);
    
    // vstreamout                                                
    tready_stream_out <= 1'b1;                                   
    instr[dwidth_inst-1:0] <=               {20'b0, 5'h3, 7'h7F};
    instr[(2*dwidth_inst)-1:dwidth_inst] <= 32'b0;
    #(clk_pd*16);                                                                                  
                                      
    // vse32                                     0       rs1      0    rd   inst
    instr[dwidth_inst-1:0] <=               {12'b0, 5'b00010 , 3'b0, 5'd3, 7'h27}; // vse32.vv v0, (x2)
    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'b0, 5'b00010 , 3'b0, 5'd3, 7'h27}; // vse32.vv v0, (x2)
    awready_HBM <= {(num_col){1'b1}};
    #(clk_pd*delay_HBM); // 8 cycles delay
    wready_HBM <= {(num_col){1'b1}};
    #(clk_pd*8); // read data for 8 cycles
    wready_HBM <= {(num_col){1'b0}};
    
    tready_stream_out <= 1'b0;
    
    // end golden****************************************


//    //////////////////////// Scalar Instructions ////////////////////////
//    // LUI                                         imm    rd   inst
//    instr[dwidth_inst-1:0] <=               {20'h12345, 5'h1, 7'h37};
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {20'h12345, 5'h1, 7'h37};
//    #clk_pd;                                     
    
//    // ADDI                                      imm   rs1     000    rd   inst
//    instr[dwidth_inst-1:0] <=               {12'h567, 5'h1, 3'b000, 5'h1, 7'h13};
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'h567, 5'h1, 3'b000, 5'h1, 7'h13};
//    #clk_pd;

//    // ADDI                                      imm   rs1     000    rd   inst
//    instr[dwidth_inst-1:0] <=               {12'h111, 5'h1, 3'b000, 5'h2, 7'h13};
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'h111, 5'h1, 3'b000, 5'h2, 7'h13};
//    #clk_pd;
    
//    // ADD
//    instr[dwidth_inst-1:0] <=               {7'h0, 5'h1, 5'h2, 3'b000, 5'h3, 7'h33};
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {7'h0, 5'h1, 5'h2, 3'b000, 5'h3, 7'h33};
//    #clk_pd;
//    // BNE
//    instr[dwidth_inst-1:0] <=               {7'h0, 5'h1, 5'h2, 3'b001, 5'h0, 7'h63};
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {7'h0, 5'h1, 5'h2, 3'b001, 5'h0, 7'h63};
//    #clk_pd;
//    // BNE
//    instr[dwidth_inst-1:0] <=               {7'h0, 5'h1, 5'h1, 3'b001, 5'h0, 7'h63};
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {7'h0, 5'h1, 5'h1, 3'b001, 5'h0, 7'h63};    
//    #(clk_pd*10);



//    //////////////////////// Debug HBM Instructions ////////////////////////
//    // vsetilvi
//    // vlen = 8 = 12'b1000                    1,1         8       0     7     0     inst
//    instr[dwidth_inst-1:0] <=               {2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048 
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048
//    #clk_pd;
//    // vle32                                     0       rs1      0    rd   inst
//    instr[dwidth_inst-1:0] <=               {12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07}; // vle32.vv v0, (x2)
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07}; // vle32.vv v0, (x2)
//    #(clk_pd*delay_HBM); // 8 cycles delay
//    rvalid_HBM <= {(num_col){1'b1}};
//    // stream in data
//    rdata_HBM <= 512'h40000000; #clk_pd;//2
//    rdata_HBM <= 512'h40400000; #clk_pd;//3
//    rdata_HBM <= 512'h40800000; #clk_pd;//4
//    rdata_HBM <= 512'h40a00000; #clk_pd;//5
//    rdata_HBM <= 512'h40c00000; #clk_pd;//6
//    rdata_HBM <= 512'h40e00000; #clk_pd;//7
//    rdata_HBM <= 512'h41000000; #clk_pd;//8
//    rdata_HBM <= 512'h41100000; rlast_HBM <= 2'b11; #clk_pd;//9
//    rvalid_HBM <= {(num_col){1'b0}};
//    #clk_pd;
    
    $finish;
    
 end

endmodule
