echo "Set up Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Set brew location for Mac M# machines
# This is added properly via .bashrc later
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "Brew - Setup PHP Versions"
brew tap shivammathur/php
brew install shivammathur/php/php@7.4
brew install shivammathur/php/php@8.0
brew install shivammathur/php/php@8.1

echo "Brew - Set PHP to v8.0"
brew unlink php && brew link --overwrite --force php@8.0

echo "Brew - Install Node"
brew install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# Use NVM now so we can install other versions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 16
nvm install 14
nvm install 12
nvm use system

echo "Brew - Install NGrok"
brew install ngrok