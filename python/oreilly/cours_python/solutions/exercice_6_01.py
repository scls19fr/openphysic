#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Conversion de miles/heure en km/h et m/s

print "Veuillez entrer le nombre de miles parcourus en une heure : ",
ch = raw_input()            # en général préférable à input()
mph = float(ch)             # conversion de la chaîne entrée en nombre réel
mps = mph * 1609 / 3600     # conversion en mètres par seconde
kmph = mph * 1.609          # conversion en km/h

# affichage :
print mph, "miles/heure =", kmph, "km/h, ou encore", mps, "m/s"
