; ModuleID = 'gcn.cpp'
source_filename = "gcn.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@stream_out = dso_local local_unnamed_addr global [1767 x float] zeroinitializer, align 16
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_gcn.cpp, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind uwtable writeonly
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #3 {
entry:
  %rf0 = alloca [272 x float], align 16
  %rf0393 = bitcast [272 x float]* %rf0 to <16 x float>*
  %0 = bitcast [272 x float]* %rf0 to i8*
  %stream_in = alloca [3122289 x float], align 16
  %hbm0 = alloca [1767 x float], align 16
  call void @llvm.lifetime.start.p0i8(i64 1088, i8* nonnull %0) #7
  %1 = bitcast [3122289 x float]* %stream_in to i8*
  call void @llvm.lifetime.start.p0i8(i64 12489156, i8* nonnull %1) #7
  %2 = bitcast [1767 x float]* %hbm0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 7068, i8* nonnull %2) #7
  %scevgep191 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 16
  %scevgep191192 = bitcast float* %scevgep191 to i8*
  %scevgep220.1 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 32
  %scevgep220221.1 = bitcast float* %scevgep220.1 to i8*
  %scevgep220.2 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 48
  %scevgep220221.2 = bitcast float* %scevgep220.2 to i8*
  %scevgep220.3 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 64
  %scevgep220221.3 = bitcast float* %scevgep220.3 to i8*
  %scevgep220.4 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 80
  %scevgep220221.4 = bitcast float* %scevgep220.4 to i8*
  %scevgep220.5 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 96
  %scevgep220221.5 = bitcast float* %scevgep220.5 to i8*
  %scevgep220.6 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 112
  %scevgep220221.6 = bitcast float* %scevgep220.6 to i8*
  %scevgep220.7 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 128
  %scevgep220221.7 = bitcast float* %scevgep220.7 to i8*
  %scevgep220.8 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 144
  %scevgep220221.8 = bitcast float* %scevgep220.8 to i8*
  %scevgep220.9 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 160
  %scevgep220221.9 = bitcast float* %scevgep220.9 to i8*
  %scevgep220.10 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 176
  %scevgep220221.10 = bitcast float* %scevgep220.10 to i8*
  %scevgep220.11 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 192
  %scevgep220221.11 = bitcast float* %scevgep220.11 to i8*
  %scevgep220.12 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 208
  %scevgep220221.12 = bitcast float* %scevgep220.12 to i8*
  %scevgep220.13 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 224
  %scevgep220221.13 = bitcast float* %scevgep220.13 to i8*
  %scevgep220.14 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 240
  %scevgep220221.14 = bitcast float* %scevgep220.14 to i8*
  %scevgep220.15 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 256
  %scevgep220221.15 = bitcast float* %scevgep220.15 to i8*
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond94.preheader, %entry
  %indvar214 = phi i64 [ 0, %entry ], [ %indvar.next215, %for.cond94.preheader ]
  %3 = shl nuw nsw i64 %indvar214, 8
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(1024) %scevgep191192, i8 0, i64 1024, i1 false)
  %4 = mul nuw nsw i64 %indvar214, 452352
  br label %for.cond22.preheader

for.cond.cleanup:                                 ; preds = %for.cond94.preheader
  call void @llvm.lifetime.end.p0i8(i64 7068, i8* nonnull %2) #7
  call void @llvm.lifetime.end.p0i8(i64 12489156, i8* nonnull %1) #7
  call void @llvm.lifetime.end.p0i8(i64 1088, i8* nonnull %0) #7
  ret i32 0

