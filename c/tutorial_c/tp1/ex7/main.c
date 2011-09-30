int main(void)
{
  printf("Donnez un nombre entier ");
  int n1;
  scanf("%i",&n1);
  
  int n2;
  
  do
    {
      printf("Quel nombre ? " );
      scanf("%i",&n2);
      if (n2>n1)
	{
	  printf("trop grand\n");
	}
      if (n1>n2)
	{
	  printf("trop petit\n");
	}
    }
  while (n1!=n2);

  return 0;
}
