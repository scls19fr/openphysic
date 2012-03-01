#!/usr/bin/env python

from PIL import Image
im = Image.open("lena.jpg")
im.rotate(45).show()