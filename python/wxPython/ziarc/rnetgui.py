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



from wxPython.wx import *
from math import *
from Numeric import *

from wxPython.lib import colourdb



import os
import sys


try:
    from win32api import RegOpenKeyEx, RegQueryValueEx, error
    from win32con import HKEY_LOCAL_MACHINE, KEY_READ
    key = RegOpenKeyEx(HKEY_LOCAL_MACHINE,r'SOFTWARE\Ziarc',0,KEY_READ)
    homepath=RegQueryValueEx(key,'Path')[0]
except:
    homepath=os.path.abspath(".")

import cPickle

#--local includes --

from datatier import DataTier
from resistornet import MaxRect, EnlargeRect, GenRect
from graph import SolveRNet, MultGraph
from undoqueue import *


##############################################################################

#                           HAUPTPROGRAMM

##############################################################################


clrList=colourdb.getColourList()

###### KONSTANTEN GUI ########################################################

ID_NEW  = wxNewId()
ID_SAVE = wxNewId()
ID_LOAD = wxNewId()
ID_PRINT= wxNewId()
ID_QUIT = wxNewId()

ID_UNDO = wxNewId()
ID_REDO = wxNewId()

ID_DRAW_R = wxNewId()
ID_DRAW_L = wxNewId()

ID_PUT_R  = wxNewId()
ID_PUT_U0 = wxNewId()
ID_PUT_GROUND = wxNewId()

ID_DELETE = wxNewId()

ID_MOVE_POINT = wxNewId()

ID_CALCULATE = wxNewId()
ID_DELETE_I = wxNewId()

ID_ABOUT = wxNewId()


myRED_PEN = wxPen("BROWN")
myRED_FAT_PEN = wxPen("BROWN",3)
myGREY_DASH_PEN=wxPen("GREY",1,wxSHORT_DASH)
myGREY_FAT_PEN=wxPen("GREY",3)
myGREEN_PEN=wxPen("GREEN")

MODUS_DRAW_R     = ID_DRAW_R 
MODUS_DRAW_L     = ID_DRAW_L 

MODUS_PUT_R      =  ID_PUT_R  
MODUS_PUT_U0     =  ID_PUT_U0 
MODUS_PUT_GROUND =  ID_PUT_GROUND
MODUS_MOVE =  ID_MOVE_POINT 

MODUS_DELETE     =  ID_DELETE 

MOVE_RESISTOR = 0
MOVE_POINT = 1

 
##### BITMAP FÜR ABOUT #######################################################



class  MyAbout(wxDialog):

    def __init__(self, parent,  bitmap):

	tupel=(bitmap.GetWidth(), bitmap.GetHeight())
	size=wxSize(*tupel)
	wxDialog.__init__(self, parent, -1, "Click to close window...",wxPoint(300,100),
	                  size, style=wxDEFAULT_DIALOG_STYLE 
			                        |wxRESIZE_BORDER)

	self.bitmap=wxStaticBitmap(self,0, bitmap,wxPoint(0,0))

        EVT_LEFT_UP(self.bitmap, self.LeftUp)

    def ShowModal(self):

	return wxDialog.ShowModal(self)

    def LeftUp(self, event): 
	self.EndModal(0)

	




##### DIALOGBOX #############################################################

# ACHTUNG: WIRD NICHT BENOETIGT, DA DURCH wxTextEntryDialog ERSETZT !!!

class  MyDiaBox(wxDialog):

    def __init__(self, par,  txt="", defval="" ):

	wxDialog.__init__(self, par, -1, "Enter data",wxPoint(300,300),
	                  wxSize(300,100), style=wxDEFAULT_DIALOG_STYLE 
			                        |wxRESIZE_BORDER)

        topsizer=wxBoxSizer(wxVERTICAL)
	self.SetSizer(topsizer)
	self.SetAutoLayout(true)

	self.st=wxStaticText(self, -1, "\n"+txt,
	                     wxDefaultPosition,wxDefaultSize, wxALIGN_CENTRE)

	topsizer.Add(self.st, 1, wxEXPAND | wxALL, 5)

        self.tc=wxTextCtrl(self, -1, defval)
	topsizer.Add(self.tc,0, wxALL|wxEXPAND, 5)

	topsizer.Add(0,5,1)

	buttonsizer=wxBoxSizer(wxHORIZONTAL)
	ok = wxButton(self, wxID_OK, "Ok")
	buttonsizer.Add(ok, 0, wxALL, 5)
	buttonsizer.Add(10,0,1)
	buttonsizer.Add(wxButton(self, wxID_CANCEL, "Cancel"), 0, wxALL, 5)
	topsizer.Add(buttonsizer, 0, wxALIGN_CENTER)

	topsizer.SetSizeHints(self)
	topsizer.Fit(self)

        # self.SetDefaultItem(ok)

    def GetValue(self):

        return self.tc.GetValue()

    def ShowModal(self):

	self.tc.SetFocus()
	return wxDialog.ShowModal(self)

	
			   



