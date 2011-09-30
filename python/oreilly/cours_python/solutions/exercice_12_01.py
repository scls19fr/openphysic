#! /usr/bin/env python
# -*- coding: Latin-1 -*-

class Domino:
    def __init__(self, pa, pb):
        self.pa, self.pb = pa, pb
         
    def affiche_points(self):
        print "face A :", self.pa,
        print "face B :", self.pb
        
    def valeur(self):
        return self.pa + self.pb

# Programme de test :

d1 = Domino(2,6)
d2 = Domino(4,3)

d1.affiche_points()
d2.affiche_points()

print "total des points :", d1.valeur() + d2.valeur() 

liste_dominos = []
for i in range(7):
    liste_dominos.append(Domino(6, i))

vt =0
for i in range(7):
    liste_dominos[i].affiche_points()
    vt = vt + liste_dominos[i].valeur()
    
print "valeur totale des points", vt    
