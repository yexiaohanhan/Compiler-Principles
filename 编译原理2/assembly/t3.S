@ part of all data
.data
    .format: .asciz "请输入一个整数：\n"
    .result: .asciz "%d的阶乘是%llu\n"

@ part of all programs
@ main programs
.text
.global main
    .type main, %function
main:
    push {lr} @ 将链接寄存器/r3push栈帧
    push {r7} 
    sub  sp, sp, #8
    add  r7, sp, #0
    mov r7, #4 @ 将寄存器r7设置为4，为printf函数提供空间
    ldr r0, =.format @ 地址.format文字"请输入一个整数:"加载到寄存器r0中
    bl printf @ bl调用printf函数

    mov r7, #5 @ 为读取操作提供空间
    bl scanf 
    ldr r0, =num @ 读入num变量
    

    mov r2, #1 @ 初始化阶乘结果为1
    mov r1, #1 @ 阶乘计数器
@ 阶乘的循环
loop:
    cmp r1, r0
    bgt end
    mul r2, r2, r1
    add r1, r1, #1
    b loop
end:
    mov r3, #1
    ldr r1, =.result@ 打印结果
    bl printf

    pop {pc}@ 清理栈帧并返回

@ 未初始化变量地址
.section .bss
    .comm num, 4, 4
    .comm result, 8, 8
