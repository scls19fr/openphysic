#!/usr/bin/python

import sys

def main():
    offset = 13
    text = sys.stdin.read()
    for x in range(len(text)):
        byte = ord(text[x])
        cap = (byte & 32)
        byte = (byte & (~cap))
        if (byte >= ord('A')) and (byte <= ord('Z')):
            byte = ((byte - ord('A') + offset) % 26 + ord('A'))
        byte = (byte | cap)
        sys.stdout.write(chr(byte))

main()
