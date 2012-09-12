#!/usr/bin/env/python

d = {
  'A': 'AAA',
  'B': 'BBB',
  'C': 'CCC',
}

def f(elt):
    if elt in d:
        return(d[elt])
    else:
        return("Undef")


#lst = ['B', 'A', 'C', 'A']
lst = ['B', 'A', 'C', 'A', 'D']

print(d)

print(lst)

#x = [d[elt] for elt in lst]
x = [f(elt) for elt in lst]

print(x)