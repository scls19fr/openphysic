#!/usr/bin/python
import random, string
myrg = random.SystemRandom()
length = 80
lines = 30
# If you want non-English characters, remove the [0:52]
#alphabet = string.letters[0:52] + string.digits
alphabet = string.letters[0:26] + string.digits + '   '
#print(alphabet)
strg = ''

for i in range(lines):
	line = str().join(myrg.choice(alphabet) for _ in range(length))
	if i==0:
		strg = line
	else:
		strg = strg + '\n' + line
		

print strg