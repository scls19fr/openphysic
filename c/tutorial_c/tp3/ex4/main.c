#include <math.h>

int main(void)
{
	int n;
	n = 4;
	int i,j,nb_car,j_min,j_max;	
	for (i = 0 ; i <= n-1 ; i++) // ligne
	{


		nb_car = 2*i+1;
		int k;
		for (k = 0 ; k < n - i - 1 ; k++)
		{
			printf(" ");
		}
			
		for (k = 0 ; k < nb_car ; k++)
		{
			printf("*");
		}

		printf("\n");
	}
	return 0;
}
