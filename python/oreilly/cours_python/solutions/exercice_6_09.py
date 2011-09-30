#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Années bissextiles

print "Veuillez entrer l'année à tester :",
a = input()

if a % 4 != 0:
    # a n'est pas divisible par 4 -> année non bissextile
    bs = 0      
else:
    if a % 400 ==0:
        # a divisible par 400 -> année bissextile
        bs = 1
    elif a % 100 ==0:
        # a divisible par 100 -> année non bissextile
        bs = 0
    else:
        # autres cas ou a est divisible par 4 -> année bissextile
        bs = 1
if bs ==1:
    ch = "est"
else:
    ch = "n'est pas"
print "L'année", a, ch, "bissextile."

########### Variante (proposée par Alex Misbah ) : #####

a = input('Veuillez entrer une année :')

if (a%4==0) and ((a%100!=0) or (a%400==0)):
    print a,"est une année bissextile"
else:
    print a,"n'est pas une année bissextile"

