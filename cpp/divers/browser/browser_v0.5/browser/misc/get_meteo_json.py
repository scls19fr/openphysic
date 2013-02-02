#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Ce script interroge le serveur de la centrale météo qui
répond via un objet JSON
"""

import urllib2
import json

url = "http://10.16.52.7/json.php"
json_data = urllib2.urlopen(url).read()

"""
Exemple de réponse JSON (pour test)
json_data='{"temperature":"5.8","relative_humidity":"85.1","pressure":"995","wind":{"moy":{"speed":"15.7","direction":"332"},"max":{"speed":"23.2","direction":"7"},"min":{"speed":"4.7","direction":"284"}}}'
"""

data = json.loads(json_data)

#print(data)

strMeteo = "Température : {temp}° - humidité relative : {hr}% - pression : {p}hPa - {wind_moy_speed} km/h de vent du {wind_moy_dir}° - rafales à {wind_max_speed} km/h du {wind_max_dir}°".format(
   temp=data['temperature'],
   hr=data['relative_humidity'],
   p=data['pressure'],
   wind_moy_speed=data['wind']['moy']['speed'],
   wind_moy_dir=data['wind']['moy']['direction'],
   wind_max_speed=data['wind']['max']['speed'],
   wind_max_dir=data['wind']['max']['direction']
)

# ToDo: direction en clair (N NNE NE ENE E ESE SE SSE S SSO SO OSO O ONO NO NNO ...)

print(strMeteo)