#!/bin/sh

#TODO: Check if xCode command line tools are installed
echo "\n\n==> Installing xCode command line tools ..."
xcode-select --install

# Check if homebrew is installed and up to date
if ! type "brew" > /dev/null; then
    #install homebrew
	echo "\n\n==> Installing Homebrew ...\n"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "\n\n==> Homebrew installation found\nUpdating Homebrew ...\n"
	# Make sure we’re using the latest Homebrew.
	brew update
	# Upgrade
	brew upgrade
fi



# Verify Homebrew is installed and working properly
brew doctor

# Add Homebrew completions
brew tap homebrew/homebrew-core

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install more recent versions of some macOS tools
PACKAGES=(
    vim
    grep
    openssh
    screen
    docker
    git
    htop
    hub
)

echo "\n==> Installing packages\n"
brew install ${PACKAGES[@]}

CASKS=(
    sublime-text
    google-chrome
    google-drive
    firefox
    vlc
    spotify
    dropbox
    the-unarchiver
    spectacle
    iterm2
    libreoffice
    sequel-pro
    lastpass
    dbngin
    insomnia
    visual-studio-code
    sequel-ace
    slack
)

#install all the needed apps
echo "\n==> Installing cask packages\n"
brew install --cask ${CASKS[@]}


#install some fonts
echo "\n\n==> Installing fonts...\n"
brew tap homebrew/cask-fonts 

FONTS=(
    font-clear-sans
)

brew install ${FONTS[@]}

# cleanup cache
echo "\n\n==> Cleaning up Homebrew cache ..."
brew cleanup

# TODO: Check if the packages have been successfully installed

# Autohide dock without a delay
defaults write com.apple.dock autohide-delay -float 0; killall Dock;


#brew cask info pkg-name
echo "\n\n==> Installed packages:\n"
brew list
echo "\n\n==> All the packages have been installed :)  \n\n"
