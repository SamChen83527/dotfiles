#!/usr/bin/env zsh

DOTFILES="$HOME/.dotfiles/"

pushd $DOTFILES

for folder in $(echo "$(ls -d */)") ; do
  echo "Removing $folder"
  stow -D $folder
done

popd
