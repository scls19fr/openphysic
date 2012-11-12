#!/usr/bin/env python
from PIL import Image, ImageDraw
width, height = (1600, 1200)
img = Image.new("RGB", (width,height), "#FFFFFF")
draw = ImageDraw.Draw(img)

for i in range(0,height/100):
  for i2 in range(1,10):
    if i2<>5:
      draw.line((0,i*100+i2*10,width,i*100+i2*10), fill="#FFFF00")
    else:
      draw.line((0,i*100+i2*10,width,i*100+i2*10), fill="#CFCFCF")

for j in range(0,width/100):
  for j2 in range(1,10):
    if j2<>5:
      draw.line((j*100+j2*10,0,j*100+j2*10,height), fill="#FFFF00")
    else:
      draw.line((j*100+j2*10,0,j*100+j2*10,height), fill="#CFCFCF")    

for i in range(0,height/100):
  draw.line((0,i*100,width,i*100), fill="#0F0F0F")

for j in range(0,width/100):
  draw.line((j*100,0,j*100,height), fill="#0F0F0F")

img.save("grid.png")