#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# module de fonctions concernant les chaînes de caractères

def majuscule(car):
    "renvoie <vrai> si car est une majuscule"
    if car >= "A" and car <= "Z":
        return 1
    else:
        return 0
    
def minuscule(car):
    "renvoie <vrai> si car est une minuscule"
    if car >= "a" and car <= "z":
        return 1
    else:
        return 0

def alphab(car):
    "renvoie <vrai> si car est un caractère alphabétique"
    if majuscule(car) or minuscule(car):
        return 1
    else:
        return 0     

# Test :
if __name__ == '__main__':
        print majuscule('d'), majuscule('F')
        print minuscule('d'), minuscule('F')
        print alphab('q'), alphab('P'), alphab('5')