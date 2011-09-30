# -*- coding:Latin-1 -*-

from Tkinter import *
from math import sin, cos
import time, threading

class App(Frame):
    def __init__(self):
        Frame.__init__(self)
        self.pack()
        can =Canvas(self, width =400, height =400,
                    bg ='ivory', bd =3, relief =SUNKEN)
        can.pack(padx =5, pady =5)
        cercle = can.create_oval(185, 355, 215, 385, fill ='red')
        tb = Thread_balle(can, cercle)
        Button(self, text ='Marche', command =tb.start).pack(side =LEFT)
        # Button(self, text ='Arrêt', command =tb.stop).pack(side =RIGHT)
        # arrêter l'autre thread si l'on ferme la fenêtre :
        self.bind('<Destroy>', tb.stop)
   
class Thread_balle(threading.Thread):
    def __init__(self, canevas, dessin):
        threading.Thread.__init__(self)
        self.can, self.dessin = canevas, dessin
        self.anim =1
    
    def run(self):
        a = 0.0
        while self.anim == 1:
            a += .01
            x, y = 200 + 170*sin(a), 200 +170*cos(a)
            self.can.coords(self.dessin, x-15, y-15, x+15, y+15)
            time.sleep(0.010)

    def stop(self, evt =0):
        self.anim =0

App().mainloop()