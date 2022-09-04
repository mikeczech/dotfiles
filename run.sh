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
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  make_symlink vimrc ~/.config/nvim/init.vim
  make_symlink config.fish ~/.config/fish/config.fish
  make_symlink gitconfig ~/.gitconfig
  make_symlink tmux.conf ~/.tmux.conf
}

function task_usage {
  echo "Usage: $0 install"
}
case ${1:-} in
  install) task_install ;;
  *) task_usage ;;
esac
