
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

case ":$PATH:" in
  *":$new_entry:"*) :;; # already there
  *) PATH="$new_entry:$PATH";; # or PATH="$PATH:$new_entry"
esac

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

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:${PATH}"
export PATH=$HOME/.local/share/bin:$PATH
export PATH=$HOME/backup:$PATH

# most programs
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

# coreutils
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"

# make
export PATH="$(brew --prefix)/opt/make/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix)/opt/make/libexec/gnuman:$MANPATH"

# ed
export PATH="$(brew --prefix)/opt/ed/libexec/gnubin:$PATH"

# findutils
export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"

# gnu-indent
export PATH="$(brew --prefix)/opt/gnu-indent/libexec/gnubin:$PATH"

# gnu-sed
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"

# gnu-tar
export PATH="$(brew --prefix)/opt/gnu-tar/libexec/gnubin:$PATH"

# gnu-which
export PATH="$(brew --prefix)/opt/gnu-which/libexec/gnubin:$PATH"

# grep
export PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
