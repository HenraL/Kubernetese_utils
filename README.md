# Kubernetese_utils

These are a series of bash files ment to help you speed up the install/removal process of required dependencies (i.e. minikube, docker, etc)

## Targeted system

The targeted system are dnf based linux systems.
However, it can easily be edited by changing the `PACKAGE_MANAGER` in the bash scripts.

When you see the variable `SYSTEM_NAME` please check that the targeted packages exist for your system.

If your distribution is not dnf/yum based, I reccomend you check the existence/name of the packages that will be downloaded by the scripts.
The reason is that some of their names may differ from one system to another.

## Author

These series of scripts were created by (c) Henry Letellier
