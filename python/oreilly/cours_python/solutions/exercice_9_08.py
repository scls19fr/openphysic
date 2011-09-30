#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Enregistrer les coordonnées des membres d'un club

def encodage():
    "renvoie la liste des valeurs entrées, ou une liste vide"
    print "*** Veuillez entrer les données (ou <Enter> pour terminer) :"
    while 1:
        nom = raw_input("Nom : ")
        if nom == "":
            return []
        prenom = raw_input("Prénom : ")
        rueNum = raw_input("Adresse (N° et rue) : ")
        cPost = raw_input("Code postal : ")
        local = raw_input("Localité : ")
        tel = raw_input("N° de téléphone : ")
        print nom, prenom, rueNum, cPost, local, tel
        ver = raw_input("Entrez <Enter> si c'est correct, sinon <n> ")
        if ver == "":
            break
    return [nom, prenom, rueNum, cPost, local, tel]

def enregistrer(liste):
    "enregistre les données de la liste en les séparant par des <#>"
    i = 0
    while i < len(liste):
        of.write(liste[i] + "#")
        i = i + 1
    of.write("\n")              # caractère de fin de ligne    
    
nomF = raw_input('Nom du fichier destinataire : ')
of = open(nomF, 'a')
while 1:
    tt = encodage()
    if tt == []:
        break
    enregistrer(tt)

of.close()