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
bashrc=$DOTS/.bashrc
excludes=$DOTS/.excludes-file.txt
brew=$MACBACK/Brewfile

# Customize macOS defaults
. macdefaults.sh

# Remove Dock icons
. docknuke.sh

# Move dotfiles to ~/
mv -f $aliases $prompt $bashrc $excludes $brew $HOME
