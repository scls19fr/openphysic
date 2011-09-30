#! /usr/bin/env python
# -*- coding: Latin-1 -*-

def majuscule(car):
    "renvoie <vrai> si car est une majuscule"
    if car in "ABCDEFGHIJKLMNOPQRSTUVWXYZ":
        return 1
    else:
        return 0

# Test :
if __name__ == '__main__':
    print majuscule('d'), majuscule('F')