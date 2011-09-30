#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Tirage de cartes

from random import randrange

couleurs = ['Pique', 'Trèfle', 'Carreau', 'Coeur']
valeurs = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'valet', 'dame', 'roi', 'as']

# Construction de la liste des 52 cartes :
carte =[]
for coul in couleurs:
     for val in valeurs:
          carte.append("%s de %s" % (str(val), coul))

# Tirage au hasard :
while 1:
     k = raw_input("Frappez <c> pour tirer une carte, <Enter> pour terminer ") 
     if k =="":
          break
     r = randrange(52)
     print carte[r]
