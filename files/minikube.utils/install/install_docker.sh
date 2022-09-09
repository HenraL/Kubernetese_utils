#!/bin/bash
PACKAGE_MANAGER=dnf
SYSTEM_NAME=uname -n
echo "Removing previous versions of docker"
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
echo "Previous version removed"
echo "Installing the repository"
sudo $PACKAGE_MANAGER -y install $PACKAGE_MANAGER-plugins-core
sudo $PACKAGE_MANAGER config-manager \
    --add-repo \
    https://download.docker.com/linux/$SYSTEM_NAME/docker-ce.repo
echo "Repository installed"
echo "Installing the docker engin"
sudo $PACKAGE_MANAGER install docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo "Adding the current user to the docker groupe"
sudo usermod -aG docker $USER && newgrp docker
echo "Docker engin installed"
echo "Starting docker services"
sudo ../start_stop/auto_launch_docker.sh -s
echo "Enabling docker services on startup"
sudo ../start_stop/auto_launch_docker.sh -e
echo "Testing docker services"
sudo ../start_stop/auto_launch_docker.sh -t
echo "Finished"
echo "This program was created by (c) Henry Letellier"
