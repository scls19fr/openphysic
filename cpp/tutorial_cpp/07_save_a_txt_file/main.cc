#include <iostream> // pour cout
#include <fstream> // pour ofstream

using namespace std;

class Complexe {
public:
	double x;
	double y;
	
	void Show()
	{
		cout << this->x << "+i*" << this->y << "\n";
	}	
};

ostream & operator << (ostream & o,const Complexe & c)
{
 		return o << c.x << "+i*" << c.y;
}


int main()
{
	Complexe cplx;
	cplx.x=1;
	cplx.y=2;
	
	cplx.Show();
	
	ofstream of("complex.txt");
	 
	of << cplx ;
}
