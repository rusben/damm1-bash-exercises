#!/bin/bash
#http://stackoverflow.com/questions/12230690/string-comparison-in-bash-not-found/17753098
#http://stackoverflow.com/questions/23320572/how-to-turn-off-echo-while-executing-a-shell-script-linux

VBOX_INSTALLED=$(dpkg -l | grep virtualbox | wc -l)

if [ $VBOX_INSTALLED -gt "0" ]; then
	echo "1"
else
	echo "0"
fi
