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

yes_no_question "Do you wish to remove openrc (ssh) from your computer?"

if [ $? -eq $TRUE ]
then
    echo "Removing openrc"
    echo "Running: sudo $PACKAGE_MANAGER remove openrc"
    sudo $PACKAGE_MANAGER remove openrc
    echo "openrc has been removed"
else
    echo "You have decided not to remove openrc."
    echo "openrc will thus be left untouched."
fi
echo "This program was created by (c) Henry Letellier"
