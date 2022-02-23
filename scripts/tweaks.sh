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
stropxe=$DOTS/.exports
funcs=$DOTS/.functions
brew=$MACBACK/Brewfile

# Customize macOS defaults
. macdefaults.sh

# Remove Dock icons
. docknuke.sh

#Copy dotfiles to ~/
cp -f $aliases $prompt $bashrc $stropxe $brew $HOME
