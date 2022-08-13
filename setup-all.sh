#!/bin/bash

# SET Directories
USER_DIR=/Users/$(id -un)
DOT_DIR=$USER_DIR/.dot-files
SETUP_DIR=$DOT_DIR/setup

# Ask for the administrator password upfront
sudo -v

sh $SETUP_DIR/brew.sh 2> /dev/null
sh $SETUP_DIR/composer.sh 2> /dev/null
sh $SETUP_DIR/docker.sh 2> /dev/null
sh $SETUP_DIR/profiles.sh 2> /dev/null

echo "Install OhMyZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Run Setup private commands"
sh $DOT_DIR/private/setup.sh 2> /dev/null

echo "Set dot files"
echo "source ./.dot-files/.bashrc" >> ~/.zshrc
ln -s $DOT_DIR/.gitconfig $USER_DIR/.gitconfig # Set as symlink
cp $DOT_DIR/.hushlogin $USER_DIR/.hushlogin # Copy file

source $USER_DIR/.zshrc

echo "Starting MacOS Config"
sh $DOT_DIR/.macos
