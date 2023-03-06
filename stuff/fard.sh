#!/bin/bash

if [[ "$1" == "--install" ]]; then
  # clone the repo from GitHub
  git clone https://github.com/fartcan6/fard.git


  # change into the "stuff" directory
  cd ~fard/stuff

  if [ $(($RANDOM % 2)) -eq 0 ]; then
    echo "Installing package... 0%"
    for i in {1..100}; do
      sleep 0.05
      echo -ne "\033[0K\rInstalling package... $i%"
    done

    if [ $? -eq 0 ]; then
      echo -e "\nInstallation complete!"
      read -p "Would you like to install the package? (Y/N): " answer
      if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
        # runs the installation command here i think
        mkdir ~/fard
        echo "trolled" > ~/fard/readme.txt
        echo "Installation started."
        zenity --info --text="Installation complete. Check the 'fard' folder for the 'readme.txt' file."
      else
        echo "Installation aborted."
      fi
    else
      echo -e "\nInstallation failed."
    fi
  else
    zenity --error --text="Fard folder installation failed. Please try again."
    exit 1
  fi
else
  echo "Unknown option: $1"
  exit 1
fi
