#include <stdio.h>

int main(int argc, char * argv[])
{
	int fd;

	//printf("hello %i\n",rand());

	if (argc==2)
	{

		fd=creat(argv[1],0700);

		//printf("fd : %i",fd);
	
		cree_fichier(fd);	

		close(fd);
	
		return 0;
	}
	else
	{
		printf("erreur\n");
		return 1;
	}
	
}
