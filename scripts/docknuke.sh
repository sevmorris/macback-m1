
set +e

clear

nuke() {
  clear
  echo "Dropping a ${warn}nuke${reset} on the ${blue}Dock!${reset}"
  defaults write com.apple.dock persistent-apps -array
  killAll Dock
}

confirm() {
  clear
while true; do
    read -p "${warn}==>${reset} Are you ${error}SURE${reset} you want to ${bold}REMOVE ALL${reset} Dock icons? ${warn}<==${reset} " yn
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
