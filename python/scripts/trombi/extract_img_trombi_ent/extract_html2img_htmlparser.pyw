#!/usr/bin/env python

from html.parser import *
import base64

class MyHTMLParser(HTMLParser):
  def __init__(self, data):
    self.mode = 0 # mode=0 : pas de capture ; mode=1 : capture
    self.i = 1
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
      fd_out = open('photos/{:03d}.jpg'.format(self.i), 'wb')

      b64encoded = bytes(data, encoding='iso-8859-1')
      decoded = base64.b64decode(b64encoded)

      fd_out.write(decoded)
      fd_out.close()

      self.i = self.i + 1

    elif (tag=='table'):
      self.mode = 1


  def handle_endtag(self, tag):
    if (tag=='table'):
      #print("Encountered  an end tag:", tag)
      self.mode = 0

#  def handle_data(self, data):
#      print("Encountered   some data:", data)

filename = 'trombi_html.txt'
fd = open(filename, 'r')
html = fd.read()
parser = MyHTMLParser(html)

fd.close()
