.section .data
    .in:.asciz "请输入一个整数：\n"
    .format: .asciz "%d"
    .result: .asciz "%d的阶乘是%llu\n"
    .comm num, 4, 4
    .comm result, 8, 8


.section .text
    .align 2
.global main
    .type main, %function
main:
    // 设置栈帧
    push {lr}
    push {r7} 
    sub  sp, sp, #8
    add  r7, sp, #0

    mov r7, #4
    ldr r0, =.in
    bl printf

    mov r7, #5
    ldr r0, =.format
    mov r1, sp
    bl scanf
    ldr r0, =num

    mov r2, #1
    mov r1, #1
loop:
    cmp r1, r0
    bgt end
    mul r2, r2, r1
    add r1, r1, #1
    b loop
end:
    // 打印结果
    mov r7, #4
    ldr r0, =num
    ldr r1, =.result
    bl printf

    // 清理栈帧并返回
    pop {pc}
    .size	main, .-main
    .section	.note.GNU-stack,"",%progbits
_bridge:
    .word num
    .word result




