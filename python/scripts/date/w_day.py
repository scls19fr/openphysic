#!/usr/bin/env python
from datetime import *

# Compte le nb de jours travailles (lu,ma,me,je,ve mais pas sa ou di)
# entre deux dates

t1=date(2009, 1, 1) # yyyy mm dd

#t=date.today()
#t2=t

t2=date(2009, 7, 3) # yyyy mm dd

#print t2-t1
#print t2.weekday()
day=timedelta(1)
w_day=0 # jours travailles
t3=t1
while t3<=t2:
	if t3.weekday()<=4: # 0:Lu 1:Ma 2:Me 3:Je 4:Ve 5:Sa 6:Di
		w_day=w_day+1

	t3=t3+day

#print t1+31*day
print w_day