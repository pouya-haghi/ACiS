`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif




//module top(
//    // NOTE: one characteristics of inbound is that it is runtime; you can use the array temp two times for two 
//    // different HL collective and their value is loaded to the tables at runtime.
//    // In the new version, there is no inbound
////    input logic [phit_size-1:0] inbound,
//    input logic [SIMD_degree-1:0] t_stream_in_valid,
//    input logic [phit_size-1:0] stream_in,
//    input logic [phit_size-1:0] wr_data_ctrl_plane, // should I merge it to stream_in b/c I have onle one QDMA? 
//    input logic clk,
//    input logic rst,
//    output logic [phit_size-1:0] stream_out,
//    output logic [SIMD_degree-1:0] t_stream_out_valid,
//    // start_loader and done_loader (which is done internally by runtimeLoadTable) are single cycle pulse but start_stream_in and ready_stream_in are handshaking signals
//    input logic start_loader, // start signal to write to state/config tables and inbound
//    input logic start_stream_in,
//    input logic [dwidth_RFadd-1:0] num_entry_config_table, //comes from a header specialized for packet processing 
//    input logic [dwidth_RFadd-1:0] num_entry_inbound,
//    output logic ready_stream_in, // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
//    // 4-phase handshaking for ready_stream_in and start_stream_in. when ready becomes high start should be low and the next cycle after deasserting start, stream-in should send valid data.
//    output logic [phit_size-1:0] stream_out_PEa0,
//    output logic [phit_size-1:0] stream_out_PEa1,
//    output logic [phit_size-1:0] stream_out_PEb,
//    output logic [phit_size-1:0] stream_out_PEc0, 
//    output logic [phit_size-1:0] stream_out_PEc1
//    );





//endmodule









// ---------------------------- Old Code ---------------------------- //


module top(
    // NOTE: one characteristics of inbound is that it is runtime; you can use the array temp two times for two 
    // different HL collective and their value is loaded to the tables at runtime.
    // In the new version, there is no inbound
//    input logic [phit_size-1:0] inbound,
    input logic [SIMD_degree-1:0] t_stream_in_valid,
    input logic [phit_size-1:0] stream_in,
    input logic [phit_size-1:0] wr_data_ctrl_plane, // should I merge it to stream_in b/c I have onle one QDMA? 
    input logic clk,
    input logic rst,
    output logic [phit_size-1:0] stream_out,
    output logic [SIMD_degree-1:0] t_stream_out_valid,
    // start_loader and done_loader (which is done internally by runtimeLoadTable) are single cycle pulse but start_stream_in and ready_stream_in are handshaking signals
    input logic start_loader, // start signal to write to state/config tables and inbound
    input logic start_stream_in,
    input logic [dwidth_RFadd-1:0] num_entry_config_table, //comes from a header specialized for packet processing 
    input logic [dwidth_RFadd-1:0] num_entry_inbound,
    output logic ready_stream_in, // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
    // 4-phase handshaking for ready_stream_in and start_stream_in. when ready becomes high start should be low and the next cycle after deasserting start, stream-in should send valid data.
    output logic [phit_size-1:0] stream_out_PEa0,
    output logic [phit_size-1:0] stream_out_PEa1,
    output logic [phit_size-1:0] stream_out_PEb,
    output logic [phit_size-1:0] stream_out_PEc0, 
    output logic [phit_size-1:0] stream_out_PEc1
    );
                                                             
    logic [(sz_config*(num_col))-1:0] rd_data_ctrl;      
    logic [(dwidth_double*(num_col))-1:0] imm;
    logic [num_col-1:0] valid_config_table;
    logic [(2*num_col)-1:0] op; 
    logic [(4*num_col)-1:0] sel_mux4;
    logic [num_col-1:0] wr_en_RF_config_table;
    logic [(dwidth_RFadd*(num_col))-1:0] wr_addr_RF_config_table, rd_addr_RF_config_table;
    logic [num_col-1:0] isItr;
    logic [(dwidth_RFadd*(num_col))-1:0] wr_addr_RF;
    
    logic wr_en_RF_runtimeLoadTable; //it is drived by runtimeLoadTable
    logic [dwidth_RFadd-1:0] wr_add_RF_runtimeLoadTable;
    
    logic [((num_col)*dwidth_double)-1:0] itr;                                                                       
    logic [num_col-1:0] wen_RF;                           

//    logic [dwidth_int-1:0] itr_k, itr_k_PEA1, itr_k_PEB, itr_k_PEC0, itr_k_PEC1, itr_k_PED;            
//    logic [dwidth_int-1:0] smart_ptr, smart_ptr_PEA1, smart_ptr_PEB, smart_ptr_PEC0, smart_ptr_PEC1, smart_ptr_PED;
    
    control_plane control_plane_inst0 (
    .clk(clk),
    .rst(rst),
    .wr_data(wr_data_ctrl_plane),
    .rd_data_ctrl(rd_data_ctrl),
    .rd_data_imm(imm),
    .itr(itr),
    .start_loader(start_loader),
    .start_stream_in(start_stream_in),
    .num_entry_config_table(num_entry_config_table),
    .num_entry_inbound(num_entry_inbound),
    .ready_stream_in(ready_stream_in),
    .wr_en_RF_runtimeLoadTable(wr_en_RF_runtimeLoadTable),
    .wr_add_RF_runtimeLoadTable(wr_add_RF_runtimeLoadTable)
    );
    
    // unpacking data
    genvar i;
    generate 
        // i = 0 => wr_en [2:1] => rd_data[sz_config-1:0] => PEA0 => valid_config_table[0]
        // i = 1 => ...
        for(i=0; i<num_col; i++) begin 
            assign valid_config_table[i] = rd_data_ctrl[(sz_config*(i+1))-1]; // TODO: parametrized the bitwidth and offset of data fields
            assign op[(2*(i+1))-1:2*i] = rd_data_ctrl[(sz_config*(i+1))-3:(sz_config*(i+1))-4];
            assign sel_mux4[(4*(i+1))-1:4*i] = rd_data_ctrl[(sz_config*(i+1))-5:(sz_config*(i+1))-8];
            assign wr_addr_RF_config_table[(dwidth_RFadd*(i+1))-1:dwidth_RFadd*i] = rd_data_ctrl[(sz_config*(i+1))-9:(sz_config*(i+1))-8-dwidth_RFadd];
            assign rd_addr_RF_config_table[(dwidth_RFadd*(i+1))-1:dwidth_RFadd*i] = rd_data_ctrl[(sz_config*(i+1))-9-dwidth_RFadd:(sz_config*(i+1))-8-(dwidth_RFadd*2)];
            assign wr_en_RF_config_table[i] = rd_data_ctrl[(sz_config*(i+1))-9-(dwidth_RFadd*2)];
            assign isItr[i] = rd_data_ctrl[(sz_config*(i+1))-10-(dwidth_RFadd*2)];
        end
    endgenerate
    
    // high fan-out maybe you can optimize timing
    assign wen_RF = (ready_stream_in)?(valid_config_table & wr_en_RF_config_table):{num_col{wr_en_RF_runtimeLoadTable}};
    // we can reuse ready_stream_in as a selector of mux (when ready_stream_in=1 => reading from config table; when ready_stream_in=0 => reading from runtimeLoadTable)
    // when we are reading from config table: if valid = 0 then wr_en should be zero => we have ANDed valid with wr_en
    assign wr_addr_RF = (ready_stream_in)? wr_addr_RF_config_table: {num_col{wr_add_RF_runtimeLoadTable}};
    
    data_path data_path_inst0 (
    .clk(clk),
    .rst(rst),
    .t_stream_in_valid(t_stream_in_valid),
    .stream_in(stream_in),
    .itr(itr),
    .isItr(isItr),
    .imm(imm),
    .sel_mux4(sel_mux4),
    .op(op),
    .wen_RF(wen_RF),
    .rd_addr_RF(rd_addr_RF_config_table),
    .wr_addr_RF(wr_addr_RF),
    .wr_data(wr_data_ctrl_plane), // will be mapped to RFs
    .wr_en_RF_runtimeLoadTable(wr_en_RF_runtimeLoadTable), // to select what is the source of data for RF data_in
    .stream_out(stream_out),
    .t_stream_out_valid(t_stream_out_valid),
    .stream_out_PEa0(stream_out_PEa0),
    .stream_out_PEa1(stream_out_PEa1),
    .stream_out_PEb(stream_out_PEb),
    .stream_out_PEc0(stream_out_PEc0), 
    .stream_out_PEc1(stream_out_PEc1)
    );
      
    
endmodule
