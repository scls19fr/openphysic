#!/usr/bin/env python

"""
Ce script permet de classer les photos dans des repertoires par annee-mois-jour
Tres utile en cas de dechargement d une carte tres remplie
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

for file in os.listdir('.'):
    fileName, fileExtension = os.path.splitext(file)
    if fileExtension.upper() in extensions:
        exif=get_exif(file)
        dt = datetime.strptime(exif['DateTimeOriginal'], '%Y:%m:%d %H:%M:%S')
        
        directory = dt.strftime('%Y/%Y-%m-%d')
        newfilename = directory+'/'+file

        print("""=== {0} ===
Datetime : {1}
Directory : {2}
Filename dest : {3}
   """.format(file, dt, directory, newfilename)
        )
        
        if not os.path.exists(directory):
            os.makedirs(directory)
        
        copyfile(file, newfilename)