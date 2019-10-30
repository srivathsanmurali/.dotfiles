#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#                                 

stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd # cd into direcotry like zsh

HISTCONTROL=ignoredups:erasedups # no duplicates
HISTSIZE=
HISTFILESIZE= # Infinite history
shopt -s histappend

prompt_cmd() {
  cur_dir=$($HOME/.local/bin/tools/prompt)
  #PS1="$(tput bold)$(tput setaf 1)[$(tput setaf 3)\u$(tput setaf 5)@$(tput setaf 4)\h $(tput setaf 6)$cur_dir$(tput setaf 1)]$ $(tput sgr0)"
  PS1="[\u@\h $cur_dir]$ "
}
PROMPT_COMMAND=prompt_cmd

# any local config
[ -f $HOME/.bash_local ] && source $HOME/.bash_local

# aliases
## vim: set ft=bash:
alias swayconfig="vi ~/.config/sway/config"
alias vimconfig="vi ~/.dotfiles/vim"
alias bashconfig="vi ~/.dotfiles/bash"
alias refresh="source ~/.bashrc"
alias abook="abook --datafile ~/.local/share/abook/addressbook"

# git
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff --color-words'
alias gdc='git diff --color-words --cached'
alias gr='git gr'
alias gs='git status'

# misc
alias cl="clear"
alias grep="grep --color=auto"
alias hgrep='history | grep '
alias ls="ls --color=auto -hN --group-directories-first"
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias mbsync='mbsync -c "$HOME/.config/mbsync/config"'

## applications
alias music="ncmpcpp"
alias playlist="~/.local/bin/mpc_playlist | less -r"
alias pjson='python -mjson.tool'
alias r='ranger'
alias unused_pkgs='pacman -Qdtq'
alias t='transmission-remote-cli'
alias v='vim'
alias vi='vim'

if hash nvim > /dev/null 2>&1; then
  alias vim='nvim' 
fi

## load with config
alias neomutt='neomutt -F ~/.config/mutt/muttrc'
alias mutt='neomutt -F ~/.config/mutt/muttrc'

# Functions
todo() {
  while getopts "eh" option $*; do
    case "$option" in
      e)
        note open todo
        return
        ;;
    esac
  done
  note cat todo
}
up() {
  cd $(printf "%0.0s../" $(seq 1 $1));
}

sshReady() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}

gShowSelected() {
  git show $(git log --no-color --oneline | fzf | awk '{print $1}')
}
script() {
  nvim $(find ~/.dotfiles/bin/.local/bin/ -type f | fzf)
}

function gReview() {
  for currHash in `git --no-pager log --reverse --pretty=format:"%h" $1..$2`; do
    echo $currHash
    git show -p $currHash
  done
}

function gco_diff() {
  git checkout $(git diff --name-only | fzf)
}

function gco_cached() {
  git checkout $(git diff --name-only --cached | fzf)
}

sri_clone() {
  git clone git@github.com:srivathsanmurali/$1.git  
}

# config for application
## asdf
[ -f /opt/asdf/asdf.sh ] && source /opt/asdf/asdf.sh
[ -f /opt/asdf/completions/asdf.bash ] && source /opt/asdf/completions/asdf.bash

[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash

## use rg if available
if hash rg 2>/dev/null; then
  export FZF_DEFAULT_COMMNAD='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi

## elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
export ECTO_EDITOR=vim
export ELIXIR_EDITOR=vim

khal list
