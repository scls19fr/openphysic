#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Fusion de lignes pour former des phrases

fiSource = raw_input("Nom du fichier à traiter : ")
fiDest = raw_input("Nom du fichier destinataire : ")
fs = open(fiSource, 'r')
fd = open(fiDest, 'w')


# On lit d'abord la première ligne :
ch1 = fs.readline()
# On lit ensuite les suivantes, en les fusionnant si nécessaire :
while 1:
    ch2 = fs.readline()
    if ch2 == "":
        break
    # Si la chaîne lue commence par une majuscule, on transcrit
    # la précédente dans le fichier destinataire, et on la
    # remplace par celle que l'on vient de lire :
    if ch2[0] >= "A" and ch2[0] <= "Z":
        fd.write(ch1)
        ch1 = ch2
    # Sinon, on la fusionne avec la précédente :
    else:
        ch1 = ch1[:-1] + " " + ch2
        # (veiller à enlever de ch1 le caractère de fin de ligne)
        
fd.write(ch1)        # ne pas oublier de transcrire la dernière !
fd.close()    
fs.close()
