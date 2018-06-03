#!/bin/bash

set -eu

function make_symlink {
  local source=$1
  local destination=$2
  if [ -h $destination ]; then
    return 0
  elif [ -f $destination ]; then
    echo "File exists: ${destination}"
  else
    ln -sv `pwd`/$source $destination
  fi
}

function task_install {
  make_symlink vimrc ~/.vimrc
  make_symlink config.fish ~/.config/fish/config.fish
  make_symlink gitconfig ~/.gitconfig
  make_symlink xinitrc ~/.xinitrc
  make_symlink termite.conf ~/.config/termite/config

  mkdir -p ~/.config/feh
  make_symlink feh/themes ~/.config/feh/themes

  # for Yubikey SSH
  make_symlink gpg-agent.conf ~/.gnupg/gpg-agent.conf
}

function task_usage {
  echo "Usage: $0 install"
}
case ${1:-} in
  install) task_install ;;
  *) task_usage ;;
esac
