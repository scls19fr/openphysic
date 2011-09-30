#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Ajouter des informations dans le fichier du club

def traduire(ch):
    "convertir une ligne du fichier source en liste de données"
    dn = ""                 # chaîne temporaire pour extraire les données  
    tt = []                 # la liste à produire
    i = 0
    while i < len(ch):
        if ch[i] == "#":
            tt.append(dn)   # on ajoute la donnée à la liste, et   
            dn =""          # on réinitialise la chaine temporaire
        else:    
            dn = dn + ch[i]
        i = i + 1
    return tt    
    
def encodage(tt):
    "renvoyer la liste tt, complétée avec la date de naissance et le sexe"
    print "*** Veuillez entrer les données (ou <Enter> pour terminer) :"
    # Affichage des données déjà présentes dans la liste :
    i = 0
    while i < len(tt):
        print tt[i],
        i = i +1
    print
    while 1:
        daNai = raw_input("Date de naissance : ")
        sexe = raw_input("Sexe (m ou f) : ")
        print daNai, sexe
        ver = raw_input("Entrez <Enter> si c'est correct, sinon <n> ")
        if ver == "":
            break
    tt.append(daNai)
    tt.append(sexe)
    return tt

def enregistrer(tt):
    "enregistrer les données de la liste tt en les séparant par des <#>"
    i = 0
    while i < len(tt):
        fd.write(tt[i] + "#")
        i = i + 1
    fd.write("\n")          # caractère de fin de ligne

fSource = raw_input('Nom du fichier source : ')
fDest = raw_input('Nom du fichier destinataire : ')
fs = open(fSource, 'r')
fd = open(fDest, 'w')
while 1:
    ligne = fs.readline()           # lire une ligne du fichier source
    if ligne =="" or ligne =="\n":
        break
    liste = traduire(ligne)         # la convertir en une liste
    liste = encodage(liste)         # y ajouter les données supplémentaires
    enregistrer(liste)              # sauvegarder dans fichier dest.

fd.close()
fs.close()
