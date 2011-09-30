#! /usr/bin/env python
# -*- coding: Latin-1 -*-

## Cette variante utilise une liste de listes ##
## (que l'on pourrait aisément remplacer par deux listes distinctes)

# La liste ci-dessous contient deux éléments qui sont eux-mêmes des listes.
# l'élément 0 contient les nombres de jours de chaque mois, tandis que
# l'élément 1 contient les noms des douze mois :
mois = [[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
        ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet',
         'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre']]

jour = ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi']

ja, jm, js, m = 0, 0, 0, 0

while ja <365:
    ja, jm = ja +1, jm +1    # ja = jour dans l'année, jm = jour dans le mois
    js = (ja +3) % 7         # js = jour de la semaine. Le décalage ajouté 
                             #      permet de choisir le jour de départ
  
    if jm > mois[0][m]:               # élément m de l'élément 0 de la liste
        jm, m = 1, m+1

    print jour[js], jm, mois[1][m]    # élément m de l'élément 1 de la liste
