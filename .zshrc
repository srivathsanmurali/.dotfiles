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

# ----- Options
## completion engine
autoload -Uz compinit && compinit

## Ctrl-p & Ctrl-n
autoload -U up-line-or-search
autoload -U down-line-or-search

bindkey C-p up-list-or-search
bindkey C-n down-line-or-search

# ----- Utility Functions
_macos() { [[ $(uname) == "Darwin" ]] }
_have() { type "$1" &> /dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----- PROMPT
setopt prompt_subst
PROMPT='[$(prompt)]$ '
#PROMPT='$(prompt)$ '

git_prompt() {
  ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3-)
  git_hash=$(git rev-parse --short=8 HEAD 2>/dev/null)
  if [ -z "$ref" ]; then
    echo ""
  else
    echo "[$git_hash $ref]"
  fi
}
RPROMPT='$(git_prompt)'

# ----- Aliases
# basic
alias refresh="source $HOME/.zshrc"


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
alias gl='git log --pretty="custom2"'

# ls 

if [[ $(uname) == "Darwin" ]]; then
  alias ls="ls --color=auto -h"
else
  alias ls="ls --color=auto -h --group-directories-first"
fi
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
alias cal='cal -y'

# ----- Functions
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
  git show $(git log --pretty=custom2 | fzf --ansi | awk '{print $1}')
}

function z_() {
    cache_file="$HOME/.cache/zdirs"

    if [ -z "$1" ]; then
        cd "$(cat $cache_file | fzf --reverse | cut -f2)"
    elif [ "$1" = "add" ]; then
        name=$2
        dir_path=$(pwd)
        echo "${name}\t${dir_path}" >> "$cache_file"
        echo "Added ${dir_path} as ${name}"
    elif [ "$1" = "list" ]; then
        cat "$cache_file" | column -t
    else
        cd "$(grep "$1" "$cache_file" | cut -f2)"
    fi
}

function conda_activate() {
    conda-load
    conda activate $(ls ~/.local/opt/miniconda3/envs -1 | fzf --reverse)
}

# ----- History Management
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

# ----- Extra configs
# Config for applications
## elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
export ECTO_EDITOR=vim
export ELIXIR_EDITOR=vim

## Golang
export GOPATH="${HOME}/.local/share/go"

disable -r time
alias time='time -p'

_macos && eval "$(/opt/homebrew/bin/brew shellenv)"

# zoxide
_have zoxide && eval "$(zoxide init zsh)"
_have zoxide && alias cd='z'

# Application specific sources
_source_if /opt/asdf/asdf.sh
_source_if /usr/share/fzf/key-bindings.zsh

# local file
_source_if $HOME/.zsh_local
_source_if ~/.fzf.zsh
