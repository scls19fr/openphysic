#!/usr/bin/env python
from PIL import Image, ImageDraw
width, height = (1600, 1200)
img = Image.new("RGB", (width,height), "#FFFFFF")
draw = ImageDraw.Draw(img)

# 5 px
for i in range(0,height/100):
  for i2 in range(0,10):
    draw.line((0,i*100+i2*10+5,width,i*100+i2*10+5), fill="#FFFFDF")

for j in range(0,width/100):
  for j2 in range(0,10):
    draw.line((j*100+j2*10+5,0,j*100+j2*10+5,height), fill="#FFFFDF")

# 10 px
for i in range(0,height/100):
  for i2 in range(1,10):
    if i2<>5:
      draw.line((0,i*100+i2*10,width,i*100+i2*10), fill="#FFFF00")

for j in range(0,width/100):
  for j2 in range(1,10):
    if j2<>5:
      draw.line((j*100+j2*10,0,j*100+j2*10,height), fill="#FFFF00")

# 50 px
for i in range(0,height/100):
  for i2 in range(1,10):
    if i2==5:
      draw.line((0,i*100+i2*10,width,i*100+i2*10), fill="#BFBFBF")

for j in range(0,width/100):
  for j2 in range(1,10):
    if j2==5:
      draw.line((j*100+j2*10,0,j*100+j2*10,height), fill="#BFBFBF")    

# 100 px
for i in range(0,height/100):
  draw.line((0,i*100,width,i*100), fill="#0F0F0F")

for j in range(0,width/100):
  draw.line((j*100,0,j*100,height), fill="#0F0F0F")

img.save("grid.png")