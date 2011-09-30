
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


import sys 

from Numeric import *                    # array-objekte, blas
from Matrix  import *                    # matrix-matrix-multiplikation
from LinearAlgebra import *              # lapack



# START class MultGraph(): ##########################################


class MultGraph:

    NONEIGHBOUR="MultGrapherror: Knoten hat keinen Nachbarn"

    def __init__(self, kantenliste=[]):

        self.g = kantenliste

        val={}
        for bogen in self.g:
            val[bogen[1]]=1  # type: array !!!
            val[bogen[0]]=1
        self.points=val.keys()
        self.anznodes=len(self.points)

    def __delitem__(self, nr):
        del(self.g[nr])

    def __getitem__(self, nr):
        
        return self.g[nr]

    def __setitem__(self, nr, val):
        
        self.g[nr]=val


    def Neighbour(self, p):

       """
          graph g in form von liste von tupeln für bögen

       """
        
       retval=[]

       for ip in self.g:
           if (ip[0]==p):
             retval.append(ip[1])
           if (ip[1]==p):
             retval.append(ip[0]) 
       return retval 



    def Degree(self,p):

       """
          graph g, punkt p ==>  anzahl kanten nach/von p
   
       """

       return len(self.Neighbour(p))



    def Path(self, p0, pziel):

        """
          erkundet Path im graphen von p0 nach pziel

          return values: p, w, vz
          p: punktelist, w: bogenlist, vz: orientierung längs Path

        """
    
        self._visited={} 
        p = self._Path(p0, pziel)
        
        w = [] 
        vz= []

        for i in range(0,len(p)-1):
           sp=p[i]
           ep=p[i+1]
           bogen1=(sp,ep)
           bogen2=(ep,sp)

           if bogen1 in self.g:
              pos=self.g.index(bogen1)
              w.append(pos)
              vz.append(1)
              continue
           
           if bogen2 in self.g:
              pos=self.g.index(bogen2)
              w.append(pos)
              vz.append(-1)
              continue
          
           # also: der folgende fehler darf NIE auftreten, sonst ist an
           # der implementierung was total falsch...
           print """Path(): error: Path im graphen nicht gefunden !!! 
                    implementierungsfehler"""
           sys.exit()

        return p, w, vz

    def _Path(self, p0, pziel, debugmode=0, depth=0):

        if debugmode==1: print depth*"   ", "--> p0=", p0
        if (p0==pziel): return [p0]  

        self._visited[p0]=1    
        for pi in self.Neighbour(p0):
           if not self._visited.has_key(pi):
              if debugmode==1: print depth*"   ",">>>", pi 
              rv = self._Path(pi, pziel, debugmode, depth+1)
              if debugmode==1: print depth*"   ","<<<", rv
              if len(rv): rv.insert(0,p0); return rv

        return []


    def DeleteDeadEnd(self):

       """
         löscht bögen, welche "sackgassen" sind
       """

       while(1):
           found=0
           for i in self.g:
               pos=self.g.index(i)
               if self.Degree(i[0])==1:
                  self.g[pos]=(9999, 9999)
                  found=1
               if self.Degree(i[1])==1:
                  self.g[pos]=(9999, 9999)
                  found=1
           if (not found): break



    def OneNeighbour(self,p):

       """
          liefert einen nachbarknoten von p in g
       """

       for i in self.g:
           if (i[0]==p): return i[1],i
           if (i[1]==p): return i[0],i

       return 0,0


    def GraphSize(self):

       """
          liefert anzahl kanten im graphen g, mit 9999 markierte
          kanten sind de fakto nicht vorhanden....
       """

       size=0
       for p in self.g: 
          if p[0] != 9999: size+=1
       return size

       # return len(self.g)


    def FindMesh(self,p):

        """
          findet masche in g mit startpunkt p
        """

        q,qi=self.OneNeighbour(p)
        if (q==0):
           raise MultGraph.NONEIGHBOUR, p # knoten p hat keinen nachbarn

        qipos=self.g.index(qi)
        self.g[qipos]=(9999, 9999)
        p,w,vz=self.Path(p,q)

        if len(p)>0:
           w.append(qipos)
           if q==qi[0]: vz.append(1)
           if q==qi[1]: vz.append(-1)
           return w,vz

        else:
           return None, None  # 9999,999
        
     
    def FindPoint(self):

       """
          findet noch verbundenen knoten im graphen g 
       """

       for w in self.g:
          if w[0] != 9999: return w[0]
          if w[1] != 9999: return w[1]
       # if (len(self.g)): return self.g[0][0]
       return 0
              




# ENDE class MultGraph(): ##########################################



# START class SolveRNet:  ##########################################


