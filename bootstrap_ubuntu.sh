#!/bin/bash

#   Ubuntu Linux  >= 16.04  bootstrap / quicksetup script.
#
#

echo "This script will install basic components, and although idempotent, is intended to be run on new Ubuntu builds."

read -p "Are you sure you wish to continue setup (y/n)?" -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  clear
  echo "Now executing script!"

  # Updates advanced package tool 'apt' 
  echo "Refreshing repo index and upgrading base packages..."
  sudo apt update && sudo apt upgrade -y

  # Defines brew packages for install
  PACKAGES=(
      ack
      autoconf
      automake
      boot2docker
      ffmpeg
      gifsicle
      git
      graphviz
      gst-plugins-base
      gst-plugins-good
      gstreamer
      libjpeg
      libmemcached
      markdown
      memcached
      mongodb
      npm
      pkg-config
      postgresql
      python
      rename
      ssh-copy-id
      tmux
      tree
      vim
      wget
  )

  # Installs the defined packages
  echo "Installing apt packages..."
  sudo apt install ${PACKAGES[@]}

  # Use cask to install extra fonts
  echo "Installing extra fonts..."
  FONTS=(
      font-roboto-mono
  )
  brew cask install ${FONTS[@]}

  # Installs global python packages
  echo "Installing Python3 packages..."
  PYTHON_PACKAGES=(
      pipenv
  )
  pip3 install ${PYTHON_PACKAGES[@]}

  # Installs global npm packages
  echo "Installing global Node Package Manager packages..."
  npm install marked -g

  echo "Ubuntu setup script complete!"

else # Quits script if anything other than y|Y is input at prompt
  echo "Exiting script! (no changes made)"
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi
