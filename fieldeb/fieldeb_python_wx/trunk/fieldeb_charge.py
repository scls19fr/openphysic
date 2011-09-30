from wxPython.wx import *

class Charge:
    def __init__(self): # Initiatisation de la classe
        self.x = 0
        self.y = 0
        self.z = 0

        self.charge = 1000

        self.radius = 10

        self.movable = false
        

    def draw(self, dc, mode):
        if self.charge > 0: # Draw a red charge if charge is positive
            colour = wxBLUE
        elif self.charge < 0: # Draw a blue charge if charge is negative
            colour = wxRED
        else: # Draw a black charge if charge is null
            colour = wxBLACK
   
        pen = wxPen(colour, 3, wxSOLID)
        dc.SetPen(pen)
        

        dc.DrawEllipse( int( self.x-self.radius ),
                        int( self.y-self.radius ),
                        int( 2*self.radius ),
                        int( 2*self.radius ))

        if mode == "E":
            if self.charge > 0:
                dc.DrawLine( int( self.x-self.radius/2.0 ),
                             int( self.y ),
                             int( self.x+self.radius/2.0 ),
                             int( self.y )
                             )
                dc.DrawLine( int( self.x ),
                             int( self.y-self.radius/2.0 ),
                             int( self.x ),
                             int( self.y+self.radius/2.0 )
                             )
                
            elif self.charge < 0:
                dc.DrawLine( int( self.x-self.radius/2.0 ),
                             int( self.y ),
                             int( self.x+self.radius/2.0 ),
                             int( self.y )
                             )
            else:
                dc.DrawPoint( int( self.x ),
                              int( self.y ))
        if mode == "B":
            if self.charge > 0:
                dc.DrawLine( int( self.x-self.radius/2.0 ),
                             int( self.y-self.radius/2.0 ),
                             int( self.x+self.radius/2.0 ),
                             int( self.y+self.radius/2.0 ) )
                             
                dc.DrawLine( int( self.x-self.radius/2.0 ),
                             int( self.y+self.radius/2.0 ),
                             int( self.x+self.radius/2.0 ),
                             int( self.y-self.radius/2.0 ) )
            
            if self.charge < 0:
                dc.DrawPoint( int( self.x ),
                              int( self.y ))
