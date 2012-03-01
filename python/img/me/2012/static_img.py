#!/usr/bin/env python

import os, sys
import Image, ImageFont, ImageDraw

im1 = Image.open("qrcode.png")
W, H = im1.size
print(im1)


im2 = Image.new('RGB', im1.size, "white")
draw = ImageDraw.Draw(im2)
# use a bitmap font
#font = ImageFont.load("arial.pil")
#draw.text((10, 10), "hello", font=font)
# use a truetype font
font = ImageFont.truetype("arial.ttf", 15)
draw.text((10, 25), "world", font=font)
#im2.save('page2.png', 'PNG')
im2 = Image.open("page2.png")
print(im2)

im3 = Image.new('RGB', im1.size, "white")
#im3.save('page3.png', 'PNG')
im3 = Image.open("page3.png")
print(im3)


im123 = Image.new('RGB', (3*W,H), "white")
im123.paste(im2, (0, 0) )
im123.paste(im1, (W, 0) )
im123.paste(im3, (2*W, 0) )
im123.save('all_in_one.png', 'PNG')
print(im123)

im123.show()
