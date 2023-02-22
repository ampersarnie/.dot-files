#!/bin/bash

DOT_DIR=$HOME/.dot-files
SETUP_DIR=$DOT_DIR/setup

# Ask for the administrator password upfront
sudo -v

source $DOT_DIR/.bashrc

sh $SETUP_DIR/brew.sh 2> /dev/null
sh $SETUP_DIR/composer.sh 2> /dev/null

if [[ "$OSTYPE" == "darwin"* ]]; then
    sh $SETUP_DIR/docker.sh 2> /dev/null
    sh $SETUP_DIR/profiles.sh 2> /dev/null
file
sh $SETUP_DIR/zsh.sh

echo "Run Setup private commands"
sh $DOT_DIR/private/setup.sh 2> /dev/null

echo "Set dot files"
echo "source ./.dot-files/.bashrc" >> ~/.zshrc
ln -s $DOT_DIR/.gitconfig $HOME/.gitconfig 2> /dev/null # Set as symlink
cp $DOT_DIR/.hushlogin $HOME/.hushlogin # Copy file

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sh $SETUP_DIR/linux/kitty.sh

    # Tweaktool
    sudo add-apt-repository universe
    sudo apt install gnome-tweaks

    # VS Code
    sudo apt install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update --yes && sudo apt upgrade
    sudo apt install code --yes

    # Docker Engine
    # https://docs.docker.com/engine/install/ubuntu/
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    sudo mkdir -m 0755 -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update --yes && sudo apt upgrade
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin --yes
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Starting MacOS Config"
    sh $DOT_DIR/.macos
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Starting Linux Config"
    sh $DOT_DIR/.linux
fi
