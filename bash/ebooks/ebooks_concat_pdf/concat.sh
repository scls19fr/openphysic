#!/usr/bin/env bash

source _config.sh

files_list=$(cat $files_ordered)
pdftk $files_list cat output $destFilename