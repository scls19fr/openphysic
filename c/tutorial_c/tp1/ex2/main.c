#include <stdio.h>

int main(void)
{
  printf("Entrez un nombre : ");
  int n;
  scanf("%d",&n);

  printf("Quel format (o / h) ?");
  char c;
  getchar(); /* pour eviter le bug a cause du CR-LF */
  scanf("%c",&c);

  if (c=='o')
    {
      printf("oct : %o\n",n);
    }
  if (c=='h')
    {
      printf("hex : %x\n",n);
    }
  return 0;
}
