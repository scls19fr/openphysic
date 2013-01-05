#!/usr/bin/env python

import sys
import os

from PIL import Image
from PIL.ExifTags import TAGS

def usage():
    sys.stderr.write("Usage: {0} filename".format(sys.argv[0])+'\n')

def get_exif(fn):
    ret = {}
    i = Image.open(fn)
    info = i._getexif()
    for tag, value in info.items():
        decoded = TAGS.get(tag, tag)
        ret[decoded] = value
    return ret

def main(argv):
    if len(sys.argv) != 2:
        usage()
        sys.exit(2)

    try:
        fn=sys.argv[1]
        if not os.path.exists(fn):
            sys.stderr.write("{0} doesn't exists".format(fn)+'\n')
            sys.exit(1)
        exif=get_exif(fn)
        print(exif)

    except:
        usage()
        sys.exit(1)

if __name__ == "__main__":
    main(sys.argv[1:])