for.cond94.preheader:                             ; preds = %for.cond.cleanup49.critedge.15
  %scevgep218 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %3
  %scevgep218219 = bitcast float* %scevgep218 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219, i8* nonnull align 16 dereferenceable(64) %scevgep191192, i64 64, i1 false)
  %5 = or i64 %3, 16
  %scevgep218.1 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %5
  %scevgep218219.1 = bitcast float* %scevgep218.1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.1, i8* nonnull align 16 dereferenceable(64) %scevgep220221.1, i64 64, i1 false)
  %6 = or i64 %3, 32
  %scevgep218.2 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %6
  %scevgep218219.2 = bitcast float* %scevgep218.2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.2, i8* nonnull align 16 dereferenceable(64) %scevgep220221.2, i64 64, i1 false)
  %7 = or i64 %3, 48
  %scevgep218.3 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %7
  %scevgep218219.3 = bitcast float* %scevgep218.3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.3, i8* nonnull align 16 dereferenceable(64) %scevgep220221.3, i64 64, i1 false)
  %8 = or i64 %3, 64
  %scevgep218.4 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %8
  %scevgep218219.4 = bitcast float* %scevgep218.4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.4, i8* nonnull align 16 dereferenceable(64) %scevgep220221.4, i64 64, i1 false)
  %9 = or i64 %3, 80
  %scevgep218.5 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %9
  %scevgep218219.5 = bitcast float* %scevgep218.5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.5, i8* nonnull align 16 dereferenceable(64) %scevgep220221.5, i64 64, i1 false)
  %10 = or i64 %3, 96
  %scevgep218.6 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %10
  %scevgep218219.6 = bitcast float* %scevgep218.6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.6, i8* nonnull align 16 dereferenceable(64) %scevgep220221.6, i64 64, i1 false)
  %11 = or i64 %3, 112
  %scevgep218.7 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %11
  %scevgep218219.7 = bitcast float* %scevgep218.7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.7, i8* nonnull align 16 dereferenceable(64) %scevgep220221.7, i64 64, i1 false)
  %12 = or i64 %3, 128
  %scevgep218.8 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %12
  %scevgep218219.8 = bitcast float* %scevgep218.8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.8, i8* nonnull align 16 dereferenceable(64) %scevgep220221.8, i64 64, i1 false)
  %13 = or i64 %3, 144
  %scevgep218.9 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %13
  %scevgep218219.9 = bitcast float* %scevgep218.9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.9, i8* nonnull align 16 dereferenceable(64) %scevgep220221.9, i64 64, i1 false)
  %14 = or i64 %3, 160
  %scevgep218.10 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %14
  %scevgep218219.10 = bitcast float* %scevgep218.10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.10, i8* nonnull align 16 dereferenceable(64) %scevgep220221.10, i64 64, i1 false)
  %15 = or i64 %3, 176
  %scevgep218.11 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %15
  %scevgep218219.11 = bitcast float* %scevgep218.11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.11, i8* nonnull align 16 dereferenceable(64) %scevgep220221.11, i64 64, i1 false)
  %16 = or i64 %3, 192
  %scevgep218.12 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %16
  %scevgep218219.12 = bitcast float* %scevgep218.12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.12, i8* nonnull align 16 dereferenceable(64) %scevgep220221.12, i64 64, i1 false)
  %17 = or i64 %3, 208
  %scevgep218.13 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %17
  %scevgep218219.13 = bitcast float* %scevgep218.13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.13, i8* nonnull align 16 dereferenceable(64) %scevgep220221.13, i64 64, i1 false)
  %18 = or i64 %3, 224
  %scevgep218.14 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %18
  %scevgep218219.14 = bitcast float* %scevgep218.14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.14, i8* nonnull align 16 dereferenceable(64) %scevgep220221.14, i64 64, i1 false)
  %19 = or i64 %3, 240
  %scevgep218.15 = getelementptr [1767 x float], [1767 x float]* @stream_out, i64 0, i64 %19
  %scevgep218219.15 = bitcast float* %scevgep218.15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %scevgep218219.15, i8* nonnull align 16 dereferenceable(64) %scevgep220221.15, i64 64, i1 false)
  %indvar.next215 = add nuw nsw i64 %indvar214, 1
  %exitcond225.not = icmp eq i64 %indvar.next215, 6
  br i1 %exitcond225.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !2

