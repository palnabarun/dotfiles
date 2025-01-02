#! /usr/bin/env bash

if ! command -v stow &> /dev/null
then
    echo "GNU/Stow is not installed. Please install Stow to proceed"
    exit 1
fi

for CONFIG in kitty nvim zsh ghostty
do
    mkdir -p ~/.config/$CONFIG
    stow -v -R -t ~/.config/$CONFIG $CONFIG
done

for CONFIG in git tmux zshrc # spacemacs
do
    stow -v -R -t ~ $CONFIG
done

for CONFIG in starship karabiner
do
    stow -v -R -t ~/.config $CONFIG
done

mkdir -p ~/.ssh
stow -v -R -t ~/.ssh ssh

mkdir -p ~/.gnupg
stow -v -R -t ~/.gnupg gnupg
