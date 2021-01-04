#!/bin/bash

UNAME=vagrant
DEVKITARM_RELEASE="https://github.com/devkitPro/pacman/releases/download/v1.0.2/devkitpro-pacman.amd64.deb"

# setting up dependencies
sudo apt-get update
sudo apt-get install -y make pkg-config

sudo apt-get --fix-broken -y install

# installing devkitpro
wget -O devkitpro.deb $DEVKITARM_RELEASE
sudo dpkg -i devkitpro.deb

# install homebrew development environments (for 3DS, GBA, and Wii)
sudo dkp-pacman -S --noconfirm 3ds-dev gba-dev wii-dev

# set environment variables
echo "export \$DEVKITPRO=/opt/devkitpro" >> ~/.bashrc
echo "export \$DEVKITARM=/opt/devkitpro/devkitARM" >> /home/$UNAME/.bashrc
echo "export \$DEVKITPPC=/opt/devkitpro/devkitPPC" >> /home/$UNAME/.bashrc

# remove deb for cleanliness
rm devkitpro.deb

# installing bashMarks
mkdir -p /home/$UNAME/.local/bin
wget -O /home/$UNAME/.local/bin/bashMarks.sh https://raw.githubusercontent.com/EncryptedCurse/bashMarks/master/bashMarks.sh
echo "source ~/.local/bin/bashMarks.sh" >> /home/$UNAME/.bashrc

# setting up bookmarks
echo "3ds-examples|/opt/devkitpro/examples/3ds" >> /home/$UNAME/.bmarks
echo "gba-examples|/opt/devkitpro/examples/gba" >> /home/$UNAME/.bmarks
