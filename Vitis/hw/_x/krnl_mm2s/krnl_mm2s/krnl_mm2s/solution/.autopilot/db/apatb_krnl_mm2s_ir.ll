; ModuleID = '/home/Will/Documents/Research-Files/G-FPin_HW/Vitis/Basic_kernels/_x/krnl_mm2s/krnl_mm2s/krnl_mm2s/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<512>" = type { %"struct.ap_int_base<512, false>" }
%"struct.ap_int_base<512, false>" = type { %"struct.ssdm_int<512, false>" }
%"struct.ssdm_int<512, false>" = type { i512 }
%"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>" = type { %"struct.hls::axis<ap_uint<512>, 1, 1, 16>" }
%"struct.hls::axis<ap_uint<512>, 1, 1, 16>" = type { %"struct.ap_uint<512>", %"struct.ap_uint<64>", %"struct.ap_uint<64>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<16>" }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }

; Function Attrs: noinline
define void @apatb_krnl_mm2s_ir(%"struct.ap_uint<512>"* %in, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %k2n, i32 %size, i32 %dest) local_unnamed_addr #0 {
entry:
  %in_copy = alloca i512, align 512
  %k2n_copy.data = alloca i512
  %k2n_copy.keep = alloca i64
  %k2n_copy.strb = alloca i64
  %k2n_copy.user = alloca i1
  %k2n_copy.last = alloca i1
  %k2n_copy.id = alloca i1
  %k2n_copy.dest = alloca i16
  call fastcc void @copy_in(%"struct.ap_uint<512>"* %in, i512* nonnull align 512 %in_copy, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %k2n, i512* %k2n_copy.data, i64* %k2n_copy.keep, i64* %k2n_copy.strb, i1* %k2n_copy.user, i1* %k2n_copy.last, i1* %k2n_copy.id, i16* %k2n_copy.dest)
  call void @apatb_krnl_mm2s_hw(i512* %in_copy, i512* %k2n_copy.data, i64* %k2n_copy.keep, i64* %k2n_copy.strb, i1* %k2n_copy.user, i1* %k2n_copy.last, i1* %k2n_copy.id, i16* %k2n_copy.dest, i32 %size, i32 %dest)
  call fastcc void @copy_out(%"struct.ap_uint<512>"* %in, i512* nonnull align 512 %in_copy, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %k2n, i512* %k2n_copy.data, i64* %k2n_copy.keep, i64* %k2n_copy.strb, i1* %k2n_copy.user, i1* %k2n_copy.last, i1* %k2n_copy.id, i16* %k2n_copy.dest)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"struct.ap_uint<512>"* readonly, i512* noalias align 512, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"*, i512* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.4" %_V_last_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.5" %_V_id_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.6" %_V_dest_V) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* align 512 %1, %"struct.ap_uint<512>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>.11"(i512* %_V_data_V, i64* %_V_keep_V, i64* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, i1* %_V_id_V, i16* %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>"(i512* noalias align 512, %"struct.ap_uint<512>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i512* %0, null
  %3 = icmp eq %"struct.ap_uint<512>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<512>", %"struct.ap_uint<512>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = load i512, i512* %.0.0.04, align 64
  store i512 %5, i512* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"(%"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i512* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.5" %_V_id_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.6" %_V_dest_V) unnamed_addr #3 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"(%"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* nonnull align 512 %0, i512* %_V_data_V, i64* %_V_keep_V, i64* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, i1* %_V_id_V, i16* %_V_dest_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"(%"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i512* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i64* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i64* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_user_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.4" %_V_last_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.5" %_V_id_V, i16* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.6" %_V_dest_V) unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"
  %2 = alloca i512
  %3 = alloca i64
  %4 = alloca i64
  %5 = alloca i1
  %6 = alloca i1
  %7 = alloca i1
  %8 = alloca i16
  br label %empty

empty:                                            ; preds = %push, %entry
  %9 = bitcast i512* %_V_data_V to i8*
  %10 = call i1 @fpga_fifo_not_empty_64(i8* %9)
  br i1 %10, label %push, label %ret

