#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main (void)
{
  clock_t start, stop;
  double elapsed;

  start = clock();
  system("sleep 10");
  
  stop = clock();
  elapsed = ((double)stop - start) / CLOCKS_PER_SEC;
        printf("%.0f\n%.0f\n%.0f\n%.2f\n%.2f\n%.2f\n",
                        (float)start,
                        (float)stop,
                        (float)(stop - start),
                        (float)CLOCKS_PER_SEC,
                        (float)(stop - start)/CLOCKS_PER_SEC,
                        elapsed);

  return EXIT_SUCCESS;
}
