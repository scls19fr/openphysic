#!/usr/bin/perl -w
#--------------------------------------------------------------------
#
#                Programme de filtrage en fréquence
#
#--------------------------------------------------------------------
# D. Cordier, Septembre 2004, Rennes (France).
# daniel.cordier AT ensc-rennes.fr
#
# Voir : http://search.cpan.org/~rkobes/Math-FFT-0.25/FFT.pm
#
$file_in = $ARGV[0]; $file_out = $ARGV[1]; $freq_1 = $ARGV[2]; $freq_2 = $ARGV[3];
if ( $file_in eq "" || $file_out eq "" || $freq_1 eq "" || $freq_2 eq ""){
    print "Usage: $0 file_in(ex.:'allo.dat.out_coeff') file_out freq_inf freq_sup\n";
    exit(0);
}
#if($freq_1 =~ /[^0-9]/) { 
#    print " >>> freq_inf n'est pas du tout un chiffre!\n";
#    exit(0);
#}
#if($freq_2 =~ /[^0-9]/) { 
#    print " >>> freq_sup n'est pas du tout un chiffre!\n";
#    exit(0);
#}

if ( $freq_1 ne "" && $freq_2 eq "" ) {
    print "\n";
    print " -----------------------------------------------------------\n";
    print " >>> pour filtrer on doit donner DEUX valeurs de fréquence !\n";
    print " -----------------------------------------------------------\n";
    print "\n";
    exit(0);
}
if ( $freq_1 > $freq_2 ) {
    print "\n";
    print " -------------------------------------\n";
    print " >>> on doit avoir freq_inf < freq_sup\n";
    print " -------------------------------------\n";
    print "\n";
    exit(0);
}

# ------------------------------
open(FILE_IN, "< $file_in") or die " *** le fichier : $file_in n'est pas lisible : $!";
open(FILE_OUT, "> $file_out");

$ligne = <FILE_IN>;
@champ = split(/\s+/, $ligne);
$Ntot  = $champ[1]; $Delta= $champ[2];
printf FILE_OUT ("%10s %16.8f\n",$Ntot,$Delta);

print "        * Il y a $Ntot donnees dans le fichier '$file_in', l'échantillonage a été fait tous les $Delta s\n";
for ( $k= 1; $k < $Ntot+1; $k++ ) {
    $ligne=<FILE_IN>;
    @champ = split(/\s+/, $ligne);
    $indice= $champ[1];
    $fn = $k / $Ntot /$Delta;
    if ( ($freq_1 <= $fn) && ($fn >= $freq_2) ) {
	$coeff= $champ[2];
    } else {
	$coeff= 0.;
    }
    printf FILE_OUT ("%9s %9.5f\n",$indice,$coeff);
    #print "$indice $coeff[$indice]\n";
}
close(FILE_IN);
close(FILE_OUT);

exit(0);
