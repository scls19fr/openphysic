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


from math import *
from Numeric import *
from polygon import *



class LineCollection:

    """
        Verwaltet eine Anzahl von Linien und bildet automatisch
	ein Rechteck um diese Linien für Redraw()
    """

    def __init__(self):

	self.lines=[]
	self.minx = 9999
	self.miny = 9999
	self.maxx = 0
	self.maxy = 0
 
    def __getitem__(self, idx): return self.lines[idx]

    def NewLines(self): LineCollection.__init__(self)

    def AppendLine(self, pvon, pnach):

	self.lines.append((pvon,pnach))
	self.minx=min(self.minx, pvon[0], pnach[0])
	self.maxx=max(self.maxx, pvon[0]+1, pnach[0]+1) # + 1 wegen rundung !
	self.miny=min(self.miny, pvon[1], pnach[1])
	self.maxy=max(self.maxy, pvon[1]+1, pnach[1]+1) # dito

    def GetRect(self):

	return (array((self.minx,self.miny)),array((self.maxx, self.maxy)))



##### RECHTECK-ROUTINEN: Ein Rechteck ist ein 2-Tupel von array-vektoren ######

def MaxRect(*rlist):

    """ 
        Liefert das die Rechtecke in rlist umhüllende Rechteck
	für Redraw()
    """


    minx, miny = 9999,9999
    maxx, maxy = 0, 0

    for r in rlist:
	if r:
	    minx=min(minx, r[0][0])
	    maxx=max(maxx, r[1][0])
	    miny=min(miny, r[0][1])
	    maxy=max(maxy, r[1][1])

    return (array((minx,miny)),array((maxx, maxy)))


	
def EnlargeRect(rect, width):

    p1=rect[0]
    p2=rect[1]
    q1=max(1, p1[0]-width)
    q2=max(1, p1[1]-width)
    q3=p2[0]+width
    q4=p2[1]+width

    return  (array((q1,q2)), array((q3,q4)) )

def GenRect(x1, y1, x2, y2):

    p1=(min(x1,x2), min(y1,y2))
    p2=(max(x1,x2), max(y1,y2))

    return (array(p1),array(p2))




