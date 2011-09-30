#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def compteMots(ch):
    "comptage du nombre de mots dans la chaîne ch"
    if len(ch) ==0:
        return 0
    nm = 1                  # la chaîne comporte au moins un mot          
    for c in ch:
        if c == " ":        # il suffit de compter les espaces
            nm = nm + 1
    return nm

# Test :
if __name__ == '__main__':
    print compteMots("Les petits ruisseaux font les grandes rivières")
