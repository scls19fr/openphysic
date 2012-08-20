#!/usr/bin/env bash

ext='jpg'

#echo "=== List of files with size ==="
#ls -lh temp/$ext/*.$ext

echo "=== Indentify in ==="
identify in/*

echo "=== Indentify temp ==="
identify temp/$ext/*.$ext

echo "=== Indentify temp2 ==="
identify temp2/$ext/*.$ext

echo "=== Indentify out ==="
identify out/*