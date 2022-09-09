#!/bin/bash
PACKAGE_MANAGER=dnf
echo "Refresshing cache"
sudo $PACKAGE_MANAGER makecache
echo "Cache refreshed"
echo "Updating system"
sudo $PACKAGE_MANAGER update
echo "Updated"
echo "Installing Docker"
sudo ./install_docker.sh
echo "Docker installed"
echo "Installing kvm2"
sudo ./install_kvm2.sh
echo "kvm2 installed"
sudo ./install_kvm2.sh
echo "kvm2 installed"
echo "Installing an ssh manager"
sudo ./install_ssh.sh
echo "ssh manager installed"
echo "Installing kubectl"
sudo ./install_kubectl.sh
echo "Kubectl has been installed"
echo "This program was created by (c) Henry Letellier"
