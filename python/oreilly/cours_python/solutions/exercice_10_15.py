#! /usr/bin/env python
# -*- coding: Latin-1 -*-

from exercice_10_12 import majuscule
from exercice_10_10 import chaineListe

def compteMaj(ch):
    "comptage des mots débutant par une majuscule dans la chaîne ch"
    c = 0
    lst = chaineListe(ch)       # convertir la phrase en une liste de mots
    for mot in lst:             # analyser chacun des mots de la liste
        if majuscule(mot[0]):   # tester le premier caractère du mot
            c = c +1
    return c
    
# Test :
if __name__ == '__main__':
    phrase = "Les filles Tidgout se nomment Justine et Corinne"
    print "Cette phrase contient", compteMaj(phrase), "majuscules."
