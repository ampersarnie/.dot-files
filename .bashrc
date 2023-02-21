# PATHS
# Node/NPM
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH="node_modules/.bin:$PATH"
# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="vendor/bin:$PATH"
# Homebrew
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
    export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
    export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

    # PHP -- After Homebrew due being loaded in by it.
    PHPVERSION=$(php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;')
    export PATH="/home/linuxbrew/.linuxbrew/opt/php@$PHPVERSION/bin:$PATH"
    export PATH="/home/linuxbrew/.linuxbrew/opt/php@$PHPVERSION/sbin:$PATH"
else
    export PATH="/opt/homebrew/bin:$PATH"

    # PHP -- After Homebrew due being loaded in by it.
    PHPVERSION=$(php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;')
    export PATH="/usr/local/opt/php@$PHPVERSION/bin:$PATH"
    export PATH="/usr/local/opt/php@$PHPVERSION/sbin:$PATH"
fi


export PATH="$HOME/.pyenv/shims:$PATH"

export KITTY_CONFIG_DIRECTORY="~/.dot-files/profiles/kitty"
export VISUAL="nano"

# -----
# NVM Load
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Switch PHP versions with Brew
sphp() {
    SET_VERSION=$(php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;')
    brew unlink "php@$SET_VERSION" && brew link --overwrite --force php@$1
}
