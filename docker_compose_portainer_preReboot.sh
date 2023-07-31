#!/bin/bash

# filename: docker_compose_portainer.sh

# check if the reboot flag file exists. 
# We created this file before rebooting.
echo "Running script for the first time.."
  
# Code to run
# update and upgrade
echo "Updating and Upgrading OS"
sudo apt update
sudo apt upgrade -y
echo "Update and Upgrade Done!"

#get docker install script and install it
echo "Installing Docker via get-docker.sh"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
echo "Docker install script done"

echo "Rebooting..."
# reboot here
sudo reboot
