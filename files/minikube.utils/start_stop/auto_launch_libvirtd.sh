#!/bin/bash

APP_NAME=libvirtd

HELP_MESSAGE="\
HELP SECTION:\n\
\n\
This script aims to help enable/disable the start of ${APP_NAME} services.\n\
\n\
OPTIONS:\n\
\n\
- Enter -h or --help to display this message.\n\
- Enter -e or --enable to enable ${APP_NAME} services on system startup\n\
- Enter -d or --disable to prevent ${APP_NAME} services on system startup\n\
- Enter -t or --test or --status to check the status of the ${APP_NAME} services\n\
- Enter -s or --start to launch ${APP_NAME}\n\
- Enter -k or --kill or --stop to stop ${APP_NAME}\n\
"

if [ $# -eq 1 ]
then
	if [[ $1 == '-h' || $1 == '--help' ]]
	then
		echo -e "${HELP_MESSAGE}"
	elif [[ $1 == '-e' || $1 == '--enable' ]]
	then
		echo "Enabling ${APP_NAME} services"
		echo "Running: sudo systemctl enable ${APP_NAME}"
		sudo systemctl enable libvirtd
		echo "Enabled ${APP_NAME} services"
	elif [[ $1 == '-d' || $1 == '--disable' ]]
	then
		echo "Disabling ${APP_NAME} services"
		echo "Running: sudo systemctl disable ${APP_NAME}"
		sudo systemctl disable libvirtd
		echo "Stopped the ${APP_NAME} services"
	elif [[ $1 == '-t' || $1 == '--test' || $1 == '--status' ]]
	then
		echo "Testing the status of the ${APP_NAME} services"
		echo "Running: sudo systemctl status ${APP_NAME}"
		sudo systemctl status libvirtd
		echo "Testing complete"
	elif [[ $1 == '-s' || $1 == '--start' ]]
	then
		echo "Starting ${APP_NAME}"
		echo "Running: sudo systemctl start ${APP_NAME}"
		sudo systemctl start libvirtd
		echo "Started ${APP_NAME}"
	elif [[ $1 == '-k' || $1 == '--kill' || $1 == '--stop' ]]
	then
		echo "Stopping ${APP_NAME}"
		echo "Running: sudo systemctl stop ${APP_NAME}"
		sudo systemctl stop libvirtd
		echo "Stopped ${APP_NAME}"
	else
		echo "Option not found, you have entered '$1'"
		echo "Enter '-h' to display the help section."
	fi
else
	echo -e "${HELP_MESSAGE}"
fi
echo "This program was created by (c) Henry Letellier"