#!/usr/bin/python
import random, string
myrg = random.SystemRandom()

# If you want non-English characters, remove the [0:52]
#alphabet = string.letters[0:52] + string.digits
#alphabet = string.letters[0:26] + string.digits
alphabet = string.letters[0:26]
#print(alphabet)
user = str().join(myrg.choice(alphabet) for _ in range(8))
domain = str().join(myrg.choice(alphabet) for _ in range(10)) + ".net"
from_adr =  user + "@" + domain
title = str().join(myrg.choice(alphabet) for _ in range(60))

print "From: "+from_adr
print "Title: "+title