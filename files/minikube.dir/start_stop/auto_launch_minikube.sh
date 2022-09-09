#!/bin/bash

APP_NAME=minikube

HELP_MESSAGE="\
HELP SECTION:\n\
\n\
This script aims to help enable/disable the start of ${APP_NAME} services.\n\
\n\
OPTIONS:\n\
\n\
- Enter -h or --help to display this message.\n\
"
#- Enter -e or --enable to enable ${APP_NAME} services on system startup\n\
#- Enter -d or --disable to prevent ${APP_NAME} services on system startup\n\
HELP_MESSAGE+="\
- Enter -t or --test or --status to check the status of the ${APP_NAME} services\n\
- Enter -s or --start to launch ${APP_NAME}\n\
- Enter -k or --kill or --stop to stop ${APP_NAME}\n\
- Enter -p or --pause to pause ${APP_NAME}\n\
- Enter -u or --unpause to resume ${APP_NAME}\n\
"

if [ $# -eq 1 ]
then
	if [[ $1 == '-h' || $1 == '--help' ]]
	then
		echo -e "${HELP_MESSAGE}"
	#elif [[ $1 == '-e' || $1 == '--enable' ]]
	#then
	#	echo "Enabling ${APP_NAME} services"
	#	echo "Running: sudo systemctl enable ${APP_NAME}"
	#	sudo systemctl enable minikube
	#	echo "Enabled ${APP_NAME} services"
	#elif [[ $1 == '-d' || $1 == '--disable' ]]
	#then
	#	echo "Disabling ${APP_NAME} services"
	#	echo "Running: sudo systemctl disable ${APP_NAME}"
	#	sudo systemctl disable minikube
	#	echo "Stopped the ${APP_NAME} services"
	elif [[ $1 == '-t' || $1 == '--test' || $1 == '--status' ]]
	then
		echo "Testing the status of the ${APP_NAME} services"
		echo "Running: ${APP_NAME} status"
		minikube status
	#	echo "Running: sudo systemctl status ${APP_NAME}"
	#	systemctl status minikube
		echo "Testing complete"
	elif [[ $1 == '-s' || $1 == '--start' ]]
	then
		echo "Starting ${APP_NAME}"
		echo "Running: ${APP_NAME} start"
		minikube start
		echo "Started ${APP_NAME}"
	elif [[ $1 == '-k' || $1 == '--kill' || $1 == '--stop' ]]
	then
		echo "Stopping ${APP_NAME}"
		echo "Running: ${APP_NAME} stop"
		minikube stop
		echo "Stopped ${APP_NAME}"
	elif [[ $1 == '-p' || $1 == '--pause' ]]
	then
		echo "Pausing ${APP_NAME}"
		echo "Running ${APP_NAME} pause"
		minikube pause
		echo "Paused ${APP_NAME}"
	elif [[ $1 == '-u' || $1 == '--unpause' ]]
	then
		echo "Resuming (Unpausing) ${APP_NAME}"
		echo "Running ${APP_NAME} unpause"
		minikube unpause
		echo "Resumed ${APP_NAME}"
	else
		echo "Option not found, you have entered '$1'"
		echo "Enter '-h' to display the help section."
	fi
else
	echo -e "${HELP_MESSAGE}"
fi
echo "This program was created by (c) Henry Letellier"
