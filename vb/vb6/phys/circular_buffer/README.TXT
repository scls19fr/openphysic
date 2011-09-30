Buffer circulaire


permet de stocker des double sur un espace linéaire de mémoire de taille fixée
(à la compilation ou à l'exécution)

Mode wrap (écrasement des données les plus anciennes)
ou mode fill (lancement d'une exception lors du dépassement de taille)



à faire :
redimensionnement du buffer à l'exécution avec conservation des données

Redim Preserve
puis copie en 2 parties (d'abord les données les plus récentes puis les plus anciennes)

envisager aussi le cas du redimensionnement vers un buffer plus petit