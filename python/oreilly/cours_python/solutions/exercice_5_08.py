#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Insertion d'un caractère d'espacement dans une chaîne

# Chaîne fournie au départ :
ch = "Gaston"
# Caractère à insérer :
cr = "*"
# Le nombre de caractères à insérer est inférieur d'une unité au
# nombre de caractères de la chaîne. On traitera donc celle-ci à
# partir de son second caractère (en omettant le premier).
lc = len(ch)    # nombre de caractères total
i = 1           # indice du premier caractère à examiner (le second, en fait)
nch = ch[0]     # nouvelle chaîne à construire (contient déjà le premier car.)
while i < lc:
    nch = nch + cr + ch[i]
    i = i + 1    
# Affichage :
print nch
