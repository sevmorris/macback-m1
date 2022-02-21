
# History control
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

export PAGER="most"
export CLICOLOR=1

# Push to Github from current directory
function pushit() {
  DATE=$(date '+%y%m%d-%H%M')
  git pull 2>&1
  git add . 2>&1
  git commit -m "${DATE}" 2>&1
  git push 2>&1
}

# `at` with no arguments opens the current directory in Atom

function at() {
    if [ $# -eq 0 ]; then
        atom .;
    else
        atom "$@";
    fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}


# Load prompt
. ~/.bash_prompt

# Load aliases
. ~/.aliases

# Load macgnu
. ~/.macgnu


eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:${PATH}"
fi

export PATH=$HOME/.local/share/bin:$PATH
export MACPREFS_BACKUP_DIR="$HOME/backups/macprefs"

neofetch
