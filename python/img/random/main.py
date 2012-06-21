import Image
import random
size = (256,256)
im = Image.new('RGB',size)
pix = im.load()
for i in range(size[0]):
    for j in range(size[1]):
        #pix[i,j] = (i,int(0.5*i+random.randint(0,127)),int(0.5*j+random.randint(0,127)))
        r = random.randint(0,1)*255
        r = random.randint(0,255)
        pix[i,j] = (r,r,r)
im.save('img.png')