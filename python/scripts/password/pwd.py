#!/usr/bin/python
import random, string
myrg = random.SystemRandom()
length = 10
# If you want non-English characters, remove the [0:52]
#alphabet = string.letters[0:52] + string.digits
alphabet = string.letters[0:26] + string.digits
#print(alphabet)
pw = str().join(myrg.choice(alphabet) for _ in range(length))
print pw