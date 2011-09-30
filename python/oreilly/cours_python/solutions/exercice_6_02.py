#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Périmètre et Aire d'un triangle quelconque

from math import sqrt

print "Veuillez entrer le côté a : "
a = float(raw_input())
print "Veuillez entrer le côté b : "
b = float(raw_input())
print "Veuillez entrer le côté c : "
c = float(raw_input())
d = (a + b + c)/2                # demi-périmètre
s = sqrt(d*(d-a)*(d-b)*(d-c))    # aire (suivant formule)

print "Longueur des côtés =", a, b, c
print "Périmètre =", d*2, "Aire =", s