#include <math.h>

double fib(int n)
{
	if ( n==1 || n== 2 )
	{
		return 1;
	}
	else
	{
		return fib(n-1)+fib(n-2); 
	}
}

int main(void)
{
	int N=10;
	int i;	
	for (i=1 ; i<N ; i++)
	{
		printf("%f\n",fib(i));
	}
	return 0;
}