class SolveRNet:

    SINGULAR="Linear equation SINGULAR"
    NOCONNECTION="No connection"

    def __init__ (self,g,r,sp,ep,uges):

        self.mg = MultGraph(g)  # typ g : liste
        self.anz= self.mg.anznodes
        self.r  = r             # typ r : liste
        self.size= len(g)
        self.sp = sp
        self.ep = ep
        self.uges=uges

        self.matrix=[]
        self.rhs=[]

    
    # strombilanzen aufstellen:

    def _GenCurrentEquations(self):

       for pidx in self.mg.points:   
           zeile=[0]*(self.size+1)
           for eidx in range (0, self.size):
              if (self.mg[eidx][0]==pidx):
                 zeile[eidx+1] = -1
              if (self.mg[eidx][1]==pidx):
                 zeile[eidx+1] = +1
           if pidx==self.sp:
              zeile[0] = 1
           if pidx==self.ep:
              zeile[0] = -1
           self.rhs.append(0); self.matrix.append(zeile)
    
    # spannungsbilanzen aufstellen:

    def _GenVoltageEquations(self):

        # spannungsbilanzen von U0 nach Masse:

        run=0
        while(1):
           p,w,vz=self.mg.Path(self.sp,self.ep)
           if (len(p)==0 and run==0):
               raise SolveRNet.NOCONNECTION;
           run+=1
           if (len(p)==0): break
           zeile=[0]*(self.size+1) 

           for i in range(0,len(w)):
              if vz[i]==-1:
                 zeile[w[i]+1]=-self.r[w[i]]
              else:
                 zeile[w[i]+1]= self.r[w[i]]
           self.rhs.append(self.uges)
           self.matrix.append(zeile)
           # letzten bogen entfernen:
           self.mg[w[len(w)-1]]=(9999,9999)
           # del(self.mg[w[len(w)-1]]) # =(9999,9999)


        # spannungsbilanzen längs maschen

        while(1):
           self.mg.DeleteDeadEnd()
           p=self.mg.FindPoint()
           if p: 
              try:
                 w,vz=self.mg.FindMesh(p)
              except MultGraph.NONEIGHBOUR,p :
                 raise MultGraph.NONEIGHBOUR, p

              zeile=[0]*(self.size+1)
              if w is not None:
                  for i in range(0,len(w)):
                     if vz[i]==-1:
                        zeile[w[i]+1]=-self.r[w[i]]
                     else:
                        zeile[w[i]+1]=+self.r[w[i]]
                  self.matrix.append(zeile)
                  self.rhs.append(0)

           if self.mg.GraphSize()<=1: break

    def Solve(self):

       self._GenCurrentEquations()
       self._GenVoltageEquations()

       A = Matrix(self.matrix)
       b = Matrix(self.rhs)

       ivec, res, rank, sv = linear_least_squares(A,transpose(b))

       if (rank!=self.size+1):
           raise SolveRNet.SINGULAR   # kurzschluss: !

       # critical change from python2.1->python2.2 :
       ivec=array(transpose(ivec))[0].tolist() 
       return ivec


if (__name__=='__main__'):


    g=[(1,2),(2,3),(2,4),(1,4),(3,4)]
    r=[10, 20, 30, 20, 20]

    g=[(1,2),(2,3),(3,1),(4,1),(4,5),(4,3),(3,5),(2,3)]
    r=[10,    20,   30,   40,   50,   60,   70,   80]

    g=[(1,2),(1,2),(3,2),(2,3)]
    r=[10, 10, 20, 20]

    g=[(1,2),(1,3),(2,3),(2,4),(3,4)]
    r=[10, 20, 50, 40, 30]

    g=[(1,2),(1,2),(1,2),(1,2)]
    r=[10, 20, 30, 40]

    g=[(1,2),(2,3),(2,4),(1,4),(3,4)]
    r=[10, 20, 30, 20, 20]

    g=[(1,2),(2,3),(3,4),(2,3)]
    r=[10,10,10,0.00001]

    g=[("a",2),(2,3),("a",3),("a",4)]
    r=[10, 10, 0.00001,10]

    sp="a"    # startpunkt, hier u0 angelegt...
    ep=3    # endpunkt, spannung 0

    uges=10.# 10 volt in punkt sp gegen ep


    print
    print "=================================================================== "
    print "   WIDERSTANDSNETZTESTPROGRAMM"
    print "=================================================================== "
    print
    print "   graph      =", g
    print "   widerstände=", r
    print "   u0         =", uges
    print "   u0 in       ",sp
    print "   masse in    ",ep
    print
    print "=================================================================== "


    obj=SolveRNet(g, r, sp, ep, uges)

    try:

        ivec=obj.Solve()

    except SolveRNet.SINGULAR:
        print "system singulär...."
        sys.exit()
 
    except MultGraph.NONEIGHBOUR, p:
        print "knoten ",p, "hat keine nachbarn."
        sys.exit()
        
    except SolveRNet.NOCONNECTION:
        print "es besteht keine verbindung zwischen U0 und masse"
        sys.exit()


    # critical change from python2.1->python2.2 :
    ivec=map(lambda s: "%.5G" % s, ivec)

    uges=10.0
    print
    print "Iges = ", ivec[0]
    print "Rges = ", uges/float(ivec[0])
    print

    pos=0
    for i in ivec:
       print "I%-3d =  %s" % (pos, i)
       pos += 1
 
    print