push:                                             ; preds = %empty
  %11 = bitcast i512* %2 to i8*
  %12 = bitcast i512* %_V_data_V to i8*
  call void @fpga_fifo_pop_64(i8* %11, i8* %12)
  %13 = load volatile i512, i512* %2
  %14 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 0
  %15 = bitcast %"struct.ap_uint<512>"* %14 to i512*
  store i512 %13, i512* %15
  %16 = bitcast i64* %4 to i8*
  %17 = bitcast i64* %_V_keep_V to i8*
  call void @fpga_fifo_pop_8(i8* %16, i8* %17)
  %18 = load volatile i64, i64* %4
  %19 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 1
  %20 = bitcast %"struct.ap_uint<64>"* %19 to i64*
  store i64 %18, i64* %20
  %21 = bitcast i64* %3 to i8*
  %22 = bitcast i64* %_V_strb_V to i8*
  call void @fpga_fifo_pop_8(i8* %21, i8* %22)
  %23 = load volatile i64, i64* %3
  %24 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 2
  %25 = bitcast %"struct.ap_uint<64>"* %24 to i64*
  store i64 %23, i64* %25
  %26 = bitcast i1* %7 to i8*
  %27 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_pop_1(i8* %26, i8* %27)
  %28 = bitcast i1* %7 to i8*
  %29 = load i8, i8* %28
  %30 = trunc i8 %29 to i1
  %31 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 3
  %32 = bitcast %"struct.ap_uint<1>"* %31 to i1*
  store i1 %30, i1* %32
  %33 = bitcast i1* %6 to i8*
  %34 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %33, i8* %34)
  %35 = bitcast i1* %6 to i8*
  %36 = load i8, i8* %35
  %37 = trunc i8 %36 to i1
  %38 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 4
  %39 = bitcast %"struct.ap_uint<1>"* %38 to i1*
  store i1 %37, i1* %39
  %40 = bitcast i1* %5 to i8*
  %41 = bitcast i1* %_V_id_V to i8*
  call void @fpga_fifo_pop_1(i8* %40, i8* %41)
  %42 = bitcast i1* %5 to i8*
  %43 = load i8, i8* %42
  %44 = trunc i8 %43 to i1
  %45 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 5
  %46 = bitcast %"struct.ap_uint<1>"* %45 to i1*
  store i1 %44, i1* %46
  %47 = bitcast i16* %8 to i8*
  %48 = bitcast i16* %_V_dest_V to i8*
  call void @fpga_fifo_pop_2(i8* %47, i8* %48)
  %49 = load volatile i16, i16* %8
  %50 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 6
  %51 = bitcast %"struct.ap_uint<16>"* %50 to i16*
  store i16 %49, i16* %51
  %52 = bitcast %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1 to i8*
  %53 = bitcast %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %0 to i8*
  call void @fpga_fifo_push_128(i8* %52, i8* %53)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"struct.ap_uint<512>"*, i512* noalias readonly align 512, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"*, i512* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.4" %_V_last_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.5" %_V_id_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.6" %_V_dest_V) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.4"(%"struct.ap_uint<512>"* %0, i512* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"(%"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %2, i512* %_V_data_V, i64* %_V_keep_V, i64* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, i1* %_V_id_V, i16* %_V_dest_V)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<512>.4"(%"struct.ap_uint<512>"* noalias, i512* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<512>"* %0, null
  %3 = icmp eq i512* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<512>", %"struct.ap_uint<512>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = load i512, i512* %1, align 512
  store i512 %5, i512* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>.11"(i512* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_user_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.4" %_V_last_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.5" %_V_id_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>.14"(i512* %_V_data_V, i64* %_V_keep_V, i64* %_V_strb_V, i1* %_V_user_V, i1* %_V_last_V, i1* %_V_id_V, i16* %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>.14"(i512* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i64* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i64* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_user_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.4" %_V_last_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.5" %_V_id_V, i16* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"
  %2 = alloca %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_128(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_128(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %2
  store %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>" %7, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1
  %8 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.ap_uint<512>"* %8 to i512*
  %10 = bitcast i512* %9 to i8*
  %11 = bitcast i512* %_V_data_V to i8*
  call void @fpga_fifo_push_64(i8* %10, i8* %11)
  %12 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 1
  %13 = bitcast %"struct.ap_uint<64>"* %12 to i64*
  %14 = bitcast i64* %13 to i8*
  %15 = bitcast i64* %_V_keep_V to i8*
  call void @fpga_fifo_push_8(i8* %14, i8* %15)
  %16 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 2
  %17 = bitcast %"struct.ap_uint<64>"* %16 to i64*
  %18 = bitcast i64* %17 to i8*
  %19 = bitcast i64* %_V_strb_V to i8*
  call void @fpga_fifo_push_8(i8* %18, i8* %19)
  %20 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 3
  %21 = bitcast %"struct.ap_uint<1>"* %20 to i1*
  %22 = bitcast i1* %21 to i8*
  %23 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_push_1(i8* %22, i8* %23)
  %24 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 4
  %25 = bitcast %"struct.ap_uint<1>"* %24 to i1*
  %26 = bitcast i1* %25 to i8*
  %27 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %26, i8* %27)
  %28 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 5
  %29 = bitcast %"struct.ap_uint<1>"* %28 to i1*
  %30 = bitcast i1* %29 to i8*
  %31 = bitcast i1* %_V_id_V to i8*
  call void @fpga_fifo_push_1(i8* %30, i8* %31)
  %32 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>", %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %1, i32 0, i32 0, i32 6
  %33 = bitcast %"struct.ap_uint<16>"* %32 to i16*
  %34 = bitcast i16* %33 to i8*
  %35 = bitcast i16* %_V_dest_V to i8*
  call void @fpga_fifo_push_2(i8* %34, i8* %35)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_krnl_mm2s_hw(i512*, i512*, i64*, i64*, i1*, i1*, i1*, i16*, i32, i32)

define void @krnl_mm2s_hw_stub_wrapper(i512*, i512*, i64*, i64*, i1*, i1*, i1*, i16*, i32, i32) #6 {
entry:
  %10 = alloca %"struct.ap_uint<512>"
  %11 = alloca %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"
  call void @copy_out(%"struct.ap_uint<512>"* %10, i512* %0, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %11, i512* %1, i64* %2, i64* %3, i1* %4, i1* %5, i1* %6, i16* %7)
  call void @krnl_mm2s_hw_stub(%"struct.ap_uint<512>"* %10, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %11, i32 %8, i32 %9)
  call void @copy_in(%"struct.ap_uint<512>"* %10, i512* %0, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"* %11, i512* %1, i64* %2, i64* %3, i1* %4, i1* %5, i1* %6, i16* %7)
  ret void
}

declare void @krnl_mm2s_hw_stub(%"struct.ap_uint<512>"*, %"class.hls::stream<hls::axis<ap_uint<512>, 1, 1, 16>, 0>"*, i32, i32)

declare i1 @fpga_fifo_not_empty_128(i8*)

declare i1 @fpga_fifo_not_empty_64(i8*)

declare void @fpga_fifo_pop_128(i8*, i8*)

declare void @fpga_fifo_pop_64(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_push_128(i8*, i8*)

declare void @fpga_fifo_push_64(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
