#! /usr/bin/env python
# -*- coding: Latin-1 -*-

class Rectangle:
    "Classe de rectangles"
    def __init__(self, longueur =0, largeur =0):
        self.L = longueur
        self.l = largeur
        self.nom ="rectangle"

    def perimetre(self):
        return "(%d + %d) * 2 = %d" % (self.L, self.l, 
                                             (self.L + self.l)*2)
    def surface(self):
        return "%d * %d = %d" % (self.L, self.l, self.L*self.l)

    def mesures(self):
        print "Un %s de %d sur %d" % (self.nom, self.L, self.l)
        print "a une surface de %s" % (self.surface(),)
        print "et un périmètre de %s\n" % (self.perimetre(),)

class Carre(Rectangle):
    "Classe de carrés"
    def __init__(self, cote):
        Rectangle.__init__(self, cote, cote)
        self.nom ="carré"

if __name__ == "__main__":
    r1 = Rectangle(15, 30)
    r1.mesures()    
    c1 = Carre(13)
    c1.mesures()
