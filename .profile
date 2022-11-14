#!/bin/sh 

export BROWSER=firefox
export PATH=~/bin/$(hostname):~/bin/$(uname -m):~/.local/bin:~/bin:$PATH
export MANPATH=$MANPATH:~/.local/share/man/
export EDITOR=vim
export TERMINAL=alacritty
export READER=zathura

export XDG_DESKTOP_DIR="$HOME"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_VIDEOS_DIR="$HOME/videos"

[ -d "$HOME/.local/share/go" ] && export GOPATH="$HOME/.local/share/go"
[ -f ~/.config/profile_local ] && source ~/.config/profile_local
