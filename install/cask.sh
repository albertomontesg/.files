#!/bin/bash

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/fonts

# Install packages
apps=(
    atom
    dash
    docker
    dropbox
    evernote
    google-chrome
    google-drive
    gpgtools
    iterm2
    mactex
    osxfuse
    skype
    slack
    slic3r
    spotify
    vlc
    wireshark-chmodbpf
    # Fonts
    font-roboto
    font-roboto-mono
    # Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
    qlcolorcode
    qlstephen
    qlmarkdown
    quicklook-json
    qlprettypatch
    quicklook-csv
    betterzipql
    qlimagesize
    webpquicklook
    suspicious-package
)

brew cask install "${apps[@]}"
