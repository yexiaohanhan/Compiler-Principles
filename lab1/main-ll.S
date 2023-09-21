	.text
	.file	"main.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI0_0:
	.quad	0x4050000000000000              # double 64
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -40(%rbp)
	movabsq	$.L.str, %rdi
	movl	$64, %esi
	movb	$0, %al
	callq	printf@PLT
	movabsq	$.L.str.1, %rdi
	leaq	-36(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$0, -12(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$64, -12(%rbp)
	jge	.LBB0_7
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	callq	clock@PLT
	movq	%rax, start
	movl	$0, -28(%rbp)
	movl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	-28(%rbp), %eax
	addl	-4(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-32(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_3
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	callq	clock@PLT
	movq	%rax, stop
	movq	stop, %rax
	subq	start, %rax
	cvtsi2sd	%rax, %xmm0
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB0_1
.LBB0_7:
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf@PLT
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	movabsq	$.L.str.3, %rdi
	movb	$1, %al
	callq	printf@PLT
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%d"
	.size	.L.str.1, 3

	.type	start,@object                   # @start
	.bss
	.globl	start
	.p2align	3
start:
	.quad	0                               # 0x0
	.size	start, 8

	.type	stop,@object                    # @stop
	.globl	stop
	.p2align	3
stop:
	.quad	0                               # 0x0
	.size	stop, 8

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"\345\271\263\345\235\207\350\277\220\350\241\214\346\227\266\351\225\277(ms)\357\274\232"
	.size	.L.str.2, 26

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%f\n"
	.size	.L.str.3, 4

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"end"
	.size	.L.str.4, 4

	.ident	"Ubuntu clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
