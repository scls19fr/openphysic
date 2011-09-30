#!/usr/bin/env bash

# Rename "recto 012.jpg" -> "recto1 012.jpg"

#rename 's/recto/recto1/' *.jpg

rename 's/^recto (\d{3}.jpg)$/recto1 $1/' *.jpg
# \d = [0-9]