////------------------------------------------------------------------------------
////  (c) Copyright 2013 Xilinx, Inc. All rights reserved.
////
////  This file contains confidential and proprietary information
////  of Xilinx, Inc. and is protected under U.S. and
////  international copyright and other intellectual property
////  laws.
////
////  DISCLAIMER
////  This disclaimer is not a license and does not grant any
////  rights to the materials distributed herewith. Except as
////  otherwise provided in a valid license issued to you by
////  Xilinx, and to the maximum extent permitted by applicable
////  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
////  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
////  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
////  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
////  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
////  (2) Xilinx shall not be liable (whether in contract or tort,
////  including negligence, or under any other theory of
////  liability) for any loss or damage of any kind or nature
////  related to, arising under or in connection with these
////  materials, including for any direct, or any indirect,
////  special, incidental, or consequential loss or damage
////  (including loss of data, profits, goodwill, or any type of
////  loss or damage suffered as a result of any action brought
////  by a third party) even if such damage or loss was
////  reasonably foreseeable or Xilinx had been advised of the
////  possibility of the same.
////
////  CRITICAL APPLICATIONS
////  Xilinx products are not designed or intended to be fail-
////  safe, or for use in any application requiring fail-safe
////  performance, such as life-support or safety devices or
////  systems, Class III medical devices, nuclear facilities,
////  applications related to the deployment of airbags, or any
////  other applications that could lead to death, personal
////  injury, or severe property or environmental damage
////  (individually and collectively, "Critical
////  Applications"). Customer assumes the sole risk and
////  liability of any use of Xilinx products in Critical
////  Applications, subject only to applicable laws and
////  regulations governing limitations on product liability.
////
////  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
////  PART OF THIS FILE AT ALL TIMES.
////------------------------------------------------------------------------------

