
# Load prompt
. ~/.bash_prompt
# Load aliases
. ~/.aliases
# Load macgnu
. ~/.macgnu
# Load functions
. ~/.functions
# Load exports
. ~/.exports

# for non-interactive sessions stop execution here -- https://serverfault.com/a/805532/67528
[[ $- != *i* ]] && return

neofetch
