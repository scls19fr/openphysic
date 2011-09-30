#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def changeCar(ch, ca1, ca2, debut =0, fin =-1):
    "Remplace tous les caractères ca1 par des ca2 dans la chaîne ch"
    if fin == -1:
        fin = len(ch)
    nch, i = "", 0            # nch : nouvelle chaîne à construire
    while i < len(ch) :
        if i >= debut and i <= fin and ch[i] == ca1:
            nch = nch + ca2
        else :
            nch = nch + ch[i]
        i = i + 1
    return nch

# test :
print changeCar("Ceci est une toute petite phrase", " ", "*")
print changeCar("Ceci est une toute petite phrase", " ", "*", 8, 12)
print changeCar("Ceci est une toute petite phrase", " ", "*", 12)