for.cond22.preheader:                             ; preds = %for.cond.cleanup49.critedge.15, %for.cond1.preheader
  %indvar = phi i64 [ 0, %for.cond1.preheader ], [ %indvar.next, %for.cond.cleanup49.critedge.15 ]
  %20 = shl nuw nsw i64 %indvar, 4
  %scevgep = getelementptr [1767 x float], [1767 x float]* %hbm0, i64 0, i64 %20
  %scevgep194 = bitcast float* %scevgep to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %0, i8* nonnull align 16 dereferenceable(64) %scevgep194, i64 64, i1 false)
  %21 = shl nsw i64 %indvar, 8
  %load_initial = load <16 x float>, <16 x float>* %rf0393, align 16
  br label %vector.body384

vector.body384:                                   ; preds = %vector.body384, %for.cond22.preheader
  %store_forwarded = phi <16 x float> [ %load_initial, %for.cond22.preheader ], [ %30, %vector.body384 ]
  %index386 = phi i64 [ 0, %for.cond22.preheader ], [ %index.next387, %vector.body384 ]
  %22 = add nuw nsw i64 %index386, 16
  %23 = add nuw nsw i64 %index386, %4
  %24 = add nuw nsw i64 %23, %21
  %25 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %24
  %26 = bitcast float* %25 to <16 x float>*
  %wide.load390 = load <16 x float>, <16 x float>* %26, align 16, !tbaa !4
  %27 = fmul <16 x float> %wide.load390, %store_forwarded
  %28 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %22
  %29 = bitcast float* %28 to <16 x float>*
  %wide.load392 = load <16 x float>, <16 x float>* %29, align 16, !tbaa !4
  %30 = fadd <16 x float> %wide.load392, %27
  %31 = bitcast float* %28 to <16 x float>*
  store <16 x float> %30, <16 x float>* %31, align 16, !tbaa !4
  %index.next387 = add i64 %index386, 16
  %32 = icmp eq i64 %index386, 0
  br i1 %32, label %vector.body373, label %vector.body384, !llvm.loop !8

vector.body373:                                   ; preds = %vector.body384, %vector.body373
  %index375 = phi i64 [ %index.next376, %vector.body373 ], [ 0, %vector.body384 ]
  %33 = add nuw nsw i64 %index375, 16
  %34 = add nuw nsw i64 %index375, 32
  %35 = add nuw nsw i64 %33, %4
  %36 = add nuw nsw i64 %35, %21
  %37 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %36
  %38 = bitcast float* %37 to <16 x float>*
  %wide.load379 = load <16 x float>, <16 x float>* %38, align 16, !tbaa !4
  %39 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index375
  %40 = bitcast float* %39 to <16 x float>*
  %wide.load380 = load <16 x float>, <16 x float>* %40, align 16, !tbaa !4
  %41 = fmul <16 x float> %wide.load379, %wide.load380
  %42 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %34
  %43 = bitcast float* %42 to <16 x float>*
  %wide.load381 = load <16 x float>, <16 x float>* %43, align 16, !tbaa !4
  %44 = fadd <16 x float> %wide.load381, %41
  %45 = bitcast float* %42 to <16 x float>*
  store <16 x float> %44, <16 x float>* %45, align 16, !tbaa !4
  %index.next376 = add i64 %index375, 16
  %46 = icmp eq i64 %index375, 0
  br i1 %46, label %vector.body362, label %vector.body373, !llvm.loop !10

