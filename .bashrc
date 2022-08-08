# PATHS
# Node/NPM
PHPVERSION=$(php -v | grep -o '[0-9].[0-9]' | tail -n1)
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH="node_modules/.bin:$PATH"
export PATH="/Users/$(id -un)/.composer/vendor/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="vendor/bin:$PATH"
export PATH="/usr/local/opt/php@$PHPVERSION/bin:$PATH"
export PATH="/usr/local/opt/php@$PHPVERSION/sbin:$PATH"

# -----
# NVM Load
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Set options
setopt auto_cd
setopt prompt_subst

# -----
# Aliases
# List all files/directories.
alias ll='ls -al'

sphp() {
    brew unlink php && brew link --overwrite --force php@$1
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# PS1="\[\033[x;ym\]FEATURE_TO_COLOUR\[\033[0m\]"

export PS1

# Set Cursor to start at bottom of screen on new window.
printf '\n%.0s' {1..100}