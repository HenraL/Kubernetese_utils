#!/bin/bash
PACKAGE_MANAGER=dnf
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

function remove_docker() {
    echo "Removing Docker"
    sudo $PACKAGE_MANAGER remove docker \
                    docker-client \
                    docker-client-latest \
                    docker-common \
                    docker-latest \
                    docker-latest-logrotate \
                    docker-logrotate \
                    docker-selinux \
                    docker-engine-selinux \
                    docker-engine
}

yes_no_question "Do you wish to remove Docker from your computer?"
if [ $? -eq $TRUE ]
then
    remove_docker
else
    echo "You have decided not to remove docker."
    echo "It will thus not be touched."
fi
echo "This program was created by (c) Henry Letellier"
