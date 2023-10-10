#include <stdio.h>

int main() {
    int num, i;
    unsigned long long factorial = 1;

    putf("请输入一个整数：");
    num = getint(); 

    // 计算阶乘
    for (i = 1; i <= num; i++) {
        factorial *= i;
    }

    putf("%d的阶乘是%llu\n", num, factorial);

    return 0;
}

