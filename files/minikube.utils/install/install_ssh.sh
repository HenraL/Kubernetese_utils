#!/bin/bash
PACKAGE_MANAGER=dnf
REF_LINK="https://minikube.sigs.k8s.io/docs/drivers/ssh/"
echo "Refenrence link: $REF_LINK"
echo "Refreshing package cache"
echo "Running: sudo $PACKAGE_MANAGER makecache"
sudo $PACKAGE_MANAGER makecache
echo "Installing openrc"
echo "Running: sudo $PACKAGE_MANAGER install openrc"
sudo $PACKAGE_MANAGER install openrc
echo "openrc is installed"
echo "This program was created by (c) Henry Letellier"
