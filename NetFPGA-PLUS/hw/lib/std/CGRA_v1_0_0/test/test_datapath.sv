`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_datapath;
    
    //////// DATAPATH ////////
    reg clk;
    reg rst;
    reg done_loader;
    reg [(dwidth_inst*num_col)-1:0] instr;
    wire [num_col-1:0] clken_PC;
    wire [num_col-1:0] load_PC;
    wire [num_col-1:0] incr_PC;
    wire [(num_col*12)-1:0] load_value_PC;
    reg [dwidth_int-1:0] cycle_register;
    // stream
    reg [phit_size-1:0] tdata_stream_in;
    reg [SIMD_degree-1:0] tvalid_stream_in;
    wire [SIMD_degree-1:0] tready_stream_in;
    wire [phit_size-1:0] tdata_stream_out;
    wire [SIMD_degree-1:0] tvalid_stream_out;
    reg [SIMD_degree-1:0] tready_stream_out;
    // AXI read
    wire [(dwidth_aximm*num_col)-1:0] araddr_HBM;
    reg [num_col-1:0] arready_HBM;
    reg [num_col-1:0] rvalid_HBM;
    reg [(phit_size*num_col)-1:0] rdata_HBM;
    wire [num_col-1:0] rready_HBM;
    wire [num_col-1:0] arvalid_HBM;
    wire [(8*num_col)-1:0] arlen_HBM;
    reg [num_col-1:0] rlast_HBM;
//    wire [(num_col*2)-1:0] rresp_HBM;
//    wire [(num_col*6)-1:0] bid_HBM;
//    wire [(num_col*2)-1:0] bresp_HBM;
    // AXI write
    wire [num_col-1:0] wvalid_HBM;
    reg [num_col-1:0] wready_HBM;
    wire [num_col-1:0] awvalid_HBM;
    wire [(num_col*8)-1:0] awlen_HBM;
    wire [(num_col*phit_size)-1:0] wdata_HBM;
    wire [(num_col*(phit_size/8))-1:0] wstrb_HBM;
    wire [num_col-1:0] wlast_HBM;
    reg [num_col-1:0] bvalid_HBM;
    wire [num_col-1:0] bready_HBM;
    wire [(dwidth_aximm*num_col)-1:0] awaddr_HBM;
    reg [num_col-1:0] awready_HBM;
//    reg [31 : 0] AXI_00_WDATA_PARITY = 32'b0;
//    reg [31 : 0] AXI_01_WDATA_PARITY = 32'b0;
//    wire [31 : 0] AXI_00_RDATA_PARITY;
//    wire [31 : 0] AXI_01_RDATA_PARITY;
    
    data_path data_path_inst1 (.*);
    
    //////// HBM ////////
//    reg apb_clk;
//    wire apb_complete_0;
//    wire DRAM_0_STAT_CATTRIP;
//    wire [6 : 0] DRAM_0_STAT_TEMP;
//    localparam apb_clk_period = 10;
    
//    hbm_0 hbm_0_inst_0 (
//        .HBM_REF_CLK_0(clk),                        // input wire HBM_REF_CLK_0
//        .AXI_00_ACLK(clk),                          // input wire AXI_00_ACLK
//        .AXI_00_ARESET_N(rst),                      // input wire AXI_00_ARESET_N
//        .AXI_00_ARADDR(araddr_HBM[dwidth_inst-1:0]),// input wire [32 : 0] AXI_00_ARADDR
//        .AXI_00_ARBURST(2'b01),                     // input wire [1 : 0] AXI_00_ARBURST (incr burst mode)
//        .AXI_00_ARID(6'b0),                         // input wire [5 : 0] AXI_00_ARID
//        .AXI_00_ARLEN(arlen_HBM[7:0]),              // input wire [3 : 0] AXI_00_ARLEN
//        .AXI_00_ARSIZE(3'b110),                     // input wire [2 : 0] AXI_00_ARSIZE (corresponds to 64 bytes in AXI documentation)
//        .AXI_00_ARVALID(arvalid_HBM[0]),            // input wire AXI_00_ARVALID
//        .AXI_00_AWADDR(awaddr_HBM[dwidth_aximm-1:0]),// input wire [32 : 0] AXI_00_AWADDR
//        .AXI_00_AWBURST(2'b01),                     // input wire [1 : 0] AXI_00_AWBURST (incr burst mode)
//        .AXI_00_AWID(6'b0),                         // input wire [5 : 0] AXI_00_AWID
//        .AXI_00_AWLEN(awlen_HBM[7:0]),              // input wire [3 : 0] AXI_00_AWLEN
//        .AXI_00_AWSIZE(3'b110),                     // input wire [2 : 0] AXI_00_AWSIZE (corresponds to 64 bytes in AXI documentation)
//        .AXI_00_AWVALID(wvalid_HBM[0]),             // input wire AXI_00_AWVALID
//        .AXI_00_RREADY(rready_HBM[0]),              // input wire AXI_00_RREADY
//        .AXI_00_BREADY(bready_HBM[0]),              // input wire AXI_00_BREADY
//        .AXI_00_WDATA(wdata_HBM[phit_size-1:0]),    // input wire [255 : 0] AXI_00_WDATA
//        .AXI_00_WLAST(wlast_HBM[0]),                // input wire AXI_00_WLAST
//        .AXI_00_WSTRB(wstrb_HBM[0]),                // input wire [31 : 0] AXI_00_WSTRB
//        .AXI_00_WDATA_PARITY(AXI_00_WDATA_PARITY),  // input wire [31 : 0] AXI_00_WDATA_PARITY COME BACK TO LATER
//        .AXI_00_WVALID(wvalid_HBM[0]),              // input wire AXI_00_WVALID
//        .AXI_01_ACLK(clk),                          // input wire AXI_01_ACLK
//        .AXI_01_ARESET_N(rst),                      // input wire AXI_01_ARESET_N
//        .AXI_01_ARADDR(araddr_HBM[(dwidth_inst*2)-1:dwidth_inst]),// input wire [32 : 0] AXI_01_ARADDR
//        .AXI_01_ARBURST(2'b01),                     // input wire [1 : 0] AXI_01_ARBURST (incr burst mode)
//        .AXI_01_ARID(6'b0),                         // input wire [5 : 0] AXI_01_ARID
//        .AXI_01_ARLEN(arlen_HBM[15:8]),             // input wire [3 : 0] AXI_01_ARLEN
//        .AXI_01_ARSIZE(3'b110),                     // input wire [2 : 0] AXI_01_ARSIZE (corresponds to 64 bytes in AXI documentation)
//        .AXI_01_ARVALID(arvalid_HBM[1]),            // input wire AXI_01_ARVALID
//        .AXI_01_AWADDR(awaddr_HBM[(dwidth_aximm*2)-1:dwidth_aximm]),// input wire [32 : 0] AXI_01_AWADDR
//        .AXI_01_AWBURST(2'b01),                     // input wire [1 : 0] AXI_01_AWBURST (incr burst mode)
//        .AXI_01_AWID(6'b0),                         // input wire [5 : 0] AXI_01_AWID
//        .AXI_01_AWLEN(awlen_HBM[15:8]),             // input wire [3 : 0] AXI_01_AWLEN
//        .AXI_01_AWSIZE(3'b110),                     // input wire [2 : 0] AXI_01_AWSIZE (corresponds to 64 bytes in AXI documentation)
//        .AXI_01_AWVALID(wvalid_HBM[1]),             // input wire AXI_01_AWVALID
//        .AXI_01_RREADY(rready_HBM[1]),              // input wire AXI_01_RREADY
//        .AXI_01_BREADY(bready_HBM[1]),              // input wire AXI_01_BREADY
//        .AXI_01_WDATA(wdata_HBM[(phit_size*2)-1:phit_size]),// input wire [255 : 0] AXI_01_WDATA
//        .AXI_01_WLAST(wlast_HBM[1]),                // input wire AXI_01_WLAST
//        .AXI_01_WSTRB(wstrb_HBM[(phit_size/8)-1:0]),// input wire [31 : 0] AXI_01_WSTRB
//        .AXI_01_WDATA_PARITY(AXI_01_WDATA_PARITY),  // input wire [31 : 0] AXI_01_WDATA_PARITY
//        .AXI_01_WVALID(wvalid_HBM[1]),              // input wire AXI_01_WVALID
//        .APB_0_PCLK(apb_clk),                       // input wire APB_0_PCLK
//        .APB_0_PRESET_N(rst),                       // input wire APB_0_PRESET_N
//        .AXI_00_ARREADY(arready_HBM[0]),            // output wire AXI_00_ARREADY
//        .AXI_00_AWREADY(awready_HBM[0]),            // output wire AXI_00_AWREADY
//        .AXI_00_RDATA_PARITY(AXI_00_RDATA_PARITY),  // output wire [31 : 0] AXI_00_RDATA_PARITY
//        .AXI_00_RDATA(rdata_HBM[phit_size-1:0]),    // output wire [255 : 0] AXI_00_RDATA
//        .AXI_00_RID(6'b0),                          // output wire [5 : 0] AXI_00_RID
//        .AXI_00_RLAST(rlast_HBM[0]),                // output wire AXI_00_RLAST
//        .AXI_00_RRESP(rresp_HBM[1:0]),              // output wire [1 : 0] AXI_00_RRESP
//        .AXI_00_RVALID(rvalid_HBM[0]),              // output wire AXI_00_RVALID
//        .AXI_00_WREADY(wready_HBM[0]),              // output wire AXI_00_WREADY
//        .AXI_00_BID(bid_HBM[5:0]),                  // output wire [5 : 0] AXI_00_BID
//        .AXI_00_BRESP(rresp_HBM[1:0]),              // output wire [1 : 0] AXI_00_BRESP
//        .AXI_00_BVALID(bvalid_HBM[0]),              // output wire AXI_00_BVALID
//        .AXI_01_ARREADY(arready_HBM[1]),            // output wire AXI_01_ARREADY
//        .AXI_01_AWREADY(awready_HBM[1]),            // output wire AXI_01_AWREADY
//        .AXI_01_RDATA_PARITY(AXI_01_RDATA_PARITY),  // output wire [31 : 0] AXI_01_RDATA_PARITY
//        .AXI_01_RDATA(rdata_HBM[(phit_size*2)-1:phit_size]),// output wire [255 : 0] AXI_01_RDATA
//        .AXI_01_RID(6'b0),                          // output wire [5 : 0] AXI_01_RID
//        .AXI_01_RLAST(rlast_HBM[1]),                // output wire AXI_01_RLAST
//        .AXI_01_RRESP(rresp_HBM[3:2]),              // output wire [1 : 0] AXI_01_RRESP
//        .AXI_01_RVALID(rvalid_HBM[1]),              // output wire AXI_01_RVALID
//        .AXI_01_WREADY(wready_HBM[1]),              // output wire AXI_01_WREADY
//        .AXI_01_BID(bid_HBM[11:6]),                 // output wire [5 : 0] AXI_01_BID
//        .AXI_01_BRESP(rresp_HBM[3:2]),              // output wire [1 : 0] AXI_01_BRESP
//        .AXI_01_BVALID(bvalid_HBM[1]),              // output wire AXI_01_BVALID
//        .apb_complete_0(apb_complete_0),            // output wire apb_complete_0
//        .DRAM_0_STAT_CATTRIP(DRAM_0_STAT_CATTRIP),  // output wire DRAM_0_STAT_CATTRIP
//        .DRAM_0_STAT_TEMP(DRAM_0_STAT_TEMP)         // output wire [6 : 0] DRAM_0_STAT_TEMP
//        );
    
//    always begin
//        apb_clk = 1;
//        #(apb_clk_period/2);
//        apb_clk = 0;
//        #(apb_clk_period/2);
//    end
    
    always begin
        clk = 1;
        #(clk_pd/2);
        clk = 0;
        #(clk_pd/2);
    end
    
 initial begin
//    inbound = 0; //dont care
    done_loader = 1;
    cycle_register <= 32'b0;
    instr <= 0;
    rst = 0;
    
    tdata_stream_in <= 512'h0;
    tvalid_stream_in <= {(SIMD_degree){1'b0}};
    tready_stream_out <= {(SIMD_degree){1'b0}};
    
    arready_HBM <= {(num_col){1'b0}};
    rvalid_HBM <= {(num_col){1'b0}};
    rdata_HBM <= 512'd0;
    rlast_HBM <= {(num_col){1'b0}};  
    
    wready_HBM <= {(num_col){1'b0}};
    bvalid_HBM <= {(num_col){1'b0}};
    awready_HBM <= {(num_col){1'b0}}; 
    
    // Reset
    #(4*clk_pd);
    rst = 1;
    #(8*clk_pd);
    rst = 0;
//    #(clk_pd*2);
    
    //////////////////////// Vector Instructions ////////////////////////
    
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
//    rdata_HBM <= 512'h41100000; #clk_pd;//9
//    rvalid_HBM <= {(num_col){1'b0}};
    
//    // vle32                                     0       rs1      0    rd   inst
//    instr[dwidth_inst-1:0] <=               {12'b0, 5'b00010 , 3'b0, 5'h3, 7'h07}; // vle32.vv v0, (x2)
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'b0, 5'b00010 , 3'b0, 5'h3, 7'h07}; // vle32.vv v0, (x2)
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
//    rdata_HBM <= 512'h41100000; #clk_pd;//9
//    rvalid_HBM <= {(num_col){1'b0}};
    
//    //vmacc                                       func     0   vs2   vs1    000    vd   inst
//    instr[dwidth_inst-1:0] <=               {6'b101100, 1'b0, 5'd1, 5'h1 , 3'b0, 5'd3, 7'h57}; // vse32.vv v0, (x2)
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {6'b101100, 1'b0, 5'd1, 5'h1 , 3'b0, 5'd3, 7'h57}; // vse32.vv v0, (x2)
//    //Stream in
//    tvalid_stream_in <= 16'hffff;
//    tdata_stream_in <= 512'h40000000; #clk_pd;//2 
//    tdata_stream_in <= 512'h40400000; #clk_pd;//3 
//    tdata_stream_in <= 512'h40800000; #clk_pd;//4 
//    tdata_stream_in <= 512'h40a00000; #clk_pd;//5 
//    tdata_stream_in <= 512'h40c00000; #clk_pd;//6 
//    tdata_stream_in <= 512'h40e00000; #clk_pd;//7 
//    tdata_stream_in <= 512'h41000000; #clk_pd;//8 
//    tdata_stream_in <= 512'h41100000; #clk_pd;//9 
//    tvalid_stream_in <= 16'h0;
//    #(clk_pd*18);
    
//    // vse32                                     0       rs1      0    rd   inst
//    instr[dwidth_inst-1:0] <=               {12'b0, 5'b00010 , 3'b0, 5'd3, 7'h27}; // vse32.vv v0, (x2)
//    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'b0, 5'b00010 , 3'b0, 5'd3, 7'h27}; // vse32.vv v0, (x2)
//    awready_HBM <= {(num_col){1'b1}};
//    #(clk_pd*delay_HBM); // 8 cycles delay
//    wready_HBM <= {(num_col){1'b1}};
//    #(clk_pd*8); // read data for 8 cycles
//    wready_HBM <= {(num_col){1'b0}};
    
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



    //////////////////////// Debug HBM Instructions ////////////////////////
    // vsetilvi
    // vlen = 8 = 12'b1000                    1,1         8       0     7     0     inst
    instr[dwidth_inst-1:0] <=               {2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048 
    instr[(2*dwidth_inst)-1:dwidth_inst] <= {2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048
    #clk_pd;
    // vle32                                     0       rs1      0    rd   inst
    instr[dwidth_inst-1:0] <=               {12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07}; // vle32.vv v0, (x2)
    instr[(2*dwidth_inst)-1:dwidth_inst] <= {12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07}; // vle32.vv v0, (x2)
    #(clk_pd*delay_HBM); // 8 cycles delay
    rvalid_HBM <= {(num_col){1'b1}};
    // stream in data
    rdata_HBM <= 512'h40000000; #clk_pd;//2
    rdata_HBM <= 512'h40400000; #clk_pd;//3
    rdata_HBM <= 512'h40800000; #clk_pd;//4
    rdata_HBM <= 512'h40a00000; #clk_pd;//5
    rdata_HBM <= 512'h40c00000; #clk_pd;//6
    rdata_HBM <= 512'h40e00000; #clk_pd;//7
    rdata_HBM <= 512'h41000000; #clk_pd;//8
    rdata_HBM <= 512'h41100000; rlast_HBM <= 2'b11; #clk_pd;//9
    rvalid_HBM <= {(num_col){1'b0}};
    #clk_pd;
    
    $finish;
    
 end

endmodule
