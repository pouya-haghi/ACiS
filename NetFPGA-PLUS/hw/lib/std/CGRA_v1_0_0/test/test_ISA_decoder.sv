`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module test_ISA_decoder;
    // **dwidth_inst = 32**
    reg [dwidth_inst-1:0] instr; // vector instruction
    reg clk;
    reg rst;
    reg done_steady;
    wire tvalid_RF;
    wire [4:0] rs1; // source register 1
    wire [4:0] rs2; // source register 2
    wire [4:0] rd; // dest register
    wire [dwidth_RFadd-1:0] ITR;
    wire is_vle32_vv;
    wire is_vse32_vv;
    wire is_vmacc_vv;
    wire is_vmv_vi;
    wire is_vstreamout;
    wire is_vsetivli;
    wire is_bne;
    wire is_csr;
    wire is_lui;
    wire [dwidth_RFadd-1:0] vr_addr; // vector register file
    wire [dwidth_RFadd-1:0] vw_addr; // vector register file
    wire is_not_vect; // used to inform us about stall (if it is zero we should stall)
    wire [11:0] branch_immediate;
    wire [dwidth_int-1:0] R_immediate;
    wire [2:0] op;
    wire [2:0] op_scalar;
    wire wen_RF_scalar;
    wire ap_done;
    
    ISA_decoder ISA_decoder_inst(
          .*
//        .instr(instr),
//        .clk(clk),
//        .rst(rst),
//        .ctrl_i_mux2_tvalid(ctrl_i_mux2_tvalid),
//        .rs1(rs1),
//        .rs2(rs2),
//        .rd(rd),
//        .ITR(ITR),
//        .wen_ITR(wen_ITR),
//        .vr_addr(vr_addr),
//        .vw_addr(vw_addr),
//        .is_not_vect(is_not_vect),
//        .is_vle32_vv(is_vle32_vv),
//        .is_vse32_vv(is_vse32_vv),
//        .is_vmacc_vv(is_vmacc_vv),
//        .is_vstreamout(is_vstreamout),
//        .is_vmv_vi(is_vmv_vi),
//        .is_bne(is_bne),
//        .is_csr(is_csr),
//        .branch_immediate(branch_immediate),
//        .R_immediate(R_immediate),
//        .op(op),
//        .op_scalar(op_scalar),
//        .wen_RF_scalar(wen_RF_scalar)
        );
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    initial begin
        rst = 1;
        instr <=0;
        done_steady <= 0;
        
        #20
        
        // Vector Load, Store, Fused MAC (VMAC), vsetivli
        // Scalar LW, LUI, ADDI, BEQ --> https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMAFDQC/riscv-spec-20191213.pdf   page 130
        
        rst = 0;
        done_steady <= 1;
        // VSETAVLI
//        #5  instr <= 32'b1_1_0011001100_10000_111_01111_1110101;
        #5  instr <= 32'b1_1_0011001100_10000_111_01111_1010111;
        // VALU
//        #10 instr <= 32'b001101_0_11000_01000_000_10111_1110101;
        #10 instr <= 32'b001101_0_11000_01000_000_10111_1010111;        
        // Vector Load           vd        rs1   
//        #10 instr <= 32'b000_0_00_0_00000_00100_000_11011_1110000;
        #10 instr <= 32'b000_0_00_0_00000_00100_000_11011_0000111;
        // Vector Store          vd        rs1
//        #10 instr <= 32'b000_0_00_0_00000_00010_000_11101_1110010;
        #10 instr <= 32'b000_0_00_0_00000_00010_000_11101_0100111;        
        // Stream Out
        #10 instr <= 32'b0000000_00000_00001_000_11110_1111111;
        
        // LW
        #10 instr <= 32'b110011001100_01111_010_10000_0000011;
        // LUI
        #10 instr <= 32'b11001100110011001100_01000_0110111;
        // ADDI
        #10 instr <= 32'b001100110011_11011_000_00100_0010011;
        // BEQ
        #10 instr <= 32'b1001100_01000_11101_000_10011_1100011;
        //WFI
        #10 instr <= 32'b0001000_00101_00000_000_00000_1110011;
        // reverting back to vector load
        #10 instr <= 32'b000_0_00_0_00000_00100_000_11011_0000111;
        #60
        // done_steady
//        #60;
        done_steady <= 0;
        #100;
        
        
        $finish;
    end

endmodule
