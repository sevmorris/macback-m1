
# check if this is a login and/or interactive shell
[ "$0" = "-bash" ] && export LOGIN_BASH=1
echo "$-" | grep -q "i" && export INTERACTIVE_BASH=1

# run bashrc if this is a login, interactive shell
if [ -n "$LOGIN_BASH" ] && [ -n "$INTERACTIVE_BASH" ]
then
  source ~/.bashrc
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

# Save multiline commands
shopt -s cmdhist

# Correct minor directory changing spelling mistakes
shopt -s cdspell

# Bash completion
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
if type brew &>/dev/null; then
  for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
  do
    [[ -f $COMPLETION ]] && source "$COMPLETION"
  done
  if [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]];
  then
    source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
  fi
fi

# Setup PATH

# Remove from anywhere in PATH
remove_from_path() {
  [ -d "$1" ] || return
  PATHSUB=":$PATH:"
  PATHSUB=${PATHSUB//:$1:/:}
  PATHSUB=${PATHSUB#:}
  PATHSUB=${PATHSUB%:}
  export PATH="$PATHSUB"
}

# Add to the start of PATH if it exists
add_to_path_start() {
  [ -d "$1" ] || return
  remove_from_path "$1"
  export PATH="$1:$PATH"
}

# Add to the end of PATH if it exists
add_to_path_end() {
  [ -d "$1" ] || return
  remove_from_path "$1"
  export PATH="$PATH:$1"
}

# Add to PATH even if it doesn't exist
force_add_to_path_start() {
  remove_from_path "$1"
  export PATH="$1:$PATH"
}

function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

export PAGER="most"
export CLICOLOR=1

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# Hide the “default interactive shell is now zsh” warning on macOS.
export BASH_SILENCE_DEPRECATION_WARNING=1;

add_to_path_start /opt/homebrew/sbin
add_to_path_start /opt/homebrew/bin
add_to_path_start ~/.local/share/bin
add_to_path_start ~/scripts/backup

# most programs
export INFOPATH=/opt/homebrew/share/info:$INFOPATH

# coreutils
addToPATH /opt/homebrew/opt/coreutils/libexec/gnubin:$PATH
export MANPATH=/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH

# make
addToPATH /opt/homebrew/opt/make/libexec/gnubin
export MANPATH=/opt/homebrew/opt/make/libexec/gnuman:$MANPATH

# ed
addToPATH /opt/homebrew/opt/ed/libexec/gnubin

# findutils
addToPATH /opt/homebrew/opt/findutils/libexec/gnubin

# gnu-indent
addToPATH /opt/homebrew/opt/gnu-indent/libexec/gnubin

# gnu-sed
addToPATH /opt/homebrew/opt/gnu-sed/libexec/gnubin

# gnu-tar
addToPATH /opt/homebrew/opt/gnu-tar/libexec/gnubin

# gnu-which
addToPATH /opt/homebrew/opt/gnu-which/libexec/gnubin

addToPATH /opt/homebrew/opt/grep/libexec/gnubin

# Created by `pipx` on 2022-05-27 01:38:00
export PATH="$PATH:/Users/sev/.local/bin"
