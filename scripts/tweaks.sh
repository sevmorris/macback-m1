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

# Symlink these since I edit them in the repo
ln -sf $HOME/.bashrc $DOTS
ln -sf $HOME/.aliases $DOTS
ln -sf $HOME/excludes-file.txt $DOTS
ln -sf $HOME/Brewfile $MACKBACK