`timescale 1ps/1ps

(* DowngradeIPIdentifiedWarnings="yes" *)


module cmac_usplus_1_lbus2axis_segmented_top #(
   parameter FIFO_DEPTH = 5,
   parameter DATA_WIDTH = 512,
   parameter C_HAS_PTP = 0,
   parameter REG_E = 1
)
(
  input  wire                                   core_clk,
  input  wire                                   core_rst,

  // AXIS IF
  output  wire                                  axis_tvalid,
  output  wire [DATA_WIDTH-1:0]                 axis_tdata,
  output  wire                                  axis_tlast,
  output  wire [DATA_WIDTH/8 - 1:0]             axis_tkeep,
  output  wire                                  axis_tuser,

  input  wire [55:0]                            rx_preambleout_i,
  output wire [55:0]                            rx_preambleout_o,

  // Segment 0
  input  wire                                   lbus_ena0,
  input  wire [DATA_WIDTH/4 - 1:0]              lbus_data0,
  input  wire                                   lbus_sop0,
  input  wire                                   lbus_eop0,
  input  wire [$clog2(DATA_WIDTH/32) - 1:0]     lbus_mty0,
  input  wire                                   lbus_err0,
  // Segment 1
  input  wire                                   lbus_ena1,
  input  wire [DATA_WIDTH/4 - 1:0]              lbus_data1,
  input  wire                                   lbus_sop1,
  input  wire                                   lbus_eop1,
  input  wire [$clog2(DATA_WIDTH/32) - 1:0]     lbus_mty1,
  input  wire                                   lbus_err1,
  // Segment 2
  input  wire                                   lbus_ena2,
  input  wire [DATA_WIDTH/4 - 1:0]              lbus_data2,
  input  wire                                   lbus_sop2,
  input  wire                                   lbus_eop2,
  input  wire [$clog2(DATA_WIDTH/32) - 1:0]     lbus_mty2,
  input  wire                                   lbus_err2,
  // Segment 3
  input  wire                                   lbus_ena3,
  input  wire [DATA_WIDTH/4 - 1:0]              lbus_data3,
  input  wire                                   lbus_sop3,
  input  wire                                   lbus_eop3,
  input  wire [$clog2(DATA_WIDTH/32) - 1:0]     lbus_mty3,
  input  wire                                   lbus_err3
);

   localparam NUM_SEG = 4;
   localparam SEG_DATA_WIDTH = DATA_WIDTH/4;
   localparam SEG_MTY_WIDTH = $clog2(DATA_WIDTH/32);

   wire [3:0]                           seg_valid;
   wire [3:0]                           output_seg_valid_int;
   reg  [3:0]                           output_seg_valid;
   wire [3:0]                           empty;
    
   wire [3:0]                           lbus_ena;
   wire [DATA_WIDTH - 1:0]              lbus_data;
   wire [3:0]                           lbus_sop;
   wire [3:0]                           lbus_eop;
   wire [4*$clog2(DATA_WIDTH/32) - 1:0] lbus_mty;
   wire [3:0]                           lbus_err;

   wire [3:0]                           lbus_ena_i;
   wire [DATA_WIDTH - 1:0]              lbus_data_i;
   wire [3:0]                           lbus_sop_i;
   wire [3:0]                           lbus_eop_i;
   wire [4*$clog2(DATA_WIDTH/32) - 1:0] lbus_mty_i;
   wire [3:0]                           lbus_err_i;

   reg  [3:0]                           rd_en_int;
   wire [3:0]                           rd_en_i;
   wire [3:0]                           rd_en;
   wire                                 no_segment_has_eop;
   wire                                 some_empty_segments;
   wire                                 all_empty_segments;
   wire                                 no_segment_has_sop;
   wire                                 send_idle;
   reg                                  delay_read;

   reg  [1:0]                           rot = 2'b00;
   reg  [1:0]                           next_rot;
   wire [1:0]                           combined_rot;
   reg  [DATA_WIDTH/4 + $clog2(DATA_WIDTH/32) + 3:0] rotated_fifo_dout[3:0]; //{ena,err,eop,sop,mty,data}
   wire [DATA_WIDTH/4 + $clog2(DATA_WIDTH/32) + 3:0] din[3:0]; //{ena,err,eop,sop,mty,data}
   wire [DATA_WIDTH/4 + $clog2(DATA_WIDTH/32) + 3:0] dout[3:0]; //{ena,err,eop,sop,mty,data}
   wire [3:0]                           wr_en;
   wire [3:0]                           wr_ack;
   wire [3:0]                           wr_rst_busy=0;
   wire [3:0]                           prog_full;
   wire [3:0]                           full;
   wire [3:0]                           data_valid_i;
   wire [3:0]                           data_valid;


   //////////////////////////////////////////////////////////////////////////////////
   //////////////////  LBUS to AXI-Stream Protocol conversion   /////////////////////
   //////////////////////////////////////////////////////////////////////////////////
   cmac_usplus_1_lbus2axis_segmented_corelogic #(.DATA_WIDTH(DATA_WIDTH))
      i_cmac_usplus_1_lbus2axis_segmented_corelogic (
                        .core_clk(core_clk),
                        .core_rst(core_rst),
                        .axis_tvalid(axis_tvalid),
                        .axis_tdata(axis_tdata),
                        .axis_tlast(axis_tlast),
                        .axis_tkeep(axis_tkeep),
                        .axis_tuser(axis_tuser),
                        .rx_preambleout_i(rx_preambleout_i),
                        .rx_preambleout_o(rx_preambleout_o),
                        .lbus_ena(lbus_ena),
                        .lbus_sop(lbus_sop),
                        .lbus_eop(lbus_eop),
                        .lbus_mty(lbus_mty),
                        .lbus_data(lbus_data),
                        .lbus_err(lbus_err)
                     );

   //////////////////////////////////////////////////////////////////////////////////
   //////////////////  Calculate rotation to align next packet            ///////////
   //////////////////////////////////////////////////////////////////////////////////
   always @(posedge core_clk)
   begin //{
      if(core_rst) begin //{

            rot <= 2'b00;

      end //}
      else 
      if( all_empty_segments ) begin //{ no valid data on any segment

            rot <= 2'b00;

      end //}
      else 
      if( no_segment_has_sop & ~no_segment_has_eop & some_empty_segments) begin //{ If EOP, but no SoP

            rot <= 2'b00;

      end //}
      else 
      if( ~no_segment_has_sop ) begin //{ If SOP, accumulate rotation to push to seg 0

            rot <= rot+next_rot;

      end //}
   end //}

   //////////////////////////////////////////////////////////////////////////////////
   //////////////////  Rotation of segments  from fifo output             ///////////
   //////////////////////////////////////////////////////////////////////////////////
   always @(*)
   begin //{
         case(rot) // rotate 0<-1<-2<-3
            2'd0: begin 
               {rotated_fifo_dout[0],rotated_fifo_dout[1],rotated_fifo_dout[2],rotated_fifo_dout[3]} = 
               {             dout[0],             dout[1],             dout[2],             dout[3]}; 
            end
            2'd1: begin
               {rotated_fifo_dout[0],rotated_fifo_dout[1],rotated_fifo_dout[2],rotated_fifo_dout[3]} = 
               {             dout[1],             dout[2],             dout[3],             dout[0]};  
            end
            2'd2:  begin
               {rotated_fifo_dout[0],rotated_fifo_dout[1],rotated_fifo_dout[2],rotated_fifo_dout[3]} = 
               {             dout[2],             dout[3],             dout[0],             dout[1]}; 
            end
            2'd3:  begin
               {rotated_fifo_dout[0],rotated_fifo_dout[1],rotated_fifo_dout[2],rotated_fifo_dout[3]} = 
               {             dout[3],             dout[0],             dout[1],             dout[2]}; 
            end
            default: begin
               {rotated_fifo_dout[0],rotated_fifo_dout[1],rotated_fifo_dout[2],rotated_fifo_dout[3]} = 
               {             dout[0],             dout[1],             dout[2],             dout[3]};
            end
         endcase
   end //}

   //////////////////////////////////////////////////////////////////////////////////
   //////////////////  Generate Reads from 0th seg to seg where eop       ///////////
   //////////////////////////////////////////////////////////////////////////////////
   assign rd_en_i = onehot2thermo( lbus_eop_i & lbus_ena_i );

   always @(*)
   begin //{
         if (send_idle) 
            output_seg_valid = 4'd0;
         else if (no_segment_has_eop)
            output_seg_valid = 4'hF;
         else 
            output_seg_valid = rd_en_i;
   end //}
      
   always @(*)
   begin //{
      if( send_idle) 
         rd_en_int = 4'd0;
      else if ( no_segment_has_eop | no_segment_has_sop  )
         rd_en_int = 4'hF;
      else
         rd_en_int = circular_left_shift(rd_en_i,rot);
   end //}

   assign data_valid_i = circular_right_shift(data_valid,rot);
   //assign data_valid_i = data_valid;

   //////////////////////////////////////////////////////////////////////////////////
   //////////////////  Generate roation to push next SOP 0th seg          ///////////
   //////////////////////////////////////////////////////////////////////////////////
   always @(*)
   begin //{
      case(data_valid_i & lbus_sop_i)
         4'b0001: begin next_rot = 2'b00; end
         4'b0010: begin next_rot = 2'b01; end
         4'b0100: begin next_rot = 2'b10; end
         4'b1000: begin next_rot = 2'b11; end
         default: begin next_rot = 0; end
      endcase
   end //}


   //////////////////////////////////////////////////////////////////////////////////
   //////////////////  FIFO read enable generation                        ///////////
   //////////////////////////////////////////////////////////////////////////////////
   assign no_segment_has_sop = ~| (data_valid_i & lbus_sop_i );
   assign no_segment_has_eop = ~| (data_valid_i & lbus_eop_i );
   assign some_empty_segments =  ~&(data_valid_i & lbus_ena_i);
   assign all_empty_segments =  ~|(data_valid_i & lbus_ena_i);
   assign send_idle = all_empty_segments ? 1'b0 : (((no_segment_has_eop ) & some_empty_segments)) ; 

   
   // Flush out any null data and read valid data
   assign rd_en = rd_en_int | (~circular_left_shift(lbus_ena_i,rot) & data_valid);


   //////////////////////////////////////////////////////////////////////////////////
   //////////////////  Data Input to FIFO                                 ///////////
   //////////////////////////////////////////////////////////////////////////////////
   assign     seg_valid = {lbus_ena0,lbus_ena0,lbus_ena0,lbus_ena0};
   assign     din[0] = {lbus_ena0,lbus_err0,lbus_eop0,lbus_sop0,lbus_mty0,lbus_data0}     ;
   assign     din[1] = {lbus_ena1,lbus_err1,lbus_eop1,lbus_sop1,lbus_mty1,lbus_data1}     ;
   assign     din[2] = {lbus_ena2,lbus_err2,lbus_eop2,lbus_sop2,lbus_mty2,lbus_data2}     ;
   assign     din[3] = {lbus_ena3,lbus_err3,lbus_eop3,lbus_sop3,lbus_mty3,lbus_data3}     ;

   genvar i;
   generate //{
   for(i = 0; i < 4; i=i+1)
   begin : SEG_LOOP3//{
   //////////////////////////////////////////////////////////////////////////////////
   //////////////////  Output from rotated fifo output                    ///////////
   //////////////////////////////////////////////////////////////////////////////////
    assign    {lbus_ena_i[i],
               lbus_err_i[i],
               lbus_eop_i[i],
               lbus_sop_i[i],
               lbus_mty_i[i*SEG_MTY_WIDTH +: SEG_MTY_WIDTH],
               lbus_data_i[i*SEG_DATA_WIDTH +: SEG_DATA_WIDTH]
              } =  rotated_fifo_dout[i];

    assign    lbus_ena[i]                                      = lbus_ena_i[i] & output_seg_valid[i];
    assign    lbus_err[i]                                      = lbus_err_i[i];
    assign    lbus_eop[i]                                      = lbus_eop_i[i];                    
    assign    lbus_sop[i]                                      = lbus_sop_i[i];
    assign    lbus_mty[i*SEG_MTY_WIDTH +: SEG_MTY_WIDTH]       = lbus_mty_i[i*SEG_MTY_WIDTH +: SEG_MTY_WIDTH];
    assign    lbus_data[i*SEG_DATA_WIDTH +: SEG_DATA_WIDTH]    = lbus_data_i[i*SEG_DATA_WIDTH +: SEG_DATA_WIDTH];



    assign    wr_en[i]        = seg_valid[i] & ~|full; 

cmac_usplus_1_fifo #(
   .DEPTH(FIFO_DEPTH),
   .PROG_FULL(FIFO_DEPTH-4),
   .DATA_WIDTH(DATA_WIDTH/4 + $clog2(DATA_WIDTH/32) + 4)      // DECIMAL
)                                       
fifo_sync_inst (                   

   .data_valid(data_valid[i]),       
   .dout(dout[i]),                   
   .empty(empty[i]),                 
   .prog_full(),         
   .full(full[i]),         
   .din(din[i]),               
   .rd_en(rd_en[i]),  
   .rst(core_rst),                   
   .wr_clk(core_clk),
   .wr_en(wr_en[i])                  
);



end //}

endgenerate //}


   //==========================================================================
    // circular left shift 
    //==========================================================================
    function [NUM_SEG - 1:0] circular_left_shift (input [NUM_SEG - 1:0] x, input [1:0] shift);
       begin : shift_blk //{
         circular_left_shift = {x,x} >> (4 - shift);
       end //}
    endfunction // func
   //==========================================================================
    // circular right shift 
    //==========================================================================
    function [NUM_SEG - 1:0] circular_right_shift (input [NUM_SEG - 1:0] x, input [1:0] shift);
       begin : shift_blk //{
         circular_right_shift = {x,x} >> shift;
       end //}
    endfunction // func
   //==========================================================================
    // one-hot to thermometer code
    //==========================================================================
    function [NUM_SEG - 1:0] onehot2thermo (input [NUM_SEG - 1:0] in_reqs);
       begin : priority_blk //{
          case (in_reqs)
            4'b1000: begin onehot2thermo = 4'b1111; end
            4'b1100: begin onehot2thermo = 4'b0111; end
            4'b1110: begin onehot2thermo = 4'b0011; end
            4'b1111: begin onehot2thermo = 4'b0001; end
            4'b0100: begin onehot2thermo = 4'b0111; end
            4'b0110: begin onehot2thermo = 4'b0011; end
            4'b0111: begin onehot2thermo = 4'b0001; end
            4'b0010: begin onehot2thermo = 4'b0011; end
            4'b0011: begin onehot2thermo = 4'b0001; end
            4'b0001: begin onehot2thermo = 4'b0001; end
            default: begin onehot2thermo = 4'b0000; end
          endcase
       end
    endfunction // func



endmodule // lbus2axis_segmented_top


`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)


