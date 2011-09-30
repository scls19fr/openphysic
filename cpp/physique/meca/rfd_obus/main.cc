#include <iostream> // cout cin (standard input/output)
#include <fstream> // ofstream

#include <math.h> // M_PI (nombre Pi)

using namespace std;


// Declaration des constantes
double const pi = M_PI;
double const g0 = 9.81;
double const h1 = 1; //0.5 ou 0; // Coefficient de frottement visqueux Fv=h1*v
double const h2 = 0; //0 ou 0.5; // Coefficient de frottement fluide   Ff=h2*v^2
// double const qe = 1.6E-19; // Charge élémentaire
// double const me = 9.109389E-31; // Masse d'un électron
// double const mp = 1.672623E-27; // Masse d'un proton
// double const mn = 1.676928E-27; // Masse d'un neutron
// double const k = ; // Constante de raideur du ressort Fr=k*(l-l0)
// double const l0 = 0.10; // Longueur à vide du ressort
// double const Gc = 6.67259E-11; // Constante de la loi de gravitation
// double const R1 =	// Rayon de la planète 1
// double const M1 = // Masse de la planète 1
// double const R2 = // Rayon de la planète 2
// double const M2 = // Masse de la planète 2
// double const epsilon_0 = 1/(4*%pi*8.98755178737E9);
// double const mu_0 = 4*%pi*100E-9


double OM_x, OM_y, OM_z = 0;
double v_x, v_y, v_z = 0;
double a_x, a_y, a_z = 0;
double F_x, F_y, F_z = 0;


// Systeme
double const m = 1; //me; // Masse MODIFIABLE defaut : m=1; (1kg)
double const q = 0; //qe;


// Experience
double t_ini = 0;
double t_max = 2;
double t_pas = 0.01;
double t = t_ini;


// Calcul de la force
void calculate_force(double t,
		     double & OM_x, double & OM_y, double & OM_z,
		     double & v_x, double & v_y, double & v_z,
		     double & a_x, double & a_y, double & a_z,
		     double & F_x, double & F_y, double & F_z) {



  // Poids
  double P_x = 0;
  double P_y = 0;
  double P_z = -m*g0;
  //cout << P_x << "\t" << P_y << "\t" << P_z << endl;

  
  // force de frottement visqueux (proportionnel a v)
  double F_Fv_x = - h1*v_x;
  double F_Fv_y = - h1*v_y;
  double F_Fv_z = - h1*v_z;
  //cout << F_Fv_x << "\t" << F_Fv_y << "\t" << F_Fv_z << endl;


  // force de frottement fluide (proportionnel a v^2)
  double v = sqrt(v_x*v_x + v_y*v_y + v_z*v_z);
  double u_x, u_y, u_z = 0;
  if (v!=0)
    {
      u_x = v_x / v;
      u_y = v_y / v;
      u_z = v_z / v;
    }
  else
    {
      u_x=0; u_y=0; u_z=0;
    }
  double F_Ff_x = - h2*v*v*u_x;
  double F_Ff_y = - h2*v*v*u_y;
  double F_Ff_z = - h2*v*v*u_z;
  //cout << F_Ff_x << "\t" << F_Ff_y << "\t" << F_Ff_z << endl;



  // Force electrostatique
  //    Champ electrique
  double E_x = 0;
  double E_y = 0;
  double E_z = 0;
  //    Force electrostatique
  double F_e_x = q*E_x;
  double F_e_y = q*E_y;
  double F_e_z = q*E_z;
  //cout << F_e_x << "\t" << F_e_y << "\t" << F_e_z << endl;



  // Force magnetostatique
  //    Champ magnetique
  double B_x = 0;
  double B_y = 0;
  double B_z = 0;
  //    Force magnetostatique
  double F_m_x = q*(v_y*B_z-v_z*B_y);
  double F_m_y = q*(v_z*B_x-v_x*B_z);
  double F_m_z = q*(v_x*B_y-v_y*B_x);
  //cout << F_m_x << "\t" << F_m_y << "\t" << F_m_z << endl;



  // Somme des forces
  F_x = P_x + F_Fv_x + F_Ff_x + F_e_x + F_m_x;
  F_y = P_y + F_Fv_y + F_Ff_y + F_e_y + F_m_y;
  F_z = P_z + F_Fv_z + F_Ff_z + F_e_z + F_m_z;
  //cout << F_x << "\t" << F_y << "\t" << F_z << endl;

}

// Fonction principale
int main(void) {
  // Debut du programme
  cout << "Resolution de la RFD" << endl;
  cout << "par S. Celles" << endl;
  cout << "====================" << endl;


  // Conditions initiales
  //  position
  OM_x=0; OM_y=0; OM_z=0;
  //  vitesse
  double v0 = 10;
  double alfa = 45; // degre
  v_x = v0*sin(alfa*2*pi/360);
  v_y = 0;
  v_z = v0*cos(alfa*2*pi/360);


  // fichier de donnees
  ofstream of("main.dat");


  // Boucle sur l'experience
  for(t=t_ini ; t<t_max ; t += t_pas)
    {
      calculate_force(t,
		      OM_x, OM_y, OM_z,
		      v_x, v_y, v_z,
		      a_x, a_y, a_z,
		      F_x, F_y, F_z);

      // Relation Fondamentale de la Dynamique
      // Somme des forces = m * acceleration
      // F=m*a
      a_x = F_x / m;
      a_y = F_y / m;
      a_z = F_z / m;



      /*
      cout << t << "\t"
		<< OM_x << "\t" << OM_y << "\t" << OM_z << "\t"
		<< v_x << "\t" << v_y << "\t" << v_z << "\t"
		<< a_x << "\t" << a_y << "\t" << a_z << "\t"
		<< F_x << "\t" << F_y << "\t" << F_z << endl;
      */
      

      of << t << "\t"
		<< OM_x << "\t" << OM_y << "\t" << OM_z << "\t"
		<< v_x << "\t" << v_y << "\t" << v_z << "\t"
		<< a_x << "\t" << a_y << "\t" << a_z << "\t"
		<< F_x << "\t" << F_y << "\t" << F_z << endl;



      // Integration 1 : vitesse
      // a = (v_tp1-v_t0)/t_pas
      v_x = a_x*t_pas + v_x;
      v_y = a_y*t_pas + v_y;
      v_z = a_z*t_pas + v_z;

      // Integration 2 : position
      // v = (OM_tp1-OM_t0)/t_pas
      OM_x = v_x*t_pas + OM_x;
      OM_y = v_y*t_pas + OM_y;
      OM_z = v_z*t_pas + OM_z;
    }

  cout << "Les resultats sont dans main.dat" << endl;
  cout << "L'affichage se fait avec GNUPlot" << endl;

  system("gnuplot -persist main.gp");

  return EXIT_SUCCESS;

}
