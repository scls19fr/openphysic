#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Conversion degrés -> radians
# Rappel : un angle de 1 radian est un angle qui correspond à une portion
# de circonférence de longueur égale à celle du rayon.
# Puisque la circonférence vaut 2 pi R, un angle de 1 radian correspond
# à 360° / 2 pi , ou encore à 180° / pi

# Angle fourni au départ en degrés, minutes, secondes :
deg, min, sec  = 32, 13, 49

# Conversion des secondes en une fraction de minute :
# (le point décimal force la conversion du résultat en un nombre réel)
fm = sec/60.
# Conversion des minutes en une fraction de degré :
fd = (min + fm)/60
# Valeur de l'angle en degrés "décimalisés" :
ang = deg + fd
# Valeur de pi :
pi = 3.14159265359
# Valeur d'un radian en degrés :
rad = 180 / pi
# Conversion de l'angle en radians :
arad = ang / rad
# Affichage :
print deg, "°", min, "'", sec, '" =', arad, "radian(s)"
