from wxPython.wx import *

class Grid:

    def __init__(self):
        self.x_max = 0 # value is well set in 'draw' method
        self.y_max = 0 # value is well set in 'draw' method
        self.x_space = 15 #60 # x space between 2 points
        self.y_space = 15 #60 # y space between 2 points

        # first x position (no self,so it's private to this class)
        self.x_min = self.x_space/2
        # first y position (same)
        self.y_min = self.y_space/2
        self.colour = "BLACK" # "BLACK"='#000000'='RRGGBB'

    def get(self, dc):
        lst = []
        
        i = self.x_min # init i (x)
        j = self.y_min # init j (y)
        # x maximal size of panel
        self.x_max = dc.GetSize().GetWidth() #580
        # y maximal size of panel
        self.y_max = dc.GetSize().GetHeight() #330        
        
        while j < self.y_max:
            while i < self.x_max:        
                lst.append(wxPoint(i, j))
                i = i + self.x_space
            i = self.x_min
            j = j + self.y_space

        return lst


    def draw(self, dc):
        pen = wxPen(self.colour, 2, wxSOLID) # "BLACK"='#000000'='RRGGBB'
        dc.SetPen(pen)

        i = self.x_min # init i (x)
        j = self.y_min # init j (y)

        self.x_max = dc.GetSize().GetWidth() #580 # x maximal size of panel
        self.y_max = dc.GetSize().GetHeight() #330 # y maximal size of panel

        while j < self.y_max:
            while i < self.x_max:        
                dc.DrawPoint(i, j)
                i = i + self.x_space
            i = self.x_min
            j = j + self.y_space
