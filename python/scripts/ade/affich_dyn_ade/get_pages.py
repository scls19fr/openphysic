#!/usr/bin/env python

import urllib

# clean previous pages

# get pages
url_start = 'https://upplanning.appli.univ-poitiers.fr/ade/standard/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=true&showPianoWeeks=true&showOptions=false&displayConfName=IUTP-Campus%20(GTE)&projectId=1&code='

urls = [
	url_start + 'Z1PT11',
	url_start + 'Z2PT22'
	]

i = 1
for url in urls:
	html = urllib.urlopen(url).read()
	filename = "{0:03d}.htm".format(i)
	f = open(filename, 'w')
	f.write(html)
	i = i + 1
	f.close()