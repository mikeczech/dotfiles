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
  if [ ! -d vendor/bundle ]; then
    bundle install --path=vendor/bundle --standalone --binstubs=vendor/binstubs
  fi

  if [ Gemfile -nt vendor/bundle ]; then
    bundle
    touch vendor/bundle
  fi

  make_symlink vim ~/.vim
  make_symlink vimrc ~/.vimrc
  make_symlink vimrc ~/.vim/init.vim # nvim compatibility
}

function task_usage {
  echo "Usage: $0 install"
}
case ${1:-} in
  install) task_install ;;
  *) task_usage ;;
esac
