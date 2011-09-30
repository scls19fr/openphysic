#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def volBoite(x1 =10, x2 =10, x3 =10):
    "Volume d'une boîte parallélipipédique"
    return x1 * x2 * x3

# test :
print volBoite()
print volBoite(5.2)
print volBoite(5.2, 3)
