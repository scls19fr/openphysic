#!/usr/bin/env python

import random
import string
import argparse

if __name__ == "__main__":
    PARSER = argparse.ArgumentParser(description='Use the following parameters')

    PARSER.add_argument('--size', action="store",
        help="Len of password (number of chars)", default=20)

    PARSER.add_argument('--no_ascii_lowercase', action="store_true")
    PARSER.add_argument('--no_ascii_uppercase', action="store_true")
    PARSER.add_argument('--no_digits', action="store_true")
        
    ARGS = PARSER.parse_args()

    size = int(ARGS.size)
    
    set_of_chars = ''
    
    if not ARGS.no_ascii_lowercase:
        set_of_chars += string.ascii_lowercase

    if not ARGS.no_ascii_uppercase:
        set_of_chars += string.ascii_uppercase

    if not ARGS.no_digits:
        set_of_chars += string.digits
    
    #set_of_chars = string.ascii_lowercase + string.digits + string.ascii_uppercase
    print("Set of chars: ")
    print(set_of_chars)

    print("")
    
    pwd = ''.join(random.choice(set_of_chars) for x in range(size))

    print("Password: ")
    print(pwd)
