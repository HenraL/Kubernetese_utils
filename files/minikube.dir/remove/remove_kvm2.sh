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

function remove_kvm2() {
    echo "Removing kvm2 from your computer"
    echo "Running: sudo $PACKAGE_MANAGER group remove virtualization"
    sudo $PACKAGE_MANAGER group remove virtualization
    echo "kvm2 has been removed from your computer"
}

yes_no_question "Do you whish to remove kvm2 from your computer?"

if [ $? -eq $TRUE ]
then
    remove_kvm2
else
    echo "You have decided not to remove kvm2 from your computer."
    echo "kvm2 will thus be left untouched."
fi
echo "This program was created by (c) Henry Letellier"
