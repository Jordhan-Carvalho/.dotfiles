#!/bin/bash
# A good upgrade would continue to loop the lns without the -f and if it already existis just skip it

set -e

# function makeFiles() {
#     touch .gitconfig 
#     touch .gitignore_global
    # }

function makeLinks() {
    ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig 
    ln -sf ~/.dotfiles/.gitignore_global ~/.gitignore_global 
    ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf 
    ln -sf ~/.dotfiles/nvim ~/.config/nvim 
    # source ~/.bash_profile
    }

    read -rp "This may overwrite existing files. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # makeFiles && makeLinks
        makeLinks
    fi;
