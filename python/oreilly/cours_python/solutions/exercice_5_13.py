#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Recherche du plus grand élément d'une liste

# Liste fournie au départ :
tt = [32, 5, 12, 8, 3, 75, 2, 15]
# Au fur et à mesure du traitement de la liste, on mémorisera dans
# la variable ci-dessous la valeur du plus grand élément déjà trouvé :
max = 0
# Examen de tous les éléments :
i = 0
while i < len(tt):
    if tt[i] > max:
        max = tt[i]         # mémorisation d'un nouveau maximum    
    i = i + 1
# Affichage :
print "Le plus grand élément de cette liste a la valeur", max
