#!/usr/bin/env bash

ext='jpg'

echo "=== List of files with size ==="
ls -lh "temp/$ext/*.$ext"

echo "=== Indentify ==="
identify "temp/$ext/*.$ext"