class OneResistor(Polygon):

    """
        diese klasse verwaltet einen einzelnen widerstand. ein
        widerstand ist ein polygon (rechteck) plus zusätzliche
        geometrische und elektrische eigenschaften
  
    """

    def __init__(self,rlen=30,rw=15):

        Polygon.__init__(self)

        self.lines=LineCollection()
	self.arrow=LineCollection()

	self.text=""
        self.rval=1.0
        self.ival=None
        self.rlen=rlen
        self.rw=rw
        self.textpos=array([0,0])
        self.sp=None
        self.ep=None

	self.eps=1e-10


    def GetRVal(self):
        return self.rval

    def GetIVal(self):
	return self.ival

    def PutIVal(self, ival):
        self.ival=ival
	self.GenerateText()

    def PutRVal(self, rval):
        self.rval=rval
	self.GenerateText()

    def Update(self, sp, ep, ln, dist):

        """
          erzeuge widerstand zwischen punkten sp, ep, wobei
          dieser einen abstand dist zur direkten verbindungsgeraden hat
          ln gibt geometrisches verhältnis an.

        """

        ln=ln/100.

        # gemäß ival orientieren um pfeil nachher richtig zeichnen zu können
	# rein von der vewaltung her ist die reihenfolge egal

	if self.ival is not None:
	    if self.ival < 0: sp, ep,dist = ep, sp, -dist

        self.sp=sp
        self.ep=ep

        # erzeuge linienzüge zum zeichnen eines widerstandes

	dv=ep-sp
	ndv=sqrt(dot(dv,dv))
	omega=dv/ndv
	omegas=array([-omega[1],omega[0]])

        self.lines.NewLines()

	if self.rval != 0.0:

	    dx=(1.0-ln)/2.
	    p1=sp+dx*dv
	    p2=ep-dx*dv


	    self.lines.AppendLine(sp,p1)
	    self.lines.AppendLine(ep,p2)
	    
	    p3=p1+dist*omegas
	    p4=p2+dist*omegas

	    self.lines.AppendLine(p1,p3)
	    self.lines.AppendLine(p2,p4)

	    alpha=-(self.rlen-ln*ndv)/2.
	    p5=p3+alpha*omega
	    p6=p4-alpha*omega

	    self.lines.AppendLine(p3,p5)
	    self.lines.AppendLine(p4,p6)

	    q1=p5-self.rw/2.*omegas
	    q2=p5+self.rw/2.*omegas
	    q3=p6+self.rw/2.*omegas
	    q4=p6-self.rw/2.*omegas

	    self.lines.AppendLine(q1,q2)
	    self.lines.AppendLine(q2,q3)
	    self.lines.AppendLine(q3,q4)
	    self.lines.AppendLine(q4,q1)

	    # erzeuge polygon (hier: rechteck) um später beim clicken mit
	    # der maus feststellen zu können, ob dieser widerstand getroffen
	    # wird
	    self.NewPolygon()
	    self.AddPoint(q1)
	    self.AddPoint(q2)
	    self.AddPoint(q3)
	    self.AddPoint(q4)
            self.textpos=min(q1,q2,q3,q4)  # (p5+p6)/2.
	
	else:

	    p5 = 1/2.0*(sp+ep)

	    self.lines.AppendLine(sp,ep)
	    self.NewPolygon()
	    q1=sp+5*omegas
	    q2=ep+5*omegas
	    q3=ep-5*omegas
	    q4=sp-5*omegas
	    self.AddPoint(q1)
	    self.AddPoint(q2)
	    self.AddPoint(q3)
	    self.AddPoint(q4)
	    self.textpos=p5

        # pfeil in stromrichtung erzeugen...

        self.arrow.NewLines()
        a=int(self.rw/2.0)
        #if self.ival >= 0:
        self.arrow.AppendLine(p5,p5-a*omega-a*omegas)
        self.arrow.AppendLine(p5,p5-a*omega+a*omegas)
        #else:
            #px = ep+sp-p5
            #self.arrow.AppendLine(px,px+a*omega-a*omegas)
            #self.arrow.AppendLine(px,px+a*omega+a*omegas)

    def GenerateText(self):

        txt=""
        if self.rval != 0.0:
	   txt = "R=%g" % self.rval
	   if self.ival != None and (self.ival<-self.eps or \
	                                        self.ival>self.eps) : 
	       txt += ",I=%.3g" % abs(self.ival)
	else:
	   if self.ival != None and (self.ival<-self.eps or \
	                                        self.ival>self.eps) : 
	       txt = "I=%.3g" % abs(self.ival)

        self.text=txt

    def GetRect(self,dc):

	# textbox bestimmen:

	w,h = dc.GetTextExtent(self.text)
	sx, sy= self.textpos
	textrect=(array((sx,sy)),array((sx+w,sy+h)))

	return MaxRect(textrect, self.arrow.GetRect(), self.lines.GetRect())


    def Paint(self,dc, col1, col2):

        """
          zeichnet einen einzelnen widerstand auf Device dc

        """

	dc.SetPen(col2)


	# eigentlichen widerstand zeichnen:

	if self.ival==None or self.ival < -self.eps or self.ival > self.eps:
	    dc.SetPen(col1)
	else:
	    dc.SetPen(col2)    # hervorheben da strom vernachlässigbar !!!

        for sp,ep in self.lines:
            dc.DrawLine(sp[0],sp[1],ep[0],ep[1])

        
	# pfeil zeichnen wenn wert vorhanden:

	if type(self.ival)==type(1.0) and ( self.ival < -self.eps or\
	                                    self.ival > self.eps) :
	    dc.SetPen(col1) 
            for sp,ep in self.arrow:
                dc.DrawLine(sp[0],sp[1],ep[0],ep[1])

        # fehlt: ival zeichnen, abh. von sp, ep an textpos pfeil +/- I
        #
        # if ival is not None: pfeil, etc

	   
        if (self.text!=""): dc.DrawText(self.text,self.textpos[0],
	                                self.textpos[1])



