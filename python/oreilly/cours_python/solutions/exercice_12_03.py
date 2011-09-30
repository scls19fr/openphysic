#! /usr/bin/env python
# -*- coding: Latin-1 -*-

class Voiture:
    def __init__(self, marque = 'Ford', couleur = 'rouge'):
        self.couleur = couleur
        self.marque = marque
        self.pilote = 'personne'
        self.vitesse = 0
        
    def accelerer(self, taux, duree):
        if self.pilote =='personne':
            print "Cette voiture n'a pas de conducteur !"
        else:    
            self.vitesse = self.vitesse + taux * duree
        
    def choix_conducteur(self, nom):
        self.pilote = nom    
        
    def affiche_tout(self):
        print "%s %s pilotée par %s, vitesse = %s m/s" % \
            (self.marque, self.couleur, self.pilote, self.vitesse)     
    
a1 = Voiture('Peugeot', 'bleue')
a2 = Voiture(couleur = 'verte')
a3 = Voiture('Mercedes')
a1.choix_conducteur('Roméo')
a2.choix_conducteur('Juliette')
a2.accelerer(1.8, 12)
a3.accelerer(1.9, 11)
a2.affiche_tout()
a3.affiche_tout()
