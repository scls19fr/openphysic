#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Notes de travaux scolaires

notes = []           # liste à construire  
n = 2                # valeur positive quelconque pour initier la boucle
while n >= 0 :
    print "Entrez la note suivante, s.v.p. : ",
    n = float(raw_input())      # conversion de l'entrée en un nombre réel
    if n < 0 :
        print "OK. Terminé."
    else:    
        notes.append(n)         # ajout d'une note à la liste
        # Calculs divers sur les notes déjà entrées :
        # valeurs minimale et maximale + total de toutes les notes. 
        min = 500               # valeur supérieure à toute note
        max, tot, i = 0, 0, 0        
        nn = len(notes)         # nombre de notes déjà entrées
        while i < nn:
            if notes[i] > max:
                max = notes[i]
            if notes[i] < min:
                min = notes[i]
            tot = tot + notes[i]
            moy = tot/nn
            i = i + 1
        print nn, "notes entrées. Max =", max, "Min =", min, "Moy =", moy
