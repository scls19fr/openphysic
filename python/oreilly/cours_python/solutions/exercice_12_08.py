#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Bataille de de cartes

from exercice_12_07 import JeuDeCartes

jeuA = JeuDeCartes()        # instanciation du premier jeu      
jeuB = JeuDeCartes()        # instanciation du second jeu      
jeuA.battre()               # mélange de chacun
jeuB.battre()
pA, pB = 0, 0               # compteurs de points des joueurs A et B

# tirer 52 fois une carte de chaque jeu :
for n in range(52):         
    cA, cB = jeuA.tirer(), jeuB.tirer()
    vA, vB = cA[0], cB[0]   # valeurs de ces cartes
    if vA > vB:
        pA += 1
    elif vB > vA:
        pB += 1             # (rien ne se passe si vA = vB)
    # affichage des points successifs et des cartes tirées :
    print "%s * %s ==> %s * %s" % (jeuA.nom_carte(cA),
                                    jeuB.nom_carte(cB), pA, pB) 

print "le joueur A obtient %s points, le joueur B en obtient %s." % (pA, pB)
