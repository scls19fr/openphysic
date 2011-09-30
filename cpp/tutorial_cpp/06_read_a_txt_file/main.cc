// --- compile-command "g++ main.cpp -o main" ---
#include <iostream> // cin, cout
#include <fstream> // file stream = flux fichier ; ifstream, ofstream
using namespace std;

int main()
{
	ifstream file;
	file.open("ReadMe.txt");
	char c;
	while ((c = file.get()) != EOF)
	{
		cout.put(c);
	}
	file.close();
	cout << "\n";
}
