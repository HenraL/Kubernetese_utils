#!/bin/bash
CWD=$(pwd)
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

yes_no_question "Do you wish to remove kubectl from your computer?"

if [ $? -eq $TRUE ]
then
    echo "Removing kubectl from your computer"
    echo "Running: cd /usr/local/bin"
    cd /usr/local/bin
    echo "Running: sudo rm -f kubectl"
    sudo rm -f kubectl
    echo "Running: cd $CWD"
    cd $CWD
    echo "Kubectl has successefully removed from your computer."
else
    echo "You have decided not to remove kubectl from your computer."
    echo "Kubectl will thus be left untouched."
fi
echo "This program was created by (c) Henry Letellier"