vector.body362:                                   ; preds = %vector.body373, %vector.body362
  %index364 = phi i64 [ %index.next365, %vector.body362 ], [ 0, %vector.body373 ]
  %47 = add nuw nsw i64 %index364, 32
  %48 = add nuw nsw i64 %index364, 48
  %49 = add nuw nsw i64 %47, %4
  %50 = add nuw nsw i64 %49, %21
  %51 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %50
  %52 = bitcast float* %51 to <16 x float>*
  %wide.load368 = load <16 x float>, <16 x float>* %52, align 16, !tbaa !4
  %53 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index364
  %54 = bitcast float* %53 to <16 x float>*
  %wide.load369 = load <16 x float>, <16 x float>* %54, align 16, !tbaa !4
  %55 = fmul <16 x float> %wide.load368, %wide.load369
  %56 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %48
  %57 = bitcast float* %56 to <16 x float>*
  %wide.load370 = load <16 x float>, <16 x float>* %57, align 16, !tbaa !4
  %58 = fadd <16 x float> %wide.load370, %55
  %59 = bitcast float* %56 to <16 x float>*
  store <16 x float> %58, <16 x float>* %59, align 16, !tbaa !4
  %index.next365 = add i64 %index364, 16
  %60 = icmp eq i64 %index364, 0
  br i1 %60, label %vector.body351, label %vector.body362, !llvm.loop !11

vector.body351:                                   ; preds = %vector.body362, %vector.body351
  %index353 = phi i64 [ %index.next354, %vector.body351 ], [ 0, %vector.body362 ]
  %61 = add nuw nsw i64 %index353, 48
  %62 = add nuw nsw i64 %index353, 64
  %63 = add nuw nsw i64 %61, %4
  %64 = add nuw nsw i64 %63, %21
  %65 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %64
  %66 = bitcast float* %65 to <16 x float>*
  %wide.load357 = load <16 x float>, <16 x float>* %66, align 16, !tbaa !4
  %67 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index353
  %68 = bitcast float* %67 to <16 x float>*
  %wide.load358 = load <16 x float>, <16 x float>* %68, align 16, !tbaa !4
  %69 = fmul <16 x float> %wide.load357, %wide.load358
  %70 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %62
  %71 = bitcast float* %70 to <16 x float>*
  %wide.load359 = load <16 x float>, <16 x float>* %71, align 16, !tbaa !4
  %72 = fadd <16 x float> %wide.load359, %69
  %73 = bitcast float* %70 to <16 x float>*
  store <16 x float> %72, <16 x float>* %73, align 16, !tbaa !4
  %index.next354 = add i64 %index353, 16
  %74 = icmp eq i64 %index353, 0
  br i1 %74, label %vector.body340, label %vector.body351, !llvm.loop !12

vector.body340:                                   ; preds = %vector.body351, %vector.body340
  %index342 = phi i64 [ %index.next343, %vector.body340 ], [ 0, %vector.body351 ]
  %75 = add nuw nsw i64 %index342, 64
  %76 = add nuw nsw i64 %index342, 80
  %77 = add nuw nsw i64 %75, %4
  %78 = add nuw nsw i64 %77, %21
  %79 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %78
  %80 = bitcast float* %79 to <16 x float>*
  %wide.load346 = load <16 x float>, <16 x float>* %80, align 16, !tbaa !4
  %81 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index342
  %82 = bitcast float* %81 to <16 x float>*
  %wide.load347 = load <16 x float>, <16 x float>* %82, align 16, !tbaa !4
  %83 = fmul <16 x float> %wide.load346, %wide.load347
  %84 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %76
  %85 = bitcast float* %84 to <16 x float>*
  %wide.load348 = load <16 x float>, <16 x float>* %85, align 16, !tbaa !4
  %86 = fadd <16 x float> %wide.load348, %83
  %87 = bitcast float* %84 to <16 x float>*
  store <16 x float> %86, <16 x float>* %87, align 16, !tbaa !4
  %index.next343 = add i64 %index342, 16
  %88 = icmp eq i64 %index342, 0
  br i1 %88, label %vector.body329, label %vector.body340, !llvm.loop !13

