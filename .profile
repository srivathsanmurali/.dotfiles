#!/bin/sh 

export BROWSER=qutebrowser
export PATH=~/bin/$(hostname):~/bin/$(uname -m):~/bin:~/.local/bin:$PATH
export MANPATH=$MANPATH:~/.local/share/man/
export EDITOR=nvim
export TERMINAL=alacritty
export READER=zathura

[ -d "$HOME/.local/share/go" ] && export GOPATH="$HOME/.local/share/go"
[ -f ~/.config/profile_local ] && source ~/.config/profile_local
