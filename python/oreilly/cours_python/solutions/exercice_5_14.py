#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Séparation des nombres pairs et impairs

# Liste fournie au départ :
tt = [32, 5, 12, 8, 3, 75, 2, 15]
pairs = []
impairs = []
# Examen de tous les éléments :
i = 0
while i < len(tt):
    if tt[i] % 2 == 0:
        pairs.append(tt[i])
    else:
        impairs.append(tt[i])
    i = i + 1
# Affichage :
print "Nombres pairs :", pairs
print "Nombres impairs :", impairs

