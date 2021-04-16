#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
#                         

# options
stty -ixon # Disable ctrl-s and ctrl-q

setopt emacs
setopt autocd
setopt nocaseglob

# completion engine
autoload -Uz compinit && compinit

# local file
[ -f $HOME/.zsh_local ] && source $HOME/.zsh_local

## PROMPT
setopt prompt_subst
PROMPT='[%m $(prompt)]$ '

git_prompt() {
  ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3-)
  if [ -z "$ref" ]; then
    echo ""
  else
    echo "[$ref]"
  fi
}
RPROMPT='$(git_prompt)'

# basic
alias refresh="source $HOME/.zshrc"

# vim
alias v='vim'
alias vi='vim'

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

# ls 
alias ls="ls --color=auto -hN --group-directories-first"
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# misc
alias cl="clear"
alias mbsync='mbsync -c "$HOME/.config/mbsync/config"'
alias grep="grep --color=auto"
alias hgrep='history | grep '
alias abook="abook --datafile ~/.local/share/abook/addressbook"
alias yt='newsboat -u ~/.config/newsboat/yt_urls -c ~/.cache/yt_newsboat'

# up function to go up in directories
function up() {
  cd $(printf "%0.0s../" $(seq 1 $1));
}

# ready ssh with default ssh key
function sshReady() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}

function gShowSelected() {
  git show $(git log --pretty=simplelog | fzf --ansi | awk '{print $1}') | less -R
}

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi
#
HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

## Ctrl-p & Ctrl-n
autoload -U up-line-or-search
autoload -U down-line-or-search

bindkey C-p up-list-or-search
bindkey C-n down-line-or-search

# Application specific sources
## asdf
[ -f /opt/asdf/asdf.sh ] && source /opt/asdf/asdf.sh

## fzf keybindings
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# Config for applications
## elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
export ECTO_EDITOR=vim
export ELIXIR_EDITOR=vim

disable -r time
alias time='time -p'
