import collections
import os

# Ref : http://jessenoller.com/2008/05/30/making-re-creatable-random-data-files-really-fast-in-python/

seed = "1092384956781341341234656953214543219"
words = open("lorem.txt", "r").read().replace("\n", '').split()
 
def fdata():
    a = collections.deque(words)
    b = collections.deque(seed)
    while True:
        yield ' '.join(list(a)[0:1024])
        a.rotate(int(b[0]))
        b.rotate(1)
 
g = fdata()
#size = 1073741824 # 1gb
size = 2*1024*1024 # 2Mb
fname = "file.dat"
fh = open(fname, 'w')
while os.path.getsize(fname) < size:
    fh.write(g.next())