#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/core
brew tap homebrew/dupes
brew tap homebrew/fuse
brew tap homebrew/python
brew tap homebrew/science
brew tap homebrew/services
brew tap homebrew/tex
brew tap homebrew/versions

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install the Homebrew packages I use on a day-to-day basis.
#
# - Languages: ruby, lua, node, go, python, python3, r
# - C Compiler and debugger: gcc (6 & 4.9), gdb
# - Zsh: zsh, zsh-completions, z
# - Git: git, git-extras, git-lfs
# - Databases: Progres, MySQL, Redis, Mongo, Elasticsearch
# - Servers: Apache, Nginx
# - Fuck (https://github.com/nvbn/thefuck): Correct your previous command. Note
#   that this needs to be added to zsh or bash. See the project README.
# - Foreman & Forego:
# - Tree (http://mama.indstate.edu/users/ice/tree/): A directory listing utility
#   that produces a depth indented listing of files.
# - Tor ():
# - git-extras (https://vimeo.com/45506445): Adds a shit ton of useful commands #   to git.
# - autoenv (https://github.com/kennethreitz/autoenv): this utility makes it
#   easy to apply environment variables to projects. I mostly use it for Go and
#   Node.js projects. For Ruby projects, I just use Foreman or Forego.
# - autojump (https://github.com/joelthelion/autojump): a faster way to navigate
#   your filesystem.
# Note that I install nvm (https://github.com/creationix/nvm) instead
# of installing Node directly. This gives me more explicit control over
# which version I'm using.

apps=(
    # Languages
    ruby
    lua
    node
    go
    python
    python3
    r
    # C Compiler, debugger and libraries
    gcc
    gcc49
    gdb
    cgal
    boost
    # Zsh & terminal
    zsh
    zsh-completions
    z
    tmux
    # Shell utilities
    htop-osx
    grep
    gnupg2
    nano
    openssh
    pstree
    tree
    unrar
    vim
    watch
    wget
    # Git and extra
    git
    git-extras
    git-lfs
    gist
    # Databases
    mongodb
    postgresql
    mysql
    # Server
    nginx
    hadoop
    # TeX
    chktex
    latex-mk
    # Science
    hdf5
    open-mpi
    opencv3
    protobuf
    # Extra
    autoenv
    keybase
    pinentry-mac
    speedtest_cli
    sshfs
    ntfs-3g
    wireshark
    youtube-dl
    docker
    bazel
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
