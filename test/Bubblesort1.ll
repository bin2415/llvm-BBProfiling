; ModuleID = 'Bubblesort.ll'
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
@CaLlCoUnTeR_BBNums = global i32 0
@CaLlCoUnTeR_table = global [4096 x i32] zeroinitializer

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
"0":
  call void @CaLlCoUnTeR_add1(i32 0)
  store i64 74755, i64* @seed, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
"1":
  call void @CaLlCoUnTeR_add1(i32 1)
  %0 = load i64, i64* @seed, align 8
  %1 = mul nsw i64 %0, 1309
  %2 = add nsw i64 %1, 13849
  %3 = and i64 %2, 65535
  store i64 %3, i64* @seed, align 8
  %4 = load i64, i64* @seed, align 8
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
"2":
  call void @CaLlCoUnTeR_add1(i32 2)
  %i = alloca i32, align 4
  %temp = alloca i64, align 8
  call void @Initrand()
  store i32 0, i32* @biggest, align 4
  store i32 0, i32* @littlest, align 4
  store i32 1, i32* %i, align 4
  br label %"3"

"3":                                              ; preds = %"10", %"2"
  call void @CaLlCoUnTeR_add1(i32 3)
  %0 = load i32, i32* %i, align 4
  %1 = icmp sle i32 %0, 500
  br i1 %1, label %"4", label %"11"

"4":                                              ; preds = %"3"
  call void @CaLlCoUnTeR_add1(i32 4)
  %2 = call i32 @Rand()
  %3 = sext i32 %2 to i64
  store i64 %3, i64* %temp, align 8
  %4 = load i64, i64* %temp, align 8
  %5 = load i64, i64* %temp, align 8
  %6 = sdiv i64 %5, 100000
  %7 = mul nsw i64 %6, 100000
  %8 = sub nsw i64 %4, %7
  %9 = sub nsw i64 %8, 50000
  %10 = trunc i64 %9 to i32
  %11 = load i32, i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %12
  store i32 %10, i32* %13, align 4
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = load i32, i32* @biggest, align 4
  %19 = icmp sgt i32 %17, %18
  br i1 %19, label %"5", label %"6"

"5":                                              ; preds = %"4"
  call void @CaLlCoUnTeR_add1(i32 5)
  %20 = load i32, i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %21
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* @biggest, align 4
  br label %"9"

"6":                                              ; preds = %"4"
  call void @CaLlCoUnTeR_add1(i32 6)
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = load i32, i32* @littlest, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %"7", label %"8"

"7":                                              ; preds = %"6"
  call void @CaLlCoUnTeR_add1(i32 7)
  %30 = load i32, i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %31
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* @littlest, align 4
  br label %"8"

"8":                                              ; preds = %"7", %"6"
  call void @CaLlCoUnTeR_add1(i32 8)
  br label %"9"

"9":                                              ; preds = %"8", %"5"
  call void @CaLlCoUnTeR_add1(i32 9)
  br label %"10"

"10":                                             ; preds = %"9"
  call void @CaLlCoUnTeR_add1(i32 10)
  %34 = load i32, i32* %i, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %i, align 4
  br label %"3"

"11":                                             ; preds = %"3"
  call void @CaLlCoUnTeR_add1(i32 11)
  ret void
}

; Function Attrs: nounwind uwtable
define void @Bubble(i32 %run) #0 {
"12":
  call void @CaLlCoUnTeR_add1(i32 12)
  %0 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %run, i32* %0, align 4
  call void @bInitarr()
  store i32 500, i32* @top, align 4
  br label %"13"

"13":                                             ; preds = %"19", %"12"
  call void @CaLlCoUnTeR_add1(i32 13)
  %1 = load i32, i32* @top, align 4
  %2 = icmp sgt i32 %1, 1
  br i1 %2, label %"14", label %"20"

"14":                                             ; preds = %"13"
  call void @CaLlCoUnTeR_add1(i32 14)
  store i32 1, i32* %i, align 4
  br label %"15"

"15":                                             ; preds = %"18", %"14"
  call void @CaLlCoUnTeR_add1(i32 15)
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* @top, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %"16", label %"19"

"16":                                             ; preds = %"15"
  call void @CaLlCoUnTeR_add1(i32 16)
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %7
  %9 = load i32, i32* %8, align 4
  %10 = load i32, i32* %i, align 4
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %9, %14
  br i1 %15, label %"17", label %"18"

"17":                                             ; preds = %"16"
  call void @CaLlCoUnTeR_add1(i32 17)
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %j, align 4
  %20 = load i32, i32* %i, align 4
  %21 = add nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %22
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %26
  store i32 %24, i32* %27, align 4
  %28 = load i32, i32* %j, align 4
  %29 = load i32, i32* %i, align 4
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %31
  store i32 %28, i32* %32, align 4
  br label %"18"

"18":                                             ; preds = %"17", %"16"
  call void @CaLlCoUnTeR_add1(i32 18)
  %33 = load i32, i32* %i, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %i, align 4
  br label %"15"

"19":                                             ; preds = %"15"
  call void @CaLlCoUnTeR_add1(i32 19)
  %35 = load i32, i32* @top, align 4
  %36 = sub nsw i32 %35, 1
  store i32 %36, i32* @top, align 4
  br label %"13"

"20":                                             ; preds = %"13"
  call void @CaLlCoUnTeR_add1(i32 20)
  %37 = load i32, i32* getelementptr inbounds ([5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 1), align 4
  %38 = load i32, i32* @littlest, align 4
  %39 = icmp ne i32 %37, %38
  br i1 %39, label %"22", label %"21"

"21":                                             ; preds = %"20"
  call void @CaLlCoUnTeR_add1(i32 21)
  %40 = load i32, i32* getelementptr inbounds ([5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 500), align 16
  %41 = load i32, i32* @biggest, align 4
  %42 = icmp ne i32 %40, %41
  br i1 %42, label %"22", label %"23"

"22":                                             ; preds = %"21", %"20"
  call void @CaLlCoUnTeR_add1(i32 22)
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0))
  br label %"23"

"23":                                             ; preds = %"22", %"21"
  call void @CaLlCoUnTeR_add1(i32 23)
  %44 = load i32, i32* %0, align 4
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [5001 x i32], [5001 x i32]* @sortlist, i64 0, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %48)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
"24":
  call void @CaLlCoUnTeR_add1(i32 24)
  %0 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %0, align 4
  store i32 0, i32* %i, align 4
  br label %"25"

"25":                                             ; preds = %"27", %"24"
  call void @CaLlCoUnTeR_add1(i32 25)
  %1 = load i32, i32* %i, align 4
  %2 = icmp slt i32 %1, 100
  br i1 %2, label %"26", label %"28"

"26":                                             ; preds = %"25"
  call void @CaLlCoUnTeR_add1(i32 26)
  %3 = load i32, i32* %i, align 4
  call void @Bubble(i32 %3)
  br label %"27"

"27":                                             ; preds = %"26"
  call void @CaLlCoUnTeR_add1(i32 27)
  %4 = load i32, i32* %i, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %i, align 4
  br label %"25"

"28":                                             ; preds = %"25"
  call void @CaLlCoUnTeR_add1(i32 28)
  call void @CaLlCoUnTeR_write()
  ret i32 0
}

declare void @CaLlCoUnTeR_write()

declare void @CaLlCoUnTeR_add1(i32)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}
