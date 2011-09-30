#include <stdio.h>
#include <stdint.h>
#include <math.h>

#define PI 4.0*atan(1.0)

int main(void) {
	uint8_t i,yN;
	double y;
	
	for (i=0;i<255;i++) {
		y = 127.5*cos(2.0*PI/256.0*i)+127.5;
		yN = (uint8_t) y;
		//printf("%d",yN); // uint8_t en decimal
		printf("%#X",yN); // uint8_t en hexa
		//printf("%f",y); // double
		printf("\n");
	}
		
	return 0;
}
