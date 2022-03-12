
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

export EDITOR=nano
export PAGER="most"
export CLICOLOR=1

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

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

addToPATH /opt/homebrew/sbin
addToPATH /opt/homebrew/bin
addToPATH ~/.local/share/bin
addToPATH ~/scripts/backup
addToPATH ~/scripts/startup

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
