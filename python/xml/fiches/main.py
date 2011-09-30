#!/usr/bin/env python

from xml.dom.minidom import parse
import os 

def getText(nodelist):
	rc = []
	for node in nodelist:
		if node.nodeType == node.TEXT_NODE:
			rc.append(node.data)
	return ''.join(rc)


print """Head
"""

for root, dirs, files in os.walk('fiches', topdown=True):
	for file in files:
		(shortname, extension) = os.path.splitext(file)
		if (extension in ['.xml']):
			print "**** %s ****" % file
			docXML = parse(os.path.join('fiches', file))
			#for node in docXML.getElementsByTagName('title'):
			#	print node
			node = docXML.getElementsByTagName('title')[0]
			print getText(node.childNodes)


#list = ["0001", "0002"]
#for i in list:
#	print i
	#fiche = parse('fiches/'+i+'.xml')
	#print fiche

print """
Foot
"""