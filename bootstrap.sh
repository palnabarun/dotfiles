#! /usr/bin/env bash

if ! command -v stow &> /dev/null
then
    echo "GNU/Stow is not installed. Please install Stow to proceed"
    exit 1
fi

for CONFIG in karabiner kitty nvim zsh
do
    mkdir -p ~/.config/$CONFIG
    stow -v -R -t ~/.config/$CONFIG $CONFIG
done

for CONFIG in git tmux zshrc
do
    stow -v -R -t ~ $CONFIG
done

for CONFIG in starship
do
    stow -v -R -t ~/.config $CONFIG
done

stow -v -R -t ~/.ssh ssh
stow -v -R -t ~/.gnupg gnupg
