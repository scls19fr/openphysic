#!/usr/bin/env python

import os

from PIL import Image
from PIL.ExifTags import TAGS

from datetime import *

from shutil import *

def get_exif(fn):
    ret = {}
    i = Image.open(fn)
    info = i._getexif()
    for tag, value in info.items():
        decoded = TAGS.get(tag, tag)
        ret[decoded] = value
    return ret

extensions = ['.JPG', '.JPEG',]
timeoffset = timedelta(hours=0, minutes=0)
model = 'origin'

for file in os.listdir(model):
    fileName, fileExtension = os.path.splitext(file)
    if fileExtension.upper() in extensions:
        exif=get_exif(model+'/'+file)
        dt = datetime.strptime(exif['DateTimeOriginal'], '%Y:%m:%d %H:%M:%S') + timeoffset
        
        newfilename = dt.strftime('%Y-%m-%d_%H-%M-%S')+'_'+model+'_'+file

        print("""=== {0} ===
Datetime : {1}
New name : {2}
   """.format(file, dt, newfilename)
        )
        
        copyfile(model+'/'+file, newfilename)


#print(exif)

#print(exif['DateTimeOriginal'])

#DateTimeOriginal
#DateTimeDigitized
#GPSInfo