###### ZEICHENFLÄCHE INKL. OBJEKT RNETZ, SOZUSAGEN HAUPTRPOGRAMM !!! ##########


class DrawCanvas(wxScrolledWindow):

    def __init__(self, parent, motionfun, queue,id = -1, size = wxDefaultSize):
        
        wxScrolledWindow.__init__(self, parent, id, wxPoint(0, 0), size, 0)
	self.SetScrollbars(20,20,50,50)

        #self.SetBackgroundColour(wxNamedColor("RED"))
        self.SetBackgroundColour(wxColour(245,235,200))

	self.motionfun = motionfun   # benachrichtigt hauptframe , statusbar...

	self.queue = queue # wird mit frame gemeinsam verwaltet

        self.data=self.queue.GetActual()

	self.data.modified=false

        self.InitCanvas()

        EVT_PAINT(self, self.OnPaint)
        EVT_LEFT_DOWN(self, self.LeftDown)
        EVT_LEFT_UP(self, self.LeftUp)
        EVT_MOTION(self, self.Motion)
	#EVT_SCROLLWIN(self, self.OnScroll)
        
    def InitCanvas(self):

        self.sp=(-10,-10)
        self.ep=(-10,-10)
	self.modus = MODUS_DRAW_R 
	self.down = 0 
	self.movemodus = None


    def SetModus(self,val):  # wird von hauptframe=menu aufgerufen

	self.modus=val
 
    def SyncAndRefresh(self):

	self.data=self.queue.GetActual()
	self.Refresh(1)

    def RectRefresh(self, *rect):

	for r in rect:
	    x1=r[0][0]
	    y1=r[0][1]
	    x2=r[1][0]
	    y2=r[1][1]
	    x1,y1 = self.CalcScrolledPosition(x1,y1)
            #x1,y1 = self.CalcUnscrolledPosition(x1,y1)
	    x2,y2 = self.CalcScrolledPosition(x2,y2)
            #x2,y2 = self.CalcUnscrolledPosition(x2,y2)
	    self.Refresh(1, wxRect(x1, y1, x2-x1, y2-y1))

    def LeftDown(self, event):
    

        px,py=event.m_x,event.m_y
	px,py= self.CalcUnscrolledPosition(px,py)
 

        if self.modus == MODUS_DRAW_R or self.modus==MODUS_DRAW_L :

	    self.down=true
	    self.count=0
	    # px,py = self.CalcUnscrolledPosition(px,py)
	    px=50*round(px/50.0)
	    py=50*round(py/50.0)
	    # px,py = self.CalcScrolledPosition(px,py)

	    self.sp=(px,py)
	    self.lp=(px,py)

            self.data = self.queue.Push() #neu
            self.oldrect=None
            rect=((px-5,py-5),(px+5,py+5)) # anfangsoese zeichnen
            self.RectRefresh(rect)

        elif self.modus == MODUS_MOVE:

            obj, idx = self.data.WhichOne((px,py))

	    if obj:

	        self.sp, self.ep = map(array,obj.GetEndPoints())
		dc = wxClientDC(self)
		self.PrepareDC(dc)
		rect = self.data.GetRect(dc, self.sp, self.ep)
                self.oldrect=EnlargeRect(rect, 8)

		self.lp = self.sp
		self.movemodus=MOVE_RESISTOR
		self.deltasp= array((px,py))-self.sp
		self.deltaep= array((px,py))-self.ep
		self.down=true
		self.px = (px,py)
	        self.data=self.queue.Push()

		# px=50*round(px/50.0)
		# py=50*round(py/50.0)
		#px,py = self.CalcUnscrolledPosition(px,py)
		px=50*round(px/50.0)
		py=50*round(py/50.0)
		#px,py = self.CalcScrolledPosition(px,py)
		self.sp=(px,py)

	    else:

		# px=50*round(px/50.0)
		# py=50*round(py/50.0)
		#px,py = self.CalcUnscrolledPosition(px,py)
		px=50*round(px/50.0)
		py=50*round(py/50.0)
		#px,py = self.CalcScrolledPosition(px,py)

		self.sp=(px,py)

		self.lp=array(self.sp)

		dc = wxClientDC(self)
		self.PrepareDC(dc)
		k, o, r, i, mr=self.data.GetObjsWithConnectionPoint(dc,self.lp)

		self.moveu0=false
		if self.sp == self.data.u0pos: 
		    self.moveu0=true
                    txt="U0=%g" % self.data.u0
		    localdc=wxClientDC(self)
                    w,h = localdc.GetTextExtent(txt) 
		    xr=GenRect(self.sp[0]-5,self.sp[1]-5,self.sp[0]+w+5, self.sp[1]+h+5)
		    if mr: mr=MaxRect(mr, xr)
		    else: mr=xr

		self.moveground=false
		if self.sp == self.data.groundpos: 
		    self.moveground=true
		    xr=GenRect(self.sp[0]-9,self.sp[1]-21,self.sp[1]+9, self.sp[1]+21)
		    if mr: mr=MaxRect(mr, xr)
		    else: mr=xr


		if k or self.moveground or self.moveu0: #verbindungspunkt gefunden?
		    self.movemodus=MOVE_POINT
		    self.keylist = k
		    self.otherpoints = o
		    self.rvals = r
		    self.ivals = i    
		    self.queue.Push()
		    self.down=true
		    mr=EnlargeRect(mr, 10)
		    self.oldrect = mr

	elif self.modus == MODUS_PUT_R:

	     self.data=self.queue.Push()
             (obj,idx) = self.data.WhichOne((px,py))
	     if obj:
                 localdc=wxClientDC(self)
		 self.PrepareDC(localdc)
		 oldrect=obj.GetRect(localdc)
                 diabox=wxTextEntryDialog(self,"Please enter resistivity","Userinput","10.0")
		 if (diabox.ShowModal()==wxID_OK):
		     rval = diabox.GetValue()
		     import string
		     try: 
			 rval=string.atof(rval)
		     except:
			 rval=0.0
		     self.data.PutRVal(obj,idx,rval)
		     self.data.modified=true
		     newrect=obj.GetRect(localdc)
		     self.RectRefresh(MaxRect(oldrect, newrect))
             else:
		 self.queue.UndoPush()

	 
	elif self.modus == MODUS_DELETE:

	     self.data=self.queue.Push()
	     obj,idx = self.data.WhichOne((px,py))
             if obj:
		 localdc=wxClientDC(self)
		 self.PrepareDC(localdc)
		 oldrect=obj.GetRect(localdc)

		 self.data.DeleteResistor(obj,idx)
		 self.data.modified=true

		 newrect=obj.GetRect(localdc)
		 self.RectRefresh(EnlargeRect(MaxRect(oldrect, newrect),8))
	     else:
		 self.queue.UndoPush()
        
	elif self.modus == MODUS_PUT_U0: 

	     #px=50*round(px/50.0)
	     #py=50*round(py/50.0)
	     #px,py = self.CalcUnscrolledPosition(px,py)
	     px=50*round(px/50.0)
	     py=50*round(py/50.0)
	     #px,py = self.CalcScrolledPosition(px,py)

	     if ((px,py) != self.data.groundpos):
		 # diabox=MyDiaBox(self, "Please enter voltage U0.","10.0")
                 diabox=wxTextEntryDialog(self,"Please enter voltage U0.","Userinput","10.0")
		 if (diabox.ShowModal()==wxID_OK):
		     self.data=self.queue.Push()
		     uval = diabox.GetValue()
		     import string
		     try:
			self.data.u0=string.atof(uval)
		     except:
			self.data.u0=10.0

		     self.data.u0pos=(px,py)
		     self.data.modified=true
		     # hier kein RectRefresh, da zu faul um Textgröße etc.
		     # zu bestimmen...
		     self.Refresh(1)
        
	elif self.modus == MODUS_PUT_GROUND:

	     #px=50*round(px/50.0)
	     #py=50*round(py/50.0)
	     #px,py = self.CalcUnscrolledPosition(px,py)
	     px=50*round(px/50.0)
	     py=50*round(py/50.0)
	     #px,py = self.CalcScrolledPosition(px,py)
	     if ((px,py) != self.data.u0pos):

		 self.data=self.queue.Push()
		 poldx, poldy = self.data.groundpos
		 self.data.groundpos=(px,py)
		 self.data.modified=true

		 rect=EnlargeRect(GenRect(px,py,px,py), 25)
		 self.RectRefresh(rect)
		 rect=EnlargeRect(GenRect(poldx,poldy,poldx,poldy), 25)
		 self.RectRefresh(rect)



    def LeftUp(self, event):

        if not self.down: return
	self.down=false

	px,py=event.m_x,event.m_y
	px,py= self.CalcUnscrolledPosition(px,py)
	px=50*round(px/50.0)
	py=50*round(py/50.0)
	# px,py = self.CalcScrolledPosition(px,py)

        if self.sp == (px, py):
            self.queue.UndoPush()
	    rect=GenRect(px-5, py-5, px+5, py+5)
	    self.RectRefresh(rect)
        else:
            self.data.modified=true



    def Motion(self, event):

	pp=(event.m_x, event.m_y)
	pp= self.CalcUnscrolledPosition(*pp)

        if self.down:  ## and modus !!!

	    if self.modus==MODUS_DRAW_R or self.modus == MODUS_DRAW_L:

		px=50*round(pp[0]/50.0)
		py=50*round(pp[1]/50.0)
	        #jpx=50*round(pp[0]/50.0)
	        #jpy=50*round(pp[1]/50.0)

                if (px, py) != self.lp:

                    self.lp = (px,py)
                    self.queue.UndoPush()
                    self.data=self.queue.Push()

                    localdc=wxClientDC(self)
		    self.PrepareDC(localdc)

                    rval=0
                    if self.modus==MODUS_DRAW_R: rval=10

                    sp=array(self.sp)
                    ep=array(self.lp)
                    if (sp != ep):
                       rect = self.data.Connect(localdc, sp, ep, rval)
                    else:
                       rect = GenRect(self.sp[0],self.sp[1], self.ep[0], self.ep[1]) 

                    if self.oldrect: 
                        rectnew=MaxRect(self.oldrect, rect)
                    else:
                        rectnew=rect

                    self.oldrect=rect
                    rectnew=EnlargeRect(rectnew, 8)

		    # brush=wxBrush("GAINSBORO", wxSOLID)
		    # dc.SetBackground(brush)
                    
                    self.RectRefresh(rectnew)

	    

            elif self.modus == MODUS_MOVE and self.movemodus==MOVE_POINT:

	        px=50*round(pp[0]/50.0)
	        py=50*round(pp[1]/50.0)
		#px,py= self.CalcUnscrolledPosition(*pp)
		#px=50*round(px/50.0)
		#py=50*round(py/50.0)
		#px,py = self.CalcScrolledPosition(px,py)

		if (px,py)!= self.lp: # bewegung ?

		    self.lp=(px,py)
		    # folgendes ist nicht effizient, führt aber zu einer
		    # recht einfachen implementierung...
		    self.queue.UndoPush()
		    self.data=self.queue.Push()

		    if self.moveu0: 
		         # oldpos=self.data.u0pos 
                         self.data.u0pos=(px,py)
		    if self.moveground: 
		         # oldpos=self.data.groundpos 
                         self.data.groundpos=(px,py)

		    for key in self.keylist: 
			self.data.DeleteParallelResistors(key)

                    localdc = wxClientDC(self)
		    self.PrepareDC(localdc)

                    newrect=None
		    for op, rval, ival in zip(self.otherpoints, self.rvals, self.ivals):
		        sp = array(op)
			ep = array((px,py))
			if sp != ep:
                           rect=self.data.Connect(localdc,sp, ep, rval, ival)
                           if not newrect:
                              newrect=rect
                           else:
                              newrect=MaxRect(newrect, rect)


                    # nie gleichzeitig: moveground und moveu0 !!
                    if self.moveground:
		       mr=GenRect(px-10,py-1,px+10,py+25)
		       if newrect: newrect=MaxRect(mr, newrect)
		       else: newrect=mr
                    elif self.moveu0:
                       txt="U0=%g" % self.data.u0
	               localdc=wxClientDC(self)
		       w,h = localdc.GetTextExtent(txt) 
		       mr=GenRect(px-10,py-6,px+w+2, py+h+10)
		       if newrect: newrect=MaxRect(mr, newrect)
		       else: newrect=mr

                    rect=MaxRect(newrect, self.oldrect)
		    rect=EnlargeRect(rect, 10)

                    # besser/genauer wäre es fuer den U0-text ein extra 
                    # rechteck zu generieren und dann mit MaxRect ein 
                    # umhüllendes Rechteck zu generieren...

                    # rect=EnlargeRect(rect, ext)

                    self.oldrect=newrect
	            self.RectRefresh(rect)

            elif self.modus == MODUS_MOVE and self.movemodus==MOVE_RESISTOR:

		# pp ==> neuer sp, neuer ep (inkl. runden)
		# neuer sp ==> lp setzen
		#          pop, push, delete, Update, connect

                #mousep=array(pp)
		mousep=array( pp)
 		newsp=mousep-self.deltasp

		temp=tuple(newsp/50.0)
		newsp=50*array(map(round, temp))
		# newsp=array(self.CalcScrolledPosition(newsp[0],newsp[1]))

		if newsp!= self.lp: # bewegung ?

		    self.lp=newsp
		    # folgendes ist nicht effizient, führt aber zu einer
		    # recht einfachen implementierung...
		    self.queue.UndoPush()
		    self.data=self.queue.Push()
                    obj, idx = self.data.WhichOne(self.px)
		    rval=obj.GetRVal(idx)
		    ival=obj.GetIVal(idx)
		    self.data.DeleteResistor(obj,idx)
		    newep=mousep-self.deltaep
		    temp=tuple(newep/50.0)
		    newep=50*array(map(round, temp))
		    localdc=wxClientDC(self)
		    self.PrepareDC(localdc)
		    newrect=self.data.Connect(localdc, newsp, newep, rval, ival)
		    newrect=EnlargeRect(newrect, 8)
		    self.RectRefresh(self.oldrect, newrect)
		    self.oldrect=newrect


	else:
            
	    # pp=self.CalcUnscrolledPosition(*pp)
	    (obj, idx)= self.data.WhichOne(pp)
	    if obj:
		ival = obj.GetIVal(idx) 
		rval = obj.GetRVal(idx) 
		str="R = %g Ohm" % rval
		if ival is not None: str += ", I = %.3g Ampere " % abs(ival)
	    else:
		str=""

	    # rufe übergeordnete klasse über motionfun-eintrag!!!
	    # diese dient dazu die oberste gui-klasse über einen neuen
	    # statusbar-eintrag zu benachrichtigen.

	    self.motionfun(str)

    # def OnDraw(self, dc):

    #   self.OnPaint(0, dc)


    def OnPaint(self, event, dc=None):

        flag=0
        if dc is None: 
	    flag=1
	    dc = wxPaintDC(self)
	    self.PrepareDC(dc)

	    dc.BeginDrawing()
	    #brush=wxBrush(wxColour(100,200,200), wxSOLID)
            #brush=wxLIGHT_GREY_BRUSH
	    #dc.SetBackground(brush)
	    dc.Clear()
	else:
	    self.PrepareDC(dc)
	    #brush=wxBrush(wxColour(100,200,200), wxSOLID)
            #brush=wxLIGHT_GREY_BRUSH
	    #dc.SetBackground(brush)
	    #pass


        hx,hy = self.GetClientSize().width,self.GetClientSize().height 
	hx,hy = self.GetVirtualSize()


        dc.SetPen(myGREY_DASH_PEN)

	dx,dy = self.CalcUnscrolledPosition(0,0)

	dummy, dx = divmod(dx, 50)
	dummy, dy = divmod(dy, 50)

	dx,dy=0,0

        for i in range(0,hx,50):
            dc.DrawLine(i-dx,0-dy,i-dx,hy-dy)
        for i in range(0,hy,50):
            dc.DrawLine(0-dx,i-dy,hx-dx,i-dy)

        self.data.Paint(dc, myRED_PEN, myRED_FAT_PEN, myGREEN_PEN)

        if self.down and self.modus == MODUS_DRAW_R or self.modus == MODUS_DRAW_L:
                dc.SetPen(myRED_FAT_PEN)
                dc.DrawEllipse(self.sp[0]-3, self.sp[1]-3,7,7)

	if self.data.u0pos is not None:
	    dc.SetPen(myGREY_FAT_PEN)
	    dc.DrawEllipse(self.data.u0pos[0]-4, self.data.u0pos[1]-4, 9, 9)
	    dc.DrawText("U0=%g"%self.data.u0, self.data.u0pos[0]-4, 
	                self.data.u0pos[1]+6)

	if self.data.groundpos is not None:
	    xp,yp=self.data.groundpos
	    dc.SetPen(myGREY_FAT_PEN)
	    dc.DrawLine(xp,yp,xp,yp+8)
	    dc.DrawLine(xp-8,yp+8,xp+8,yp+8)
	    dc.DrawLine(xp-8,yp+14,xp+8,yp+14)
	    dc.DrawLine(xp-8,yp+20,xp+8,yp+20)


        if flag: dc.EndDrawing()




