#! /usr/bin/env python
# -*- coding: Latin-1 -*-

n = 1       # numéro de la case
g = 1       # nombre de grains à y déposer
# Pour la variante, il suffit de définir g comme <float>
# en remplaçant la ligne ci-dessus par :  g = 1.

while n < 65 :
    print n, g
    n, g = n+1, g*2
