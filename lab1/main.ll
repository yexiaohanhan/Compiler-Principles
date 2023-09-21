; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@start = dso_local global i64 0, align 8
@stop = dso_local global i64 0, align 8
@.str.2 = private unnamed_addr constant [26 x i8] c"\E5\B9\B3\E5\9D\87\E8\BF\90\E8\A1\8C\E6\97\B6\E9\95\BF(ms)\EF\BC\9A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"end\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 64)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  store double 0.000000e+00, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %38, %0
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %12, 64
  br i1 %13, label %14, label %41

14:                                               ; preds = %11
  %15 = call i64 @clock() #3
  store i64 %15, ptr @start, align 8
  store i32 0, ptr %5, align 4
  store i32 1, ptr %6, align 4
  store i32 1, ptr %7, align 4
  br label %16

16:                                               ; preds = %20, %14
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %2, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %30

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  store i32 %21, ptr %8, align 4
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %6, align 4
  %25 = load i32, ptr %6, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %25)
  %27 = load i32, ptr %8, align 4
  store i32 %27, ptr %5, align 4
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %7, align 4
  br label %16, !llvm.loop !6

30:                                               ; preds = %16
  %31 = call i64 @clock() #3
  store i64 %31, ptr @stop, align 8
  %32 = load i64, ptr @stop, align 8
  %33 = load i64, ptr @start, align 8
  %34 = sub nsw i64 %32, %33
  %35 = sitofp i64 %34 to double
  %36 = load double, ptr %3, align 8
  %37 = fadd double %36, %35
  store double %37, ptr %3, align 8
  br label %38

38:                                               ; preds = %30
  %39 = load i32, ptr %4, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %4, align 4
  br label %11, !llvm.loop !8

41:                                               ; preds = %11
  %42 = load double, ptr %3, align 8
  %43 = fdiv double %42, 6.400000e+01
  store double %43, ptr %3, align 8
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %45 = load double, ptr %3, align 8
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %45)
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i64 @clock() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
