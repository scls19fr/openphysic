#!/usr/bin/env python

import urllib2
import logging

logger = logging.getLogger("IpLogger")
logger.setLevel(logging.DEBUG) #set verbosity to show all messages of severity >= DEBUG

file_handler = logging.FileHandler('ip.log')
formatter = logging.Formatter("%(asctime)s %(message)s")
file_handler.setFormatter(formatter)
logger.addHandler(file_handler)

console_handler = logging.StreamHandler()
console_handler.setFormatter(formatter)
level = logging.INFO
console_handler.setLevel(level)
logger.addHandler(console_handler)

req = urllib2.Request('http://www.celles.net/php/whatismyip.php')
f = urllib2.urlopen(req)
ip = f.read()
# parse HTML page if necessary

logger.info(ip)
