#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def voyelle(car):
    "teste si car est une voyelle"
    if car in "AEIOUYaeiouy":
        return 1
    else:
        return 0

def compteVoyelles(ch):
    "compte les voyelles présentes dans la chaîne ch"
    n = 0
    for c in ch:
        if voyelle(c):
            n = n + 1
    return n

# Test :
if __name__ == '__main__':
    print compteVoyelles("Monty Python Flying Circus")