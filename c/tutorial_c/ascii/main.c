#include <stdio.h>

int main(void)
{
  int i;
  const int i_min = 0;
  const int i_max = 255;

  for(i=i_min; i<=i_max ; ++i)
    {
      printf("%d\t%c\n",i,i);
    }

  return 0;
}
