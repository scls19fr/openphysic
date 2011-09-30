from wxPython.wx import *

# Colour class
# RGB
#
# From maximum
# To minimum

# Red #FF0000
#  Orange #FF7F00
# Yellow #FFFF00
# Green #00FF00
#  Green 2
# Cyan (light blue) #00FFFF
#  Blue light
# Blue #0000FF
#  Very dark blue
# #Violet #7F00FF ?
# Violet #FF00FF

#class Colour:
#    def __init__(self):
#        R=0
#        G=0
#        B=255

def get_colour_linear(x, x_max):
    x = x/x_max * 100
    if x < 0:
        x = 0
    if x > 100:
        x = 100
        
        # TO DO
    colour = wxBLACK #"BLACK"
    
    return colour

def get_colour_step(x, x_max):
    default_colour = wxBLACK #"BLACK"

    colour = default_colour

    if x_max != 0:
        x = x/x_max*100
    else:
        return default_colour
    
    if x < 0:
        x = 0
    if x > 100:
        x = 100

    if x >= 0 and x < 10:
        colour = "#FF00FF" # .violet
    elif x >= 10 and x < 20:
        colour = "#7F00FF" # ..       BlueViolet ?
    elif x >= 20 and  x < 30:
        colour = "#0000FF" # .blue
    elif x >= 30 and x < 40:
        colour = "#007FFF" # ..
    elif x >= 40 and x < 50:
        colour = "#00FFFF" # .cyan
    elif x >= 50 and x < 60:
        colour = "#00FF7F" # ..
    elif x >= 60 and x < 70:
        colour = "#00FF00" # .green
    elif x >= 70 and x < 80:
        colour = "#FFFF00" # .yellow
    elif x >= 80 and x < 90:
        colour = "#FF7F00" # ..      Orange ?
    else: # n>=90
        colour = "#FF0000" # .red

    return colour
    #colour = "BLACK"
    #return colour

#FF0000" #RED
#FFFF00" #YELLOW
#00FF00" #GREEN
#00FFFF" #CYAN ?
#0000FF" #BLUE
#FF00FF" #VIOLET
#FF00FF" #RED

#n_list=[100,90,80,70,60,50,40,30,20,10,0]
# Test
