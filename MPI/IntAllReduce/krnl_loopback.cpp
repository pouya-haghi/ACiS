#include "ap_axi_sdata.h"
#include "ap_int.h"
#include "hls_stream.h"

#define DWIDTH 512
#define TDWIDTH 16
#define UWIDTH 96
#define MAX_RANK 8
#define MAX_BUFFER_SIZE 11264 // 1408*8

typedef ap_axiu<DWIDTH, UWIDTH, 1, TDWIDTH> pkt;

extern "C" {
void krnl_loopback(hls::stream<pkt> &n2k,    // Internal Stream
	               hls::stream<pkt> &k2n,
                   unsigned int     size, // Size in bytes (size-local)
                   unsigned int     num_rank // Number of ranks
                   ) {
#pragma HLS INTERFACE axis port = n2k
#pragma HLS INTERFACE axis port = k2n

  unsigned int bytes_per_beat = (DWIDTH / 8);
  unsigned int size_tot = num_rank * size;
  unsigned int num_iter_local = (size / bytes_per_beat);
  unsigned int num_iter_global = (size_tot / bytes_per_beat);

  unsigned int buffer_idx_mux = 0;
  static unsigned int buffer_idx[MAX_RANK]; // Array to hold buffer indices for each rank
  #pragma HLS ARRAY_PARTITION variable=buffer_idx complete dim=1
  #pragma HLS UNROLL

  unsigned int global_idx = 0;
  pkt pkt_in;
  pkt pkt_out;

  // Define buffer arrays for each rank
  static ap_uint<512> acc_buf[MAX_RANK][MAX_BUFFER_SIZE] = {0};
  #pragma HLS ARRAY_PARTITION variable=acc_buf complete dim=1
  #pragma HLS ARRAY_PARTITION variable=acc_buf cyclic factor=8
  
  // Initialize buffer indices for each rank
  for (int rank = 0; rank < num_rank; rank++) {
    buffer_idx[rank] = 0;
  }

  // Loop unrolling and pipelining for the main processing loop
  loop_main: while (global_idx < num_iter_global) {
    #pragma HLS PIPELINE II=1

    //Read incoming packet
    pkt_in = n2k.read();

    // Compute the incoming rank
    ap_uint<8> this_rank = pkt_in.user.range(7,0); //myPort

    // Pick the right index to update the buffer
    unsigned int buffer_idx_this_rank = buffer_idx[this_rank];
    buffer_idx_mux = buffer_idx_this_rank;

    // Perform the processing (accumulation)
for (int i = 0; i < DWIDTH/32; i++) {
    #pragma HLS UNROLL
    ap_uint<32> acc_buf_data = acc_buf[this_rank][buffer_idx_mux + i];
    acc_buf_data += pkt_in.data.range((i+1)*32-1, i*32);
    acc_buf[this_rank][buffer_idx_mux + i] = acc_buf_data;
}

    // Update the buffer index for the current rank
    if (buffer_idx[this_rank] == num_iter_local - 1)
        buffer_idx[this_rank] = 0;
    else
        buffer_idx[this_rank]++;

    // Update the global index
    global_idx++;
  }

  // Multicast the accumulated data back to each rank
  loop_multicast: for (int rank = 0; rank < num_rank; rank++) {
// #pragma HLS LOOP_TRIPCOUNT min=1 max=MAX_RANK
#pragma HLS UNROLL

    int rank_offset = rank * num_iter_local * (DWIDTH / 32);

    // Use a buffer to store the concatenated data for each rank
    ap_uint<DWIDTH> data_buffer = 0;

    for (int i = 0; i < num_iter_local; i++) {
// #pragma HLS LOOP_TRIPCOUNT min=1 max=MAX_BUFFER_SIZE / (DWIDTH / 32)
#pragma HLS UNROLL

        pkt_out.keep = -1;
        if ((((size / bytes_per_beat) - 1) == i) || ((((i + 1) * DWIDTH / 8) % 1408) == 0))
            pkt_out.last = 1;
        else
            pkt_out.last = 0;
        pkt_out.dest = rank + 1; // Sending to the corresponding NIC

        // Sending the accumulated data to the corresponding NIC for each rank
        int acc_buf_idx = rank_offset + i * (DWIDTH / 32);

        // Concatenate data into the buffer
        data_buffer.range(511, 480) = acc_buf[acc_buf_idx + 15];
        data_buffer.range(479, 448) = acc_buf[acc_buf_idx + 14];
        data_buffer.range(447, 416) = acc_buf[acc_buf_idx + 13];
        data_buffer.range(415, 384) = acc_buf[acc_buf_idx + 12];
        data_buffer.range(383, 352) = acc_buf[acc_buf_idx + 11];
        data_buffer.range(351, 320) = acc_buf[acc_buf_idx + 10];
        data_buffer.range(319, 288) = acc_buf[acc_buf_idx + 9];
        data_buffer.range(287, 256) = acc_buf[acc_buf_idx + 8];
        data_buffer.range(255, 224) = acc_buf[acc_buf_idx + 7];
        data_buffer.range(223, 192) = acc_buf[acc_buf_idx + 6];
        data_buffer.range(191, 160) = acc_buf[acc_buf_idx + 5];
        data_buffer.range(159, 128) = acc_buf[acc_buf_idx + 4];
        data_buffer.range(127, 96) = acc_buf[acc_buf_idx + 3];
        data_buffer.range(95, 64) = acc_buf[acc_buf_idx + 2];
        data_buffer.range(63, 32) = acc_buf[acc_buf_idx + 1];
        data_buffer.range(31, 0) = acc_buf[acc_buf_idx];

        // Write the entire buffer to k2n
        pkt_out.data = data_buffer;
        k2n.write(pkt_out);
    }
}
}
}