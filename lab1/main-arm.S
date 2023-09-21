	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.global	start
	.bss
	.align	2
	.type	start, %object
	.size	start, 4
start:
	.space	4
	.global	stop
	.align	2
	.type	stop, %object
	.size	stop, 4
stop:
	.space	4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\012\000"
	.align	2
.LC1:
	.ascii	"%d\000"
	.align	2
.LC2:
	.ascii	"\345\271\263\345\235\207\350\277\220\350\241\214\346"
	.ascii	"\227\266\351\225\277(ms)\357\274\232\000"
	.align	2
.LC3:
	.ascii	"%f\012\000"
	.align	2
.LC4:
	.ascii	"end\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	ldr	r2, .L8+8
.LPIC10:
	add	r2, pc
	ldr	r3, .L8+12
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #36]
	mov	r3, #0
	movs	r1, #64
	ldr	r3, .L8+16
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	mov	r3, r7
	mov	r1, r3
	ldr	r3, .L8+20
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2
.L5:
	bl	clock(PLT)
	mov	r2, r0
	ldr	r3, .L8+24
.LPIC2:
	add	r3, pc
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #1
	str	r3, [r7, #12]
	movs	r3, #1
	str	r3, [r7, #16]
	b	.L3
.L4:
	ldr	r3, [r7, #12]
	str	r3, [r7, #20]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r1, [r7, #12]
	ldr	r3, .L8+28
.LPIC3:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, [r7, #20]
	str	r3, [r7, #8]
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
.L3:
	ldr	r3, [r7]
	ldr	r2, [r7, #16]
	cmp	r2, r3
	blt	.L4
	bl	clock(PLT)
	mov	r2, r0
	ldr	r3, .L8+32
.LPIC4:
	add	r3, pc
	str	r2, [r3]
	ldr	r3, .L8+36
.LPIC5:
	add	r3, pc
	ldr	r2, [r3]
	ldr	r3, .L8+40
.LPIC6:
	add	r3, pc
	ldr	r3, [r3]
	subs	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, [r7, #24]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [r7, #24]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #63
	ble	.L5
	vldr.64	d6, [r7, #24]
	vldr.64	d5, .L8
	vdiv.f64	d7, d6, d5
	vstr.64	d7, [r7, #24]
	ldr	r3, .L8+44
.LPIC7:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldrd	r2, [r7, #24]
	ldr	r1, .L8+48
.LPIC8:
	add	r1, pc
	mov	r0, r1
	bl	printf(PLT)
	ldr	r3, .L8+52
.LPIC9:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r3, #0
	ldr	r1, .L8+56
.LPIC11:
	add	r1, pc
	ldr	r2, .L8+12
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #36]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L7
	bl	__stack_chk_fail(PLT)
.L7:
	mov	r0, r3
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	3
.L8:
	.word	0
	.word	1078984704
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC10+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	start-(.LPIC2+4)
	.word	.LC0-(.LPIC3+4)
	.word	stop-(.LPIC4+4)
	.word	stop-(.LPIC5+4)
	.word	start-(.LPIC6+4)
	.word	.LC2-(.LPIC7+4)
	.word	.LC3-(.LPIC8+4)
	.word	.LC4-(.LPIC9+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC11+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu 12.3.0-1ubuntu1~23.04) 12.3.0"
	.section	.note.GNU-stack,"",%progbits
