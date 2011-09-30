#!/usr/bin/env python

# Script Python de copie de fichiers d'extension donnée depuis les comptes utilisateurs
# et compression dans un fichier .zip
# Sebastien CELLES
# 7/11/2008

import os
import zipfile

from Tkinter import *
import tkMessageBox

dirOrigine = "\\\\Andromede\\Comptes\\GTE\\dut"
zFile =  "C:\\Documents and Settings\\scelles\\Mes documents\\copie_autocad.zip"

extensions = [".dwg",".dwt"]

def message_info(msg):
  #tkMessageBox.showinfo("Copie", msg)
  print msg


message_info("Creation du fichier "+zFile)
zip=zipfile.ZipFile(zFile, 'w')

message_info("Debut de la copie")

root=''
dirs=[]
files=[]
for root, dirs, files in os.walk(dirOrigine, topdown=True):
  for file in files:
    (shortname, extension) = os.path.splitext(file)
    if (extension in extensions):
      message_info(os.path.join(root, file))
      zip.write(os.path.join(root, file))

zip.close()

message_info("Fin de la copie")
