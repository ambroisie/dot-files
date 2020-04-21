#!/usr/bin/env bash

# Exit on errors
set -e

# Install pre-requisite packages for installing packages and connecting
prerequisite() {
    sudo pacman -S base base-devel git stow mosh
}

# Install the yay AUR helper
install-yay() {
    git clone https://aur.archlinux.org/yay.git
    pushd yay || exit 1
    makepkg -si
    popd || exit 1
}

# Keyboard and language setup
setup-lang() {
    # A good QWERTY keyboard with easy access to accents
    sudo localectl set-x11-keymap fr pc105 us
    # FIXME: no international keyboard in VC for now
    sudo localectl set-keymap --no-convert us
}

prerequisite
install-yay
setup-lang
