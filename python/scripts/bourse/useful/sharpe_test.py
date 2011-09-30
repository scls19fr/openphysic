#!/usr/bin/env python
# -*- coding: utf8 -*-

#    Sharpe ratio & Sortino ratio
#
#       But : ce fichier teste les fonctions ratio de Sharpe et ratio de Sortino
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

from sharpe import *
from datetime import datetime

# 1er janv : 1000
# 31 janv : 2000
# 29 fev : 2000
# ...
# 31 dec : 2850
print("="*5+" Input "+"="*5)

date = [datetime(2011, 1, 1, 0, 0, 0), datetime(2011, 1, 31),
	datetime(2011, 2, 28), datetime(2011, 3, 31),
	datetime(2011, 4, 30), datetime(2011, 5, 31),
	datetime(2011, 6, 30), datetime(2011, 7, 31),
	datetime(2011, 8, 31), datetime(2011, 9, 30),
	datetime(2011, 10, 31), datetime(2011, 11, 30), datetime(2011, 12, 31)]

print(date)

val = [1000, 2000, 3000, 2500, 2000, 2500,
	2800, 2000, 2500, 2800, 2900, 2800, 2850]

print(val)

rf = 0 # Rendement de l'avoir sans risque

print("="*5+" Test "+"="*5)
print((average(val)-rf))

print("="*5+" Ratio "+"="*5)

sh_r = sharpe_ratio(val, rf)
print('Sharpe ratio : {0}'.format(sh_r))

#so_r = sortino_ratio(val, rf)
#print('Sortino ratio : {0}'.format(so_r))
