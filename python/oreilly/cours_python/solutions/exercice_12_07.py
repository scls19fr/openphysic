#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Tirage de cartes

from random import randrange

class JeuDeCartes:
    """Jeu de cartes"""
    # attributs de classe (communs à toutes les instances) :
    couleur = ('Pique', 'Trèfle', 'Carreau', 'Coeur')
    valeur = (0, 0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'valet', 'dame', 'roi', 'as')

    def __init__(self):
        "Construction de la liste des 52 cartes"
        self.carte =[]
        for coul in range(4):
            for val in range(13):
                self.carte.append((val +2, coul))   # la valeur commence à 2

    def nom_carte(self, c):
        "Renvoi du nom de la carte c, en clair"
        return "%s de %s" % (self.valeur[c[0]], self.couleur[c[1]])
        
    def battre(self):
        "Mélange des cartes"
        t = len(self.carte)             # nombre de cartes restantes
        # pour mélanger, on procède à un nombre d'échanges équivalent :
        for i in range(t):
            # tirage au hasard de 2 emplacements dans la liste :
            h1, h2 = randrange(t), randrange(t)
            # échange des cartes situées à ces emplacements :
            self.carte[h1], self.carte[h2] = self.carte[h2], self.carte[h1]
        
    def tirer(self):
        "Tirage de la première carte de la pile"
        t = len(self.carte)             # vérifier qu'il reste des cartes 
        if t >0:                        
            carte = self.carte[0]       # choisir la première carte du jeu
            del(self.carte[0])          # la retirer du jeu
            return carte                # en renvoyer copie au prog. appelant
        else:
            return None                 # facultatif

### Programme test :

if __name__ == '__main__':
    jeu = JeuDeCartes()                 # instanciation d'un objet
    jeu.battre()                        # mélange des cartes
    for n in range(53):                 # tirage des 52 cartes : 
        c = jeu.tirer()
        if c == None:                   # il ne reste aucune carte
            print 'Terminé !'           # dans la liste
        else:
            print jeu.nom_carte(c)      # valeur et couleur de la carte
