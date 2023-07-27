/**********
Copyright (c) 2019-2020, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/
/* This is a stream to memory mapped data mover kernel which takes input from a
stream and writes data
to global memory via memory mapped interface */

#include "ap_axi_sdata.h"
#include "ap_int.h"
#include "hls_stream.h"

#define DWIDTH 512
#define TDWIDTH 16

// template<int D,int U,int TI,int TD>
// struct ap_axis{
//  ap_int<D> data;
//  ap_uint<D/8> keep;
//  ap_uint<D/8> strb;
//  ap_uint<U> user;
//  ap_uint<1> last;
//  ap_uint<TI> id;
//  ap_uint<TD> dest;
// };

// template<int D,int U,int TI,int TD>
// struct ap_axiu{
//  ap_uint<D> data;
//  ap_uint<D/8> keep;
//  ap_uint<D/8> strb;
//  ap_uint<U> user;
//  ap_uint<1> last;
//  ap_uint<TI> id;
//  ap_uint<TD> dest;
// };

// Note: tvalid and tready are always there! In other words, when you use "void example(int A[50], int B[50]) { #pragma HLS INTERFACE axis port=A"
// then you will have mandatory signals {tdata, tvalid, tready} but when you use ap_axiu struct you are adding optional signals like keep, strb, ... to
// {tdata, tvalid, tready}. They will be left unconnected if the downstream does not use them. 

typedef ap_axiu<DWIDTH, 1, 1, TDWIDTH> pkt;

extern "C" {
void krnl_loopback(hls::stream<pkt> &n2k,    // Internal Stream
	       hls::stream<pkt> &k2n,
               unsigned int     size     // Size in bytes
               ) {
#pragma HLS INTERFACE axis port = n2k
#pragma HLS INTERFACE axis port = k2n

  unsigned int bytes_per_beat = (DWIDTH / 8);
  //unsigned int count = 0:
data_mover:
  int i = 0;
  pkt pkt_in;
  pkt pkt_out;
  ap_int <DWIDTH> temp = 1; 
  // Auto-pipeline is going to apply pipeline to this loop
  for (unsigned int i = 0; i < (size / bytes_per_beat); i++) {
    //pipeline stage 1
    pkt_in = n2k.read();

    //pipeline stage 2
    // unroll
    pkt_out.data.range(31,0) = pkt_in.data.range(31,0) + temp;
    pkt_out.data.range(63,32) = pkt_in.data.range(63,32) + temp;
    pkt_out.data.range(95,64) = pkt_in.data.range(95,64) + temp;
    pkt_out.data.range(127,96) = pkt_in.data.range(127,96) + temp;
    pkt_out.data.range(159,128) = pkt_in.data.range(159,128) + temp;
    pkt_out.data.range(191,160) = pkt_in.data.range(191,160) + temp;
    pkt_out.data.range(223,192) = pkt_in.data.range(223,192) + temp;
    pkt_out.data.range(255,224) = pkt_in.data.range(255,224) + temp;
    pkt_out.data.range(287,256) = pkt_in.data.range(287,256) + temp;
    pkt_out.data.range(319,288) = pkt_in.data.range(319,288) + temp;
    pkt_out.data.range(351,320) = pkt_in.data.range(351,320) + temp;
    pkt_out.data.range(383,352) = pkt_in.data.range(383,352) + temp;
    pkt_out.data.range(415,384) = pkt_in.data.range(415,384) + temp;
    pkt_out.data.range(447,416) = pkt_in.data.range(447,416) + temp;
    pkt_out.data.range(479,448) = pkt_in.data.range(479,448) + temp;
    pkt_out.data.range(511,480) = pkt_in.data.range(511,480) + temp;

    pkt_out.keep = pkt_in.keep;
    pkt_out.strb = pkt_in.strb;
    pkt_out.user = pkt_in.user;
    pkt_out.last = pkt_in.last;
    pkt_out.id = pkt_in.id;
    pkt_out.dest = pkt_in.dest;

    // pipeline stage 3
    k2n.write(pkt_out);
  }
}
}
