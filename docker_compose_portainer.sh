#!/bin/bash

# filename: docker_compose_portainer.sh

# check if the reboot flag file exists. 
# We created this file before rebooting.
if [ ! -f /var/run/resume-after-reboot ]; then
  echo "Running script for the first time.."
  
  # Code to run
  # update and upgrade
  sudo apt update
  sudo apt upgrade -y

  #get docker install script and install it
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh

  # Preparation for reboot
  script="bash /docker_compose_portainer.sh"
  
  # add this script to zsh so it gets triggered immediately after reboot
  echo "$script" >> ~/.bashrc 
  
  # create a flag file to check if we are resuming from reboot.
  sudo touch /var/run/resume-after-reboot
  
  echo "rebooting.."
  # reboot here
  sudo reboot
  
else 
  echo "resuming script after reboot.."
  
  # Remove the line that we added in zshrc
  sed -i '/bash/d' ~/.bashrc 
  
  # remove the temporary file that we created to check for reboot
  sudo rm -f /var/run/resume-after-reboot

  # continue with rest of the script
  docker run hello-world

fi
