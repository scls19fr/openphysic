#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Rechercher l'indice d'un caractère donné dans une chaîne

def trouve(ch, car, deb=0):
    "trouve l'indice du caractère car dans la chaîne ch"
    i = deb
    while i < len(ch):
        if ch[i] == car:
            return i		# le caractère est trouvé -> on termine
        i = i + 1
    return -1       		# toute la chaîne a été scannée sans succès 

# Test :
if __name__ == '__main__':
    print trouve("Coucou c'est moi", "z")
    print trouve("Juliette & Roméo", "&")
    print trouve("César & Cléopâtre", "r", 5)
