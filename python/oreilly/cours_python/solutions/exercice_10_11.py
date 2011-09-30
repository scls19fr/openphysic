#! /usr/bin/env python
# -*- coding: Latin-1 -*-

from exercice_10_08 import majuscule
from exercice_10_10 import chaineListe

txt = "Le nom de ce Monsieur est Alphonse"
lst = chaineListe(txt)          # convertir la phrase en une liste de mots
for mot in lst:                 # analyser chacun des mots de la liste
    if majuscule(mot[0]):       # tester le premier caractère du mot
        print mot
