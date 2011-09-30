#include <iostream> // pour cout
#include <fstream>  // pour ofstream
#include <stdlib.h> // system("program_to_run");

using namespace std;

void make_gp(void)
{
  ofstream of("main.gp");

  of << "set parametric" << endl;        // Ecriture des données dans le fichier
  of << "set xrange [-5:5]" << endl;
  of << "set yrange [-5:5]" << endl;
  of << "plot \"main.dat\"" << endl;  // plot "main.dat"
}

void make_dat(void)
{
  ofstream of("main.dat");

  of << "0 1" << endl; // Ecriture des données dans le fichier
  of << "1 2" << endl;
  of << "2 3" << endl;
  of << "3 4" << endl;
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
