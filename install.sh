#! /usr/bin/sh

# Configuration files
stow -t ~ X
stow -t ~ bash
stow -t ~ dunst
stow -t ~ emacs
stow -t ~ git
stow -t ~ i3
stow -t ~ i3blocks
stow -t ~ ranger
stow -t ~ redshift
stow -t ~ rofi
stow -t ~ termite
stow -t ~ tridactyl
stow -t ~ vim
stow -t ~ zsh

# Create the directory if needed
mkdir -p ~/.scripts
# Scripts must be in their own directory
stow -t ~/.scripts scripts/

# Common shell files
stow -t ~ shell/

# Wallpapers
stow -t ~ wallpapers/

# Create the directory if needed
mkdir -p ~/.local/share/applications
# Symlink the '.desktop' files (btmenu needs one)
stow -t ~/.local/share/applications desktop
