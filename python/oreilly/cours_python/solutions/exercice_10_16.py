#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Table des codes ASCII

c = 32      # Premier code ASCII <imprimable>

while c < 128 :                 # caractères non accentués seulement 
    print "Code", c, ":", chr(c), "  ",
    c = c + 1
