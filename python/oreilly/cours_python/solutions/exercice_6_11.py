#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Calculs de triangles

from sys import exit      # module contenant des fonctions système

print """
Veuillez entrer les longueurs des 3 côtés
(en séparant ces valeurs à l'aide de virgules) :"""
a, b, c = input()
# Il n'est possible de construire un triangle que si chaque côté
# a une longueur inférieure à la somme des deux autres :
if a < (b+c) and b < (a+c) and c < (a+b) :
    print "Ces trois longueurs déterminent bien un triangle."
else:
    print "Il est impossible de construire un tel triangle !"
    exit()          # ainsi l'on n'ira pas plus loin.

f = 0
if a == b and b == c :
    print "Ce triangle est équilatéral."
    f = 1
elif a == b or b == c or c == a :
    print "Ce triangle est isocèle."
    f = 1
if a*a + b*b == c*c or b*b + c*c == a*a or c*c + a*a == b*b :
    print "Ce triangle est rectangle."
    f = 1
if f == 0 :
    print "Ce triangle est quelconque."

#########  Variante (proposée par Alex Misbah) ######### :
a=input('entrer une longueur a:')
b=input('entrer une longueur b:')
c=input('entrer une longueur c:')

ab_carre=(a*b)**2
pytha=(b*c)**2+(c*a)**2

if a<(b+c) and b<(a+c) and c <(a+b):
    print " les longueurs définissent un triangle"
    if ab_carre == pytha:
        print " c'est un triangle rectangle"
    elif a == b == c:
        print " c'est un triangle équilatéral"
    elif a == b or b == c or c == a:
        print "c'est un triangle isocèle"
    else:
        print "c'est un triangle quelconque"
else:
    print "les longueurs a,b et c ne permettent pas de définir un triangle"
