#!/bin/bash

# filename: docker_compose_portainer.sh

echo "Resuming script after reboot.."

# continue with rest of the script
#update and upgrade again
echo "Update and Upgrade again"
sudo apt update
sudo apt upgrade
echo "Second update and upgrade done"

# tasks to run docker rootless
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
  
#test docker isntallation
echo "Run Hello-World"
docker run hello-world