module cmac_usplus_1_lbus2axis_segmented_corelogic #(
   parameter DATA_WIDTH = 512
)
(
  input  wire                                   core_clk,
  input  wire                                   core_rst,

  // AXIS IF
  output  reg                                   axis_tvalid,
  output  reg [DATA_WIDTH-1:0]                  axis_tdata,
  output  reg                                   axis_tlast,
  output  reg [DATA_WIDTH/8 - 1:0]              axis_tkeep,
  output  reg                                   axis_tuser,
  input   wire [55:0]                           rx_preambleout_i,
  output  reg [55:0]                            rx_preambleout_o,

  input  wire    [3:0]                          lbus_ena,
  input  wire [DATA_WIDTH - 1:0]                lbus_data,
  input  wire    [3:0]                          lbus_sop,
  input  wire    [3:0]                          lbus_eop,
  input  wire [4*$clog2(DATA_WIDTH/32) - 1:0]   lbus_mty,
  input  wire    [3:0]                          lbus_err

);

   localparam SEG_DATA_WIDTH = DATA_WIDTH/4;
   localparam SEG_MTY_WIDTH = $clog2(DATA_WIDTH/32);
   localparam ALL_ONES = {DATA_WIDTH/32 {1'b1}};

   wire [DATA_WIDTH/8 - 1:0] axis_tkeep_w;
   wire [DATA_WIDTH - 1:0]   axis_tdata_w;
   wire                      lbus_sopw;
   reg  [55:0]               rx_preambleout_1d;
   reg  [55:0]               rx_preambleout_2d;



   always @(posedge core_clk)
   begin //{
         axis_tdata <= axis_tdata_w;
         axis_tlast <= |lbus_eop;
         axis_tvalid <= |lbus_ena;
         axis_tkeep  <= axis_tkeep_w;
         axis_tuser <= |lbus_err;
         rx_preambleout_1d <= rx_preambleout_i;
         rx_preambleout_2d <= rx_preambleout_1d;
         rx_preambleout_o <= rx_preambleout_2d;
   end //}


   ////////////////////////////////////////////////////////////////////////////
   //                      LBUS
   //For a 512-bit wide bus, the first byte of the packet is written on bits //
   //  [511:504], the second byte on bits [503:496], and so forth            //
   ////////////////////////////////////////////////////////////////////////////
   genvar i;
   genvar seg;
   generate //{
   for(seg = 0; seg < 4; seg=seg+1) begin : SEG_LOOP1 //{
   for(i = 0; i < DATA_WIDTH/32; i=i+1)
      begin : SEG_LOOP2 //{
         assign  axis_tdata_w[((seg+1)*DATA_WIDTH/4-8-i*8) +: 8] = lbus_data[seg*SEG_DATA_WIDTH+i*8 +: 8];
      end//}
   assign   axis_tkeep_w[seg * DATA_WIDTH/32 +: DATA_WIDTH/32] = lbus_ena[seg] ? mty_to_tkeep(lbus_mty[seg*SEG_MTY_WIDTH +: SEG_MTY_WIDTH]) : 'd0;
   end//}
   endgenerate //}



   ////////////////////////////////////////////////////////////////////////////
   //             Function: mty_to_tkeep                                     //
   ////////////////////////////////////////////////////////////////////////////
   function [DATA_WIDTH/32 - 1:0] mty_to_tkeep(input [$clog2(DATA_WIDTH/32) - 1:0]  idx);
      begin :mty_to_tkeep_blk //{
                   mty_to_tkeep = ALL_ONES >> /*DATA_WIDTH/8 - idx*/ idx;
      end //}
   endfunction // func

endmodule // lbus2axis_segmented_corelogic


`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)


module cmac_usplus_1_fifo #(
   parameter DATA_WIDTH = 512,
   parameter DEPTH      = 4,
   parameter PROG_FULL      = 0
)
(
  input  wire                                   wr_clk,
  input  wire                                   rst,
  input  wire     [DATA_WIDTH-1:0]              din,
  input  wire                                   wr_en,
  input  wire                                   rd_en,
  output wire     [DATA_WIDTH-1:0]              dout,
  output wire                                    empty,
  output wire                                    full,
  output wire                                    prog_full,
  output wire                                   data_valid
);

// Local buffer to save data
reg [DATA_WIDTH-1: 0] buffer[DEPTH-1:0];
reg [$clog2(DEPTH) -1: 0] wr_ptr;
reg [$clog2(DEPTH) -1: 0] rd_ptr;

wire [PROG_FULL:0] p_full; 
// Write pointer
always @(posedge wr_clk) 
begin//{
   if(rst) 
      begin //{
            wr_ptr <= 0;
      end //}
   else if(wr_en & ~full)
      begin //{
            wr_ptr <= (wr_ptr + 1'b1)%(DEPTH);
      end //}
end //}

// Read pointer
always @(posedge wr_clk) 
begin//{
   if(rst) 
      begin //{
            rd_ptr <= 0;
      end //}
   else if(rd_en & ~empty)
      begin //{
            rd_ptr <= (rd_ptr + 1'b1)%(DEPTH);
      end //}
end //}

assign full  = ((wr_ptr + 1'b1)%(DEPTH) == rd_ptr);
assign empty = (wr_ptr == rd_ptr);
assign data_valid = ~empty;


assign dout = buffer[rd_ptr];

// WRITE process
always @(posedge wr_clk) 
begin //{

   buffer[wr_ptr] <= din;

end //}

   //==========================================================================
    //  gray counter
    //==========================================================================
    function [$clog2(DEPTH) -1: 0] gray_increment (input [$clog2(DEPTH) -1: 0] x);
       begin : gray_incr_blk //{
       case (x) //{
          2'b00: gray_increment = 2'b01;
          2'b01: gray_increment = 2'b11;
          2'b11: gray_increment = 2'b10;
          2'b10: gray_increment = 2'b00;
       endcase //}   
       end //}
    endfunction // func
endmodule // fifo

