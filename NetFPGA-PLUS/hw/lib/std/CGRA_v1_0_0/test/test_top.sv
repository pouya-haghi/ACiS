`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_top;
    // General I/O                                                           
    reg                      ap_clk                    ;
    reg                      ap_rst_n                    ;
    // --------- Control Plane --------- //
    // Other                          
    wire                     interrupt              ;                                      
    // AXI Lite                                         
    //inputs                                                            
    reg  [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_araddr   ;           
    reg                             s_axi_control_arvalid  ;           
    reg  [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_awaddr   ;           
    reg                             s_axi_control_awvalid  ;           
    reg                             s_axi_control_bready   ;           
    reg                             s_axi_control_rready   ;           
    reg  [C_S_AXI_DATA_WIDTH-1:0]   s_axi_control_wdata    ;           
    reg  [C_S_AXI_DATA_WIDTH/8-1:0] s_axi_control_wstrb    ;           
    reg                             s_axi_control_wvalid   ;           
    //output                                                  
    wire                          s_axi_control_arready  ;           
    wire                          s_axi_control_awready  ;           
    wire [1:0]                    s_axi_control_bresp    ;           
    wire                          s_axi_control_bvalid   ;           
    wire [C_S_AXI_DATA_WIDTH-1:0] s_axi_control_rdata    ;           
    wire                          s_axi_control_rvalid   ;           
    wire [1:0]                    s_axi_control_rresp    ;           
    wire                          s_axi_control_wready   ;           
                                                                     
    // AXI MM                                         
    //input                                                          
    reg                      m00_axi_arready        ;           
    reg  [phit_size-1:0]     m00_axi_rdata          ;           
    reg                      m00_axi_rlast          ;           
    reg                      m00_axi_rvalid         ;           
    //output                                                      
    wire [C_M_AXI_ADDR_WIDTH-1:0] m00_axi_araddr    ;           
    wire [8-1:0]             m00_axi_arlen          ;           
    wire                     m00_axi_arvalid        ;           
    wire                     m00_axi_rready         ;           
                                                                
    // --------- Data Path --------- //
    // Stream                                                   
    // in                                                    
    wire [phit_size-1:0]     axis00_tdata           ;           
    wire                     axis00_tvalid          ;           
    wire                     axis00_tready          ;           
    wire                     axis00_tlast           ;           
    wire [phit_size/8-1:0]   axis00_tkeep           ;           
    // out
    wire [phit_size-1:0]     axis01_tdata           ;           
    wire                     axis01_tvalid          ;           
    wire                     axis01_tready          ;           
    wire                     axis01_tlast           ;           
    wire [phit_size/8-1:0]   axis01_tkeep           ;           
                                                                       
    // AXI Col 1                                                           
    //input                                                            
    wire                     m01_axi_arready        ;
    wire                     m01_axi_awready        ;
    wire                     m01_axi_bvalid         ;
    wire [phit_size-1:0]     m01_axi_rdata          ;
    wire                     m01_axi_rlast          ;
    wire                     m01_axi_rvalid         ;
    wire                     m01_axi_wready         ;
    //output                               
    wire [dwidth_aximm-1:0]  m01_axi_araddr         ;
    wire [7:0]               m01_axi_arlen          ;
    wire                     m01_axi_arvalid        ;
    wire [dwidth_aximm-1:0]  m01_axi_awaddr         ;
    wire [7:0]               m01_axi_awlen          ;
    wire                     m01_axi_awvalid        ;
    wire                     m01_axi_bready         ;
    wire                     m01_axi_rready         ;
    wire                     m01_axi_wvalid         ;
    wire [phit_size-1:0]     m01_axi_wdata          ;
    wire                     m01_axi_wlast          ;
    wire [(phit_size/8)-1:0] m01_axi_wstrb          ;
                                         
    // AXI Col 2                             
    //input                              
    wire                     m02_axi_arready        ;
    wire                     m02_axi_awready        ;
    wire                     m02_axi_bvalid         ;
    wire [phit_size-1:0]     m02_axi_rdata          ;
    wire                     m02_axi_rlast          ;
    wire                     m02_axi_rvalid         ;
    wire                     m02_axi_wready         ;
    //output                              
    wire [dwidth_aximm-1:0]  m02_axi_araddr         ;
    wire [7:0]               m02_axi_arlen          ;
    wire                     m02_axi_arvalid        ;
    wire [dwidth_aximm-1:0]  m02_axi_awaddr         ;
    wire [7:0]               m02_axi_awlen          ;
    wire                     m02_axi_awvalid        ;
    wire                     m02_axi_bready         ;
    wire                     m02_axi_rready         ;
    wire                     m02_axi_wvalid         ;
    wire [phit_size-1:0]     m02_axi_wdata          ;
    wire                     m02_axi_wlast          ;
    wire [(phit_size/8)-1:0] m02_axi_wstrb          ;
    
    top top_inst0(.*);    
    
    emulate_HBM emulate_HBM_inst0(
        .ap_clk     (ap_clk         ),
        .ap_rst_n   (ap_rst_n       ),
        .axi_arready(m01_axi_arready), 
        .axi_awready(m01_axi_awready), 
        .axi_bvalid (m01_axi_bvalid ), 
        .axi_rdata  (m01_axi_rdata  ), 
        .axi_rlast  (m01_axi_rlast  ), 
        .axi_rvalid (m01_axi_rvalid ), 
        .axi_wready (m01_axi_wready ), 
        .axi_araddr (m01_axi_araddr ), 
        .axi_arlen  (m01_axi_arlen  ), 
        .axi_arvalid(m01_axi_arvalid), 
        .axi_awaddr (m01_axi_awaddr ), 
        .axi_awlen  (m01_axi_awlen  ), 
        .axi_awvalid(m01_axi_awvalid), 
        .axi_bready (m01_axi_bready ), 
        .axi_rready (m01_axi_rready ), 
        .axi_wvalid (m01_axi_wvalid ), 
        .axi_wdata  (m01_axi_wdata  ), 
        .axi_wlast  (m01_axi_wlast  ), 
        .axi_wstrb  (m01_axi_wstrb  ) 
    );
    
    emulate_HBM emulate_HBM_inst1(
        .ap_clk     (ap_clk         ),
        .ap_rst_n   (ap_rst_n       ),
        .axi_arready(m02_axi_arready), 
        .axi_awready(m02_axi_awready), 
        .axi_bvalid (m02_axi_bvalid ), 
        .axi_rdata  (m02_axi_rdata  ), 
        .axi_rlast  (m02_axi_rlast  ), 
        .axi_rvalid (m02_axi_rvalid ), 
        .axi_wready (m02_axi_wready ), 
        .axi_araddr (m02_axi_araddr ), 
        .axi_arlen  (m02_axi_arlen  ), 
        .axi_arvalid(m02_axi_arvalid), 
        .axi_awaddr (m02_axi_awaddr ), 
        .axi_awlen  (m02_axi_awlen  ), 
        .axi_awvalid(m02_axi_awvalid), 
        .axi_bready (m02_axi_bready ), 
        .axi_rready (m02_axi_rready ), 
        .axi_wvalid (m02_axi_wvalid ), 
        .axi_wdata  (m02_axi_wdata  ), 
        .axi_wlast  (m02_axi_wlast  ), 
        .axi_wstrb  (m02_axi_wstrb  ) 
    );
    
    emulate_stream_in emulate_stream_in_inst(.*);
    
    always begin
        #(clk_pd/2);
        ap_clk = !ap_clk;      
    end
    
    // Load instructions
    logic [phit_size-1:0] instructions[0:depth_config-1];
    logic [dwidth_int-1:0] mem[0:num_col-1][0:(depth_config)-1];
    
    genvar c;
    generate
    for (c=0;c<num_col;c++) begin
        logic [dwidth_int-1:0] read_inst[0:depth_config-1];
        string s, path;
        initial begin
            s.itoa(c);
            path = {"../../../../instructions/gcn_",s,".bin"};
            $readmemb(path,read_inst);
            #1;
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
        
        // Reset
        ap_clk                       = 1'b1;
        ap_rst_n                     = 1'b0; 
        
        s_axi_control_araddr    <= 5'b0;
        s_axi_control_arvalid   <= 1'b0;
        s_axi_control_awaddr    <= 5'b0;
        s_axi_control_awvalid   <= 1'b0;
        s_axi_control_bready    <= 1'b0;
        s_axi_control_rready    <= 1'b0;
        s_axi_control_wdata     <= 32'b0;
        s_axi_control_wstrb     <= 4'b0;
        s_axi_control_wvalid    <= 1'b0;
        m00_axi_arready         <= 1'b0;
        m00_axi_rdata           <= 512'b0;
        m00_axi_rlast           <= 1'b0;
        m00_axi_rvalid          <= 1'b0;
//        axis00_tdata            <= 512'b0;
//        axis00_tvalid           <= 1'b0;
//        axis01_tready           <= 1'b0;
//        axis00_tlast            <= 1'b0;
//        axis00_tkeep            <= 64'b0;
//        m01_axi_arready         <= 1'b0;
//        m01_axi_awready         <= 1'b0;
//        m01_axi_bvalid          <= 1'b0;
//        m01_axi_rdata           <= 512'b0;
//        m01_axi_rlast           <= 1'b0;
//        m01_axi_rvalid          <= 1'b0;
//        m01_axi_wready          <= 1'b0;
//        m02_axi_arready         <= 1'b0;
//        m02_axi_awready         <= 1'b0;
//        m02_axi_bvalid          <= 1'b0;
//        m02_axi_rdata           <= 512'b0;
//        m02_axi_rlast           <= 1'b0;
//        m02_axi_rvalid          <= 1'b0;
//        m02_axi_wready          <= 1'b0;
                
        
        #(depth_config*clk_pd); ap_rst_n = 1'b1;
        
        // trigger ap_start
        s_axi_control_awaddr <= 5'b0;
        s_axi_control_awvalid <= 1'b1;
        #80;
        s_axi_control_awvalid <= 1'b0;
        s_axi_control_wstrb[0] <= 1'b1;
        s_axi_control_wdata[0] <= 1'b1;
        s_axi_control_wvalid <= 1'b1;
        #40;
        // de-assert signals to release ctrl_start
        s_axi_control_wstrb[0] <= 1'b0;
        s_axi_control_wdata[0] <= 1'b0;
        s_axi_control_wvalid <= 1'b0;
        
        #60; //ctrl start goes high and sample offset and size, arready is high, HBM latency
        
        // Start instructions write
        m00_axi_rvalid <= 1'b1; 
        
        //start instructions
        for (k=0; k<depth_config; k++) begin
            m00_axi_rdata <= instructions[k];
            $display("Instruction %d: %b",k,m00_axi_rdata);
            if (k==(depth_config-1))
                m00_axi_rlast <= 1'b1;
            #clk_pd;
            m00_axi_rlast <= 1'b0;
        end
        // stop loading
        m00_axi_rvalid <= 1'b0;
        #clk_pd;
        
//////////////// Start hard coded TB /////////////////////
//        //      Scalar            // column 2                                       // column 1
//        m00_axi_rdata <= {448'b0, 20'h12345, 5'h1, 7'h37                          , 20'h12345, 5'h1, 7'h37                            }; #clk_pd; //lui
//        m00_axi_rdata <= {448'b0, 12'h678, 5'h1, 3'b000, 5'h1, 7'h13              , 12'h678, 5'h1, 3'b000, 5'h1, 7'h13                }; #clk_pd; //addi, out=12345567
//        m00_axi_rdata <= {448'b0, 7'h0, 5'h1, 5'h1, 3'b000, 5'h2, 7'h33           , 7'h0, 5'h1, 5'h1, 3'b000, 5'h2, 7'h33             }; #clk_pd; //add, out=2468ACF0
//        //      Vector 
//        m00_axi_rdata <= {448'b0, 2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57      , 2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57        }; #clk_pd; //vsetivli
//        m00_axi_rdata <= {448'b0, 12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07             , 12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07               }; #clk_pd; // vle32.vv
//        m00_axi_rdata <= {448'b0, 6'b101100, 1'b0, 5'd1, 5'h1 , 3'b0, 5'd1, 7'h57 , 6'b101100, 1'b0, 5'd1, 5'h1 , 3'b0, 5'd1, 7'h57   }; #clk_pd; // vfmacc.xv
//        m00_axi_rdata <= {448'b0, 12'b0, 5'b00010 , 3'b0, 5'd1, 7'h27             , 12'b0, 5'b00010 , 3'b0, 5'd1, 7'h27               }; #clk_pd; // vse32.vv
        
//        m00_axi_rdata <= {448'b0, 32'b0001000_00101_00000_000_00000_1110011       , 32'b0001000_00101_00000_000_00000_1110011         }; #clk_pd; //wfi
//        m00_axi_rlast <= 1'b1;
//        m00_axi_rdata <= {448'b0, 32'b0001000_00101_00000_000_00000_1110011       , 32'b0001000_00101_00000_000_00000_1110011         }; #clk_pd; //wfi
        
//        // stop loading
//        m00_axi_rlast <= 1'b0;
//        m00_axi_rvalid <= 1'b0;
//        #clk_pd;
        
//        // wait for scalar instr
//        #(clk_pd*4); 
        
//        // HBM response time
//        #(clk_pd*delay_HBM);        
        
//        // HBM read for vle
//        m01_axi_arready <= 1'b1;         m02_axi_arready <= 1'b1;                             
//        #clk_pd;                                                                          
//        m01_axi_arready <= 1'b0;         m02_axi_arready <= 1'b0;                             
                                                                                          
//        m01_axi_rvalid <= 1'b1;          m02_axi_rvalid <= 1'b1;                              
                                                                                          
//        m01_axi_rdata <= 512'h40000000;  m02_axi_rdata <= 512'h40000000;  #clk_pd;//2         
//        m01_axi_rdata <= 512'h40400000;  m02_axi_rdata <= 512'h40400000;  #clk_pd;//3         
//        m01_axi_rdata <= 512'h40800000;  m02_axi_rdata <= 512'h40800000;  #clk_pd;//4         
//        m01_axi_rdata <= 512'h40a00000;  m02_axi_rdata <= 512'h40a00000;  #clk_pd;//5         
//        m01_axi_rdata <= 512'h40c00000;  m02_axi_rdata <= 512'h40c00000;  #clk_pd;//6         
//        m01_axi_rdata <= 512'h40e00000;  m02_axi_rdata <= 512'h40e00000;  #clk_pd;//7         
//        m01_axi_rdata <= 512'h41000000;  m02_axi_rdata <= 512'h41000000;  #clk_pd;//8         
//        m01_axi_rlast <= 1'b1;           m02_axi_rlast <= 1'b1;                               
//        m01_axi_rdata <= 512'h41100000;  m02_axi_rdata <= 512'h41100000;  #clk_pd;//9         
                                                                                          
//        m01_axi_rvalid <= 1'b0;          m02_axi_rvalid <= 1'b0;                              
//        m01_axi_rlast <= 1'b0;           m02_axi_rlast <= 1'b0;                               
       
//        // Wait a little
//        #(clk_pd*2);
        
//        // Stream in for vmacc
//        axis00_tvalid <= 1'h1;
//        axis00_tkeep <= 64'hFFFFFFFFFFFFFFFF;
        
//        axis00_tdata <= 512'h40000000; #clk_pd;//2 
//        axis00_tdata <= 512'h40400000; #clk_pd;//3 
//        axis00_tdata <= 512'h40800000; #clk_pd;//4 
//        axis00_tdata <= 512'h40a00000; #clk_pd;//5 
//        axis00_tdata <= 512'h40c00000; #clk_pd;//6 
//        axis00_tdata <= 512'h40e00000; #clk_pd;//7 
//        axis00_tdata <= 512'h41000000; #clk_pd;//8 
//        axis00_tlast <= 1'b1;
//        axis00_tdata <= 512'h41100000; #clk_pd;//9 
         
//        axis00_tvalid <= 1'h0;
//        axis00_tlast <= 1'b0;
//        axis00_tkeep <= 64'b0;

//        // Wait to process
//        #(clk_pd*latencyPEC+2);
        
//        // HBM response time
//        #(clk_pd*delay_HBM);
        
//        // Write out vse
//        m01_axi_awready <= 1'b1;   m02_axi_awready <= 1'b1;
//        m01_axi_wready <= 1'b1;    m02_axi_wready <= 1'b1; 
//        m01_axi_bvalid <= 1'b1;    m02_axi_bvalid <= 1'b1; 
//        #(clk_pd*8);
//        m01_axi_awready <= 1'b0;   m02_axi_awready <= 1'b0;
//        m01_axi_wready <= 1'b0;    m02_axi_wready <= 1'b0; 
//        m01_axi_bvalid <= 1'b0;    m02_axi_bvalid <= 1'b0; 
//////////////// End hard coded TB /////////////////////
        
        
        
        #(clk_pd*(128+5)*32*16);
    $finish;
    end

endmodule
