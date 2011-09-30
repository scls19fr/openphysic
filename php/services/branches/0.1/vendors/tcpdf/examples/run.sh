#!/usr/bin/env bash
php=/Applications/MAMP/bin/php5/bin/php
for file in *.php
do
	$php $file > ${file%.*}.pdf
done