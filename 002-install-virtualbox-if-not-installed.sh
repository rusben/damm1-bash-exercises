#!/bin/bash

VBOX_INSTALLED=$(dpkg -l virtualbox | wc -l)

if [ $VBOX_INSTALLED -gt "1" ]; then
	echo "The package virtualbox is installed"
else
	echo "Ouch! The package virtualbox is not installed."
	sudo apt-get install virtualbox
fi