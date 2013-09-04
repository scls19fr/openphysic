#!/usr/bin/env bash

echo "[ Checking for epd package updates... ]"
#-- display new packages
sudo enpkg --whats-new
#-- save new package list
sudo enpkg --whats-new > /tmp/enpkgnew.txt
#-- save only the first word after the "=====", it will be "no" if there are no new packages to be updated
firstword=$(sed '1,2d' /tmp/enpkgnew.txt | awk 'NR>1{exit};1' | awk '{print $1}')

if [ "$firstword" == "no" ]; then
    echo "[ No package updates available, exiting ]"
else
    echo "[ Updating... ]"
    #-- space delimited list of the new packages
    newpacks=$(sed '1,2d' /tmp/enpkgnew.txt | awk '{print $1}' | tr "\n" " ")
    #-- update the new packages
    sudo enpkg $newpacks
fi

# See more at: http://blog.newsyland.com/programming/enthought-python-distribution-epd-update-via-command-line#sthash.OhLDwNay.dpuf