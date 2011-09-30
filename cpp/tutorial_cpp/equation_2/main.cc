#include <iostream>

using namespace std;

int main(void)
{
  cout << "Resolution de " << endl;
  cout << "a*x^2+b*x+c=0" << endl;

  double a = 0;
  cout << "a=";
  cin >> a;
  cout << endl;

  double b = 0;
  cout << "b=";
  cin >> b;
  cout << endl;

  double c = 0;
  cout << "c=";
  cin >> c;
  cout << endl;


  if (a!=0)
    {
      double delta = pow(b,2) - 4*a*c;
      if (delta==0)
	{
	  cout << "Solution double" << endl;
	  double x = - b / (2*a);
	  cout << "x=" << x << endl;
	}
      else if(delta > 0)
	{
	  double x1 = (-b-sqrt(delta))/(2*a);
	  double x2 = (-b+sqrt(delta))/(2*a);
	  cout << "x1=" << x1 << endl;
	  cout << "x2=" << x2 << endl;	  
	}
      else if (delta <0)
	{
	  cout << "Pas de solution reelle" << endl;
	}
    }
  else
    {
      cout << "C'est une equation de 1er degre" << endl;
    }

  return EXIT_SUCCESS;
}


// Test
// x^2-2x+1=0 => x=1
// x^2+x+1=0 => pas de sol reelle
// x^2-1=0 => x=+1 ou x=-1
