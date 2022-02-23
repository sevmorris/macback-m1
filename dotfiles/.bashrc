
# for non-interactive sessions stop execution here -- https://serverfault.com/a/805532/67528
[[ $- != *i* ]] && return

export PAGER="most"
export CLICOLOR=1

# Load prompt
. ~/.bash_prompt

# Load aliases
. ~/.aliases

# Load macgnu
. ~/.macgnu

# Load functions
. ~/.functions

eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:${PATH}"
fi

export PATH=$HOME/.local/share/bin:$PATH
export MACPREFS_BACKUP_DIR="$HOME/backups/macprefs"

neofetch
