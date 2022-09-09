#!/bin/bash
RESEARCHED_RESPONSE=OK
PACKAGE=kubectl
TRUE=1
FALSE=0
CONTINUE_RUNNING=$TRUE
QUESTION_RETRY="Do you wish to try again?"
DOWNLOAD_RESPONSE=""
function download_package() {
    echo "Downloading kubectl's package"
    echo "Running: curl -LO \"https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl\" -o $PACKAGE"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o $PACKAGE
    echo "Checking the integrity of the package"
    echo "Fetching the validator"
    echo "Running: curl -LO \"https://dl.k8s.io/$(curl -LO -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256\" -o $PACKAGE.sha256"
    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" -o $PACKAGE.sha256
}

function install_package() {
    echo "Filename = $1"
    file_exits $1
    FILE_DOES_EXIST=$?
    echo "File exists = $FILE_DOES_EXIST"
    if [ $FILE_DOES_EXIST -eq $TRUE ]
    then
        echo "Installing"
        echo "Running: sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl"
        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
        echo "Checking the version"
        echo "Running: kubectl version"
        kubectl version
        echo "kubectl has successefully been installed."
        return $TRUE
    else
        echo "File $PACKAGE not found."
        return $FALSE
    fi
}

function check_integrity() {
    echo "Checking the integrity"
    echo "Runing: echo \"\$(cat $1.sha256)  $1\" | sha256sum --check"
    DOWNLOAD_RESPONSE=$(echo "$(cat $1.sha256)  $1" | sha256sum --check)
    PROCESSED=$(echo $DOWNLOAD_RESPONSE | grep -o $2)
    if [ $PROCESSED == $RESEARCHED_RESPONSE ]
    then
        echo "$PROCESSED"
        return $TRUE
    else
        echo "Download failed, the integrity of the file is damaged."
        return $FALSE
    fi
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

function file_exits() {
    echo "filename = $1"
	if [ -f  "$1" ]
	then
		 return $TRUE
	else
		return $FALSE
	fi
}

echo "Installing Kubectl"

while [ $CONTINUE_RUNNING -eq $TRUE ]
do
    download_package
    check_integrity $PACKAGE $RESEARCHED_RESPONSE
    INTERGRITY_STATUS=$?
    echo "$INTEGRITY_STATUS"
    if [ $INTERGRITY_STATUS -eq $TRUE ]
    then
        install_package $PACKAGE
        RESPONSE=$?
        if [ $RESPONSE -eq $TRUE ]
        then
            echo "The program has successefully been installed."
            CONTINUE_RUNNING=$FALSE
        else
            echo "Installation failed."
            yes_no_question $QUESTION_RETRY
            CONTINUE_RUNNING=$?
        fi
    else
        echo "Download failed."
        yes_no_question $QUESTION_RETRY
        CONTINUE_RUNNING=$?
    fi
    echo "Program created by (c) Henry Letellier"
done