#include <iostream>

using namespace std;

int main(void)
{
  cout << "Resolution de " << endl;
  cout << "a*x+b=c" << endl;

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
      double x = (c-b)/a;
      cout << "x=" << x << endl;
    }
  else
    {
      cout << "Erreur" << endl;
    }


  

  return EXIT_SUCCESS;
}
