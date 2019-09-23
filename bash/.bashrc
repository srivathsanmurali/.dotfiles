#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#                                 

stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd # cd into direcotry like zsh
HISTSIZE= HISTFILESIZE= # Infinite history

prompt_cmd() {
  cur_dir=$($HOME/.local/bin/tools/prompt)
  PS1="\u@\h:$cur_dir$ "
}
PROMPT_COMMAND=prompt_cmd

# any local config
[ -f $HOME/.bash_local ] && source $HOME/.bash_local

# aliases
## vim: set ft=bash:
alias swayconfig="vi ~/.config/sway/config"
alias vimconfig="vi ~/.dotfiles/vim"
alias bashconfig="vi ~/.dotfiles/vim"
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
alias todo="note open todo"

## applications
alias music="ncmpcpp"
alias playlist="~/.local/bin/mpc_playlist | less -r"
alias v='vim'
alias vi='vim'
alias pjson='python -mjson.tool'
alias r='ranger'
alias unused_pkgs='pacman -Qdtq'
alias t='transmission-remote-cli'

## load with config
alias neomutt='neomutt -F ~/.config/mutt/muttrc'
alias mutt='neomutt -F ~/.config/mutt/muttrc'

# Functions
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

function gReview() {
  for currHash in `git --no-pager log --reverse --pretty=format:"%h" $1..$2`; do
    echo $currHash
    git show -p $currHash
  done
}

sri_clone() {
  git clone git@github.com:srivathsanmurali/$1.git  
}

# config for application
## asdf
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash

## use rg if available
if hash rg 2>/dev/null; then
  export FZF_DEFAULT_COMMNAD='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi

## elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
export ECTO_EDITOR=vim
export ELIXIR_EDITOR=vim

