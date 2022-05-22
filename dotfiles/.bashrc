# Source dotfiles
for file in ~/.{bash_prompt,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# enable mcfly (if installed)
which mcfly &>/dev/null && eval "$(mcfly init bash)"

# to avoid non-zero exit code
true

# History
export HISTFILE="$HOME/.bash_history"
export HISTCONTROL="ignoredups"
export PROMPT_COMMAND="history -a"
export HISTIGNORE="&:ls:[bf]g:exit"


################################################################################
# BEGIN FUNCTIONS
################################################################################

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

################################################################################
# END FUNCTIONS
################################################################################
