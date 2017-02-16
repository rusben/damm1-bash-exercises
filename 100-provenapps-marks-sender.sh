#!/bin/bash

PRIMARY_GROUP=alumnes
HOST=localhost

#which a2ensite
#${A2ENSITE} new-domain.com
CHMOD=/bin/chmod
CHOWN=/bin/chown
MKDIR=/bin/mkdir
SENDMAIL=/usr/sbin/sendmail

#Three parameters
if [ $# -eq 2 ] ; then
	#First parameter is the group's name
	#Second parameter is the number of users
	#Third parameter is a file path containing an ordered list of emails, just one
	# column with a valid email address. 
	#GROUP_NAME=$1
	#USERS_NUMBER=$2
	MARKS_LIST_PATH=$1
	EMAILS_LIST_PATH=$2

#http://stackoverflow.com/questions/12022319/bash-echo-number-of-lines-of-file-given-in-a-bash-variable-without-the-file-name
	USERS_NUMBER=cat $EMAILS_LIST_PATH | wc -l

	USERS_NUMBER=1
	EMAIL_SENDER="no-reply"

	#http://stackoverflow.com/questions/30988586/creating-an-array-from-a-text-file-in-bash
	#Get email-list
	mapfile -t MARKS_ARRAY < $MARKS_LIST_PATH
	mapfile -t EMAILS_ARRAY < $EMAILS_LIST_PATH

	echo $USERS_NUMBER

	#https://www.cyberciti.biz/faq/unix-linux-iterate-over-a-variable-range-of-numbers-in-bash/
	for (( i=1; i<=$((USERS_NUMBER)); i++ ))
	do

#
# Mailing
#
$(echo "Hola,

Notes DAM-M1-UF1:

${MARKS_ARRAY[0]}
${MARKS_ARRAY[i]}


Salutacions" >> marks.mailing.txt)

#Send the email
#http://stackoverflow.com/questions/8260858/how-to-send-email-from-terminal
#echo ${EMAILS_ARRAY[i-1]}

#mail -s "Accés al VPS del Provençana" "${EMAILS_ARRAY[i-1]}" <<EOF
${SENDMAIL} "${EMAILS_ARRAY[i-1]}" <<EOF
subject: Notes DAM-M1-UF1
from: ${EMAIL_SENDER}
Hola,

Notes DAM-M1-UF1:

${MARKS_ARRAY[0]}
${MARKS_ARRAY[i]}

Salutacions
EOF
	sleep 5
	done

else
	#help
	echo "$# parameters"
	echo "$@"
	#usage
	echo "Send marks sender"
	echo "usage: sh provenapps-marks-sender.sh <marks-list> <email-list>"
fi


