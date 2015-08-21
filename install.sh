#!/usr/bin/env bash
set -x

packagelist=(
#    biber
    build-essential
    cmake
    cmake-curses-gui
    default-jdk
    exfat-utils
    exfat-fuse
    filezilla
    fluxgui
    gimp
    git
    htop
    libboost-all-dev
    libglew-dev
    libglfw-dev
    libglm-dev
    libpng++-dev
    libreoffice
    libsfml-dev
    libxi-dev
    monodevelop
    nautilus-dropbox
    nautilus-open-terminal
    stow
    subversion
#    texlive-fonts-recommended
#    texlive-latex-extra
#    texlive-xetex
    ttf-mscorefonts-installer
    tmux
    tree
    ubuntu-restricted-extras
    vim
    vim-gnome
    vlc
    xclip
    xorg-dev
    zsh
)

TMPDIR=/tmp/newinstall
mkdir -p $TMPDIR
wget -c -O $TMPDIR/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -c -O $TMPDIR/steam.deb https://steamcdn-a.akamaihd.net/client/installer/steam.deb

sudo add-apt-repository -y ppa:kilian/f.lux
sudo dpkg -i $TMPDIR/*.deb
sudo apt-get install -fy
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y ${packagelist[@]}
sudo stow vim -t /root
sudo stow zsh -t /root
sudo chsh -s /usr/bin/zsh

stow -t ~ git
stow -t ~ vim
stow -t ~ zsh
chsh -s /usr/bin/zsh
