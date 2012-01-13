#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import sys

file = sys.stdout
#file = open('out.txt', 'w')

# sudo easy_install opml
import opml
# http://pypi.python.org/pypi/opml

# sudo easy_install feedparser
import feedparser
# http://code.google.com/p/feedparser/

# sudo easy_install feedparser
#import html2txt

def getType(out):
  try:
    return(out.type)
  except:
    return('rep')

def getFeeds(out, parent):
  #str = ''
  #str = '   feeds from '+out.xmlUrl 
  d = feedparser.parse(out.xmlUrl)
  #out.text
  try:
    title = d['feed']['title']
    if title == '':
      title = out2.title
  except:
    title = out2.title

  if parent==None:
    start = '+>'
  else:
    start = ' >'

  str = start + title + '\n'
  
  for feed in d['entries']:
    str = str + '  - ' + feed.title + '\n'
    #str = str + feed.summary + '\n'
  
  return(str)

outline = opml.parse('google-reader-subscriptions.xml')

file.write(outline.title+'\n')

for out in outline:
  if getType(out) == 'rep':
    file.write("")
    file.write("+"+out.title+'\n')
    for out2 in out:
      #file.write(" >"+out2.title)
      file.write(getFeeds(out2, out))
      #file.write("")
  else:
    #file.write("+>"+out.title)
    file.write(getFeeds(out, None))
    #file.write("")

file.close()