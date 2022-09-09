#!/bin/bash
TRUE=1
FALSE=0
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

function file_exits() {
	if [ test -f  $1 ]
	then
		return $TRUE
	else
		return $FALSE
	fi
}

function run_file() {
    file_exist $1
    if [ $? -eq $TRUE ]
    then
        chmod +x $1
        ./$1
    fi
}

yes_no_question "Do you wish to remove Minikube and all it's dependencies from your computer?"

if [ $? -eq $TRUE ]
then
    echo "Fully removing Minikube and depencies from your computer"
    run_file remove_ssh.sh
    run_file remove_kvm2.sh
    run_file remove_docker.sh
    run_file remove_kubectl.sh
    run_file remove_minikube.sh
    echo "Everybody has been removed"
else
    echo "You have decided not to remove Minikube and it's dependencies."
    echo "Minikube and it's dependencies will thus be left untouched."
fi
echo "This program was created by (c) Henry Letellier"