class  ParallelResistors:

    """
          diese klasse verwaltet eine menge parallel geschalteter widerstände

    """
    
    def __init__(self,sp=None,ep=None):
        self.rlist=[]
        self.sp=sp
        self.ep=ep
        
        self.rw=15
        self.rlen=30

    def HasConnection(self, px):

	# retval: None wenn nicht betroffen, sonst "anderer Punkt".
        # vorsicht : vergleich von vektoren liefert wiederum vektor !!!
	# daher:arraycmp

	arraycmp=lambda u,v : reduce (lambda x,y : x*y, u==v)

	if arraycmp(self.sp,px):
	    return self.ep, -1
	elif arraycmp(self.ep,px):
	    return self.sp, +1
	else:
	    return None, 1


    def ValueList(self):

	res=[]
	for obj in self.rlist:
	    res.append((obj.GetRVal(), obj.GetIVal()))
	
	return res

    def GetEndPoints(self):

	return (self.sp, self.ep)
	     
	  
    def Update(self):

        """
         parallele widerstände geometrisch anordnen

        """

        n=len(self.rlist)
        alpha=self.rw*sqrt(2.3*n-2) ### muss man noch kallibrieren ###

        if n==1:
            f = lambda i,n,alpha: 0.
        else:
            f = lambda i,n,alpha: -alpha+2.*alpha*i/(n-1)

        for i in range(n):
	    obj=self.rlist[i]
            obj.Update(self.sp,self.ep, 75., f(i,n,alpha))

    def Insert(self, rval, ival=None):

        """
         widerstand hinzufügen

        """

        # beim parallelschalten werden alle widerstände =0 gelöscht:
	# achtung: widerstand==0 geht nur mit len(rcol)==1

	if len(self.rlist)==1 and self.rlist[0].GetRVal()==0: 
	    del self.rlist[0]

        r=OneResistor(self.rlen, self.rw)
	r.PutRVal(rval)
	r.PutIVal(ival)
        self.rlist.append(r)
        self.Update()

    def PutRVal(self,idx,val):

        if val==0:            # paralellschaltung wegen kurzschluss loeschen !
	    self.rlist=[]     # ==> garbage collection
	    r=OneResistor(self.rlen, self.rw)
	    r.PutIVal(None)
	    r.PutRVal(0.0)
	    self.rlist.append(r)
	else:
            self.rlist[idx].PutRVal(val) # verwaltung ob widerstand oder strippe                                         # geschieht eine ebene tiefer.

	self.Update()

    def PutIVal(self,idx,val):
        self.rlist[idx].PutIVal(val)
	# kein Update: diese Funktion wird nur beutzt um dem ganzen
	# Netz Werte zuzuweisen, 
        # self.Update()

    def GetIVal(self,idx):
	return self.rlist[idx].GetIVal()

    def GetRVal(self,idx):
	return self.rlist[idx].GetRVal()

    def Delete(self,idx):
        del(self.rlist[idx])
        if self.rlist: self.Update()
        return self.rlist

    def GetRect(self,dc):

	rectlist=[ r.GetRect(dc) for r in self.rlist ]
	return MaxRect(*rectlist)

    def Paint(self, dc, col1, col2, col3):

       if self.rlist:
	   # checken ob box stimmt:
           # p1,p2=self.GetRect(dc)
	   # x,   y = p1
	   # w,h = p2-p1
	   # dc.DrawRectangle(x,y,w,h)

           dc.SetPen(col2)
           dc.DrawEllipse(self.sp[0]-3,self.sp[1]-3,7,7)
           dc.DrawEllipse(self.ep[0]-3,self.ep[1]-3,7,7)
           for R in self.rlist:
               R.Paint(dc,col1,col3)


    def WhichOne(self, p):

        """
         welcher der parallelen widerstände wird beim mausklick auf
         punkt p getroffen ??

        """

        i = 0
        for r in self.rlist:
            if r.IsInside(p): return i
            i+=1
        return -1

    def GenerateGraph(self):

        """
         erzeugt zum widerstandsnetz zugehörigen multigraphen
         punkte des graphen sind tupel bestehend aus anfangs
         und endpunkt
        """

        netz=[]
        resistors=[]
        for r in self.rlist:
            netz.append((tuple(self.sp),tuple(self.ep)))
            resistors.append(r.GetRVal())

        return resistors, netz

    def DeleteI(self):

	for r in self.rlist: r.PutIVal(None)
 


