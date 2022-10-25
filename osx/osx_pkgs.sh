#!/bin/sh

#TODO: Check if xCode command line tools are installed
xcode-select --install


# Check if homebrew is installed and up to date
if ! type "brew" > /dev/null; then
    #install homebrew
	echo "\n==> Installing Homebrew...\n"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "\nHomebrew installation found\nUpdating Homebrew "
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

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install docker


echo "Cleaning up Homebrew cache ..."
brew cleanup


CASKS=(
    git
    sublime-text
    google-chrome
    google-drive
    firefox
    vlc
    spotify
    dropbox
    unrarx
    the-unarchiver
    spectacle
    iterm2
    libreoffice
    slack
    marp
    sequel-pro
    lastpass
    dbngin
    insomnia
    visual-studio-code
    sequel-ace
    htop
    hub
)

#install all the needed apps
echo "\n==> Installing all the needed packages\n"
brew install --cask ${CASKS[@]}


#install some fonts
echo "Installing fonts..."
brew tap homebrew/cask-fonts 

FONTS=(
    font-inconsolidata
    font-clear-sans
)

brew install ${FONTS[@]}

# cleanup cache
brew cleanup

# TODO: Check if the packages have been successfully installed

# Autohide dock without a delay
defaults write com.apple.dock autohide-delay -float 0; killall Dock;


#brew cask info pkg-name
brew list
echo "\n\n==> All the packages have been installed :)  \n\n"
