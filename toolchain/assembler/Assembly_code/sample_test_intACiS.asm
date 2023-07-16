// starting address of HBM data is 0x20000 (below that are immediate values)
// assuming HBM memory is byte-addressable
            vsetivli zero, 44, e32, m2
            vle32.v v1, (x0) // init v1 to zero 
            lui x7, 0x00020 // x7 is now equal to 0x20000 (points to values 2 in decimal)
            vle32.v v0, (x7) // vectorization for LOOP_K - weights
            vmacc.vx v1, x0, vs // vs is stream_in
            streamout.v v1
            wfi