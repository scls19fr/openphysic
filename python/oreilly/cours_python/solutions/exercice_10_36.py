#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Insertion de nouveaux éléments dans une liste existante

t1 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
t2 = ['Janvier','Février','Mars','Avril','Mai','Juin',
      'Juillet','Août','Septembre','Octobre','Novembre','Décembre']

c, d = 1, 0
while d < 12 :
     t2[c:c] = [t1[d]]       # ! l'élément inséré doit être une liste
     c, d = c+2, d+1