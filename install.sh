#!/usr/bin/env bash

set -e

# Source: https://gist.github.com/davejamesmiller/1965569
ask() {
  while true; do
      if [ "${2:-}" = "Y" ]; then
        prompt="Y/n"
        default=Y
      elif [ "${2:-}" = "N" ]; then
        prompt="y/N"
        default=N
      else
        prompt="y/n"
        default=
      fi
      read -p "$1 [$prompt] " REPLY </dev/tty
      if [ -z "$REPLY" ]; then
        REPLY=$default
      fi
      case "$REPLY" in
        Y*|y*) return 0 ;;
        N*|n*) return 1 ;;
    esac
  done
}
dir=`pwd`
pwd

# backup=0
# if ask "Do you want to back up all existing dotfiles?" Y; then
#   echo "backup"
#   rm -rf ~/.dotfileBackup
#   mkdir ~/.dotfileBackup
#   backup=1
# fi

if ask "Install symlink for .gitconfig?" N; then
  echo "gitconfig"
  rm ~/.gitconfig
  ln -sf ${dir}/gitconfig ~/.gitconfig
fi

if ask "install symlink for .zshrc?" N; then
  echo "zshrc"
  rm ~/.zshrc
  ln -sf ${dir}/zshrc ~/.zshrc
fi

if ask "install sri zsh theme?" N; then
  echo "sri.zsh-theme"
  rm ${ZSH}/themes/sri.zsh-theme
  ln -sf ${dir}/sri.zsh-theme ${ZSH}/themes/sri.zsh-theme
fi

if ask "Install symlink for .vimrc?" N; then
  echo "vimrc"
  rm ~/.vimrc
  rm -rf ~/.vim
  ln -sf ${dir}/vimrc ~/.vimrc
fi

if ask "Install symlink for .i3?" N; then
  echo "i3"
  rm -rf ~/.i3
  rm ~/.i3blocks.conf
  ln -sf ${dir}/i3 ~/.i3
  ln -sf ${dir}/i3blocks.conf ~/.i3blocks.conf
fi

if ask "Install symlink for .mpd?" N; then
  echo "mpd"
  rm -rf ~/.mpd
  ln -sf ${dir}/mpd ~/.mpd
fi

if ask "install symlink for .ncmpcpp?" N; then
  echo "ncmpcpp"
  rm -rf ~/.ncmpcpp
  mkdir ~/.ncmpcpp
  ln -sf ${dir}/ncmpcpp ~/.ncmpcpp/config
fi
