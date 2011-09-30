int main(void)
{
  float a,b=0;
  printf("Entrez a : ");
  scanf("%f",&a);
  
  while (b==0)
    {
      printf("Entrez b : ");
      scanf("%f",&b);
      if (b==0) {
	printf("Erreur ! ");
      }
    }

  printf("%f\n",a/b);
  
}
