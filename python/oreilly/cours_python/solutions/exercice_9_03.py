#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def tableMulti(n):
    # Fonction générant la table de multiplication par n (20 termes)
    # La table sera renvoyée sous forme d'une chaîne de caractères :
    i, ch = 0, ""
    while i < 20:        
        i = i + 1
        ch = ch + str(i * n) + " "
    return ch

NomF = raw_input("Nom du fichier à créer : ")
fichier = open(NomF, 'w')

# Génération des tables de 2 à 30 :
table = 2
while table < 31:
    fichier.write(tableMulti(table) + '\n')
    table = table + 1
fichier.close()