vector.body329:                                   ; preds = %vector.body340, %vector.body329
  %index331 = phi i64 [ %index.next332, %vector.body329 ], [ 0, %vector.body340 ]
  %89 = add nuw nsw i64 %index331, 80
  %90 = add nuw nsw i64 %index331, 96
  %91 = add nuw nsw i64 %89, %4
  %92 = add nuw nsw i64 %91, %21
  %93 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %92
  %94 = bitcast float* %93 to <16 x float>*
  %wide.load335 = load <16 x float>, <16 x float>* %94, align 16, !tbaa !4
  %95 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index331
  %96 = bitcast float* %95 to <16 x float>*
  %wide.load336 = load <16 x float>, <16 x float>* %96, align 16, !tbaa !4
  %97 = fmul <16 x float> %wide.load335, %wide.load336
  %98 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %90
  %99 = bitcast float* %98 to <16 x float>*
  %wide.load337 = load <16 x float>, <16 x float>* %99, align 16, !tbaa !4
  %100 = fadd <16 x float> %wide.load337, %97
  %101 = bitcast float* %98 to <16 x float>*
  store <16 x float> %100, <16 x float>* %101, align 16, !tbaa !4
  %index.next332 = add i64 %index331, 16
  %102 = icmp eq i64 %index331, 0
  br i1 %102, label %vector.body318, label %vector.body329, !llvm.loop !14

vector.body318:                                   ; preds = %vector.body329, %vector.body318
  %index320 = phi i64 [ %index.next321, %vector.body318 ], [ 0, %vector.body329 ]
  %103 = add nuw nsw i64 %index320, 96
  %104 = add nuw nsw i64 %index320, 112
  %105 = add nuw nsw i64 %103, %4
  %106 = add nuw nsw i64 %105, %21
  %107 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %106
  %108 = bitcast float* %107 to <16 x float>*
  %wide.load324 = load <16 x float>, <16 x float>* %108, align 16, !tbaa !4
  %109 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index320
  %110 = bitcast float* %109 to <16 x float>*
  %wide.load325 = load <16 x float>, <16 x float>* %110, align 16, !tbaa !4
  %111 = fmul <16 x float> %wide.load324, %wide.load325
  %112 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %104
  %113 = bitcast float* %112 to <16 x float>*
  %wide.load326 = load <16 x float>, <16 x float>* %113, align 16, !tbaa !4
  %114 = fadd <16 x float> %wide.load326, %111
  %115 = bitcast float* %112 to <16 x float>*
  store <16 x float> %114, <16 x float>* %115, align 16, !tbaa !4
  %index.next321 = add i64 %index320, 16
  %116 = icmp eq i64 %index320, 0
  br i1 %116, label %vector.body307, label %vector.body318, !llvm.loop !15

vector.body307:                                   ; preds = %vector.body318, %vector.body307
  %index309 = phi i64 [ %index.next310, %vector.body307 ], [ 0, %vector.body318 ]
  %117 = add nuw nsw i64 %index309, 112
  %118 = add nuw nsw i64 %index309, 128
  %119 = add nuw nsw i64 %117, %4
  %120 = add nuw nsw i64 %119, %21
  %121 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %120
  %122 = bitcast float* %121 to <16 x float>*
  %wide.load313 = load <16 x float>, <16 x float>* %122, align 16, !tbaa !4
  %123 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index309
  %124 = bitcast float* %123 to <16 x float>*
  %wide.load314 = load <16 x float>, <16 x float>* %124, align 16, !tbaa !4
  %125 = fmul <16 x float> %wide.load313, %wide.load314
  %126 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %118
  %127 = bitcast float* %126 to <16 x float>*
  %wide.load315 = load <16 x float>, <16 x float>* %127, align 16, !tbaa !4
  %128 = fadd <16 x float> %wide.load315, %125
  %129 = bitcast float* %126 to <16 x float>*
  store <16 x float> %128, <16 x float>* %129, align 16, !tbaa !4
  %index.next310 = add i64 %index309, 16
  %130 = icmp eq i64 %index309, 0
  br i1 %130, label %vector.body296, label %vector.body307, !llvm.loop !16

