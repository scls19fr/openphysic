#!/usr/bin/env bash

source _config.sh

ls $srcFilename > $files
cp $files $files_ordered