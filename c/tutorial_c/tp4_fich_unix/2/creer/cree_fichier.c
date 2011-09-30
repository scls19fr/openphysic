#include <stdio.h>

void cree_fichier(int fd)
{
	
	#define max 1024
	int buf[max], nb_octets,nb_lu,tmp;
	nb_octets = sizeof(int);

	int i;
	for( i=0 ; i<=max/sizeof(int) ; i++ )
	{
		tmp=rand();
		buf[i]=tmp;
		printf("%i\n",tmp);

		// 
		// write(f,&tmp,sizeof(int)) // il faut passer l'adresse de tmp... le pb n'arrivait pas avec les tableaux
		// 
	}

	nb_lu=max;

	write(fd,buf,nb_lu);

}
