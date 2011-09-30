#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def indexMax(tt):
    "renvoie l'indice du plus grand élément de la liste tt"
    i, max = 0, 0
    while i < len(tt):
        if tt[i] > max :
            max, imax = tt[i], i
        i = i + 1    
    return imax

# test :
serie = [5, 8, 2, 1, 9, 3, 6, 4]
print indexMax(serie)
