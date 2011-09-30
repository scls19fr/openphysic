from wxPython.wx import *
from math import sqrt

class Grain:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.ux = 0
        self.uy = 0
        self.len = 30
        self.colour = "BLACK"
        self.width = 1

    def draw(self, dc):
        pen = wxPen(self.colour, self.width, wxSOLID)
        dc.SetPen(pen)


        if self.ux**2+self.uy**2 != 0: # Not null vector
            dc.DrawLine( int( self.x-self.len/2*self.ux/(sqrt(self.ux**2+self.uy**2)) ),
                         int( self.y-self.len/2*self.uy/(sqrt(self.ux**2+self.uy**2)) ),
                         int( self.x+self.len/2*self.ux/(sqrt(self.ux**2+self.uy**2)) ),
                         int( self.y+self.len/2*self.uy/(sqrt(self.ux**2+self.uy**2)) )
                        )
            
        else:
            dc.DrawPoint( int( self.x ),
                          int( self.y ))
                
