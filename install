#!/usr/bin/env bash

set -e

## Colors
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
reset=$(tput sgr0)

# Execute some scripts
. scripts/macdefaults.sh
. scripts/docknuke.sh

echo "Finished!"
echo
sleep 2
echo "You must reboot soon!" | cowsay | lolcat
sleep 2
clear

while true; do
    read -p "Do you want to reboot now? " yn
    case $yn in
        [Yy]* ) sudo reboot; break;;
        [Nn]* ) sleep 1; source ~/.bashrc; pipes.sh -p4 -t2; break;;
        * ) echo "Try again.";
    esac
done
