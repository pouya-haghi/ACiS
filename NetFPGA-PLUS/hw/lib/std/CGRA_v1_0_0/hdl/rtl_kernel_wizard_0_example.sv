// This is a generated file. Use and modify at your own risk.
//////////////////////////////////////////////////////////////////////////////// 
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
module rtl_kernel_wizard_0_example #(
  parameter integer C_M00_AXI_ADDR_WIDTH = 64 ,
  parameter integer C_M00_AXI_DATA_WIDTH = 512,
  parameter integer C_AXIS00_TDATA_WIDTH = 512,
  parameter integer C_AXIS01_TDATA_WIDTH = 512
)
(
  // System Signals
  input  wire                              ap_clk         ,
  input  wire                              ap_rst_n       ,
  // AXI4 master interface m00_axi
  output wire                              m00_axi_awvalid,
  input  wire                              m00_axi_awready,
  output wire [C_M00_AXI_ADDR_WIDTH-1:0]   m00_axi_awaddr ,
  output wire [8-1:0]                      m00_axi_awlen  ,
  output wire                              m00_axi_wvalid ,
  input  wire                              m00_axi_wready ,
  output wire [C_M00_AXI_DATA_WIDTH-1:0]   m00_axi_wdata  ,
  output wire [C_M00_AXI_DATA_WIDTH/8-1:0] m00_axi_wstrb  ,
  output wire                              m00_axi_wlast  ,
  input  wire                              m00_axi_bvalid ,
  output wire                              m00_axi_bready ,
  output wire                              m00_axi_arvalid,
  input  wire                              m00_axi_arready,
  output wire [C_M00_AXI_ADDR_WIDTH-1:0]   m00_axi_araddr ,
  output wire [8-1:0]                      m00_axi_arlen  ,
  input  wire                              m00_axi_rvalid ,
  output wire                              m00_axi_rready ,
  input  wire [C_M00_AXI_DATA_WIDTH-1:0]   m00_axi_rdata  ,
  input  wire                              m00_axi_rlast  ,
  // Pipe (AXI4-Stream host) interface axis00
  output wire                              axis00_tvalid  ,
  input  wire                              axis00_tready  ,
  output wire [C_AXIS00_TDATA_WIDTH-1:0]   axis00_tdata   ,
  output wire [C_AXIS00_TDATA_WIDTH/8-1:0] axis00_tkeep   ,
  output wire                              axis00_tlast   ,
  // Pipe (AXI4-Stream host) interface axis01
  input  wire                              axis01_tvalid  ,
  output wire                              axis01_tready  ,
  input  wire [C_AXIS01_TDATA_WIDTH-1:0]   axis01_tdata   ,
  input  wire [C_AXIS01_TDATA_WIDTH/8-1:0] axis01_tkeep   ,
  input  wire                              axis01_tlast   ,
  // Control Signals
  input  wire                              ap_start       ,
  output wire                              ap_idle        ,
  output wire                              ap_done        ,
  output wire                              ap_ready       ,
  input  wire [64-1:0]                     axi00_ptr0     
);


timeunit 1ps;
timeprecision 1ps;

///////////////////////////////////////////////////////////////////////////////
// Local Parameters
///////////////////////////////////////////////////////////////////////////////
// Large enough for interesting traffic.
localparam integer  LP_DEFAULT_LENGTH_IN_BYTES = 16384;
localparam integer  LP_NUM_EXAMPLES    = 2;

