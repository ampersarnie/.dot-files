#!/bin/bash

# Kitty Terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/ && 2> /dev/null
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

    ln -sf -t $HOME/.config/kitty/ \
        $HOME/.dot-files/profiles/kitty/kitty.conf \
        $HOME/.dot-files/profiles/kitty/current-theme.conf
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -sf $HOME/.dot-files/profiles/kitty/kitty.conf $HOME/.config/kitty/
    ln -sf $HOME/.dot-files/profiles/kitty/current-theme.conf $HOME/.config/kitty/
fi

ln -sf $HOME/.dot-files/profiles/kitty/${OSTYPE//[^[:alpha:]]/}-kitty.conf $HOME/.config/kitty/os-kitty.conf