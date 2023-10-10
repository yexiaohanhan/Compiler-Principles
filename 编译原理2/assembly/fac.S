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
	.file	"factorial.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\350\257\267\350\276\223\345\205\245\344\270\200\344"
	.ascii	"\270\252\346\225\264\346\225\260\357\274\232\000"
	.align	2
.LC1:
	.ascii	"%d\000"
	.align	2
.LC2:
	.ascii	"%d\347\232\204\351\230\266\344\271\230\346\230\257%"
	.ascii	"llu\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, r8, r9, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	ldr	r2, .L6
.LPIC3:
	add	r2, pc
	ldr	r3, .L6+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	mov	r3, #0
	mov	r2, #1
	mov	r3, #0
	strd	r2, [r7, #8]
	ldr	r3, .L6+8
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	mov	r3, r7
	mov	r1, r3
	ldr	r3, .L6+12
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	movs	r3, #1
	str	r3, [r7, #4]
	b	.L2
.L3:
	ldr	r3, [r7, #4]
	asrs	r2, r3, #31
	mov	r8, r3
	mov	r9, r2
	ldr	r3, [r7, #12]
	mul	r2, r8, r3
	ldr	r3, [r7, #8]
	mul	r3, r9, r3
	add	r3, r3, r2
	ldr	r2, [r7, #8]
	umull	r4, r5, r2, r8
	add	r3, r3, r5
	mov	r5, r3
	strd	r4, [r7, #8]
	strd	r4, [r7, #8]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	ble	.L3
	ldr	r1, [r7]
	ldrd	r2, [r7, #8]
	ldr	r0, .L6+16
.LPIC2:
	add	r0, pc
	bl	printf(PLT)
	movs	r3, #0
	ldr	r1, .L6+20
.LPIC4:
	add	r1, pc
	ldr	r2, .L6+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L5
	bl	__stack_chk_fail(PLT)
.L5:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, r8, r9, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC3+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	.LC2-(.LPIC2+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu 12.3.0-1ubuntu1~23.04) 12.3.0"
	.section	.note.GNU-stack,"",%progbits