##### HAUPTFRAME #############################################################

        
class DrawFrame(wxFrame):


    def __init__(self,parent, id,title,position,size):

        wxFrame.__init__(self,parent, id,title,position, size)


        # das queue-objekt wird zwischen frame und canvas überr referenz
	# geteilt. im diesem objekt werden die daten gehalten, alles andere
	# sind nur referenzen auf dieses objekt...

	self.queue = UndoQueue(DataTier(), self.EnableUndo, self.EnableRedo)

        self.Canvas = DrawCanvas(self,self.UpdateStatusBar, self.queue, 
	                         size=(700,700))

	self.CreateStatusBar(2)
	self.SetStatusText("Welcome to ZiaRC...",0);
	self.SetStatusText("Modus: Draw resistor",1)

	self.tb=self.CreateToolBar(style=wxNO_BORDER | wxTB_HORIZONTAL)

	fnamlist=["filenew", "fileopen", "filesave", "exit", "undo", "redo",
	          "editdelete", "move", "put_rval", "put_u0", "put_ground", 
		   "draw_r", "draw_con", "exec", "del_ival", "help"]
        
	togglelist=[false, false, false, false, false, false, true, true,
	            true, true, true, true, true, false, false, false ]

        tooltip=["New Net", "Load Net", "Save Net", "Exit", "Undo", "Redo",
	         "Delete", "Move", "Put RVal", "Put U0", "Put Ground",
		 "Draw R", "Draw Connection", "Calculate", "Delete IVals", 
		 "About"]
        
	helptxt=["Start with new network", "Load network", "Save network",
	         "Exit ZiaRC", "Undo last operation", "Redo last Undo",
		 "Delete Item", "Move object/connection point",
		 "Assign resistivity to resistor", "Assign voltage U0",
		 "Assign Ground", "Draw resistor", "Draw connection line",
		 "Start calculation of currents and overall resistivity",
		 "Delete all current values", "About this Program"]

        ids = [ ID_NEW , ID_LOAD, ID_SAVE, ID_QUIT, ID_UNDO, ID_REDO, 
	        ID_DELETE, ID_MOVE_POINT, ID_PUT_R, ID_PUT_U0, ID_PUT_GROUND,
		ID_DRAW_R, ID_DRAW_L, ID_CALCULATE, ID_DELETE_I, 
		ID_ABOUT]
	
	seplist=[0,0,0,10,0,10,0,0,0,0,10,0,10,0,40,0]

        ziplist=zip(fnamlist, togglelist, tooltip, helptxt, ids, seplist)

        self.tb.SetToolBitmapSize(wxSize(22,22))

	for fnam, tg, tool, help, id, sep in ziplist:

	    path=os.path.join(homepath,"icons",fnam)+".png"

	    bitmap=wxBitmapFromImage(wxImage(path, wxBITMAP_TYPE_PNG))
	    self.tb.AddTool(id,bitmap,wxNullBitmap, tg, -1, tool, help)
	    if sep:
		self.tb.SetToolSeparation(sep)
	        self.tb.AddSeparator()

	self.tb.Realize()
	self.tb.ToggleTool(ID_DRAW_R, true)
	self.tb.EnableTool(ID_UNDO, false)
	self.tb.EnableTool(ID_REDO, false)

	# self.SetIcon(wxIcon(os.path.join("icons","draw_r.png"),wxBITMAP_TYPE_PNG))


        menuBar =wxMenuBar()

	menuFile=wxMenu()
	menuFile.Append(ID_NEW, "&New\tCtrl-N", "New circuit")
	menuFile.Append(ID_LOAD, "&Load\tCtrl-L", "Open new circuit from file")
	menuFile.Append(ID_SAVE, "&Save\tCtrl-S", "Save circuit to file")
	# menuFile.Append(ID_PRINT, "&Print\tCtrl-P", "Print circuit")
	menuFile.AppendSeparator()
	menuFile.Append(ID_QUIT, "&Quit\tCtrl-Q", "Quit program")

	menuBar.Append(menuFile, "&File")

	menuEdit=wxMenu()
	menuEdit.Append(ID_UNDO,"&Undo\tCtrl-Z", "Undo last operations")
	menuEdit.Append(ID_REDO,"&Redo\tCtrl-Y", "Undo last undo")
	menuEdit.AppendSeparator()
	menuEdit.Append(ID_DELETE,"&Delete object\tCtrl-D", "Delete object")
	menuEdit.AppendSeparator()
	menuEdit.Append(ID_PUT_R,"Put &R-value\tCtrl-V","Assign resistance to object")

	menuEdit.Enable(ID_UNDO, false)
	menuEdit.Enable(ID_REDO, false)

        self.edit_menu=menuEdit

	menuBar.Append(menuEdit,"&Edit")

	menuDraw=wxMenu()
	menuDraw.Append(ID_DRAW_R, "Draw &R\tCtrl-R", "Draw resistor")
	menuDraw.Append(ID_DRAW_L, "Draw &Connection\tCtrl-C", "Draw Connection")
	menuDraw.AppendSeparator()
	menuDraw.Append(ID_PUT_U0,"Put &U_0\tCtrl-U","Assign potential to point")
	menuDraw.Append(ID_PUT_GROUND,"Put &Ground\tCtrl-G", "Assign ground to point")

	menuBar.Append(menuDraw,"&Draw")

	menuMove=wxMenu()
	menuMove.Append(ID_MOVE_POINT, "&Move\tCtrl-M")
	menuBar.Append(menuMove,"&Move")

	menuCalc=wxMenu()
	menuCalc.Append(ID_CALCULATE, "&Calculate\tF5", "Calculate overall resistivity and currents")
	menuCalc.Append(ID_DELETE_I, "&Delete I-Values\tF4","Deletes the current values associated to resistors")

	menuBar.Append(menuCalc,"&Jobs")

	menuAbout=wxMenu()
	menuAbout.Append(ID_ABOUT, "&About\tF1","About this program")
	menuBar.Append(menuAbout,"&Help")

	self.SetMenuBar(menuBar)
        self.Show(true)

	EVT_MENU(self, ID_NEW, self.New )
	EVT_MENU(self, ID_LOAD, self.Load )
	EVT_MENU(self, ID_SAVE, self.Save )
	EVT_MENU(self, ID_PRINT, self.Print)
	EVT_MENU(self, ID_QUIT, self.OnCloseWindow ) ## DIREKT !!!


	EVT_MENU(self, ID_UNDO, self.Undo )
	EVT_MENU(self, ID_REDO, self.Redo )
	EVT_MENU(self, ID_DELETE, self.SetModus )

	EVT_MENU(self, ID_DRAW_R, self.SetModus )
	EVT_MENU(self, ID_DRAW_L, self.SetModus )
	EVT_MENU(self, ID_PUT_R, self.SetModus )
	EVT_MENU(self, ID_PUT_U0, self.SetModus )
	EVT_MENU(self, ID_PUT_GROUND, self.SetModus )

	EVT_MENU(self, ID_MOVE_POINT, self.SetModus )

	EVT_MENU(self, ID_CALCULATE, self.Calculate )
	EVT_MENU(self, ID_DELETE_I, self.DeleteIVals)

	EVT_MENU(self, ID_ABOUT, self.About )

	EVT_CLOSE(self, self.OnCloseWindow)

        if len(sys.argv)>1: self.Load(None, sys.argv[1]) 


	return None

    # die folgende funktion wird dem untergeordneten canvas
    # mitgeteilt um vom canvas aus die darüber liegende gui-schicht
    # manipulieren zu können...

    def UpdateStatusBar(self, txt):

	self.SetStatusText(txt,0)
 
    # die beiden folgenden funktionen werden in die queue eingehängt
    # um die entsprechenden menüeinträge ein oder auszublenden...

    def EnableUndo(self, bool):
	self.edit_menu.Enable(ID_UNDO, bool)
	self.tb.EnableTool(ID_UNDO, bool)

    def EnableRedo(self, bool):
	self.edit_menu.Enable(ID_REDO, bool)
	self.tb.EnableTool(ID_REDO, bool)


    def New(self, event) : 

        data=self.queue.GetActual()
	if not data.IsEmpty() and data.modified: 
           tmpbox = wxMessageDialog(self, "Do you want to loose actual data without saving ?", "", wxOK|wxCANCEL|wxICON_INFORMATION)
	   if tmpbox.ShowModal()!=wxID_OK: return

	self.queue.InitNew(DataTier())  # inkl. modified !
        self.Canvas.InitCanvas()
	self.Canvas.SyncAndRefresh()


    def Load(self, event, path=""): 

        data=self.queue.GetActual()
	if not data.IsEmpty() and data.modified: 
           tmpbox = wxMessageDialog(self, "Do you want to loose actual data without saving ?", "", wxOK|wxCANCEL|wxICON_INFORMATION)
	   if tmpbox.ShowModal()!=wxID_OK: return

        if path=="":

             tempdialog=wxFileDialog(self, "Load Resistor Net", "", "", "RNet file (*.rnt)|*.rnt",wxOPEN)

	if path != "" or tempdialog.ShowModal()==wxID_OK:
            if path=="": path=tempdialog.GetPath()
            try:
		fp=open(path,"rb")
                obj=cPickle.load(fp)
		self.queue.InitNew(obj)
		self.queue.GetActual().modified=false
                self.Canvas.InitCanvas()
		self.Canvas.SyncAndRefresh()
	    except:
		pass


    def Save(self, event) : 

        tempdialog=wxFileDialog(self, "Save Resistor Net", "", "", 
	                        "RNet file (*.rnt)|*.rnt",wxSAVE|wxOVERWRITE_PROMPT)
	if tempdialog.ShowModal()==wxID_OK:

	    fp=open(tempdialog.GetPath(),"wb+")
            p=cPickle.Pickler(fp)
	    data=self.queue.GetActual()
	    p.dump(data) 
	    fp.close()
	    self.queue.GetActual().modified=false

    def Print(self, event):

        dia=wxPrintDialog(self)
	dia.ShowModal()
	dc=wxPostScriptDC(dia.GetPrintDialogData().GetPrintData())
	print "res=", dc.GetResolution()
	dc.StartDoc("Message....")
	self.Canvas.OnPaint(0, dc)
	dc.EndDoc()

    def Undo(self, event) : 

        self.queue.Backwards()
	self.Canvas.SyncAndRefresh()
	self.queue.GetActual().modified=true

    def Redo(self, event) : 

        self.queue.Forwards()
	self.Canvas.SyncAndRefresh()
	self.queue.GetActual().modified=true

    def About(self, event) : 

	path=os.path.join(homepath,"icons","ziarc.png")
	bitmap=wxBitmapFromImage(wxImage(path, wxBITMAP_TYPE_PNG))
 
        about=MyAbout(self, bitmap)
        about.ShowModal()

    def SetModus(self,event):

	newid=event.GetId()
	self.Canvas.SetModus(newid)

	if newid==ID_DELETE:
	    self.SetStatusText("Modus: Delete object",1)
	elif newid==ID_PUT_R:
	    self.SetStatusText("Modus: Assign resistivity",1)
	elif newid==ID_PUT_U0:
	    self.SetStatusText("Modus: Assign potiential U0",1)
	elif newid==ID_PUT_GROUND:
	    self.SetStatusText("Modus: Assign ground",1)
	elif newid==ID_DRAW_R:
	    self.SetStatusText("Modus: Draw resistor",1)
	elif newid==ID_DRAW_L:
	    self.SetStatusText("Modus: Draw connection",1)
	elif newid==ID_MOVE_POINT:
	    self.SetStatusText("Modus: Move connection point/resistor",1)


	for id in [ ID_DELETE, ID_MOVE_POINT, ID_PUT_R, ID_PUT_U0, 
	            ID_PUT_GROUND, ID_DRAW_R, ID_DRAW_L ]:
	    self.tb.ToggleTool(id, false)

	self.tb.ToggleTool(newid, true)

	
	


    def Calculate(self, event):

	data=self.queue.Push()
	graph, res=data.GenerateGraph()
        
	obj=SolveRNet(graph, res, data.u0pos, data.groundpos, data.u0)

	outstr=""
	try:
	   ivec=obj.Solve()

	   if (ivec[0] != 0.0): 
	        rges = data.u0/ivec[0]
		outstr = "The calculated overall resistivity is %g Ohm."%rges
	   else:
	        outstr = "The calculated overall resistivity is not bounded."

           data.PutResult(ivec[1:]) # ivec[0]: gesamstrom auslassen
	   self.queue.GetActual().modified=true

	except SolveRNet.SINGULAR:

	   outstr = "A short-circuit happened. \nCould not calculate overall resistivity."
	   self.queue.UndoPush()
     
	except MultGraph.NONEIGHBOUR, p:

	   outstr = "An unexpected error happened."
	   self.queue.UndoPush()

	except SolveRNet.NOCONNECTION:
	   outstr = "U0 and ground are not connected."
	   self.queue.UndoPush()

	self.Canvas.SyncAndRefresh()

        objM  = wxMessageDialog(self, outstr, "", wxOK|wxICON_INFORMATION)

	objM.ShowModal() 


    def DeleteIVals(self, event):

	self.queue.Push().DeleteIVals()
	self.Canvas.SyncAndRefresh()
	self.queue.GetActual().modified=true

    def OnCloseWindow(self, event):

	if self.queue.GetActual().modified: 
           tmpbox = wxMessageDialog(self, "Do you want to loose actual data without saving ?", "", wxOK|wxCANCEL|wxICON_INFORMATION)
	   if tmpbox.ShowModal()==wxID_OK: self.Destroy()
	else:
	    self.Destroy()


 

####### APPLICATION ##########################################################

    
class App(wxApp):

    def OnInit(self):

        wxInitAllImageHandlers()

        frame = DrawFrame(NULL, -1, "ZiaRC (c) 2001 uwe.schmitt@procoders.net",
	                  wxDefaultPosition, wxSize(750,600)) 
	
        frame.Show(true)
	self.SetTopWindow(frame)

        return true
