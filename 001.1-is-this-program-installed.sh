#!/bin/bash

# $# : Contains the number of parameters the program gets
# $@ : Contains an array with all parameters the program gets
if [ $# -eq 1 ] ; then
	
	PROGRAM_INSTALLED=$(dpkg -l | grep $1 | wc -l)

	if [ $PROGRAM_INSTALLED -gt 0 ] ; then
		echo "The program is installed"
	else
		echo "Ouch! The program is not installed."
	fi
else
	#help
	echo "$# parameters"
	echo "$@"
	#usage
	echo "Program finder"
	echo "usage: sh is-this-program-installed.sh <program-to-find>"
fi

