#! /usr/bin/env python
# -*- compile-command: "python hello.py" -*-

print "Calcul numerique en Python"

A=[[1,2],[3,4]]

print A

print A[1] # selectionne la deuxieme ligne (indice commence a 1)

print [A[i][0] for i in range(len(A))] # selectionne la premiere colonne
print [i[0] for i in A] # selectionne la premiere colonne (+ court)



B=[[1,2],[3,4]]

#print add(A,B)
# voir pour les operations


import numarray

A_num = numarray.array([[1,2],[3,4]])
print numarray.transpose(A_num)[0]
