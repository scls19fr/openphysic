#!/usr/bin/env python

"""
Ce script permet de sortir les metadonnes geographiques
"""

import os

from PIL import Image
from PIL.ExifTags import TAGS

from datetime import *

def get_exif(fn):
    ret = {}
    i = Image.open(fn)
    info = i._getexif()
    for tag, value in info.items():
        decoded = TAGS.get(tag, tag)
        ret[decoded] = value
    return ret

def get_gps_latitude(exif):
    if 'GPSInfo' not in exif:
        return(None)
    try:
        Nsec = exif['GPSInfo'][2][2][0] / float(exif['GPSInfo'][2][2][1])
        Nmin = exif['GPSInfo'][2][1][0] / float(exif['GPSInfo'][2][1][1])
        Ndeg = exif['GPSInfo'][2][0][0] / float(exif['GPSInfo'][2][0][1])

        if exif['GPSInfo'][1] == 'N':
            Nmult = 1
        else:
            Nmult = -1

        Lat = Nmult * (Ndeg + (Nmin + Nsec/60.0)/60.0)
        return(Lat)
    except:
        return('NoLat')

def get_gps_longitude(exif):
    if 'GPSInfo' not in exif:
        return(None)
    try:
    	#return(1.2345)
        Wsec = exif['GPSInfo'][4][2][0] / float(exif['GPSInfo'][4][2][1])
        Wmin = exif['GPSInfo'][4][1][0] / float(exif['GPSInfo'][4][1][1])
        Wdeg = exif['GPSInfo'][4][0][0] / float(exif['GPSInfo'][4][0][1])

        if exif['GPSInfo'][3] == 'E':
            Wmult = 1
        else:
            Wmult = -1

        Lng = Wmult * (Wdeg + (Wmin + Wsec/60.0)/60.0)
        return(Lng)
    except:
        return('NoLng')

extensions = ['.JPG', '.JPEG',]

timeoffset = timedelta(hours=0, minutes=0)

print("filename\tmodel\tlatitude\tlongitude")

for file in os.listdir('.'):
    fileName, fileExtension = os.path.splitext(file)
    if fileExtension.upper() in extensions:
        exif=get_exif(file)
        #dt = datetime.strptime(exif['DateTimeOriginal'], '%Y:%m:%d %H:%M:%S') + timeoffset
        model = exif['Model']
        latitude = get_gps_latitude(exif)
        longitude = get_gps_longitude(exif)

        print("{0}\t{1}\t{2}\t{3}".format(file, model, latitude, longitude))
        #print("")
