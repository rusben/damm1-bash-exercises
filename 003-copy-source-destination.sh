#!/bin/bash

# $# : Contains the number of parameters the program gets
# $@ : Contains an array with all parameters the program gets
if [ $# -eq 2 ] ; then
	
	SOURCE_FOLDER=$1
	DESTINATION_FOLDER=$2

	# Check <source-folder> exists
	if [ ! -d "$SOURCE_FOLDER" ]; then
  		# Control will enter here if $SOURCE_FOLDER doesn't exist.
  		echo "Ouch! The <source-folder> $1 does not exist."
  	else
  		# Check <destination-folder> exists	
  		# Creates <destination-folder> if not exists
  		if [ ! -d "$DESTINATION_FOLDER" ]; then
			echo "Creating <destination-folder> $2."	
			mkdir -p $2
		fi

		# Check if after the creation the folder exists <destination-folder>
		if [ -d "$DESTINATION_FOLDER" ]; then
			# Copy the content from <source-folder> to <destination-folder>
			cp -R $1/* $2
		else
			echo "Ouch! An error ocurred while creating <destination-folder> $1"
  		fi
	fi

else
	#info
	echo "Your execution:"
	echo "$# parameters:"
	echo "$@"
	#usage
	echo "Usage:"
	echo "sh 003-copy-source-destination.sh <source-folder> <destination-folder>"
fi