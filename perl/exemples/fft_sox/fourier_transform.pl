#!/usr/bin/perl -w
#--------------------------------------------------------------------
#
#               Programme de calcul de la transformée
#                     de Fourier d'un signal
#
#--------------------------------------------------------------------
# D. Cordier, Septembre 2004, Rennes (France).
# daniel.cordier AT ensc-rennes.fr
#
# Voir : http://search.cpan.org/~rkobes/Math-FFT-0.25/FFT.pm
# pour la documentation du module "FFT" utilisé dans ce script.
#
use Math::FFT;
#
my $PI = 3.1415926539;

# Initialisation des arguments :
$file_in = $ARGV[0];
if ( $file_in eq "" ){
    print "Usage: $0 filein\n";
    exit(0);
}
# Lecture des donées :
print "        * Lecture des données dans le fichier : '$file_in'\n";
open(FILE_IN, "< $file_in") or die " *** le fichier : $file_in n'est pas lisible : $!";;
$Ntot = 0;
$ligne=<FILE_IN>;

while ( defined($ligne=<FILE_IN>)) { # Procéder avec "defined( ..." sinon on
    @champ = split(/\s+/, $ligne); # permet de ventiler les données séparées
                                   # par un nombre quelconque de blancs sur
                                   # une ligne données.
    $t            = $champ[1]; # temps
    $h -> [$Ntot] = $champ[2]; # signal
    $Ntot         = $Ntot + 1;

}
close(FILE_IN);
$Ntot         = $Ntot;

print "        * Nombre de points dans l'échantillon : $Ntot\n";
print "        * Durée de l'enregistrement           : $t s\n";

$Delta = $t/($Ntot-1);
$fc    = 1./2./$Delta;
print "        * Fréquence critique de Nyquist       : $fc Hz\n";

# Le nombre de données doit être une puissance de DEUX :

$m     = log($Ntot)/log(2);

$reste = $m - int($m);
$ajout = 0;
while ( $reste > 0. ) { # On ajoute des zéros aux données pour que "m" soit entier
    $h -> [$Ntot] = 0.;
    $m     = log($Ntot+1)/log(2);
    $reste = $m - int($m);
    $Ntot = $Ntot + 1;
    #print "$reste\n";
    if ( $ajout == 0 ) {
	print "          => on ajoute des zéros pour avoir 2^m données, avec m un entier\n";
	$ajout = 1;
    }
 }
#foreach $x (@h) {
#    print "$x\n";
#}$i1 =
#exit(0);

$m     = log($Ntot)/log(2);
if ( $ajout ) {
    print "        * On a maintenant $Ntot données, soit 2^$m\n";
} else {
     print "        * On a $Ntot données, soit 2^$m\n";
 }

print "        * Calcul de la transformée de Fourier (FFT)\n";
my $fft = new Math::FFT($h);

my $coeff = $fft -> rdft();

print "        * Ecriture des sorties :\n";

$file_reel = $file_in.".out_real";
$file_img  = $file_in.".out_img";
$file_pwr  = $file_in.".out_pwr";
$file_coeff= $file_in.".out_coeff";

print "           - fichier : \"$file_reel\" pour la partie réelle de la FFT\n";
open(FILE_OUT_REEL, "> $file_reel");
for ($k = 0; $k < $Ntot/2; $k++) {
    $fn      = $k / $Delta / $Ntot;
    $Hn_reel = $coeff->[2*$k];
    printf FILE_OUT_REEL ("%9.5f %9.5f\n",$fn,$Hn_reel);
}
close(FILE_OUT_REEL);

print "           - fichier : \"$file_img\" pour la partie imaginaire de la FFT\n";
open(FILE_OUT_IMG , "> $file_img" );
for ($k = 1; $k < $Ntot/2; $k++) {
    $fn      = $k / $Delta / $Ntot;
    $Hn_img  = $coeff->[2*$k+1];
    printf FILE_OUT_IMG ("%9.5f %9.5f\n",$fn,$Hn_img);
}
close(FILE_OUT_IMG);

print "           - fichier : \"$file_pwr\" pour le module de la FFT\n";
open(FILE_OUT_PWR , "> $file_pwr" );
for ($k = 1; $k < $Ntot/2; $k++) {
    $fn      = $k / $Delta / $Ntot;
    $r       = $coeff->[2*$k];
    $i       = $coeff->[2*$k+1];
    $mod     = sqrt($r**2+$i**2);
    printf FILE_OUT_PWR ("%9.5f %9.5f\n",$fn,$mod);
}
close(FILE_OUT_PWR);

print "           - fichier : \"$file_coeff\" avec tous les coefficients de la FFT\n";
open(FILE_OUT_COEFF , "> $file_coeff" );

printf FILE_OUT_COEFF ("%10s %16.8f\n",$Ntot,$Delta);

$i1 = 0; $x = $coeff->[0];
printf FILE_OUT_COEFF ("%9s %9.5f\n",$i1,$x);
$i2 = 1; $x = $coeff->[$Ntot/2];
printf FILE_OUT_COEFF ("%9s %9.5f\n",$i2,$x);

for ($k = 1; $k < $Ntot/2; $k++) {
    $r       = $coeff->[2*$k];
    $i       = $coeff->[2*$k+1];
    $i1 = 2*$k; $i2= 2*$k+1;
    printf FILE_OUT_COEFF ("%9s %9.5f\n",$i1,$r);
    printf FILE_OUT_COEFF ("%9s %9.5f\n",$i2,$i);
}
close(FILE_OUT_COEFF);

exit(0);
