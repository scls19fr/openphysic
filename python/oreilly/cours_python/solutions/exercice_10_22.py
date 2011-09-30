#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Comptage du nombre de mots dans un texte

fiSource = raw_input("Nom du fichier à traiter : ")
fs = open(fiSource, 'r')

n = 0           # variable compteur
while 1:
    ch = fs.readline()
    if ch == "":
        break
    # conversion de la chaîne lue en une liste de mots :
    li = ch.split()
    # totalisation des mots :
    n = n + len(li)    
fs.close()
print "Ce fichier texte contient un total de %s mots" % (n)
