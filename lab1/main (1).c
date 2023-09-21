#include <stdio.h>
#include <time.h>
//宏定义
#define Count_Max 64 

// 计时
clock_t start, stop; 
int main()
{

#ifdef Count_Max
    printf("%d\n", Count_Max);
#endif

    // 死代码
    if (1==0)
    {
        printf("Error1!\n");
    }

    int n;
    scanf("%d", &n);

    double time=0;
    for (int Count = 0; Count < Count_Max; Count++)
    {
        start = clock();
        int a, b, i, t;
        a = 0;
        b = 1;
        i = 1;

        // 斐波那契数列
    	while (i < n)
    	{
	   	t = b;
		b = a + b;
		printf("%d\n", b);
		a = t;
		i = i + 1;
    	}	
        
        stop = clock();
        time += (double)(stop - start);
    }
    time /= Count_Max;
    printf("平均运行时长(ms)：");
    printf("%f\n", time);
    printf("end");
    return 0;
}