///////////////////////////////////////////////////////////////////////////////
// Wires and Variables
///////////////////////////////////////////////////////////////////////////////
(* KEEP = "yes" *)
logic                                areset                         = 1'b0;
logic                                ap_start_r                     = 1'b0;
logic                                ap_idle_r                      = 1'b1;
logic                                ap_start_pulse                ;
logic [LP_NUM_EXAMPLES-1:0]          ap_done_i                     ;
logic [LP_NUM_EXAMPLES-1:0]          ap_done_r                      = {LP_NUM_EXAMPLES{1'b0}};
logic [32-1:0]                       ctrl_xfer_size_in_bytes        = LP_DEFAULT_LENGTH_IN_BYTES;
logic [32-1:0]                       ctrl_constant                  = 32'd1;

///////////////////////////////////////////////////////////////////////////////
// Begin RTL
///////////////////////////////////////////////////////////////////////////////

// Register and invert reset signal.
always @(posedge ap_clk) begin
  areset <= ~ap_rst_n;
end

// create pulse when ap_start transitions to 1
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
    ap_done_r <= (ap_done) ? '0 : ap_done_r | ap_done_i;
  end
end

assign ap_done = &ap_done_r;

// Ready Logic (non-pipelined case)
assign ap_ready = ap_done;

// Vadd example
rtl_kernel_wizard_0_example_vadd #(
  .C_M_AXI_ADDR_WIDTH ( C_M00_AXI_ADDR_WIDTH ),
  .C_M_AXI_DATA_WIDTH ( C_M00_AXI_DATA_WIDTH ),
  .C_ADDER_BIT_WIDTH  ( 32                   ),
  .C_XFER_SIZE_WIDTH  ( 32                   )
)
inst_example_vadd_m00_axi (
  .aclk                    ( ap_clk                  ),
  .areset                  ( areset                  ),
  .kernel_clk              ( ap_clk                  ),
  .kernel_rst              ( areset                  ),
  .ctrl_addr_offset        ( axi00_ptr0              ),
  .ctrl_xfer_size_in_bytes ( ctrl_xfer_size_in_bytes ),
  .ctrl_constant           ( ctrl_constant           ),
  .ap_start                ( ap_start_pulse          ),
  .ap_done                 ( ap_done_i[0]            ),
  .m_axi_awvalid           ( m00_axi_awvalid         ),
  .m_axi_awready           ( m00_axi_awready         ),
  .m_axi_awaddr            ( m00_axi_awaddr          ),
  .m_axi_awlen             ( m00_axi_awlen           ),
  .m_axi_wvalid            ( m00_axi_wvalid          ),
  .m_axi_wready            ( m00_axi_wready          ),
  .m_axi_wdata             ( m00_axi_wdata           ),
  .m_axi_wstrb             ( m00_axi_wstrb           ),
  .m_axi_wlast             ( m00_axi_wlast           ),
  .m_axi_bvalid            ( m00_axi_bvalid          ),
  .m_axi_bready            ( m00_axi_bready          ),
  .m_axi_arvalid           ( m00_axi_arvalid         ),
  .m_axi_arready           ( m00_axi_arready         ),
  .m_axi_araddr            ( m00_axi_araddr          ),
  .m_axi_arlen             ( m00_axi_arlen           ),
  .m_axi_rvalid            ( m00_axi_rvalid          ),
  .m_axi_rready            ( m00_axi_rready          ),
  .m_axi_rdata             ( m00_axi_rdata           ),
  .m_axi_rlast             ( m00_axi_rlast           )
);


// Vadd stream example
rtl_kernel_wizard_0_example_vadd_axis #(
  .C_S_AXIS_TDATA_WIDTH ( C_AXIS00_TDATA_WIDTH       ),
  .C_M_AXIS_TDATA_WIDTH ( C_AXIS00_TDATA_WIDTH       ),
  .C_ADDER_BIT_WIDTH    ( 32                         ),
  .C_NUM_CLOCKS         ( 1                          ),
  .C_GEN_S_AXIS_DATA    ( 0                          ),
  .C_LENGTH_IN_BYTES    ( LP_DEFAULT_LENGTH_IN_BYTES )
)
inst_example_vadd__axis01_to_axis00 (
  .aclk          ( ap_clk         ),
  .areset        ( areset         ),
  .kernel_clk    ( ap_clk         ),
  .kernel_rst    ( areset         ),
  .s_axis_tvalid ( axis01_tvalid  ),
  .s_axis_tready ( axis01_tready  ),
  .s_axis_tdata  ( axis01_tdata   ),
  .s_axis_tkeep  ( axis01_tkeep   ),
  .s_axis_tlast  ( axis01_tlast   ),
  .m_axis_tvalid ( axis00_tvalid  ),
  .m_axis_tready ( axis00_tready  ),
  .m_axis_tdata  ( axis00_tdata   ),
  .m_axis_tkeep  ( axis00_tkeep   ),
  .m_axis_tlast  ( axis00_tlast   ),
  .ctrl_constant ( 32'b1          ),
  .ap_start      ( ap_start_pulse ),
  .ap_idle       ( ap_idle        ),
  .ap_done       ( ap_done_i[1]   )
);

endmodule : rtl_kernel_wizard_0_example
`default_nettype wire
