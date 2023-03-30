#!/usr/bin/env zsh

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="nvim,git,zsh,tmux"
fi

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g") ; do
  echo "Stowing $folder"
  stow -D $folder
  stow $folder
done

