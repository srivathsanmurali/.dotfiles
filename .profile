#!/bin/sh 

export BROWSER=firefox
export PATH=~/bin/$(hostname):~/bin/$(uname -m):~/.local/bin:~/bin:$PATH
export MANPATH=$MANPATH:~/.local/share/man/
export EDITOR=vim
export TERMINAL=alacritty
export READER=zathura

export XDG_DESKTOP_DIR="$HOME"

[ -d "$HOME/.local/share/go" ] && export GOPATH="$HOME/.local/share/go"
[ -f ~/.config/profile_local ] && source ~/.config/profile_local
