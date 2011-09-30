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

def get_pips_stat(lstPips):
    nb_trades = len(lstPips)
    nb_win = 0
    nb_lost = 0
    totalPips = 0
    pipsWin = 0
    pipsLost = 0
    #(nb_trade, nb_win, nb_lost)
    #print(lstPips)
    for pips in lstPips:
        totalPips = totalPips + pips
        if pips>=0:
            nb_win = nb_win + 1
            pipsWin = pipsWin + pips
        else:
            nb_lost = nb_lost + 1
            pipsLost = pipsLost + pips
    #val = (nb_trades, totalPips, nb_win, nb_lost, pipsWin, pipsLost)
    #return val
    #print nb_trades
    #print nb_win
    #print nb_lost
    try:
        pipsMoyWin = pipsWin / nb_win
    except:
        pipsMoyWin = 0
    try:
        pipsMoyLost = pipsLost / nb_lost
    except:
        pipsMoyLost = 0
    try:
        pipsMoy = totalPips / nb_trades
        pcWin = nb_win*100.0 / nb_trades
        pcLost = nb_lost*100.0 / nb_trades
    except:
        pipsMoy = 0
        pcWin = 50
        pcLost = 50

    stat = {'Nb Trades':nb_trades, 'Pips total':totalPips, 'Nb Trades gagnants':nb_win, 'Nb Trades perdants':nb_lost, 'Pips moyen gagnés':pipsMoyWin, 'Pips moyen perdus':pipsMoyLost, 'Pips moyen / trade':pipsMoy, '% gagner':pcWin, '% perdre':pcLost}
    return stat
    #return None