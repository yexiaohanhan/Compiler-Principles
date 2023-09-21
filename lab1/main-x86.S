	.file	"main.c"
	.text
	.globl	start
	.bss
	.align 8
	.type	start, @object
	.size	start, 8
start:
	.zero	8
	.globl	stop
	.align 8
	.type	stop, @object
	.size	stop, 8
stop:
	.zero	8
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	"%d"
.LC4:
	.string	"\345\271\263\345\235\207\350\277\220\350\241\214\346\227\266\351\225\277(ms)\357\274\232"
.LC5:
	.string	"%f\n"
.LC6:
	.string	"end"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$64, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L2
.L5:
	call	clock@PLT
	movq	%rax, start(%rip)
	movl	$0, -32(%rbp)
	movl	$1, -28(%rbp)
	movl	$1, -24(%rbp)
	jmp	.L3
.L4:
	movl	-28(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-32(%rbp), %eax
	addl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %eax
	movl	%eax, -32(%rbp)
	addl	$1, -24(%rbp)
.L3:
	movl	-40(%rbp), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L4
	call	clock@PLT
	movq	%rax, stop(%rip)
	movq	stop(%rip), %rdx
	movq	start(%rip), %rax
	subq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	movsd	-16(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addl	$1, -36(%rbp)
.L2:
	cmpl	$63, -36(%rbp)
	jle	.L5
	movsd	-16(%rbp), %xmm0
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	0
	.long	1078984704
	.ident	"GCC: (Ubuntu 12.3.0-1ubuntu1~23.04) 12.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
