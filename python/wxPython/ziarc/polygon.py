# ---------------------------------------------------------------------------------------------

# License

# Copyright (C) 2001 by Uwe Schmitt, uwe.schmitt@procoders.net

# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software, to deal in ZiaRC without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of ZiaRC, and to permit persons to whom the
# ZiaRC is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of ZiaRC.

# The software is provided "as is", without warranty of any kind, express or
# implied, including but not limited to the warranties of merchantability,
# fitness for a particular purpose and noninfringement.  In no event shall
# Uwe Schmitt be liable for any claim, damages or other liability,
# whether in an action of contract, tort or otherwise, arising from, out of
# or in connection with ZiaRC or the use or other dealings in
# ZiaRC.

# ---------------------------------------------------------------------------------------------

# All information about installation at http://ziarc.procoders.net

# run ZiaRC by "python main_ziarc.py"

# ---------------------------------------------------------------------------------------------


from Numeric import *
from math import *


##### class Polygon: inkl. methode ob punkt im oder ausserhalb polygon ######

class Polygon:

    def __init__(self,plist=[]):

        self.plist=plist

    def NewPolygon(self):

        del (self.plist)
        self.plist=[]

    def AddPoint(self,p):

        self.plist.append(p)

    def _dpwinkel(self,p1,p2,p3):

        """ 
            berechnet winkel zwischen (p1,p2) und (p1,p3)
            resultat liegt in ]-pi, +pi]

        """

        alpha1=atan2(p1[1]-p2[1],p1[0]-p2[0])
        alpha2=atan2(p1[0]-p3[0],p1[1]-p3[1])
        beta=pi/2.0-alpha1-alpha2
        if (beta>pi): beta-=2*pi
        return  beta

    def IsInside(self,p,eps=0.01): 

        """
            testet mit genauigkeit eps ob p im polygon self liegt oder nicht
            methode: summation von winkeln

        """

        llist=self.plist[:]
        llist.append(llist[0])

        winkelsumme=0.0
        lp=llist[0]
        for px in llist[1:]:
            winkelsumme += self._dpwinkel(p, lp, px)
            lp=px

        if winkelsumme>pi-eps or winkelsumme<-pi+eps : return 1

        return 0

