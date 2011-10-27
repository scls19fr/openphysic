#!/usr/bin/env bash

wget http://www.domain.com/forum/rubrique/00000-titre.html

for i in {2..226}
do
	wget http://www.domain.com/forum/rubrique/00000-titre-$i.html
done