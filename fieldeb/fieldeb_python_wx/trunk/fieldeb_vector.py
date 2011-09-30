from wxPython.wx import *

from math import sqrt, pi, cos, sin, acos
# ** stands for ^ and it's not present in math

class Vector:
    class initial:
        class position:
            def __init__(self):
                x = 0
                y = 0

    class final:
        class position:
            def __init__(self):
                x = 0
                y = 0

    class arrow:
        # len of the 2 little segments of the arrow
        len = 10
        # angle between a little segment and a long segment (must be in rad)
        angle = 20*pi/180
        # ratio between a long segment ant a little segment
        ratio = 10
            
    def __init__(self):
        self.colour = "BLACK"
        self.width = 1
        self.is_variable_len = 0 # boolean :
        #false if len is only defined by arrow.len
        #true  if len is defined by ratio and vector.len

    def len(self):
        #return the length of the vector
        return sqrt( (self.final.position.x-self.initial.position.x)**2 +
                     (self.final.position.y-self.initial.position.y)**2
                     )

    def angle(self):
        #return the angle between x (horizontal up) and vector
        #return value belongs to 0->360 degree or 0->2*pi rad
        #use the cos to get a value between 0 and 180 deg
        #trick with sign of delta y to get angle between 180 and 360 deg
        #result is given in rad

        if sqrt( (self.final.position.x-self.initial.position.x)**2 +
                 (self.final.position.y-self.initial.position.y)**2 ) == 0:
            # null vector
            return None #undef

        if self.final.position.y-self.initial.position.y>0:
            return acos(
                (self.final.position.x-self.initial.position.x)
                / sqrt( (self.final.position.x-self.initial.position.x)**2 +
                        (self.final.position.y-self.initial.position.y)**2 )
                )
        
        elif self.final.position.y-self.initial.position.y<0:
            return 2*pi-acos(
                (self.final.position.x-self.initial.position.x)
                / sqrt( (self.final.position.x-self.initial.position.x)**2 +
                        (self.final.position.y-self.initial.position.y)**2 )
                )
        else:
            return 0

    def draw(self, dc):
        pen = wxPen(self.colour, self.width, wxSOLID)
        dc.SetPen(pen)

        if self.len()>0: # Not null vector
            dc.DrawLine( int(self.initial.position.x), 
                         int(self.initial.position.y), 
                         int(self.final.position.x),
                         int(self.final.position.y)
                         )

            if (self.is_variable_len == 0):
                Len = self.arrow.len
            else:
                Len = self.len()/self.arrow.ratio
            
            epsilonX = Len*cos( self.arrow.angle + self.angle() )
            epsilonY = Len*sin( self.arrow.angle + self.angle() )

            dc.DrawLine( int(self.final.position.x),
                         int(self.final.position.y),
                         int(self.final.position.x-epsilonX),
                         int(self.final.position.y-epsilonY)
                         )

            epsilonX = Len*cos( self.arrow.angle-self.angle() )
            epsilonY = Len*sin( self.arrow.angle-self.angle() )

            dc.DrawLine( int(self.final.position.x),
                         int(self.final.position.y),
                         int(self.final.position.x-epsilonX),
                         int(self.final.position.y+epsilonY)
                         )

        else: # Null Vector (or nearly)
            dc.DrawPoint( int(self.initial.position.x),
                          int(self.final.position.y)
                          )
