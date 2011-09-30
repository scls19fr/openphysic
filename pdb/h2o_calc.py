#!/usr/bin/env python

# ************************************************************
# * Script en Python permettant de generer une molecule d'eau*
# * a partir de calculs lorsque l'on connait la taille des   *
# * liaisons et les angles                                   *
# * Auteur : Sebastien CELLES                                *
# * Licence : GNU General Public License v2 and above        *
# ************************************************************

from math import * # pi cos sin ...

FILE = open('h2o_calc.pdb', 'w')

# Definition de la fonction qui ajoute un atome dans le fichier .pdb
def print_atom(FILE, AtomNumber, AtomSymbol, x, y, z):
        str = 'ATOM      %(#1)s  %(#2)s                  %(#3) 1.3f  %(#4) 1.3f  %(#5) 1.3f' % {'#1': AtomNumber, '#2':AtomSymbol, '#3': x, '#4': y, '#5': z}
        FILE.write(str+"\n")

# Definition des constantes
#    Liaison O-H  0.0957nm = 0.957A (et pas 0,957)
#    Angle 104.52°
l_OH = 0.957;
alpha = 104.52*pi/180; # angle en rad

# En tete du fichier .pdb
FILE.write("HEADER"+"\n")
FILE.write("COMPND    H2O calc"+"\n")
FILE.write("HEAD"+"\n")

# Partie centrale du fichier .pdb (ex : molecule d'eau)
#print_atom(numéro_atome_dans_le_fichier_pdb,symbole_de_l_atome,x,y,z);
print_atom(FILE, 1, "O", 0, 0, 0) # ne pas confondre O et 0
print_atom(FILE, 2, "H", l_OH, 0, 0)
print_atom(FILE, 3, "H", l_OH*cos(alpha), l_OH*sin(alpha), 0)

#liaison(s)
FILE.write("CONECT    1    2    3"+"\n")

# Fin du fichier .pdb
FILE.write("END"+"\n")
FILE.write("TAIL"+"\n")

# Fermeture du fichier
FILE.close()
