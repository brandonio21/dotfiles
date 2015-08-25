#!/bin/bash
EMAIL_FILE=".emailcount"

ping -c 1 "www.google.com" > /dev/null
pingResult=$?
if [ ${pingResult} -ne 0 ]; then
	echo 0 > $EMAIL_FILE
	exit 1
fi

if [ ! -f $EMAIL_FILE ]; then
	echo 0 > $EMAIL_FILE
fi

numEmails=$(curl -s -u ''${EMAIL}'':''${DETAILS}'' https://mail.google.com/mail/feed/atom | egrep -o "<fullcount>[0-9]*</fullcount>" | egrep -o "[0-9]*")
oldEmails=$(cat $EMAIL_FILE)
echo $numEmails > $EMAIL_FILE
if [ $numEmails -ne 0 ]; then
	echo $numEmails
fi
if [ $numEmails -gt $oldEmails ]; then
	let "emailDiff = $numEmails - $oldEmails"
	if [ $emailDiff == 1 ]; then
		$HOME/.i3/bin/showAlert.sh "$emailDiff new email!" top 2
	else
		$HOME/.i3/bin/showAlert.sh "$emailDiff new emails!" top 2
	fi
fi
