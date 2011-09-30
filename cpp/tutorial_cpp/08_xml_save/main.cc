#include <iostream> // pour cout
#include <fstream> // pour ofstream

using namespace std;

class Complexe {
public:
	double x;
	double y;
	
	void Show()
	{
		cout << this->x << "+i*" << this->y << endl;
	}	
};

ostream & operator << (ostream & o,const Complexe & c)
{
/*
<?xml version="1.0"?>
<Complexe xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
*/
		return o
			<< "<?xml version=\"1.0\"?>" << endl
			<< "<Complexe" << " "
			<< "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">" << endl
		 		<< "<Re>" << c.x << "</Re>" << endl
				<< "<Im>" << c.y << "</Im>" << endl
			<< "</Complexe>" << endl;
}


int main()
{
	Complexe cplx;
	cplx.x=1;
	cplx.y=2;
	
	cplx.Show();

	ofstream ofs("cplx.xml");
	 
	ofs << cplx << endl;

	cout << cplx;
}
