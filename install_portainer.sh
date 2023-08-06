#!/bin/bash

# filename: install_portainer.sh

echo "Script to install Portainer"

# continue with rest of the script
#update and upgrade again
echo "Download docker compose yml file for Portainer"
mkdir -p docker
cd docker
echo "Downloading yml file"
wget https://raw.githubusercontent.com/vinayns/homeLabSetup/main/docker-compose-portainer.yml
echo "Renaming yml file"
mv docker-compose-portainer.yml docker-compose.yml
echo "YML file ready for install with Docker-Compose"
