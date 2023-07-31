#!/bin/bash

# filename: docker_compose_portainer.sh

# check if the reboot flag file exists. 
# We created this file before rebooting.
if [ ! -f /var/run/resume-after-reboot ]; then
  echo "Running script for the first time.."
  
  # Code to run
  # update and upgrade
  echo "Updating and Upgrading OS"
  sudo apt update
  sudo apt upgrade -y
  echo "Update and Upgrade Done!"

  read -p "Press enter to continue installtion of Docker"

  #get docker install script and install it
  echo "Installing Docker via get-docker.sh"
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  echo "Docker install script done"

  # Preparation for reboot
  echo "Prep for reboot"
  script="bash /docker_compose_portainer.sh"
  
  # add this script to zsh so it gets triggered immediately after reboot
  echo "Adding script to bashrc"
  echo "$script" >> ~/.zshrc 
  
  # create a flag file to check if we are resuming from reboot.
  echo "Creating a flag for first run of script"
  sudo touch /var/run/resume-after-reboot
  
  read -p "Press enter to reboot!"
  echo "Rebooting..."
  # reboot here
  sudo reboot
  
else 
  echo "Resuming script after reboot.."

  read -p "Press enter to continue"
  
  # Remove the line that we added in zshrc
  echo "Remove refrence of first run"
  sed -i '/bash/d' ~/.zshrc 
  
  # remove the temporary file that we created to check for reboot
  echo "Delete flag of first run"
  sudo rm -f /var/run/resume-after-reboot

  # continue with rest of the script
  #update and upgrade again
  echo "Update and Upgrade again"
  sudo apt update
  sudo apt upgrade
  echo "Second update and upgrade done"

  #test docker isntallation
  echo "Run Hello-World"
  docker run hello-world

fi
