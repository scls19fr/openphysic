#!/usr/bin/perl
#--------------------------------------------------------------------
#
#               Programme de création d'un fichier son
#                    au format '*.dat' de SoX
#
#--------------------------------------------------------------------
# D. Cordier, Septembre 2004, Rennes (France).
# daniel. cordier AT ensc-rennes.fr
#
# Initialisation des arguments :
$duree = $ARGV[0]; $file_out = $ARGV[1];
if ( $duree eq "" || $file_out eq "" ){
    print "Usage: $0 duree(secondes) fileout\n";
    exit(0);
}

# Paramètres :
#$sample_rate = 14000; # Fréquence d'échantillonage en hertz
$sample_rate = 22050;
$period      = 1./$sample_rate;
$npts = $duree * $sample_rate;

print " $sample_rate $period $npts $duree\n";

open(FILE_OUT, "> $file_out");
$t = 0.;
print FILE_OUT "; Sample Rate $sample_rate\n";

while ( $t < $duree) {
    #$signal = exp(-$t*4.) * (sin(2.*3.14*$t*440.) + 0.05*sin(2.*3.14*$t*220.) + 0.05*sin(2.*3.14*$t*110.)) /1.1 ;

    $f0 = 400;
    $signal = sin(2.*3.14*$f0*$t);

    printf FILE_OUT ("%16.11f %16.11f\n",$t,$signal);
    $t = $t + $period;
}
close(FILE_OUT);


exit(0);
