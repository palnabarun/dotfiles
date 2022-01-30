#! /usr/bin/env bash

########################
#
# Inspired by the following:
# - https://wilsonmar.github.io/dotfiles/
# - https://git.herrbischoff.com/awesome-macos-command-line/about/
# - https://github.com/rkalis/dotfiles/blob/master/macos/setup.sh
# - https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# - https://www.shell-tips.com/mac/defaults/
# -
#
########################

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##### General UI/UX

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Enable Firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Disable Speech Recognition.
sudo defaults write "com.apple.speech.recognition.AppleSpeechRecognition.prefs" StartSpeakableItems -bool false

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "helios-m1"
sudo scutil --set HostName "helios-m1"
sudo scutil --set LocalHostName "helios-m1"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "zeus"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false


##### Trackpad

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


##### Keyboard

# Enable keyboard navigation to move focus
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press and hold
defaults write -g ApplePressAndHoldEnabled -bool true

# Set key repeat rate
defaults write -g KeyRepeat -int 1

##### Screen

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

##### Screenshot

# Screenshot location
test -d "${HOME}/Pictures/screenshots" || mkdir -p "${HOME}/Pictures/screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/screenshots"

##### Finder

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# Open Finder at $HOME
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


##### Dock

# Autohide Dock
defaults write com.apple.dock autohide -bool false

# Disable icon bouncing Dock
defaults write com.apple.dock no-bouncing -bool true

# Set the icon size of Dock items to 48 pixels
defaults write com.apple.dock tilesize -int 48

# Restart Dock
killall Dock


##### Photos

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
