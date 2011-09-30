#! /usr/bin/env python
# -*- coding: Latin-1 -*-

from math import pi

def surfCercle(r):
    "Surface d'un cercle de rayon r"
    return pi * r**2

# test :
print surfCercle(2.5)
