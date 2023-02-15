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
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "Install OhMyZSH"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Run Setup private commands"
sh $DOT_DIR/private/setup.sh 2> /dev/null

echo "Set dot files"
echo "source ./.dot-files/.bashrc" >> ~/.zshrc
ln -s $DOT_DIR/.gitconfig $HOME/.gitconfig 2> /dev/null # Set as symlink
cp $DOT_DIR/.hushlogin $HOME/.hushlogin # Copy file

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Starting MacOS Config"
    sh $DOT_DIR/.macos
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Starting Linux Config"
    sh $DOT_DIR/.linux
fi