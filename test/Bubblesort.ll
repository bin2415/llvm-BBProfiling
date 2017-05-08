; ModuleID = 'Bubblesort.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@top = common global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %struct.node* null, align 8
@stack = common global [4 x i32] zeroinitializer, align 16
@cellspace = common global [19 x %struct.element] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@movesdone = common global i32 0, align 4
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@rma = common global [41 x [41 x float]] zeroinitializer, align 16
@rmb = common global [41 x [41 x float]] zeroinitializer, align 16
@rmr = common global [41 x [41 x float]] zeroinitializer, align 16
@piececount = common global [4 x i32] zeroinitializer, align 16
@class = common global [13 x i32] zeroinitializer, align 16
@piecemax = common global [13 x i32] zeroinitializer, align 16
@puzzl = common global [512 x i32] zeroinitializer, align 16
@p = common global [13 x [512 x i32]] zeroinitializer, align 16
@n = common global i32 0, align 4
@kount = common global i32 0, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64, i64* @seed, align 8
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, i64* @seed, align 8
  %5 = load i64, i64* @seed, align 8
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
  %i = alloca i32, align 4
  %temp = alloca i64, align 8
  call void @Initrand()
  store i32 0, i32* @biggest, align 4
  store i32 0, i32* @littlest, align 4
  store i32 1, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %42, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp sle i32 %2, 500
  br i1 %3, label %4, label %45

; <label>:4                                       ; preds = %1
  %5 = call i32 @Rand()
  %6 = sext i32 %5 to i64
  store i64 %6, i64* %temp, align 8
  %7 = load i64, i64* %temp, align 8
  %8 = load i64, i64* %temp, align 8
  %9 = sdiv i64 %8, 100000
  %10 = mul nsw i64 %9, 100000
  %11 = sub nsw i64 %7, %10
  %12 = sub nsw i64 %11, 50000
  %13 = trunc i64 %12 to i32
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %15
  store i32 %13, i32* %16, align 4
  %17 = load i32, i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %18
  %20 = load i32, i32* %19, align 4
  %21 = load i32, i32* @biggest, align 4
  %22 = icmp sgt i32 %20, %21
  br i1 %22, label %23, label %28

; <label>:23                                      ; preds = %4
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %25
  %27 = load i32, i32* %26, align 4
  store i32 %27, i32* @biggest, align 4
  br label %41

; <label>:28                                      ; preds = %4
  %29 = load i32, i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %30
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* @littlest, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %40

; <label>:35                                      ; preds = %28
  %36 = load i32, i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %37
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* @littlest, align 4
  br label %40

; <label>:40                                      ; preds = %35, %28
  br label %41

; <label>:41                                      ; preds = %40, %23
  br label %42

; <label>:42                                      ; preds = %41
  %43 = load i32, i32* %i, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %i, align 4
  br label %1

; <label>:45                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @Bubble(i32 %run) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %run, i32* %1, align 4
  call void @bInitarr()
  store i32 500, i32* @top, align 4
  br label %2

; <label>:2                                       ; preds = %42, %0
  %3 = load i32, i32* @top, align 4
  %4 = icmp sgt i32 %3, 1
  br i1 %4, label %5, label %45

; <label>:5                                       ; preds = %2
  store i32 1, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %39, %5
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* @top, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %42

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = icmp sgt i32 %14, %19
  br i1 %20, label %21, label %39

; <label>:21                                      ; preds = %10
  %22 = load i32, i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %23
  %25 = load i32, i32* %24, align 4
  store i32 %25, i32* %j, align 4
  %26 = load i32, i32* %i, align 4
  %27 = add nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %28
  %30 = load i32, i32* %29, align 4
  %31 = load i32, i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %32
  store i32 %30, i32* %33, align 4
  %34 = load i32, i32* %j, align 4
  %35 = load i32, i32* %i, align 4
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %37
  store i32 %34, i32* %38, align 4
  br label %39

; <label>:39                                      ; preds = %21, %10
  %40 = load i32, i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  br label %6

; <label>:42                                      ; preds = %6
  %43 = load i32, i32* @top, align 4
  %44 = sub nsw i32 %43, 1
  store i32 %44, i32* @top, align 4
  br label %2

; <label>:45                                      ; preds = %2
  %46 = load i32, i32* getelementptr inbounds ([5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 1), align 4
  %47 = load i32, i32* @littlest, align 4
  %48 = icmp ne i32 %46, %47
  br i1 %48, label %53, label %49

; <label>:49                                      ; preds = %45
  %50 = load i32, i32* getelementptr inbounds ([5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 500), align 16
  %51 = load i32, i32* @biggest, align 4
  %52 = icmp ne i32 %50, %51
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %49, %45
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0))
  br label %55

; <label>:55                                      ; preds = %53, %49
  %56 = load i32, i32* %1, align 4
  %57 = add nsw i32 %56, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %58
  %60 = load i32, i32* %59, align 4
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %60)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %7, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  call void @Bubble(i32 %6)
  br label %7

; <label>:7                                       ; preds = %5
  %8 = load i32, i32* %i, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %i, align 4
  br label %2

; <label>:10                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}
