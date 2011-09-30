#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def nomMois(n):
    "renvoie le nom du n-ième mois de l'année"
    mois = ['Janvier,', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet',
            'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre']
    return mois[n -1]       # les indices sont numérotés à partir de zéro

# test :
print nomMois(4)
