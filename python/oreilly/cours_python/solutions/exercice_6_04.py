#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Entrée d'éléments dans une liste

tt = []             # Liste à compléter (vide au départ)
ch = "start"        # valeur quelconque (mais non nulle) 
while ch != "":
    print "Veuillez entrer une valeur : "
    ch = raw_input()
    if ch != "":
        tt.append(float(ch))        # variante : tt.append(ch)    

# affichage de la liste :
print tt
