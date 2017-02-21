#!/bin/bash

# http://stackoverflow.com/questions/12230690/string-comparison-in-bash-not-found/17753098
# http://stackoverflow.com/questions/23320572/how-to-turn-off-echo-while-executing-a-shell-script-linux

# The following commented lines shows the version returning installed for all packages 
# with virtualbox in the name
# Note that the result from wc should be greater than 0 lines to return installed.
# VBOX_INSTALLED=$(dpkg -l | grep virtualbox | wc -l) 

# With the following version we look up for exactly virtualbox in the name of the package
# If the package is not installed the result will be one line, as follows:
# dpkg-query: no packages found matching virtualbox

VBOX_INSTALLED=$(dpkg -l virtualbox | wc -l)

if [ $VBOX_INSTALLED -gt "1" ]; then
	echo "The package virtualbox is installed"
else
	echo "Ouch! The package virtualbox is not installed."
fi