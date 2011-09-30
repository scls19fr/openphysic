#! /usr/bin/env python
# -*- coding: Latin-1 -*-

####################################
# Programme Python type            #
# auteur : G.Swinnen, Liège, 2003  #
# licence : GPL                    #
####################################

class Point:
    """point mathématique"""
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
class Rectangle:
    """rectangle"""
    def __init__(self, ang, lar, hau):
        self.ang = ang
        self.lar = lar
        self.hau = hau

    def trouveCentre(self):
        xc = self.ang.x + self.lar /2
        yc = self.ang.y + self.hau /2
        return Point(xc, yc)

class Carre(Rectangle):
    """carré = rectangle particulier"""
    def __init__(self, coin, cote):
        Rectangle.__init__(self,
               coin, cote, cote)
        self.cote = cote

    def surface(self):
        return self.cote**2

###########################
## Programme principal : ##
        
# coord. de 2 coins sup. gauches :  
csgR = Point(40,30)
csgC = Point(10,25)

# "boîtes" rectangulaire et carrée : 
boiteR = Rectangle(csgR, 100, 50)
boiteC = Carre(csgC, 40)

# Coordonnées du centre pour chacune :
cR = boiteR.trouveCentre()
cC = boiteC.trouveCentre()

print "centre du rect. :", cR.x, cR.y
print "centre du carré :", cC.x, cC.y

print "surf. du carré :",
print boiteC.surface()
