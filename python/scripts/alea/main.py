#!/usr/bin/python
import random, string


def test():
	myrg = random.SystemRandom()

	length = 80
	lines = 300
	# 80x30000 = 2.3Mo

	# If you want non-English characters, remove the [0:52]
	#alphabet = string.letters[0:52] + string.digits
	alphabet = string.letters[0:26] + string.digits + '   '
	#print(alphabet)
	#strg = ''

	f = open('file.dat', 'wb')


	for i in range(lines):
		line = str().join(myrg.choice(alphabet) for _ in range(length))
		if i==0:
			#strg = line
			f.write(line)
		else:
			#strg = strg + '\n' + line
			f.write('\n' + line)

	#print(strg)

	f.close()


if __name__ == '__main__':
	test()