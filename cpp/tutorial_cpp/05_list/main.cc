#include <iostream>
#include <list>

using namespace std;

// myList.begin()
//	renvoie un itérateur vers le premier élément
// myList.end()
//	renvoie un itérateur vers le dernier élément

// push_front(e)
//	ajout l'élément e au début
// push_back(e)
//	ajout l'élément e à la fin
// insert(i,e)
//	insert l'élément e avant l'élément auquel l'itérateur 'i' fait référence

int main()
{
	list <int> myList;
	typedef list <int>::const_iterator LI; // type itérateur (pour modification dans liste) ... pour lecture seule on utilise le type 'iterator'
	// on accède à un élémen d'une liste
	// non pas à l'aide d'une indice (comme pour un vector)
	// mais à l'aide d'une valeur donné
	
	myList.push_back(1);
	myList.push_back(2);
	myList.push_back(3);
	myList.push_front(4);
	myList.push_front(5);
	
/*	
	list <int>::iterator myIterator;
	myIterator = myList.begin();	// TO DO : l'itérateur doit être ailleurs qu'au début
	myList.insert(myIterator,6);
*/

	for (LI i = myList.begin() ; i != myList.end() ; ++i)
	{
		int elt = *i; // MyStruct& elt = *i;
		cout << elt << "\n";
	}
}
