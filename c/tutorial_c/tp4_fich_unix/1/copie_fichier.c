
void copie_fichier(int f_source, int f_destination)
{
	#define max 1024
	int buf[max], nb_octets,nb_lu;
	nb_octets = sizeof(int);

	while( (nb_lu=read(f_source,buf,nb_octets*max)) > 0 )
			write(f_destination,buf,nb_lu);
}
