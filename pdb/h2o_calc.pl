#!/usr/bin/perl

# ************************************************************
# * Script permettant de générer une molécule d'eau à partir *
# * de calculs lorsque l'on connait la taille des liaisons   *
# * et les angles                                            *
# * Auteur : Sébastien CELLES                                *
# * Licence : GNU General Public License v2 and above        *
# ************************************************************

# Ouverture du fichier en mode écriture (>) ou affichage d'erreur
open(FILE,">h2o_calc.pdb") or die("Erreur d'écriture");

# Définition de la fonction qui ajoute un atome dans le fichier .pdb
sub print_atom {
($AtomNumber,$AtomSymbol,$x,$y,$z)=($_[0],$_[1],$_[2],$_[3],$_[4]);
  printf(FILE "ATOM      %d  %s                  % 1.3f  % 1.3f  % 1.3f"."\n",
	 $AtomNumber,$AtomSymbol,$x,$y,$z);
# perldoc -f sprintf  pour %x.yf
# x longueur *totale* *minimale* du champ contenant un nombre
#  (et non celle de sa partie entière)
# y longueur partie décimale
}

# Calcul de pi (petite astuce vieille comme le monde informatique)  
$pi = 4*atan2(1, 1);

# Définition des constantes
#    Liaison O-H  0.0957nm = 0.957A (et pas 0,957)
#    Angle 104.52°
$l_OH = 0.957;
$alpha = 104.52*$pi/180; # angle en rad

# En tête du fichier .pdb
print FILE "HEADER"."\n";
print FILE "COMPND    H2O calc"."\n";
print FILE "HEAD"."\n";


# Partie centrale du fichier .pdb (ex : molécule d'eau)
#&print_atom(numéro_atome_dans_le_fichier_pdb,symbole_de_l_atome,x,y,z);
&print_atom(1,"O",0,0,0); # ne pas confondre O et 0
&print_atom(2,"H",$l_OH,0,0);
&print_atom(3,"H",$l_OH*cos($alpha),$l_OH*sin($alpha),0);

print FILE "CONECT    1    2    3"."\n";


# Fin du fichier .pdb
print FILE "END"."\n";
print FILE "TAIL"."\n";

close(FILE);
