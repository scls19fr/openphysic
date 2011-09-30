#!/usr/bin/perl -w
#--------------------------------------------------------------------
#
#            Programme de calcul de la transformee
#                de Fourier inverse d'un signal
#
#--------------------------------------------------------------------
# D. Cordier, Septembre 2004, Rennes (France).
# daniel.cordier AT ensc-rennes.fr
#
# Voir : http://search.cpan.org/~rkobes/Math-FFT-0.25/FFT.pm
# pour la documentation du module "FFT" utilise dans ce script.
#
use Math::FFT;
#
# Initialisation des arguments :
$file_in = $ARGV[0];
if ( $file_in eq "" ){
    print "Usage: $0 filein(ex.:'allo.dat.out_coeff')\n";
    exit(0);
}

# Lecture des données :
print "        * Lecture des données dans le fichier : '$file_in'\n";
open(FILE_IN, "< $file_in") or die " *** le fichier : $file_in n'est pas lisible : $!";;

$ligne = <FILE_IN>;
@champ = split(/\s+/, $ligne);
$Ntot  = $champ[1]; $Delta= $champ[2];
print "        * Il y a $Ntot donnees dans le fichier '$file_in', l'échantillonage a été fait tous les $Delta s\n";
for ( $k= 1; $k < $Ntot+1; $k++ ) {
    $ligne=<FILE_IN>;
    @champ = split(/\s+/, $ligne);
    $indice= $champ[1];
    $coeff[$indice]= $champ[2];
    #print "$indice $coeff[$indice]\n";
}
close(FILE_IN);

# FFT inverse :
$coeffi= \@coeff;
print "        * Calcul de la FFT inverse\n";

my $fft = new Math::FFT($coeffi);
$orig_data = $fft->invrdft($coeffi);

# Ecriture du fichier de sortie :
$file_out= $file_in.".orig.dat";
print "        * Ecriture du fichier de sortie : '$file_out'\n";
open(FILE_OUT, "> $file_out");
$t=0.;
$sample_rate=int(1./$Delta);
print FILE_OUT "; Sample Rate $sample_rate\n";
for ( $k= 0; $k < $Ntot; $k++ ) {
    $data = $orig_data->[$k]; 
    #print "$data\n";
    printf FILE_OUT ("%9.5f %9.5f\n",$t,$data);
    #printf FILE_OUT ("%9.5f\n",$t);
    $t= $t + $Delta;
}
close(FILE_OUT);

exit(0);
