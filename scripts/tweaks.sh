#!/usr/bin/env bash

set -e

## Colors
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
reset=$(tput sgr0)

MACBACK=$HOME/macback
DOTS=$MACBACK/dotfiles
aliases=$DOTS/.aliases
prompt=$DOTS/.bash_prompt
profile=$DOTS/.bash_profile
bashrc=$DOTS/.bashrc
excludes=$DOTS/.excludes-file.txt
brew=$MACBACK/Brewfile

# Check that we're running on Apple Silicon and exit if not
arch_name="$(uname -m)"

if [ "${arch_name}" = "x86_64" ]; then
  echo "macback [M1 edition] is intended for an M1 Mac."
  exit
fi

# Customize macOS defaults
. macdefaults.sh

# Remove Dock icons
. docknuke.sh

# Move dotfiles to ~/
mv -f $aliases $prompt $profile $bashrc $excludes $brew $HOME
