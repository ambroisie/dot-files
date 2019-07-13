#! /usr/bin/sh

# Configuration files
stow -t ~ X
stow -t ~ bash
stow -t ~ emacs
stow -t ~ git
stow -t ~ i3
stow -t ~ i3blocks
stow -t ~ ranger
stow -t ~ termite
stow -t ~ tridactyl
stow -t ~ vim
stow -t ~ zsh

if ! [ -e ~/scripts ]; then
    # Only create the symlink when the directory doesn't exist
    mkdir ~/scripts
    # Scripts must be in there own directory
    stow -t ~/scripts scripts/
fi

# Common shell files
stow -t ~ shell/

# Wallpapers
stow -t ~ wallpapers/
