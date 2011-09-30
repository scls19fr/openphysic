int main(void)
{
  float n1,n2;
  printf("Entrez les 2 nombres : ");
  scanf("%f %f",&n1,&n2);

  if ((n1<0 && n2<0) || (n1>0 && n2>0))
    {
      printf("meme signe\n");
    }
  if  ((n1>0 && n2<0) || (n1<0 && n2>0))
    {
      printf("signe different\n");
    }
}
