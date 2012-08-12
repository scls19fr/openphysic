#!/usr/bin/env python

import numpy as np
import pandas as pd
#from datetime import date, datetime, timedelta

m = 1 # kg
g = 9.81 # m.s^(-2)

tmin = 0 # s
tmax = 1 # s
tstep = 0.1 # s
t = np.arange(tmin,tmax,tstep)

nul = np.zeros(t.shape)

df_F = pd.DataFrame({'x':nul, 'y':nul, 'z':nul}, index=t)
df_F['z'] = -m*g 

df_V = pd.DataFrame({'x':nul, 'y':nul, 'z':nul}, index=t)
df_V.ix[0] = [1, 1, 0] # m/s

df_OM = pd.DataFrame({'x':nul, 'y':nul, 'z':nul}, index=t)
df_OM.ix[0] = [0, 0, 0] # m

# sum(F->) = m a-> = m v->. = m OM->..
#v = np.zeros((3,len(t)))

# F->/m = (v->(t)-v->(t-dt))/dt
# shift / roll ?
# integrate

# voir lib pandas ? DataFrame
#  F: t Fx Fy Fz
#  V: t Vx Vy Vz
# OM: t  x  y  z

# v->(t) = F->/m * dt + v->(t-dt)

#v->(t) = (OM->(t) - OM->(t-dt)) / dt