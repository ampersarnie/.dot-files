#!/bin/bash

if [[ ! -d ~/.oh-my-zsh ]]; then
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install zsh --yes
        chsh -s $(which zsh)
    fi

    echo "Install OhMyZSH"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi