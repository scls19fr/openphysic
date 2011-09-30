#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Le fichier traité est un fichier texte dont chaque ligne contient un nombre
# réel (sans exposants et encodé sous la forme d'une chaîne de caractères)    

def valArrondie(ch):
    "représentation arrondie du nombre présenté dans la chaîne ch"
    f = float(ch)       # conversion de la chaîne en un nombre réel
    e = int(f + .5)     # conversion en entier (On ajoute d'abord
                        # 0.5 au réel pour l'arrondir correctement)
    return str(e)       # reconversion en chaîne de caractères
     
fiSource = raw_input("Nom du fichier à traiter : ")
fiDest = raw_input("Nom du fichier destinataire : ")
fs = open(fiSource, 'r')
fd = open(fiDest, 'w')

while 1:
    ligne = fs.readline()       # lecture d'une ligne du fichier
    if ligne == "" or ligne == "\n":
        break
    ligne = valArrondie(ligne)
    fd.write(ligne +"\n")
    
fd.close()
fs.close()