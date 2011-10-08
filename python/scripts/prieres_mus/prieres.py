#!/usr/bin/env python
# -*- coding: utf-8 -*-

import urllib
from datetime import *
import json

tday = date.today()
#print(t.year)
#print(t.month)

#Le Caire
#Coordonnées		sexagésimales		décimales
#Latitude :			30°	3′	22″	N		30.056111°
#Longitude :		31°	14′	22″	E		31.239444°

# Verif :
#  http://www.yabiladi.com/prieres/details/42/le-caire.html


# "Muslim World League" method 

longitude = 31.239444
latitude = 30.056111
gmt_offset = 0 # 2
url = "http://xhanch.com/api/islamic-get-prayer-time.php?lng={lng}&lat={lat}&yy={yy}&mm={mm}&gmt={gmt}&m=json".format(yy=tday.year, mm=tday.month, lng=longitude, lat=latitude, gmt=gmt_offset)
#print(url)
f = urllib.urlopen(url)
json_data = f.read() 
#print(json_data)
data = json.loads(json_data)

today_prayer = data[str(tday.day)]
#json.loads(json_r)
#print json.dumps(json_r, sort_keys=True, indent=4)

#fajr > Dohr(*) > asr > maghreb > isha
#(*) n'est pas une prière

#print(today_prayer)

#t = datetime()
#strptime('%H:%M')
for prayer in ['fajr', 'asr', 'maghrib', 'isha']:
    dt = datetime.strptime(today_prayer[prayer], '%H:%M')
    #print("{0}:{1}".format(dt.hour, dt.minute))
    print(prayer + "\t" + datetime.strftime(dt, "%H:%M"))