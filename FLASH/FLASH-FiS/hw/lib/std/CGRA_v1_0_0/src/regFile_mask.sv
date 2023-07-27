`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module regFile_mask( // support multibit wen (resolution at the granularity of PEs)
    input logic [phit_size-1:0]         d_in,
    input logic [SIMD_degree-1:0]       tlast_in,
    input logic                         clk,
    input logic rst,
    input logic [dwidth_RFadd-1:0]      rd_addr1,
    input logic [dwidth_RFadd-1:0]      rd_addr2,
    input logic [dwidth_RFadd-1:0]      wr_addr,
    input logic [SIMD_degree-1:0]       wen,
    output logic [phit_size-1:0]        d_out1,
    output logic [phit_size-1:0]        d_out2,
    output logic [SIMD_degree-1:0]      tlast_out1,
    output logic [SIMD_degree-1:0]      tlast_out2
    );
    
//    logic [phit_size+SIMD_degree-1:0] mem [depth_RF-1:0];
    logic [SIMD_degree-1:0] mem [depth_RF-1:0];
    integer k;
    
    // This is for simulation
    initial begin
        for (k=0;k<depth_RF;k=k+1)
            mem[k] <= '0;
//            mem[i] <= i*10;
    end
    // End of simulation
    genvar i;
//    generate for (i = 0; i< SIMD_degree; i++) begin
//        always_ff @(posedge clk) begin
//            if(wen[i]) 
//                mem[wr_addr][dwidth_float*(i+1) - 1:dwidth_float*i] <= d_in[dwidth_float*(i+1) - 1:dwidth_float*i];
//        end
//    end
//    endgenerate
    
    always_ff @(posedge clk) begin
        if(|wen) 
            mem[wr_addr] <= tlast_in;
    end
    
    assign tlast_out1 = mem[rd_addr1];
    assign tlast_out2 = mem[rd_addr2];
    
    logic [phit_size-1:0]        t_d_out1;
    logic [phit_size-1:0]        t_d_out2;
    
    xpm_memory_tdpram #(
   .ADDR_WIDTH_A(12),               // DECIMAL
   .ADDR_WIDTH_B(12),               // DECIMAL
   .AUTO_SLEEP_TIME(0),            // DECIMAL
//   .BYTE_WRITE_WIDTH_A(64),        // DECIMAL
//   .BYTE_WRITE_WIDTH_B(64),        // DECIMAL
   .CASCADE_HEIGHT(0),             // DECIMAL
   .CLOCKING_MODE("common_clock"), // String
   .ECC_MODE("no_ecc"),            // String
   .MEMORY_INIT_FILE("none"),      // String
   .MEMORY_INIT_PARAM("0"),        // String
   .MEMORY_OPTIMIZATION("true"),   // String
   .MEMORY_PRIMITIVE("block"),      // String
   .MEMORY_SIZE(2097152),             // DECIMAL
   .MESSAGE_CONTROL(0),            // DECIMAL
   .READ_DATA_WIDTH_A(512),         // DECIMAL
   .READ_DATA_WIDTH_B(512),         // DECIMAL
   .READ_LATENCY_A(1),             // DECIMAL
   .READ_LATENCY_B(1),             // DECIMAL
   .READ_RESET_VALUE_A("0"),       // String
   .READ_RESET_VALUE_B("0"),       // String
   .RST_MODE_A("SYNC"),            // String
   .RST_MODE_B("SYNC"),            // String
   .SIM_ASSERT_CHK(0),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
   .USE_EMBEDDED_CONSTRAINT(0),    // DECIMAL
   .USE_MEM_INIT(1),               // DECIMAL
   .USE_MEM_INIT_MMI(0),           // DECIMAL
   .WAKEUP_TIME("disable_sleep"),  // String
   .WRITE_DATA_WIDTH_A(512),        // DECIMAL
   .WRITE_DATA_WIDTH_B(512),        // DECIMAL
   .WRITE_MODE_A("no_change"),     // String
   .WRITE_MODE_B("no_change"),     // String
   .WRITE_PROTECT(1)               // DECIMAL
)
xpm_memory_tdpram_inst1 (
   .dbiterra(),             // 1-bit output: Status signal to indicate double bit error occurrence
                                    // on the data output of port A.
   .dbiterrb(),             // 1-bit output: Status signal to indicate double bit error occurrence
                                    // on the data output of port A.
   .douta(),                   // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
   .doutb(t_d_out1),                   // READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
   .sbiterra(),             // 1-bit output: Status signal to indicate single bit error occurrence
                                    // on the data output of port A.
   .sbiterrb(),             // 1-bit output: Status signal to indicate single bit error occurrence
                                    // on the data output of port B.
   .addra(wr_addr),                   // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
   .addrb(rd_addr1),                   // ADDR_WIDTH_B-bit input: Address for port B write and read operations.
   .clka(clk),                     // 1-bit input: Clock signal for port A. Also clocks port B when
                                    // parameter CLOCKING_MODE is "common_clock".
   .clkb(),                     // 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
                                    // "independent_clock". Unused when parameter CLOCKING_MODE is
                                    // "common_clock".
   .dina(d_in),                     // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
   .dinb(),                     // WRITE_DATA_WIDTH_B-bit input: Data input for port B write operations.
   .ena(1'b1),                       // 1-bit input: Memory enable signal for port A. Must be high on clock
                                    // cycles when read or write operations are initiated. Pipelined
                                    // internally.
   .enb(1'b1),                       // 1-bit input: Memory enable signal for port B. Must be high on clock
                                    // cycles when read or write operations are initiated. Pipelined
                                    // internally.
   .injectdbiterra(), // 1-bit input: Controls double bit error injection on input data when
                                    // ECC enabled (Error injection capability is not available in
                                    // "decode_only" mode).
   .injectdbiterrb(), // 1-bit input: Controls double bit error injection on input data when
                                    // ECC enabled (Error injection capability is not available in
                                    // "decode_only" mode).
   .injectsbiterra(), // 1-bit input: Controls single bit error injection on input data when
                                    // ECC enabled (Error injection capability is not available in
                                    // "decode_only" mode).
   .injectsbiterrb(), // 1-bit input: Controls single bit error injection on input data when
                                    // ECC enabled (Error injection capability is not available in
                                    // "decode_only" mode).
   .regcea(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
                                    // data path.
   .regceb(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
                                    // data path.
   .rsta(rst),                     // 1-bit input: Reset signal for the final port A output register stage.
                                    // Synchronously resets output port douta to the value specified by
                                    // parameter READ_RESET_VALUE_A.
   .rstb(rst),                     // 1-bit input: Reset signal for the final port B output register stage.
                                    // Synchronously resets output port doutb to the value specified by
                                    // parameter READ_RESET_VALUE_B.
   .sleep(1'b0),                   // 1-bit input: sleep signal to enable the dynamic power saving feature.
   .wea({wen[15],wen[15],wen[15],wen[15],wen[14],wen[14],wen[14],wen[14],wen[13],wen[13],wen[13],wen[13],wen[12],wen[12],wen[12],wen[12],wen[11],wen[11],wen[11],wen[11],wen[10],wen[10],wen[10],wen[10],wen[9],wen[9],wen[9],wen[9],wen[8],wen[8],wen[8],wen[8],wen[7],wen[7],wen[7],wen[7],wen[6],wen[6],wen[6],wen[6],wen[5],wen[5],wen[5],wen[5],wen[4],wen[4],wen[4],wen[4],wen[3],wen[3],wen[3],wen[3],wen[2],wen[2],wen[2],wen[2],wen[1],wen[1],wen[1],wen[1],wen[0],wen[0],wen[0],wen[0]}),                       // WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
                                    // for port A input data port dina. 1 bit wide when word-wide writes are
                                    // used. In byte-wide write configurations, each bit controls the
                                    // writing one byte of dina to address addra. For example, to
                                    // synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A
                                    // is 32, wea would be 4'b0010.
   .web(64'b0)                        // WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B-bit input: Write enable vector
                                    // for port B input data port dinb. 1 bit wide when word-wide writes are
                                    // used. In byte-wide write configurations, each bit controls the
                                    // writing one byte of dinb to address addrb. For example, to
                                    // synchronously write only bits [15-8] of dinb when WRITE_DATA_WIDTH_B
                                    // is 32, web would be 4'b0010.
);

    
    xpm_memory_tdpram #(
   .ADDR_WIDTH_A(12),               // DECIMAL
   .ADDR_WIDTH_B(12),               // DECIMAL
   .AUTO_SLEEP_TIME(0),            // DECIMAL
//   .BYTE_WRITE_WIDTH_A(64),        // DECIMAL
//   .BYTE_WRITE_WIDTH_B(64),        // DECIMAL
   .CASCADE_HEIGHT(0),             // DECIMAL
   .CLOCKING_MODE("common_clock"), // String
   .ECC_MODE("no_ecc"),            // String
   .MEMORY_INIT_FILE("none"),      // String
   .MEMORY_INIT_PARAM("0"),        // String
   .MEMORY_OPTIMIZATION("true"),   // String
   .MEMORY_PRIMITIVE("block"),      // String
   .MEMORY_SIZE(2097152),             // DECIMAL
   .MESSAGE_CONTROL(0),            // DECIMAL
   .READ_DATA_WIDTH_A(512),         // DECIMAL
   .READ_DATA_WIDTH_B(512),         // DECIMAL
   .READ_LATENCY_A(1),             // DECIMAL
   .READ_LATENCY_B(1),             // DECIMAL
   .READ_RESET_VALUE_A("0"),       // String
   .READ_RESET_VALUE_B("0"),       // String
   .RST_MODE_A("SYNC"),            // String
   .RST_MODE_B("SYNC"),            // String
   .SIM_ASSERT_CHK(0),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
   .USE_EMBEDDED_CONSTRAINT(0),    // DECIMAL
   .USE_MEM_INIT(1),               // DECIMAL
   .USE_MEM_INIT_MMI(0),           // DECIMAL
   .WAKEUP_TIME("disable_sleep"),  // String
   .WRITE_DATA_WIDTH_A(512),        // DECIMAL
   .WRITE_DATA_WIDTH_B(512),        // DECIMAL
   .WRITE_MODE_A("no_change"),     // String
   .WRITE_MODE_B("no_change"),     // String
   .WRITE_PROTECT(1)               // DECIMAL
)
xpm_memory_tdpram_inst2 (
   .dbiterra(),             // 1-bit output: Status signal to indicate double bit error occurrence
                                    // on the data output of port A.
   .dbiterrb(),             // 1-bit output: Status signal to indicate double bit error occurrence
                                    // on the data output of port A.
   .douta(),                   // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
   .doutb(t_d_out2),                   // READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
   .sbiterra(),             // 1-bit output: Status signal to indicate single bit error occurrence
                                    // on the data output of port A.
   .sbiterrb(),             // 1-bit output: Status signal to indicate single bit error occurrence
                                    // on the data output of port B.
   .addra(wr_addr),                   // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
   .addrb(rd_addr2),                   // ADDR_WIDTH_B-bit input: Address for port B write and read operations.
   .clka(clk),                     // 1-bit input: Clock signal for port A. Also clocks port B when
                                    // parameter CLOCKING_MODE is "common_clock".
   .clkb(),                     // 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
                                    // "independent_clock". Unused when parameter CLOCKING_MODE is
                                    // "common_clock".
   .dina(d_in),                     // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
   .dinb(),                     // WRITE_DATA_WIDTH_B-bit input: Data input for port B write operations.
   .ena(1'b1),                       // 1-bit input: Memory enable signal for port A. Must be high on clock
                                    // cycles when read or write operations are initiated. Pipelined
                                    // internally.
   .enb(1'b1),                       // 1-bit input: Memory enable signal for port B. Must be high on clock
                                    // cycles when read or write operations are initiated. Pipelined
                                    // internally.
   .injectdbiterra(), // 1-bit input: Controls double bit error injection on input data when
                                    // ECC enabled (Error injection capability is not available in
                                    // "decode_only" mode).
   .injectdbiterrb(), // 1-bit input: Controls double bit error injection on input data when
                                    // ECC enabled (Error injection capability is not available in
                                    // "decode_only" mode).
   .injectsbiterra(), // 1-bit input: Controls single bit error injection on input data when
                                    // ECC enabled (Error injection capability is not available in
                                    // "decode_only" mode).
   .injectsbiterrb(), // 1-bit input: Controls single bit error injection on input data when
                                    // ECC enabled (Error injection capability is not available in
                                    // "decode_only" mode).
   .regcea(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
                                    // data path.
   .regceb(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
                                    // data path.
   .rsta(rst),                     // 1-bit input: Reset signal for the final port A output register stage.
                                    // Synchronously resets output port douta to the value specified by
                                    // parameter READ_RESET_VALUE_A.
   .rstb(rst),                     // 1-bit input: Reset signal for the final port B output register stage.
                                    // Synchronously resets output port doutb to the value specified by
                                    // parameter READ_RESET_VALUE_B.
   .sleep(1'b0),                   // 1-bit input: sleep signal to enable the dynamic power saving feature.
   .wea({wen[15],wen[15],wen[15],wen[15],wen[14],wen[14],wen[14],wen[14],wen[13],wen[13],wen[13],wen[13],wen[12],wen[12],wen[12],wen[12],wen[11],wen[11],wen[11],wen[11],wen[10],wen[10],wen[10],wen[10],wen[9],wen[9],wen[9],wen[9],wen[8],wen[8],wen[8],wen[8],wen[7],wen[7],wen[7],wen[7],wen[6],wen[6],wen[6],wen[6],wen[5],wen[5],wen[5],wen[5],wen[4],wen[4],wen[4],wen[4],wen[3],wen[3],wen[3],wen[3],wen[2],wen[2],wen[2],wen[2],wen[1],wen[1],wen[1],wen[1],wen[0],wen[0],wen[0],wen[0]}),                       // WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
                                    // for port A input data port dina. 1 bit wide when word-wide writes are
                                    // used. In byte-wide write configurations, each bit controls the
                                    // writing one byte of dina to address addra. For example, to
                                    // synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A
                                    // is 32, wea would be 4'b0010.
   .web(64'b0)                        // WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B-bit input: Write enable vector
                                    // for port B input data port dinb. 1 bit wide when word-wide writes are
                                    // used. In byte-wide write configurations, each bit controls the
                                    // writing one byte of dinb to address addrb. For example, to
                                    // synchronously write only bits [15-8] of dinb when WRITE_DATA_WIDTH_B
                                    // is 32, web would be 4'b0010.
);

//  xpm_memory_tdpram #(
//   .ADDR_WIDTH_A(12),               // DECIMAL
//   .ADDR_WIDTH_B(12),               // DECIMAL
//   .AUTO_SLEEP_TIME(0),            // DECIMAL
////   .BYTE_WRITE_WIDTH_A(32),        // DECIMAL
////   .BYTE_WRITE_WIDTH_B(32),        // DECIMAL
//   .CASCADE_HEIGHT(0),             // DECIMAL
//   .CLOCKING_MODE("common_clock"), // String
//   .ECC_MODE("no_ecc"),            // String
//   .MEMORY_INIT_FILE("none"),      // String
//   .MEMORY_INIT_PARAM("0"),        // String
//   .MEMORY_OPTIMIZATION("true"),   // String
//   .MEMORY_PRIMITIVE("block"),      // String
//   .MEMORY_SIZE(1048576),             // DECIMAL
//   .MESSAGE_CONTROL(0),            // DECIMAL
//   .READ_DATA_WIDTH_A(256),         // DECIMAL
//   .READ_DATA_WIDTH_B(256),         // DECIMAL
//   .READ_LATENCY_A(1),             // DECIMAL
//   .READ_LATENCY_B(1),             // DECIMAL
//   .READ_RESET_VALUE_A("0"),       // String
//   .READ_RESET_VALUE_B("0"),       // String
//   .RST_MODE_A("SYNC"),            // String
//   .RST_MODE_B("SYNC"),            // String
//   .SIM_ASSERT_CHK(0),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
//   .USE_EMBEDDED_CONSTRAINT(0),    // DECIMAL
//   .USE_MEM_INIT(1),               // DECIMAL
//   .USE_MEM_INIT_MMI(0),           // DECIMAL
//   .WAKEUP_TIME("disable_sleep"),  // String
//   .WRITE_DATA_WIDTH_A(256),        // DECIMAL
//   .WRITE_DATA_WIDTH_B(256),        // DECIMAL
//   .WRITE_MODE_A("no_change"),     // String
//   .WRITE_MODE_B("no_change"),     // String
//   .WRITE_PROTECT(1)               // DECIMAL
//)
//xpm_memory_tdpram_inst1 (
//   .dbiterra(),             // 1-bit output: Status signal to indicate double bit error occurrence
//                                    // on the data output of port A.
//   .dbiterrb(),             // 1-bit output: Status signal to indicate double bit error occurrence
//                                    // on the data output of port A.
//   .douta(),                   // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
//   .doutb(t_d_out1),                   // READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
//   .sbiterra(),             // 1-bit output: Status signal to indicate single bit error occurrence
//                                    // on the data output of port A.
//   .sbiterrb(),             // 1-bit output: Status signal to indicate single bit error occurrence
//                                    // on the data output of port B.
//   .addra(wr_addr),                   // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
//   .addrb(rd_addr1),                   // ADDR_WIDTH_B-bit input: Address for port B write and read operations.
//   .clka(clk),                     // 1-bit input: Clock signal for port A. Also clocks port B when
//                                    // parameter CLOCKING_MODE is "common_clock".
//   .clkb(),                     // 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
//                                    // "independent_clock". Unused when parameter CLOCKING_MODE is
//                                    // "common_clock".
//   .dina(d_in),                     // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
//   .dinb(),                     // WRITE_DATA_WIDTH_B-bit input: Data input for port B write operations.
//   .ena(1'b1),                       // 1-bit input: Memory enable signal for port A. Must be high on clock
//                                    // cycles when read or write operations are initiated. Pipelined
//                                    // internally.
//   .enb(1'b1),                       // 1-bit input: Memory enable signal for port B. Must be high on clock
//                                    // cycles when read or write operations are initiated. Pipelined
//                                    // internally.
//   .injectdbiterra(), // 1-bit input: Controls double bit error injection on input data when
//                                    // ECC enabled (Error injection capability is not available in
//                                    // "decode_only" mode).
//   .injectdbiterrb(), // 1-bit input: Controls double bit error injection on input data when
//                                    // ECC enabled (Error injection capability is not available in
//                                    // "decode_only" mode).
//   .injectsbiterra(), // 1-bit input: Controls single bit error injection on input data when
//                                    // ECC enabled (Error injection capability is not available in
//                                    // "decode_only" mode).
//   .injectsbiterrb(), // 1-bit input: Controls single bit error injection on input data when
//                                    // ECC enabled (Error injection capability is not available in
//                                    // "decode_only" mode).
//   .regcea(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
//                                    // data path.
//   .regceb(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
//                                    // data path.
//   .rsta(rst),                     // 1-bit input: Reset signal for the final port A output register stage.
//                                    // Synchronously resets output port douta to the value specified by
//                                    // parameter READ_RESET_VALUE_A.
//   .rstb(rst),                     // 1-bit input: Reset signal for the final port B output register stage.
//                                    // Synchronously resets output port doutb to the value specified by
//                                    // parameter READ_RESET_VALUE_B.
//   .sleep(1'b0),                   // 1-bit input: sleep signal to enable the dynamic power saving feature.
//       .wea({32{1'b1}}),                       // WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
                                
//                                    // for port A input data port dina. 1 bit wide when word-wide writes are
//                                    // used. In byte-wide write configurations, each bit controls the
//                                    // writing one byte of dina to address addra. For example, to
//                                    // synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A
//                                    // is 32, wea would be 4'b0010.
//   .web({32{1'b0}})                        // WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B-bit input: Write enable vector
//                                    // for port B input data port dinb. 1 bit wide when word-wide writes are
//                                    // used. In byte-wide write configurations, each bit controls the
//                                    // writing one byte of dinb to address addrb. For example, to
//                                    // synchronously write only bits [15-8] of dinb when WRITE_DATA_WIDTH_B
//                                    // is 32, web would be 4'b0010.
//);

    
//    xpm_memory_tdpram #(
//   .ADDR_WIDTH_A(12),               // DECIMAL
//   .ADDR_WIDTH_B(12),               // DECIMAL
//   .AUTO_SLEEP_TIME(0),            // DECIMAL
////   .BYTE_WRITE_WIDTH_A(32),        // DECIMAL
////   .BYTE_WRITE_WIDTH_B(32),        // DECIMAL
//   .CASCADE_HEIGHT(0),             // DECIMAL
//   .CLOCKING_MODE("common_clock"), // String
//   .ECC_MODE("no_ecc"),            // String
//   .MEMORY_INIT_FILE("none"),      // String
//   .MEMORY_INIT_PARAM("0"),        // String
//   .MEMORY_OPTIMIZATION("true"),   // String
//   .MEMORY_PRIMITIVE("block"),      // String
//   .MEMORY_SIZE(1048576),             // DECIMAL
//   .MESSAGE_CONTROL(0),            // DECIMAL
//   .READ_DATA_WIDTH_A(256),         // DECIMAL
//   .READ_DATA_WIDTH_B(256),         // DECIMAL
//   .READ_LATENCY_A(1),             // DECIMAL
//   .READ_LATENCY_B(1),             // DECIMAL
//   .READ_RESET_VALUE_A("0"),       // String
//   .READ_RESET_VALUE_B("0"),       // String
//   .RST_MODE_A("SYNC"),            // String
//   .RST_MODE_B("SYNC"),            // String
//   .SIM_ASSERT_CHK(0),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
//   .USE_EMBEDDED_CONSTRAINT(0),    // DECIMAL
//   .USE_MEM_INIT(1),               // DECIMAL
//   .USE_MEM_INIT_MMI(0),           // DECIMAL
//   .WAKEUP_TIME("disable_sleep"),  // String
//   .WRITE_DATA_WIDTH_A(256),        // DECIMAL
//   .WRITE_DATA_WIDTH_B(256),        // DECIMAL
//   .WRITE_MODE_A("no_change"),     // String
//   .WRITE_MODE_B("no_change"),     // String
//   .WRITE_PROTECT(1)               // DECIMAL
//)
//xpm_memory_tdpram_inst2 (
//   .dbiterra(),             // 1-bit output: Status signal to indicate double bit error occurrence
//                                    // on the data output of port A.
//   .dbiterrb(),             // 1-bit output: Status signal to indicate double bit error occurrence
//                                    // on the data output of port A.
//   .douta(),                   // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
//   .doutb(t_d_out2),                   // READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
//   .sbiterra(),             // 1-bit output: Status signal to indicate single bit error occurrence
//                                    // on the data output of port A.
//   .sbiterrb(),             // 1-bit output: Status signal to indicate single bit error occurrence
//                                    // on the data output of port B.
//   .addra(wr_addr),                   // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
//   .addrb(rd_addr2),                   // ADDR_WIDTH_B-bit input: Address for port B write and read operations.
//   .clka(clk),                     // 1-bit input: Clock signal for port A. Also clocks port B when
//                                    // parameter CLOCKING_MODE is "common_clock".
//   .clkb(),                     // 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
//                                    // "independent_clock". Unused when parameter CLOCKING_MODE is
//                                    // "common_clock".
//   .dina(d_in),                     // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
//   .dinb(),                     // WRITE_DATA_WIDTH_B-bit input: Data input for port B write operations.
//   .ena(1'b1),                       // 1-bit input: Memory enable signal for port A. Must be high on clock
//                                    // cycles when read or write operations are initiated. Pipelined
//                                    // internally.
//   .enb(1'b1),                       // 1-bit input: Memory enable signal for port B. Must be high on clock
//                                    // cycles when read or write operations are initiated. Pipelined
//                                    // internally.
//   .injectdbiterra(), // 1-bit input: Controls double bit error injection on input data when
//                                    // ECC enabled (Error injection capability is not available in
//                                    // "decode_only" mode).
//   .injectdbiterrb(), // 1-bit input: Controls double bit error injection on input data when
//                                    // ECC enabled (Error injection capability is not available in
//                                    // "decode_only" mode).
//   .injectsbiterra(), // 1-bit input: Controls single bit error injection on input data when
//                                    // ECC enabled (Error injection capability is not available in
//                                    // "decode_only" mode).
//   .injectsbiterrb(), // 1-bit input: Controls single bit error injection on input data when
//                                    // ECC enabled (Error injection capability is not available in
//                                    // "decode_only" mode).
//   .regcea(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
//                                    // data path.
//   .regceb(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
//                                    // data path.
//   .rsta(rst),                     // 1-bit input: Reset signal for the final port A output register stage.
//                                    // Synchronously resets output port douta to the value specified by
//                                    // parameter READ_RESET_VALUE_A.
//   .rstb(rst),                     // 1-bit input: Reset signal for the final port B output register stage.
//                                    // Synchronously resets output port doutb to the value specified by
//                                    // parameter READ_RESET_VALUE_B.
//   .sleep(1'b0),                   // 1-bit input: sleep signal to enable the dynamic power saving feature.
////   .wea({wen[15],wen[15],wen[15],wen[15],wen[14],wen[14],wen[14],wen[14],wen[13],wen[13],wen[13],wen[13],wen[12],wen[12],wen[12],wen[12],wen[11],wen[11],wen[11],wen[11],wen[10],wen[10],wen[10],wen[10],wen[9],wen[9],wen[9],wen[9],wen[8],wen[8],wen[8],wen[8],wen[7],wen[7],wen[7],wen[7],wen[6],wen[6],wen[6],wen[6],wen[5],wen[5],wen[5],wen[5],wen[4],wen[4],wen[4],wen[4],wen[3],wen[3],wen[3],wen[3],wen[2],wen[2],wen[2],wen[2],wen[1],wen[1],wen[1],wen[1],wen[0],wen[0],wen[0],wen[0]}),                       // WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
//    .wea({32{1'b1}}),                                
//                                    // for port A input data port dina. 1 bit wide when word-wide writes are
//                                    // used. In byte-wide write configurations, each bit controls the
//                                    // writing one byte of dina to address addra. For example, to
//                                    // synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A
//                                    // is 32, wea would be 4'b0010.
//   .web(32'b0)                        // WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B-bit input: Write enable vector
//                                    // for port B input data port dinb. 1 bit wide when word-wide writes are
//                                    // used. In byte-wide write configurations, each bit controls the
//                                    // writing one byte of dinb to address addrb. For example, to
//                                    // synchronously write only bits [15-8] of dinb when WRITE_DATA_WIDTH_B
//                                    // is 32, web would be 4'b0010.
//);

assign d_out1 = t_d_out1;
assign d_out2 = t_d_out2;
    
endmodule
