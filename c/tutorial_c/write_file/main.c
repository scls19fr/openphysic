#include <stdio.h>

int main(void)
{ 
  FILE * fic;
  int i = 100;
  char c = 'C';
  double d = 1.234;
  
  fic = fopen("data.dat", "w+"); // Ouverture du fichier
  fprintf(fic, "%d %c %lf", i, c, d); // Ecriture des données dans le fichier
  fclose(fic); // Fermeture du fichier

  return 0;
}
