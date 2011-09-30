#include <iostream>
#include <vector>

// un 'vector' ne contient pas de contrôle de limite
// si ce dispositif est nécessaire il faut utiliser une 'list'

// size() fournit le nb d'éléments
// myVct.resize(myVct.size()+n) augmente la taille du vecteur n

using namespace std;

int main()
{
	vector <int> myVct(5); // vector est un 'template' modèle... ici on l'applique à des nombres entiers (int ... pour integer)
	// on crée un vecteur de 5 entiers
	// attention à ne pas écrire :
	// vector <int> myVct[5];
	// car là on crée 5 vecteurs vides
	
	myVct[0]=0;
	myVct[1]=10;
	myVct[2]=20;
//	myVct[3]=30;	// les éléments sont initialisés à 0 dans un vector
	myVct[4]=40;
	
	cout<<"myVct\n";
	for (int i=0 ; i<myVct.size() ; i++)
	{
		cout<<myVct[i]<<"\n";
	}
	
	cout<<"Pas de contrôle de dépassement\n";
	cout<<myVct[12500]<<"\n"; // pas de contrôle de dépassement
	
}