class ResistorNet:

    """
        diese klasse verwaltet ein komplettes netz an beliebig angeordneten
        widerständen.

    """

    def __init__(self):
        self.pdict={}
        self.iidx=[]

    def IsEmpty(self): return not self.pdict

    def GetObjsWithConnectionPoint(self, dc, px):

	keylist=[]
	otherpointlist=[]
	rvallist=[]
	ivallist=[]
        maxrect=None
         
	for key, obj in self.pdict.items():
	    otherpoint, sign = obj.HasConnection(px)
	    if otherpoint:
		keylist.append(key)
                rect=obj.GetRect(dc)
                if not maxrect: 
                    maxrect=rect
                else:
                    maxrect=MaxRect(maxrect, rect)
		for rval, ival in obj.ValueList():
		    otherpointlist.append(otherpoint)
		    rvallist.append(rval)
                    if ival is not None: ival = ival*sign
		    ivallist.append(ival)
		   
	return keylist, otherpointlist, rvallist, ivallist, maxrect

    def GenKey(self,sp, ep):

        tsp=tuple(sp); tep=tuple(ep)

        ppmin=min(tsp,tep) 
        ppmax=max(tsp,tep)

        sp=array((ppmin[0],ppmin[1]))
        ep=array((ppmax[0],ppmax[1]))
	
        px=(ppmin[0],ppmin[1],ppmax[0],ppmax[1])
        px=tuple(map(int, px))

	return px, sp, ep

    def GetRect(self,dc, sp,ep):

	px, sp, ep = self.GenKey(sp,ep)

	return self.pdict[px].GetRect(dc)



    def Connect(self,dc, sp,ep,rval=0, ival=None):

        """
         erzeuge widerstand zwischen punkten sp und ep
	 sp und ep sind Numpy-Vektoren und keine Tupel !

        """

	# im folgenden konvertierung, da min() und max() angewandt
	# auf Numeric.array-ojekte fehlerhaft !!!

        # min und max-bildung um von orientierung unabhänigig zu sein

        if tuple(sp)>tuple(ep) and ival is not None: ival=-ival
	px, sp, ep= self.GenKey(sp,ep)

        rect =GenRect(*px)
        
	rectlist=[ rect ] 

        if self.pdict.has_key(px): 
	    rectlist.append(self.pdict[px].GetRect(dc))

	if rval==0:
	    if self.pdict.has_key(px): del self.pdict[px]

        self.pdict.setdefault(px, ParallelResistors(sp,ep)).Insert(rval,ival) 
	rectlist.append(self.pdict[px].GetRect(dc))

	return MaxRect(*rectlist)


    def Paint(self,dc,col1,col2,col3):
        
        for rc in self.pdict.values():
            rc.Paint(dc,col1,col2,col3)

    def GenerateGraph(self,ev=0):
    
        """ 
         erzeugt den dem widerstandsnetz zugehörigen multigraphen
         sowie liste der zugehörigen widerstände
    
        """
        
        resnetz=[]
        resres=[]
        self.iidx=[]

        for rr in self.pdict.values():
            resistors, netz = rr.GenerateGraph()
            resnetz+=netz                   # an liste anhängen
            resres+=resistors               # an liste anhängen
        
            # iidx entält verwaltungsinformationen um später die liste der 
            # errechneten ströme in den einzelnen bögen des graphen wieder 
            # den einzelnen wiederständen zuordnen zu können:
            for i in range(len(netz)):
                self.iidx.append((rr,i))    

        return resnetz, resres

    def PutResult(self, ilist):

        """
             ordnet liste der errechneten ströme der einzelnen widerständen
             mittels verwaltungsinformationen in self.iidx zu

        """

        for val,(obj,idx) in zip(ilist,self.iidx):
            obj.PutIVal(idx, val)
            obj.Update()


    def WhichOne(self,p):

        """
             liefert widerstand der beim mausklick auf puntk p getroffen
             wird: zum einen die widerstanssammlung rr, zum anderen den
             index des getroffenen widerstandes in dieser sammlung.

        """

        for rr in self.pdict.values():
            i=rr.WhichOne(p)
            if i >= 0: return rr, i
        return None, 0

    def PutRVal(self,obj,idx,val):

        """
             ordnet dem mittels WhichOne() ermittelten widerstand einen
             neuen widerstandswert zu.

        """ 

        if obj is not None: obj.PutRVal(idx, val); obj.Update()


    def DeleteParallelResistors(self, key):

	del self.pdict[key]

    def DeleteResistor(self, obj,idx):

        """ 
              löscht den mittels WhichOne() ermittelten widerstand

        """

        if obj:
            rval = obj.Delete(idx)
            if not rval :  # letzer widerstand, d.h. liste leer
		           #  ==> objekt suchen, umständlich
                delkey = None
                for key in self.pdict.keys():
                    if self.pdict[key] is obj: delkey=key
                if delkey: del(self.pdict[delkey])

    def DeleteIVals(self):

	for obj in self.pdict.values(): obj.DeleteI()





