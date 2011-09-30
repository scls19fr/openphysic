#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def volBoite(x1 =-1, x2 =-1, x3 =-1):
    "Volume d'une boîte parallélipipédique"
    if x1 == -1 :
        return x1           # aucun argument n'a été fourni
    elif x2 == -1 :
        return x1**3        # un seul argument -> boîte cubique
    elif x3 == -1 :
        return x1*x1*x2     # deux arguments -> boîte prismatique
    else :
        return x1*x2*x3

# test :
print volBoite()
print volBoite(5.2)
print volBoite(5.2, 3)
print volBoite(5.2, 3, 7.4)
