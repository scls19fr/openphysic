#!/usr/bin/env python

# http://www.pythonware.com/library/pil/handbook/image.htm

from PIL import Image
im = Image.open("lena.jpg")
im.rotate(45).show()