#!/bin/bash

TRUE=1
FALSE=0
SERVICE_FILENAME=minikube.service
QUESTION="Do you wish to enable Minikube on startup?"

function create_minikube_service() {
	echo "[Unit]" > $SERVICE_FILENAME
	echo "Description=Launch Minikube on startup" >> $SERVICE_FILENAME
	echo "" >> $SERVICE_FILENAME
	echo "[Service]" >> $SERVICE_FILENAME
	echo "ExecStart=minikube start" >> $SERVICE_FILENAME
	echo "" >> $SERVICE_FILENAME
	echo "[Install]" >> $SERVICE_FILENAME
	echo "WantedBy=multi-user.target" >> $SERVICE_FILENAME
}

function yes_no_question {
    while true; do
        read -p "$1 [(Y)es/(n)o]: " yn
        case $yn in
            [Yy]* )
                return $TRUE;
                break;;
            [Nn]* )
                return $FALSE;
                break;;
            * )
                echo "Please enter yes or no."
                echo "You have entered: $yn";;
        esac
    done
}

echo "Going to '/etc/systemd/system'"
cd /etc/systemd/system
echo "Creating the minikube service"
create_minikube_service
echo "Service created"
echo "Refreshing the service list"
sudo systemctl daemon-reload
echo "Starting service"
sudo systemctl start minikube
echo "Checking the status of the service"
E=$(sudo systemctl status minikube)
#E=$(echo $E | tr '' '\n')
echo -e $E
echo "Attentions!:"
echo "It is not recommended to enable Minikube on startup if it has not finished configuring (or is asking for sudo rigths [could freeze the boot up of your computer])"
yes_no_question $QUESTION
RESPONSE=$?
if [ $RESPONSE -eq $TRUE ]
then
	echo "Enabeling Minikube on startup"
	sudo systemctl enable minikube
fi
echo "You can always disable/enable/test/start/stop Minikube by using the auto_launch_minikube.sh program"
echo "This program was created by (c) Henry Letellier"
