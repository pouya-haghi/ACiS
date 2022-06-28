`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2022 03:34:21 PM
// Design Name: 
// Module Name: test_rtl_kernel_wizard_0_runtimeloadtable
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


module test_runtimeLoadTable(

    );
    
    localparam integer C_M_AXI_ADDR_WIDTH  = 64;
    localparam integer C_M_AXI_DATA_WIDTH  = 512;
    localparam integer C_XFER_SIZE_WIDTH   = C_M_AXI_ADDR_WIDTH;
    localparam integer C_MAX_OUTSTANDING   = 16;
    localparam integer C_INCLUDE_DATA_FIFO = 1;
    // System signals
    reg aclk;
    reg areset;
    
    // Control signals
    reg  ctrl_start;              // Pulse high for one cycle to begin reading
    wire ctrl_done;               // Pulses high for one cycle when transfer request is complete
    
    // The following ctrl signals are sampled when ctrl_start is asserted
    reg [C_M_AXI_ADDR_WIDTH-1:0] ctrl_addr_offset;        // Starting Address offset
    reg [C_XFER_SIZE_WIDTH-1:0]  ctrl_xfer_size_in_bytes; // Length in number of bytes; limited by the address width.
    
    // AXI4 master interface (read only)
    wire m_axi_arvalid;
    reg m_axi_arready;
    wire [C_M_AXI_ADDR_WIDTH-1:0] m_axi_araddr;
    wire [8-1:0] m_axi_arlen;
    
    reg m_axi_rvalid;
    wire m_axi_rready;
    reg [C_M_AXI_DATA_WIDTH-1:0] m_axi_rdata;
    reg m_axi_rlast;
    reg [num_col-1:0] clken_PC;
    reg [num_col-1:0] load_PC;
    reg [num_col-1:0] incr_PC;
    reg [(num_col*12)-1:0] load_value_PC;
    wire [(num_col*12)-1:0] PC;
    wire [dwidth_int-1:0] cycle_register;
    wire [(num_col*dwidth_int)-1:0] instr;
    
    rtl_kernel_wizard_0_runtimeLoadTable rtl_kernel_wizard_0_runtimeLoadTable_inst0(.*);
    
    always begin
        aclk = 1'b1;
        #5;
        aclk = 1'b0;
        #5;
    end
    
    initial begin
        areset = 1'b1;
        ctrl_start = 1'b0;
        ctrl_addr_offset = 64'b0;
        ctrl_xfer_size_in_bytes = 64'b0;
        m_axi_arready = 1'b0;
        m_axi_rvalid = 1'b0;
        m_axi_rdata = 512'b0;
        m_axi_rlast = 1'b0;
        clken_PC = 2'b0;
        load_PC = 2'b0;
        incr_PC = 2'b0;
        load_value_PC = 24'b0;
        
        
        // load col 1 
        #40;
        areset = 0;
        ctrl_start = 1'b1;
        ctrl_addr_offset = 64'h0;
        ctrl_xfer_size_in_bytes = 64'hff;
        #10; ctrl_start = 1'b0;
        #60;
        m_axi_rvalid = 1'b1;
        m_axi_rdata = 512'd11111111; #10;
        m_axi_rdata = 512'd22222222; #10;
        m_axi_rdata = 512'd33333333; #10;
        m_axi_rlast = 1'b1;
        m_axi_rdata = 512'd44444444; #10;
        
        m_axi_rvalid = 1'b0;
        m_axi_rlast = 1'b0;
        #40;
        
        // load col 2
        ctrl_start = 1'b1;               
        ctrl_addr_offset = 64'h8;        
        ctrl_xfer_size_in_bytes = 64'hff;
        #10; ctrl_start = 1'b0;          
        #60;                             
        m_axi_rvalid = 1'b1;             
        m_axi_rdata = 512'd55555555; #10;
        m_axi_rdata = 512'd66666666; #10;
        m_axi_rdata = 512'd77777777; #10;
        m_axi_rlast = 1'b1;            
        m_axi_rdata = 512'd88888888; #10;
                                         
        m_axi_rvalid = 1'b0;             
        m_axi_rlast = 1'b0;              
        #40;              
        
        
        // read
        
        load_PC = 2'b11; #10;
        load_PC = 2'b0; #10;
        
        incr_PC = 2'b11; #10;
        incr_PC = 2'b00; #10;
        
        incr_PC = 2'b11; #10;
        incr_PC = 2'b00; #10;
        
        incr_PC = 2'b11; #10;
        incr_PC = 2'b00; #10;
        
        incr_PC = 2'b11; #10;
        incr_PC = 2'b00; #10;
        
        
        // Notes: ctrl_start asserted, ctrl_addr and ctrl_xfer are sampled
        //        data into m_axi_rdata
        //        readind done when hbm done, ctrl done assert
        //        this becomes read only afterwards with a PC
    end
endmodule
