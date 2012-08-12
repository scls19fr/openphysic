#!/usr/bin/env python

import numpy as np

m = 1 // kg
g = 9.81 // m.s^(-2)

tmin = 0 # s
tmax = 10 # s
tstep = 0.1 # s
t = np.arange(tmin,tmax,tstep)

F = array([0, 0, -m*g]) # N

v0 = np.array([1, 1, 0]) # m/s

# sum(F->) = m a-> = m v->. = m OM->..
v = np.zeros((3,len(t)))

# F->/m = (v->(t)-v->(t-dt))/dt
# shift / roll


# v->(t) = F->/m * dt + v->(t-dt)

#v->(t) = (OM->(t) - OM->(t-dt)) / dt