#!/usr/bin/env python

from PIL import Image
import os

infile = "lena.jpg"
file, ext = os.path.splitext(infile)

im = Image.open(infile)

print(im.mode, im.size)

#
data = list(im.getdata())
print(data[0:10]) # [1:10]

# img->RGB
r,g,b = im.split()  ## Recuperation des differentes composantes de l'image
r.save(file+'-R'+ext) ## Sauvegarde des differents images composantes
g.save(file+'-G'+ext)
b.save(file+'-B'+ext)

# RGB->img
comp = r, g, b
imgnew = Image.merge('RGB',comp) ## Recomposition de l'image
imgnew.save(file+'-recomposed'+ext) ## Sauvegarde de l'image decomposee puis recomposee

print(r)
#<PIL.Image.Image image mode=L size=140x140 at 0x103DE7D88>