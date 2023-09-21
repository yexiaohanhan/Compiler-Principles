#include <stdio.h>

#define TEST "DEF TEST!"

const int n = 10;
const int m = 2;
int rank(int start, int end)
{
    int ans = 1;
    for (int i = start; i <= end; i++)
    {
        ans *= i;
    }
    return ans;
}
int main()
{
#ifdef _DEF_TEST
    printf("%s\n", TEST);
#endif
    //death code
    if (1==0)
    {
        printf("Error1!\n");
    }
    if(n>m)
    {
	int Anm = rank(1, n) / rank(1, m);
        printf("%d\n", Anm);
    }
    return 0;
}
