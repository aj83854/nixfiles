#!/bin/bash
#
#   Ubuntu Linux  >= 18.04  bootstrap / quicksetup script.
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

  # Defines apt packages for install
  PACKAGES=(
      ack
      autoconf
      automake
      ffmpeg
      gcc
      gifsicle
      graphviz
      libtool
      make
      markdown
      memcached
      mongodb
      npm
      perl
      pkg-config
      postgresql
      rename
      tmux
      tree
      vim
      wget
  )

  # Installs defined packages
  echo "Installing apt packages..."
  sudo apt install ${PACKAGES[@]} -y

  # For versions >= 18.04.01, Python 3.6.6 should come pre-installed;
  # However, pip does not- so we'll need to install pip3 for python3. 
  echo "Installing pip for Python3..."
  sudo apt install python3-pip -y

  # Installs global python packages
  echo "Installing Python3 packages..."
  PYTHON_PACKAGES=(
      pipenv
  )
  pip3 install ${PYTHON_PACKAGES[@]}

  echo "Ubuntu setup now complete!"
  echo "============================="
  echo "If this is a virtual machine, consider installing any provided guest additions media now."

else # Quits script if anything other than y|Y is input at prompt
  echo "Exiting script! (no changes made)"
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi
