#!/usr/bin/env bash

# the -z evaluates to true if the variable is empty
if [[ -z $STOW_FOLDERS ]]; then
    echo "STOW_FOLDERS is not set"
    STOW_FOLDERS="nvim,tmux,git,zsh,golang,bin"
fi

if [[ -z $DOTFILES ]]; then
    echo "DOTFILES is not set"
    DOTFILES=$HOME/.dotfiles
fi

pushd $HOME
# check if .zshrc exists and if it exists then remove it
if [[ -f .zshrc ]]; then
    echo "Removing .zshrc"
    rm .zshrc
fi
pushd $DOTFILES
# sed will replace the "," with a space so we can loop over the folders
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stowing $folder"
    stow -D $folder
    stow $folder
done
popd
