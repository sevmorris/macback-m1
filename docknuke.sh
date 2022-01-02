
set +e

clear

## Colors
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
reset=$(tput sgr0)

nuke() {
  clear
  echo "Dropping a ${yellow}nuke${reset} on the ${blue}Dock!${reset}"
  defaults write com.apple.dock persistent-apps -array
  killAll Dock
}

confirm() {
  clear
while true; do
    read -p "${yellow}==>${reset} Are you ${red}SURE${reset} you want to ${red}REMOVE ALL${reset} Dock icons? ${yellow}<==${reset} " yn
    case $yn in
        [Yy]* ) nuke; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes(y) or no(n)";;
    esac
done

}

while true; do
    read -p "Do you want to remove all of the Dock icons? " yn
    case $yn in
        [Yy]* ) confirm; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes(y) or no(n)";;
    esac
done

set -e