vector.body296:                                   ; preds = %vector.body307, %vector.body296
  %index298 = phi i64 [ %index.next299, %vector.body296 ], [ 0, %vector.body307 ]
  %131 = add nuw nsw i64 %index298, 128
  %132 = add nuw nsw i64 %index298, 144
  %133 = add nuw nsw i64 %131, %4
  %134 = add nuw nsw i64 %133, %21
  %135 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %134
  %136 = bitcast float* %135 to <16 x float>*
  %wide.load302 = load <16 x float>, <16 x float>* %136, align 16, !tbaa !4
  %137 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index298
  %138 = bitcast float* %137 to <16 x float>*
  %wide.load303 = load <16 x float>, <16 x float>* %138, align 16, !tbaa !4
  %139 = fmul <16 x float> %wide.load302, %wide.load303
  %140 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %132
  %141 = bitcast float* %140 to <16 x float>*
  %wide.load304 = load <16 x float>, <16 x float>* %141, align 16, !tbaa !4
  %142 = fadd <16 x float> %wide.load304, %139
  %143 = bitcast float* %140 to <16 x float>*
  store <16 x float> %142, <16 x float>* %143, align 16, !tbaa !4
  %index.next299 = add i64 %index298, 16
  %144 = icmp eq i64 %index298, 0
  br i1 %144, label %vector.body285, label %vector.body296, !llvm.loop !17

vector.body285:                                   ; preds = %vector.body296, %vector.body285
  %index287 = phi i64 [ %index.next288, %vector.body285 ], [ 0, %vector.body296 ]
  %145 = add nuw nsw i64 %index287, 144
  %146 = add nuw nsw i64 %index287, 160
  %147 = add nuw nsw i64 %145, %4
  %148 = add nuw nsw i64 %147, %21
  %149 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %148
  %150 = bitcast float* %149 to <16 x float>*
  %wide.load291 = load <16 x float>, <16 x float>* %150, align 16, !tbaa !4
  %151 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index287
  %152 = bitcast float* %151 to <16 x float>*
  %wide.load292 = load <16 x float>, <16 x float>* %152, align 16, !tbaa !4
  %153 = fmul <16 x float> %wide.load291, %wide.load292
  %154 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %146
  %155 = bitcast float* %154 to <16 x float>*
  %wide.load293 = load <16 x float>, <16 x float>* %155, align 16, !tbaa !4
  %156 = fadd <16 x float> %wide.load293, %153
  %157 = bitcast float* %154 to <16 x float>*
  store <16 x float> %156, <16 x float>* %157, align 16, !tbaa !4
  %index.next288 = add i64 %index287, 16
  %158 = icmp eq i64 %index287, 0
  br i1 %158, label %vector.body274, label %vector.body285, !llvm.loop !18

vector.body274:                                   ; preds = %vector.body285, %vector.body274
  %index276 = phi i64 [ %index.next277, %vector.body274 ], [ 0, %vector.body285 ]
  %159 = add nuw nsw i64 %index276, 160
  %160 = add nuw nsw i64 %index276, 176
  %161 = add nuw nsw i64 %159, %4
  %162 = add nuw nsw i64 %161, %21
  %163 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %162
  %164 = bitcast float* %163 to <16 x float>*
  %wide.load280 = load <16 x float>, <16 x float>* %164, align 16, !tbaa !4
  %165 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index276
  %166 = bitcast float* %165 to <16 x float>*
  %wide.load281 = load <16 x float>, <16 x float>* %166, align 16, !tbaa !4
  %167 = fmul <16 x float> %wide.load280, %wide.load281
  %168 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %160
  %169 = bitcast float* %168 to <16 x float>*
  %wide.load282 = load <16 x float>, <16 x float>* %169, align 16, !tbaa !4
  %170 = fadd <16 x float> %wide.load282, %167
  %171 = bitcast float* %168 to <16 x float>*
  store <16 x float> %170, <16 x float>* %171, align 16, !tbaa !4
  %index.next277 = add i64 %index276, 16
  %172 = icmp eq i64 %index276, 0
  br i1 %172, label %vector.body263, label %vector.body274, !llvm.loop !19

