#!/bin/bash

DEVKITARM_RELEASE="https://github.com/devkitPro/pacman/releases/download/v1.0.2/devkitpro-pacman.amd64.deb"

# setting up dependencies
sudo apt-get update
sudo apt-get install -y make pkg-config

sudo apt-get --fix-broken -y install

# -- HOMEBREW DEV ENVIRONMENT INSTALLATION --
# installing devkitpro
wget -O devkitpro.deb $DEVKITARM_RELEASE
sudo dpkg -i devkitpro.deb

# installing 3DS development environment
sudo dkp-pacman -S --noconfirm 3ds-dev

# -- MISCELLANEOUS INSTALLATION --
# installing bashMarks
mkdir -p ~/.local/bin
wget https://raw.githubusercontent.com/EncryptedCurse/bashMarks/master/bashMarks.sh
cp bashMarks.sh ~/.local/bin
echo "source ~/.local/bin/bashMarks.sh" >> ~/.bashrc

# setting up bookmarks
echo "3ds-examples|$DEVKITPRO/examples/3ds" >> ~/.bmarks
