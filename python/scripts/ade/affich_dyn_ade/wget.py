#!/usr/bin/env python

import urllib, sys
print urllib.urlopen(sys.argv[1]).read() 