#include <math.h>

double log_nep(double x)
{
	x=x-1;
	return x - pow(x,2)/2 + pow(x,3)/3 - pow(x,4)/4; 
}

int main(void)
{
	printf("%f",log_nep(1.5));
	return 0;
}
