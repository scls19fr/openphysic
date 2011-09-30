#include <stdio.h>

void make_gp(void)
{
  FILE * file;
  
  file = fopen("main.gp", "w+"); // Ouverture du fichier pour écriture

  fprintf(file, "set parametric\n"); // Ecriture des données dans le fichier
  fprintf(file, "set xrange [-5:5]\n");
  fprintf(file, "set yrange [-5:5]\n");
  fprintf(file, "plot \"main.dat\"\n");

  fclose(file); // Fermeture du fichier
}

void make_dat(void)
{
  FILE * file;
  
  file = fopen("main.dat", "w+"); // Ouverture du fichier pour écriture

  fprintf(file, "1 1"); // Ecriture des données dans le fichier

  fclose(file); // Fermeture du fichier
}

void run_gp(void)
{
  system("gnuplot -persist main.gp");
}

int main(void)
{
  // make .gp file
  make_gp();

  // make .dat file
  make_dat();
  
  // run gnuplot
  run_gp();

  return 0;
}
