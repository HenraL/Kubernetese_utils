#!/bin/bash

if [ $# -eq 1 ]
then
	if [ $1 -eq 1 ]
	then
		echo "Horray, you have found the correct answer"
		exit 1
	else
		echo "Wrong answer, please try again"
	fi

else
	echo "Please only enter 1 number"
fi
echo "This program was created by (c) Henry Letellier"