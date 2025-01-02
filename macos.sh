#! /usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# create code directory
mkdir -p ~/s
mkdir -p ~/s/palnabarun
mkdir -p ~/s/kubernetes

# Install xcode
xcode-select --install

# Install HomeBrew if not installed else update
command -v brew
if [[ $? != 0 ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  brew update
fi

brew upgrade
brew bundle

# Install rust utilities
cargo install exa
cargo install bat
cargo install ripgrep
cargo install delta

# TODO: (Check if already installed)
# TODO: Fix this part
# Setup ZSH and OhMyZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# OMZ plugins
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install VS Code extensions
cat code/extensions.txt | xargs -L1 code --install-extension
cp code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

# Setup neovim
# Install plugin manager
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Instll plugin dependencies
npm update --global npm
npm install --global yarn
# Install and setup plugins
nvim --headless +PlugInstall +qa
nvim --headless +GoInstallBinaries +qa

# Setup tmux
# download and initialize tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
