#!/bin/bash
TRUE=1
FALSE=0
function file_exits() {
	if [ test -f  $1 ]
	then
		 return $TRUE
	else
		return $FALSE
	fi
}

echo "Downloading"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
echo "Downloaded"
echo "Installing"
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo "Installed"
#echo "Allowing minikube to be launched on startup"
#FILENAME=create_minikube_startup.sh
#file_exist $FILENAME
#if [ $? -eq $TRUE ]
#then
#	sudo ./$FILENAME
#else
#	echo "Could not make minikube launchable on startup."
#	echo "Reason: $FILENAME not found"
#	echo "Solution: Locate the file and run it with admin rights"
#fi
# echo "Startup launcher created"
echo "This program was created by (c) Henry Letellier"