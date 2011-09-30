/***********************/
/* Chrono precision us */
/***********************/
#include <sys/time.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
  struct timeval tv1,tv2;
  struct timezone tz;
  long long diff;
  int i;

  printf("appuyez sur une touche pour commencer");
  getchar();

  gettimeofday(&tv1, &tz);

  /* for (i=1;i<10000;i++) {} */  /* code à timer */

  printf("appuyez sur une touche pour arrêter");
  getchar();

  gettimeofday(&tv2, &tz);
  diff=(tv2.tv_sec-tv1.tv_sec) * 1000000L + \
           (tv2.tv_usec-tv1.tv_usec);  
  printf("durée=%d usec\n",diff);
}

/*
__inline__ unsigned long long int rdtsc()
 {
    unsigned long long int x;
    __asm__ volatile (".byte 0x0f, 0x31" : "=A" (x));     
    return x;  
 }
*/



/****************************/
/* Chrono precision seconde */
/****************************/
/* #include <stdlib.h> */
/* #include <stdio.h> */
/* #include <time.h> */
/* int main(){ */
/*   time_t debut, fin; */
/*   printf("appuyez sur une touche pour commencer"); */
/*   getchar(); */
/*   debut = time(NULL); */
/*   printf(ctime(&debut)); */
/*   printf("appuyez sur une touche pour arrêter"); */
/*   getchar(); */
/*   fin = time(NULL); */
/*   printf(ctime(&fin)); */
/*   printf("il s'est écoulé %lf secondes\n",difftime(fin,debut)); */
/*   return 0; */
/* } */

/* #include <time.h> */
/* #include <stdio.h> */
/* int main() */
/* { */
/*   time_t a; */
/*   time(&a); */
/*   printf(ctime(&a)); */
/*   return 0; */
/* } */

/* #include <sys/time.h> */
/* #include <unistd.h> */
/* #include <stdio.h> */
/* int main() { */
/*   struct timeval tv1,tv2; */
/*   struct timezone tz; */
/*   long long diff; */
/*   int i; */
/*   gettimeofday(&tv1, &tz); */
/*    for (i=1;i<10000;i++) {}  code à timer */
/*   gettimeofday(&tv2, &tz); */
/*   diff=(tv2.tv_sec-tv1.tv_sec) * 1000000L + \ */
/*            (tv2.tv_usec-tv1.tv_usec);   */
/*   printf("durée=%d usec\n",diff); */
/*   return 0; */
/* } */

/* #include <stdlib.h> */
/* #include <stdio.h> */
/* #include <time.h> */
/* int main(){ */
/*   time_t debut,fin; */
/*   printf("appuyez sur une touche pour commencer\n"); */
/*   getchar(); */
/*   time(&debut); */
/*   printf("appuyez sur une touche pour arrêter\n"); */
/*   getchar(); */
/*   time(&fin); */
/*   printf("il s'est écoulé %d secondes\n",difftime(fin,debut)); */
/*   return 0; */
/* } */

/* #include <stdio.h> */
/* #include <time.h> */
/* #include <unistd.h>   /\* sleep() *\/ */
/* main() { */
/*     time_t t1, t2; */
/*     t1 = time(NULL); */
/*     sleep(2);       /\* attente de 2 secondes *\/ */
/*     t2 = time(NULL); */
/*     printf("difference : %lf secondes\n", difftime(t2, t1) ); */
/*     return 0; */
/* } */
