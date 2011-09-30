#include <iostream> // pour cout
#include <fstream> // pour ofstream

/*
<?xml version="1.0"?>
<Ligne xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
*/

/*
<?xml version=\"1.0\"?>
<Ligne xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">
*/


using namespace std;

class Complexe
{
public:
	double x;
	double y;
};

ostream & operator << (ostream & o,const Complexe & c)
{
		return o
		  << "<Complexe>" << endl
		     << "<Re>" << c.x << "</Re>" << endl
		     << "<Im>" << c.y << "</Im>" << endl
		  << "</Complexe>";
}

class Ligne
{
public:
	Complexe z1;
	Complexe z2;
};

ostream & operator << (ostream & o,const Ligne & lg)
{
		return o
			<< "<Ligne>" << endl
				<< "<z1>" << endl
					<< lg.z1 << endl
				<< "</z1>" << endl
				<< "<z2>" << endl
					<< lg.z2 << endl
				<< "</z2>" << endl
			<< "</Ligne>" << endl;
}

int main()
{
	Ligne lg;
	lg.z1.x = 1;
	lg.z1.y = 2;
	lg.z2.x = 3;
	lg.z2.y = 4;

	ofstream of("ligne.xml");
	of << "<?xml version=\"1.0\"?>" << endl
	   << lg ;

	cout << "<?xml version=\"1.0\"?>" << endl
	   << lg ;	
}
