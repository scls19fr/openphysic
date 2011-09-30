int main(void)
{
  printf("Entrez un entier : ");
  int n;
  scanf("%i",&n);
  int i;
  for (i=1;i<=10;i++)
    {
      printf("%i fois %i font %i\n",n,i,n*i);
    }
}
