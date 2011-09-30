#!/usr/bin/env python
# -*- coding: utf8 -*-

#    Useful class
#
#       But : ce fichier définit diverses fonctions pratiques
#
#    Copyright (C) 2011  "Sébastien CELLES" <s.celles@gmail.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>


#
# Donne le nb de val dans chaque intervalle
#
def inbound(bounds, vals, minus_infinity=True, plus_infinity=True):
    bounds.sort()
    nb = [0 for i in range(0, len(bounds)-1)]
    nb_minus_infinity = 0
    nb_plus_infinity = 0
    
    for val in vals:
        if val < bounds[0]:
            nb_minus_infinity = nb_minus_infinity + 1

        if val >= bounds[len(bounds)-1]:
            nb_plus_infinity = nb_plus_infinity + 1

        for j in range(0, len(bounds)-1):
            #print("[{0};{1}]".format(bounds[j],bounds[j+1]))
            if bounds[j]<=val and (val<bounds[j+1] or val<=bounds[j+1] and not plus_infinity):
                nb[j] = nb[j] + 1

    if minus_infinity:
        nb.insert(0, nb_minus_infinity)

    if plus_infinity:
        nb.append(nb_plus_infinity)

    return nb

def cumulative_sum(n):
    cum_sum = []
    y = 0
    for i in n:   # <--- i will contain elements (not indices) from n
        y += i    # <--- so you need to add i, not n[i]
        cum_sum.append(y)
    return cum_sum

