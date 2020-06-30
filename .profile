#!/bin/sh 

export BROWSER=chromium
export PATH="$HOME/.local/bin/$(hostname):$HOME/.local/bin/$(uname -m):$HOME/.local/bin/:$PATH"
export MANPATH=$MANPATH:~/.local/share/man/
export EDITOR=nvim
export TERMINAL=alacritty
export READER=zathura

export SSH_ASKPASS=/usr/lib/seahorse/ssh-askpass
eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
export SSH_AUTH_SOCK
ssh-add </dev/null

setxkbmap -option ctrl:nocaps

[ -d "$HOME/.local/share/go" ] && export GOPATH="$HOME/.local/share/go"
[ -f ~/.config/profile_local ] && source ~/.config/profile_local
