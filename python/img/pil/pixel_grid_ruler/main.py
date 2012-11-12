#!/usr/bin/env python
from PIL import Image, ImageDraw
width, height = (1600, 1200)
img = Image.new("RGB", (width,height), "#FFFFFF")
draw = ImageDraw.Draw(img)

#for i in range(0,10)
draw.line((0,0,width,300), fill="#FF0000")
img.save("grid.png")