vector.body263:                                   ; preds = %vector.body274, %vector.body263
  %index265 = phi i64 [ %index.next266, %vector.body263 ], [ 0, %vector.body274 ]
  %173 = add nuw nsw i64 %index265, 176
  %174 = add nuw nsw i64 %index265, 192
  %175 = add nuw nsw i64 %173, %4
  %176 = add nuw nsw i64 %175, %21
  %177 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %176
  %178 = bitcast float* %177 to <16 x float>*
  %wide.load269 = load <16 x float>, <16 x float>* %178, align 16, !tbaa !4
  %179 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index265
  %180 = bitcast float* %179 to <16 x float>*
  %wide.load270 = load <16 x float>, <16 x float>* %180, align 16, !tbaa !4
  %181 = fmul <16 x float> %wide.load269, %wide.load270
  %182 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %174
  %183 = bitcast float* %182 to <16 x float>*
  %wide.load271 = load <16 x float>, <16 x float>* %183, align 16, !tbaa !4
  %184 = fadd <16 x float> %wide.load271, %181
  %185 = bitcast float* %182 to <16 x float>*
  store <16 x float> %184, <16 x float>* %185, align 16, !tbaa !4
  %index.next266 = add i64 %index265, 16
  %186 = icmp eq i64 %index265, 0
  br i1 %186, label %vector.body252, label %vector.body263, !llvm.loop !20

vector.body252:                                   ; preds = %vector.body263, %vector.body252
  %index254 = phi i64 [ %index.next255, %vector.body252 ], [ 0, %vector.body263 ]
  %187 = add nuw nsw i64 %index254, 192
  %188 = add nuw nsw i64 %index254, 208
  %189 = add nuw nsw i64 %187, %4
  %190 = add nuw nsw i64 %189, %21
  %191 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %190
  %192 = bitcast float* %191 to <16 x float>*
  %wide.load258 = load <16 x float>, <16 x float>* %192, align 16, !tbaa !4
  %193 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index254
  %194 = bitcast float* %193 to <16 x float>*
  %wide.load259 = load <16 x float>, <16 x float>* %194, align 16, !tbaa !4
  %195 = fmul <16 x float> %wide.load258, %wide.load259
  %196 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %188
  %197 = bitcast float* %196 to <16 x float>*
  %wide.load260 = load <16 x float>, <16 x float>* %197, align 16, !tbaa !4
  %198 = fadd <16 x float> %wide.load260, %195
  %199 = bitcast float* %196 to <16 x float>*
  store <16 x float> %198, <16 x float>* %199, align 16, !tbaa !4
  %index.next255 = add i64 %index254, 16
  %200 = icmp eq i64 %index254, 0
  br i1 %200, label %vector.body241, label %vector.body252, !llvm.loop !21

vector.body241:                                   ; preds = %vector.body252, %vector.body241
  %index243 = phi i64 [ %index.next244, %vector.body241 ], [ 0, %vector.body252 ]
  %201 = add nuw nsw i64 %index243, 208
  %202 = add nuw nsw i64 %index243, 224
  %203 = add nuw nsw i64 %201, %4
  %204 = add nuw nsw i64 %203, %21
  %205 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %204
  %206 = bitcast float* %205 to <16 x float>*
  %wide.load247 = load <16 x float>, <16 x float>* %206, align 16, !tbaa !4
  %207 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index243
  %208 = bitcast float* %207 to <16 x float>*
  %wide.load248 = load <16 x float>, <16 x float>* %208, align 16, !tbaa !4
  %209 = fmul <16 x float> %wide.load247, %wide.load248
  %210 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %202
  %211 = bitcast float* %210 to <16 x float>*
  %wide.load249 = load <16 x float>, <16 x float>* %211, align 16, !tbaa !4
  %212 = fadd <16 x float> %wide.load249, %209
  %213 = bitcast float* %210 to <16 x float>*
  store <16 x float> %212, <16 x float>* %213, align 16, !tbaa !4
  %index.next244 = add i64 %index243, 16
  %214 = icmp eq i64 %index243, 0
  br i1 %214, label %vector.body230, label %vector.body241, !llvm.loop !22

