#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Recherche de lignes particulières dans un fichier texte :

def chercheCP(ch):
    "recherche dans ch la portion de chaîne contenant le code postal"
    i, f, ns = 0, 0, 0          # ns est un compteur de codes #
    cc = ""                     # chaîne à construire 
    while i < len(ch):
        if ch[i] =="#":
            ns = ns +1
            if ns ==3:          # le CP se trouve après le 3e code #
                f = 1           # variable "drapeau" (flag)
            elif ns ==4:        # inutile de lire après le 4e code #
                break
        elif f ==1:             # le caractère lu fait partie du
            cc = cc + ch[i]     # CP recherché -> on mémorise
        i = i +1
    return cc    
        
nomF = raw_input("Nom du fichier à traiter : ")
codeP = raw_input("Code postal à rechercher : ")
fi = open(nomF, 'r')
while 1:
    ligne = fi.readline()
    if ligne =="":
        break
    if chercheCP(ligne) == codeP:
        print ligne
fi.close()
