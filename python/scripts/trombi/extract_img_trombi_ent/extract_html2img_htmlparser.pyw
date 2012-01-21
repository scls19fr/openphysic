#!/usr/bin/env python

from html.parser import *
import base64
import unicodedata
import csv

filename_out_format = 'photos/{nom}_{prenom}_{num}.jpg'

csvWriter = csv.writer(open('liste_etu.csv', 'w'), delimiter=';')
csvWriter.writerow(['NUM', 'NOM', 'PRENOM', 'IMG', 'TP'])
                        
def remove_diacritic(input):
    '''
    Accept a unicode string, and return a normal string (bytes in Python 3)
    without any diacritical marks.
    '''
    return unicodedata.normalize('NFKD', input).encode('ASCII', 'ignore')

def cleanup(txt):
  txt = txt.strip() # enlever espace
  txt = txt.lower() # mise en minuscule
  txt = txt.replace(' ','_') # remplacer espace par underscore
  txt = remove_diacritic(txt)
  txt = txt.decode('ascii')
  return txt

class MyHTMLParser(HTMLParser):
  def __init__(self, data):
    self.mode = 0 # mode=0 : pas de capture ; mode=1 : capture
    self.i = 0
    self.j = 0
    self.num = 0
    self.nom = ''
    self.prenom = ''
    self.img = b''
    HTMLParser.__init__(self)
    self.feed(data)
    self.close()

  def handle_starttag(self, tag, attrs):
    if (tag=='img' and self.mode==1):
      #print("Encountered a start tag:", tag, attrs[0][1])

      data = attrs[0][1]
      start_dat = data.find(',') + 1
      data = data[start_dat:]
      
      #fd_out = open('temp/'+str(self.i)+'.gif', 'wb')

      b64encoded = bytes(data, encoding='iso-8859-1')
      #decoded = base64.b64decode(b64encoded)
      self.img = base64.b64decode(b64encoded)

      self.i = self.i + 1

    if (tag=='td'):
      self.j = 0

    elif (tag=='table'):
      self.mode = 1


  def handle_endtag(self, tag):
    if (tag=='table'):
      #print("Encountered  an end tag:", tag)
      self.mode = 0
    elif (tag=='td'):
      print('='*5)
      #filename = 'photos/{:03d}.jpg'.format(self.i)
      filename_out = filename_out_format.format(nom=cleanup(self.nom), prenom=cleanup(self.prenom), num=self.num)
      fd_out = open(filename_out, 'wb')
      fd_out.write(self.img)
      fd_out.close()
      csvWriter.writerow([self.num, self.nom, self.prenom.strip(), filename_out, 0])

  def handle_data(self, data):
    if (self.mode == 1):
      if (self.j == 0):
        self.num = data
      elif (self.j==1):
        self.nom = data
      elif (self.j==2):
        self.prenom = data
      #  self.filename_img = ''
      #else:
      #  self.filename_img = self.filename_img + data
      print("Encountered some data:", self.j, data)
      self.j = self.j + 1

filename_in = 'trombi_html.txt'
fd = open(filename_in, 'r', encoding='iso-8859-1')
html = fd.read()
parser = MyHTMLParser(html)

fd.close()