vector.body230:                                   ; preds = %vector.body241, %vector.body230
  %index232 = phi i64 [ %index.next233, %vector.body230 ], [ 0, %vector.body241 ]
  %215 = add nuw nsw i64 %index232, 224
  %216 = add nuw nsw i64 %index232, 240
  %217 = add nuw nsw i64 %215, %4
  %218 = add nuw nsw i64 %217, %21
  %219 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %218
  %220 = bitcast float* %219 to <16 x float>*
  %wide.load236 = load <16 x float>, <16 x float>* %220, align 16, !tbaa !4
  %221 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index232
  %222 = bitcast float* %221 to <16 x float>*
  %wide.load237 = load <16 x float>, <16 x float>* %222, align 16, !tbaa !4
  %223 = fmul <16 x float> %wide.load236, %wide.load237
  %224 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %216
  %225 = bitcast float* %224 to <16 x float>*
  %wide.load238 = load <16 x float>, <16 x float>* %225, align 16, !tbaa !4
  %226 = fadd <16 x float> %wide.load238, %223
  %227 = bitcast float* %224 to <16 x float>*
  store <16 x float> %226, <16 x float>* %227, align 16, !tbaa !4
  %index.next233 = add i64 %index232, 16
  %228 = icmp eq i64 %index232, 0
  br i1 %228, label %vector.body, label %vector.body230, !llvm.loop !23

vector.body:                                      ; preds = %vector.body230, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body230 ]
  %229 = add nuw nsw i64 %index, 240
  %230 = add nuw nsw i64 %index, 256
  %231 = add nuw nsw i64 %229, %4
  %232 = add nuw nsw i64 %231, %21
  %233 = getelementptr inbounds [3122289 x float], [3122289 x float]* %stream_in, i64 0, i64 %232
  %234 = bitcast float* %233 to <16 x float>*
  %wide.load = load <16 x float>, <16 x float>* %234, align 16, !tbaa !4
  %235 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %index
  %236 = bitcast float* %235 to <16 x float>*
  %wide.load226 = load <16 x float>, <16 x float>* %236, align 16, !tbaa !4
  %237 = fmul <16 x float> %wide.load, %wide.load226
  %238 = getelementptr inbounds [272 x float], [272 x float]* %rf0, i64 0, i64 %230
  %239 = bitcast float* %238 to <16 x float>*
  %wide.load227 = load <16 x float>, <16 x float>* %239, align 16, !tbaa !4
  %240 = fadd <16 x float> %wide.load227, %237
  %241 = bitcast float* %238 to <16 x float>*
  store <16 x float> %240, <16 x float>* %241, align 16, !tbaa !4
  %index.next = add i64 %index, 16
  %242 = icmp eq i64 %index, 0
  br i1 %242, label %for.cond.cleanup49.critedge.15, label %vector.body, !llvm.loop !24

for.cond.cleanup49.critedge.15:                   ; preds = %vector.body
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond206.not = icmp eq i64 %indvar.next, 1767
  br i1 %exitcond206.not, label %for.cond94.preheader, label %for.cond22.preheader
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_gcn.cpp() #5 section ".text.startup" {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #7
  ret void
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn writeonly }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.1.0"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.unroll.disable"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !3, !9}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !3, !9}
!11 = distinct !{!11, !3, !9}
!12 = distinct !{!12, !3, !9}
!13 = distinct !{!13, !3, !9}
!14 = distinct !{!14, !3, !9}
!15 = distinct !{!15, !3, !9}
!16 = distinct !{!16, !3, !9}
!17 = distinct !{!17, !3, !9}
!18 = distinct !{!18, !3, !9}
!19 = distinct !{!19, !3, !9}
!20 = distinct !{!20, !3, !9}
!21 = distinct !{!21, !3, !9}
!22 = distinct !{!22, !3, !9}
!23 = distinct !{!23, !3, !9}
!24 = distinct !{!24, !3, !9}
