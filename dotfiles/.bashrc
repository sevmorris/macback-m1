

# Source dotfiles
for file in ~/.{bash_prompt,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# pushit :: Push to Github from current directory
function pushit() {
  DATE=$(date '+%y%m%d-%H%M')
  git pull 2>&1
  git add . 2>&1
  git commit -m "${DATE}" 2>&1
  git push 2>&1
}

# at :: Opens the current directory in Atom
function at() {
    if [ $# -eq 0 ]; then
        atom .;
    else
        atom "$@";
    fi;
}

# tre :: `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* *;
    fi;
}

# Add to the start of PATH if it exists
add_to_path_start() {
  [ -d "$1" ] || return
  remove_from_path "$1"
  export PATH="$1:$PATH"
}

add_to_path_start "/usr/local/bin"
add_to_path_start "/opt/homebrew/bin"

# Colourful manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi

export EDITOR=nano
export PAGER="most"
export CLICOLOR=1

eval "$(rbenv init - bash)"

export PROMPT_COMMAND="history -a"
export HISTIGNORE="&:[bf]g:exit:?:??"

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

# for non-interactive sessions stop execution here -- https://serverfault.com/a/805532/67528
[[ $- != *i* ]] && return
