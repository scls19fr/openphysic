#include <stdio.h>

int main(int argc, char * argv[])
{
	int fd_dst,fd_sce;

	if (argc==3)
	{

		fd_sce=open(argv[1],0);
		fd_dst=creat(argv[2],0700);
	
		copie_fichier(fd_sce,fd_dst);	

		close(fd_sce);
		close(fd_dst);
	
		return 0;
	}
}
