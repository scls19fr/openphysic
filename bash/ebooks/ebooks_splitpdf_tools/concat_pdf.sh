#!/usr/bin/env bash

source _config.sh

files_list=$(ls temp2/pdf/*)
#pdftk $files_list cat output $destFilename
pdftk $files_list cat output The_Art_of_Prolog,_Second_Edition_Advanced_Programming_Techniques-cutted.pdf