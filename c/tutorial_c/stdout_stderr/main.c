#include <stdio.h>

int main(void)
{
  int i = 0;


  printf("Essai avec stdin et stdout\n");

  fprintf(stdout,"Sortie normale sur stdout\n");
  fprintf(stderr,"Sortie d'erreur sur stderr\n");

  for(i=5 ; i>=0 ; --i)
    {
      printf("%d / %d = %d\n",i,i,i/i);
    }
    

  return 0;
}
