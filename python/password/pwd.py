#!/usr/bin/env python

import random
import string

pwd = ''.join(random.choice(
    string.ascii_lowercase + string.digits) for x in range(10))

print(pwd)
