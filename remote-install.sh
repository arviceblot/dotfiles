#!/usr/bin/env bash
set -x

sudo apt install git
git clone https://github.com/arviceblot/dotfiles.git ~/git/dotfiles
( cd ~/git/dotfiles ; ./install.sh )
