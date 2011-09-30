# -*- coding: Latin-1 -*-
# encodage d'un texte dans un dictionnaire

nFich = raw_input('Nom du fichier à traiter : ')
fi = open(nFich, 'r')
texte = fi.read()
fi.close()

# On considère que les mots sont des suites de caractères faisant partie
# de la chaîne ci-dessous. Tous les autres sont des séparateurs :

alpha = "abcdefghijklmnopqrstuvwxyzéèàùçâêîôûäëïöü"

# construction du dictionnaire :
dico ={}
# parcours de tous les caractères du texte :
i =0                    # indice du caractère en cours de lecture
mot =""                 # variable de travail : mot en cours de lecture
for c in texte:
    c = c.lower()       # conversion de chaque caractère en minuscule
    
    if c in alpha:      # car. alphabétique => on est à l'intérieur d'un mot
        mot = mot + c   
    else:               # car. non-alphab. => fin de mot
        if mot !="":    # afin d'ignorer les car. non-alphab. successifs
            # pour chaque mot, on construit une liste d'indices :
            if dico.has_key(mot):       # mot déjà répertorié :
                dico[mot].append(i)     # ajout d'un indice à la liste
            else:                       # mot rencontré pour la 1e fois :
                dico[mot] =[i]          # création de la liste d'indices
            mot =""     # préparer la lecture du mot suivant
    i += 1              # indice du caractère suivant
      
# Affichage du dictionnaire, en clair :
for clef, valeur in dico.items():
    print clef, ":", valeur