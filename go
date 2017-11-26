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

function ensure_requirements {
  pip install -r requirements.txt
}

function task_backup_zsh_history {
  local backup_dir=$(pwd)/zsh_history
  local backup_path=$backup_dir/$(date "+%Y.%m.%d-%H.%M.%S").bak
  mkdir -p $backup_dir
  gpg --output $backup_path --encrypt --recipient mczech@thoughtworks.com ~/.zsh_history
  echo "Successfully created backup $backup_path"
}

function task_install {
  if [ ! -d vendor/bundle ]; then
    bundle install --path=vendor/bundle --standalone --binstubs=vendor/binstubs
  fi

  if [ Gemfile -nt vendor/bundle ]; then
    bundle
    touch vendor/bundle
  fi

  ensure_requirements

  make_symlink vim ~/.vim
  make_symlink vimrc ~/.vimrc
  make_symlink vimrc ~/.vim/init.vim # nvim compatibility
  make_symlink zshrc ~/.zshrc
  make_symlink tmux.conf ~/.tmux.conf
  make_symlink scripts ~/.scripts
  make_symlink aliases ~/.aliases
}

function task_usage {
  echo "Usage: $0 install | backup-zsh-history"
}
case ${1:-} in
  install) task_install ;;
  backup-zsh-history) task_backup_zsh_history ;;
  *) task_usage ;;
esac
