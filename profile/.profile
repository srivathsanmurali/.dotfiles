#!/bin/sh 

export DOTFILES=${HOME}/.dotfiles
export BROWSER=firefox
export PATH=$PATH:$(du "${DOTFILES}/bin/.local/bin/" \
                    | cut -f2 \
                    | tr '\n' ':' \
                    | sed -e "s@.dotfiles/bin/@@g" -e "s/:*$//")
export MANPATH=$MANPATH:~/.local/share/man/
export EDITOR=nvim
export TERMINAL=st
export READER=zathura

export SSH_ASKPASS=/usr/lib/seahorse/ssh-askpass
eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
export SSH_AUTH_SOCK
ssh-add </dev/null

[ -d "$HOME/.local/share/go" ] && export GOPATH="$HOME/.local/share/go"
[ -f ~/.bashrc ] && source ~/.bashrc
