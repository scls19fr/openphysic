#!/usr/bin/env python

"""
Ce script permet de classer les photos par date heure
Tres utile en cas de prise de vue avec plusieurs appareils d'un meme evenement
"""

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
models = ['nikon', 'htc', 'sony']

for model in models:
    timeoffset = timedelta(hours=0, minutes=0)
    if model=='htc':
        timeoffset = timedelta(hours=0, minutes=0)
    elif model=='sony':
        timeoffset = timedelta(hours=0, minutes=0)
    elif model=='nikon':
        timeoffset = timedelta(hours=2, minutes=0)

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