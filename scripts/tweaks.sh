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
brew=$MACBACK/Brewfile


# Customize macOS defaults
. macdefaults.sh

# Remove Dock icons
. docknuke.sh

cp -f $aliases $prompt $bashrc $stropxe $brew $HOME

## Add to .nanorc for M1 Macs
if [ $(arch) = "arm64" ]; then
  echo "include /opt/homebrew/share/nano/asm.nanorc
  include /opt/homebrew/share/nano/autoconf.nanorc
  include /opt/homebrew/share/nano/awk.nanorc
  include /opt/homebrew/share/nano/c.nanorc
  include /opt/homebrew/share/nano/changelog.nanorc
  include /opt/homebrew/share/nano/cmake.nanorc
  include /opt/homebrew/share/nano/css.nanorc
  include /opt/homebrew/share/nano/debian.nanorc
  include /opt/homebrew/share/nano/default.nanorc
  include /opt/homebrew/share/nano/elisp.nanorc
  include /opt/homebrew/share/nano/fortran.nanorc
  include /opt/homebrew/share/nano/gentoo.nanorc
  include /opt/homebrew/share/nano/go.nanorc
  include /opt/homebrew/share/nano/groff.nanorc
  include /opt/homebrew/share/nano/guile.nanorc
  include /opt/homebrew/share/nano/html.nanorc
  include /opt/homebrew/share/nano/java.nanorc
  include /opt/homebrew/share/nano/javascript.nanorc
  include /opt/homebrew/share/nano/json.nanorc
  include /opt/homebrew/share/nano/lua.nanorc
  include /opt/homebrew/share/nano/makefile.nanorc
  include /opt/homebrew/share/nano/man.nanorc
  include /opt/homebrew/share/nano/mgp.nanorc
  include /opt/homebrew/share/nano/mutt.nanorc
  include /opt/homebrew/share/nano/nanohelp.nanorc
  include /opt/homebrew/share/nano/nanorc.nanorc
  include /opt/homebrew/share/nano/nftables.nanorc
  include /opt/homebrew/share/nano/objc.nanorc
  include /opt/homebrew/share/nano/ocaml.nanorc
  include /opt/homebrew/share/nano/patch.nanorc
  include /opt/homebrew/share/nano/perl.nanorc
  include /opt/homebrew/share/nano/php.nanorc
  include /opt/homebrew/share/nano/po.nanorc
  include /opt/homebrew/share/nano/postgresql.nanorc
  include /opt/homebrew/share/nano/pov.nanorc
  include /opt/homebrew/share/nano/python.nanorc
  include /opt/homebrew/share/nano/ruby.nanorc
  include /opt/homebrew/share/nano/rust.nanorc
  include /opt/homebrew/share/nano/sh.nanorc
  include /opt/homebrew/share/nano/spec.nanorc
  include /opt/homebrew/share/nano/tcl.nanorc
  include /opt/homebrew/share/nano/tex.nanorc
  include /opt/homebrew/share/nano/texinfo.nanorc
  include /opt/homebrew/share/nano/xml.nanorc" >> ~/.nanorc
fi
