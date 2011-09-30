#!/usr/bin/env python
# -*- coding: cp1252 -*-

import zipfile
import os

print "Zip files in a directory (and its subdirectories)"

dir="files"

zip=zipfile.ZipFile("files.zip", 'w')

def change_encode(s):
  #return unicode(s,'cp1252').encode('cp850','replace')
  #return unicode(s,'cp1252').encode('cp437','replace')
  return s
  #return unicode(s,'ascii')

#walking in the directories and subdirectories
root=''
dirs=[]
files=[]
for root, dirs, files in os.walk(dir, topdown=True):
  for file in files:
    root_file = os.path.join(root, file)
    root_file=change_encode(root_file)
    print root_file
    zip.write(root_file)

zip.close()

print "Zip file is ready"
