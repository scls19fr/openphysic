#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Module contenant une série de fonctions graphiques "tortue"

from turtle import *

def forme(n, a, taille, couleur, angle):
    "forme de base, avec n = nombre de côtés, a = angle des sommets"
    down()              # abaisser le crayon
    right(angle)        # choisir une orientation de départ
    color(couleur)      # ainsi qu'une couleur de tracé
    # tracer la forme graphique proprement dite :
    c =0
    while c < n:
        forward(taille)
        right(a)
        c = c +1
    up()

def carre(taille, couleur, angle):
    forme(4, 90, taille, couleur, angle)

def triangle(taille, couleur, angle):
    forme(3, 120, taille, couleur, angle)

def etoile5(taille, couleur, angle):
    forme(5, 144, taille, couleur, angle)
    # 144° = 180° - 360°/10

def etoile6(taille, couleur, angle):
    # dessiner un premier triangle équilatéral :
    forme(3, 120, taille, couleur, angle)
    # repositionner le crayon :
    left(30)
    forward(taille/1.732)       # 1.732 = 2 * cos(30°)
    # dessiner le second triangle, après rotation :
    right(90)
    forme(3, 120, taille, couleur, angle)
    # si l'on veut retrouver l'orientation initiale :
    #left(60)

