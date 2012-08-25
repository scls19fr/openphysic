#!/usr/bin/env python

import numpy as np
import pandas as pd
#from datetime import date, datetime, timedelta
from scipy.integrate import odeint

def func_acc(V, t):
  return(F/m)

m = 1 # kg
g = 9.81 # m.s^(-2)

tmin = 0 # s
tmax = 1 # s
tstep = 0.1 # s
t = np.arange(tmin,tmax,tstep)

nul = np.zeros(t.shape)

F = pd.DataFrame({'x':nul, 'y':nul, 'z':nul}, index=t)
F['z'] = -m*g 

A = F/m

V = pd.DataFrame({'x':nul, 'y':nul, 'z':nul}, index=t)
V.ix[0] = [1, 0, 1] # m/s

OM = pd.DataFrame({'x':nul, 'y':nul, 'z':nul}, index=t)
OM.ix[0] = [0, 0, 0] # m

# sum(F->) = m a-> = m v->. = m OM->..
#v = np.zeros((3,len(t)))

# F->/m = (v->(t)-v->(t-dt))/dt
# shift / roll ?
# integrate ? odeint http://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.odeint.html
# vectorize ? http://docs.scipy.org/doc/numpy/reference/generated/numpy.vectorize.html
# http://dakarlug.org/pat/scientifique/html/scipy.html

# voir lib pandas ? DataFrame
#  F: t Fx Fy Fz
#  V: t Vx Vy Vz
# OM: t  x  y  z

# v->(t) = F->/m * dt + v->(t-dt)

#v->(t) = (OM->(t) - OM->(t-dt)) / dt