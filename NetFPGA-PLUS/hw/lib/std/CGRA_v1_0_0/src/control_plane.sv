`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module control_plane(
    // Common
    input logic ap_clk,
    input logic ap_rst_n,
    input logic ap_done_i,
    
    // Control (AXILite)
    input  logic [C_S_AXI_ADDR_WIDTH-1:0]   AWADDR    ,
    input  logic                            AWVALID   ,
    input  logic [C_S_AXI_DATA_WIDTH-1:0]   WDATA     ,
    input  logic [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB     ,
    input  logic                            WVALID    ,
    input  logic                            BREADY    ,
    input  logic [C_S_AXI_ADDR_WIDTH -1:0]  ARADDR    ,
    input  logic                            ARVALID   ,
    input  logic                            RREADY    ,
    output logic                            AWREADY   ,
    output logic                            WREADY    ,
    output logic [1:0]                      BRESP     ,
    output logic                            BVALID    ,
    output logic                            ARREADY   ,
    output logic [C_S_AXI_DATA_WIDTH-1:0]   RDATA     ,
    output logic [1:0]                      RRESP     ,
    output logic                            RVALID    ,
    output logic                            interrupt ,
    
    // runtimeLoadTable
//    input  logic [dwidth_HBMadd-1:0]        ctrl_addr_offset         ,
//    input  logic [63:0]                     ctrl_xfer_size_in_bytes  ,
    input  logic                            m_axi_arready            ,
    input  logic                            m_axi_rvalid             ,
    input  logic [phit_size-1:0]            m_axi_rdata              ,
    input  logic                            m_axi_rlast              ,
    input  logic [num_col-1:0]              clken_PC                 ,
    input  logic [num_col-1:0]              load_PC                  ,
    input  logic [num_col-1:0]              incr_PC                  ,
    input  logic [num_col*12-1:0]           load_value_PC            ,
    output logic                            m_axi_arvalid            ,
    output logic [dwidth_HBMadd-1:0]        m_axi_araddr             ,
    output logic [8-1:0]                    m_axi_arlen              ,
    output logic                            m_axi_rready             ,
    output logic [dwidth_int-1:0]           cycle_register           ,
    output logic [(num_col*dwidth_int)-1:0] instr                    ,
    output logic                            done_loader

    );

logic areset;
logic ap_done, ap_done_r;
logic ap_ready;
logic ap_idle, ap_idle_r;
logic ap_start, ap_start_r, ap_start_pulse;
logic [63:0] axi00_ptr0;
logic [63:0] xfer_size_bytes = total_instr;








rtl_kernel_wizard_0_control_s_axi control_s_axi_inst0 (
    .ACLK      (ap_clk), //input
    .ARESET    (areset), //input
    .ACLK_EN   (1'b1  ), //input
    .AWADDR    (AWADDR  ), //input*
    .AWVALID   (AWVALID ), //input
    .WDATA     (WDATA   ), //input*
    .WSTRB     (WSTRB   ), //input*
    .WVALID    (WVALID  ), //input
    .BREADY    (BREADY  ), //input
    .ARADDR    (ARADDR  ), //input*
    .ARVALID   (ARVALID), //input
    .RREADY    (RREADY), //input
    .ap_done   (ap_done), //input
    .ap_ready  (ap_ready), //input
    .ap_idle   (ap_idle), //input
    .AWREADY   (AWREADY), //output
    .WREADY    (WREADY), //output
    .BRESP     (BRESP ), //output*
    .BVALID    (BVALID), //output
    .ARREADY   (ARREADY), //output
    .RDATA     (RDATA ), //output*
    .RRESP     (RRESP ), //output*
    .RVALID    (RVALID), //output
    .interrupt (interrupt), //output
    .axi00_ptr0(axi00_ptr0), //output*
    .ap_start  (ap_start));//output
    
rtl_kernel_wizard_0_runtimeLoadTable runtimeLoadTable_inst0(
    .aclk                   (ap_clk), //input
    .areset                 (areset), //input
    .ctrl_start             (ap_start), //input
    .ctrl_addr_offset       (axi00_ptr0), //input*
    .ctrl_xfer_size_in_bytes(xfer_size_bytes), //input*
    .m_axi_arready          (m_axi_arready), //input
    .m_axi_rvalid           (m_axi_rvalid), //input
    .m_axi_rdata            (m_axi_rdata), //input*
    .m_axi_rlast            (m_axi_rlast), //input
    .clken_PC               (clken_PC), //input
    .load_PC                (load_PC), //input
    .incr_PC                (incr_PC), //input
    .load_value_PC          (load_value_PC), //input*
    .ctrl_done              (done_loader), //output
    .m_axi_arvalid          (m_axi_arvalid), //output
    .m_axi_araddr           (m_axi_araddr), //output*
    .m_axi_arlen            (m_axi_arlen), //output*
    .m_axi_rready           (m_axi_rready), //output
    .cycle_register         (cycle_register), //output
    .instr                  (instr));//output
  
  
  
always @(posedge ap_clk) begin
  areset <= ~ap_rst_n;
end

always @(posedge ap_clk) begin
  begin
    ap_start_r <= ap_start;
  end
end
assign ap_start_pulse = ap_start & ~ap_start_r;
// ap_idle is asserted when done is asserted, it is de-asserted when ap_start_pulse
// is asserted
always @(posedge ap_clk) begin
  if (areset) begin
    ap_idle_r <= 1'b1;
  end
  else begin
    ap_idle_r <= ap_done ? 1'b1 :
      ap_start_pulse ? 1'b0 : ap_idle;
  end
end
assign ap_idle = ap_idle_r;
// Done logic
always @(posedge ap_clk) begin
  if (areset) begin
    ap_done_r <= '0;
  end
  else begin
    ap_done_r <= (ap_done) ? 1'b0 : ap_done_r | ap_done_i; //ap_done_i is never driven
  end
end
assign ap_done = ap_done_r;
// Ready Logic (non-pipelined case)
assign ap_ready = done_loader;
  
endmodule