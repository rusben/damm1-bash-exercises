#!/bin/bash

# $# : Contains the number of parameters the program gets
# $@ : Contains an array with all parameters the program gets
if [ $# -eq 1 ] ; then
	
	PROGRAM_INSTALLED=$(dpkg -l $1 | wc -l)

	if [ $PROGRAM_INSTALLED -gt "1" ] ; then
		echo "The program $1 is installed"
	else
		echo "Ouch! The program $1 is not installed."
	fi
else
	#help
	echo "$# parameters"
	echo "$@"
	#usage
	echo "Program finder"
	echo "usage: sh is-this-program-installed.sh <program-to-find>"
fi

