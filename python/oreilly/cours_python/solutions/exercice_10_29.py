#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Affichage de tables de multiplication

nt = [2, 3, 5, 7, 9, 11, 13, 17, 19]

def tableMulti(m, n):
     "renvoie n termes de la table de multiplication par m"
     ch =""
     for i in range(n):
          v = m * (i+1)               # calcul d'un des termes
          ch = ch + "%4d" % (v)       # formatage à 4 caractères
     return ch

for a in nt:
     print tableMulti(a, 15)          # 15 premiers termes seulement
