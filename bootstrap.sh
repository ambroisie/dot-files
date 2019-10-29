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

prerequisite
install-yay
