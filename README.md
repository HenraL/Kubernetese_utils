# Kubernetese_utils

These are a series of bash files ment to help you speed up the install/removal process of required dependencies (i.e. minikube, docker, etc)

## Targeted system

The targeted system are dnf based linux systems.
However, it can easily be edited by changing the `PACKAGE_MANAGER` in the bash scripts.

When you see the variable `SYSTEM_NAME` please check that the targeted packages exist for your system.

If your distribution is not dnf/yum based, I reccomend you check the existence/name of the packages that will be downloaded by the scripts.
The reason is that some of their names may differ from one system to another.

## Running a file

In the folder of the file:

* open a terminal in the folder location
* run: `chmod +x <your_file>` to apply execution rights
* run: `./<your_file>` to run the file

## Structure

Folder : install

This folder contains the scripts in charge of installing different dependencies as well as minikube.
The two main files to run are:

* `install_minikube.sh` [to install minikube]
* `install_drivers.sh` [to install the third party software that can be required to manage and organise your Kubernetes environement]

Folder: management

This folder is intended to host the scripts you created in order to manage your Kubernetes environement.

Folder: obsolete

This folder is here to contain scripts you wrote that are no longer required but still good to have in hand or are broken.

Folder: remove

This folder contains scripts to allow you to remove the dependencies that were installed by the install scripts in the install folder.
The two main files are:

* `remove_drivers.sh` [to remove everything except for minikube]
* `remove_everything.sh` [to remove everything that the install scripts can install]

Folder: start_stop

This folder contains scripts that aim to help you to quickly realise a few essential actions, such as:

* starting a service
* stopping a service
* checking the service status
* enabeling a service
* disabeling a service

## Author

These series of scripts were created by (c) Henry Letellier

## Disclaimer

These scripts are provided as if and without any warranty.
Use at your own risk.

The Author cannot be accused for ny damage occurring on your computer.

Crediting the Author `Henry Letellier` is not required but would be appreciated.

The bash scripts have been written in a way that makes it easy to understand and maintain.
