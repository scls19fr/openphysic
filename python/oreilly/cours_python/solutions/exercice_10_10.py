#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def chaineListe(ch):
    "convertit la chaîne ch en une liste de mots"
    liste, ct = [], ""          # ct est une chaîne temporaire
    for c in ch:
        if c == " ":
            liste.append(ct)    # ajouter la ch. temporaire à la liste
            ct = ""             # ré-initialiser la ch. temporaire
        else:    
            ct = ct + c
    if ct != "":        
        liste.append(ct)        # ne pas oublier le dernier mot        
    return liste

# Test :
if __name__ == '__main__':
    print chaineListe("Une hirondelle ne fait pas le printemps")
    print chaineListe("")
