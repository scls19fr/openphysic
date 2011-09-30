#include <stdio.h>
#include <sys/time.h>

void faire_des_trucs(void)
{
  int i = 0;
  for (i=0 ; i<1000 ; i++)
    {
      printf("%d\n",i);
    }
}


int main(void)
{
    struct timeval tmv1, tmv2;
    long ms;

    gettimeofday(&tmv1, NULL);

    /*---- faire des trucs ----*/
    faire_des_trucs();

    gettimeofday(&tmv2, NULL);

    ms =   (tmv2.tv_sec-tmv1.tv_sec)*1000
     + (tmv2.tv_usec-tmv1.tv_usec)/1000;

    printf("duree = %ld ms\n", ms);

    return 0;
}

