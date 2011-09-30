// -*- compile-command: "g++ -g -Wall *.cxx" -*-

using namespace std;

#include <iostream>

#include "signal.hxx"


int main(void)
{
  cout << "harmon" << endl;

  Signal *sgn = new Signal(); // alloc dynamique ; durée : new -> delete ; sgn->foo()
  //Signal sgn(); // pile
  //static Signal sgn(); // statique


  // Signal sinusoidal pur
  sgn->set_f1(10000.0);
  sgn->set_a1(1.0);

  /*
  // Signal sinusoidal pur 5f
  sgn->set_f1(5000.0);
  sgn->set_a1(0.0);
  sgn->set_a0(0.0);
  sgn->set_amplitude(5,1.0);
  */
  

  /*
  // Signal carre
  sgn->set_f1(5000.0);
  sgn->set_a0(0.0);
  sgn->set_a1(1.0);
  sgn->set_amplitude(3,1/3.0);
  sgn->set_phase(3,0.0);
  sgn->set_amplitude(5,1/5.0);
  sgn->set_amplitude(7,1/7.0);
  sgn->set_amplitude(9,1/9.0);
  */

  // Signal triangle
  /*
  sgn->set_f1(5000.0);
  sgn->set_a0(0.0);
  sgn->set_a1(1.0);
  sgn->set_amplitude(3,1/(3.0*3.0));
  sgn->set_phase(3,180);
  sgn->set_amplitude(5,1/(5.0*5.0));
  sgn->set_phase(5,0);
  sgn->set_amplitude(7,1/(7.0*7.0));
  sgn->set_phase(7,180);
  sgn->set_amplitude(9,1/(9.0*9.0));
  sgn->set_phase(9,0);
  */


  sgn->Test_Signal();
  sgn->Test_value();


  delete sgn;
  sgn = NULL;

  return EXIT_SUCCESS;
}
