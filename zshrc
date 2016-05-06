# Path to your oh-my-zsh installation.
  export ZSH=/home/sri/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git)

# User configuration
  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# default editor as vim
export EDITOR='vim'

## Aliases
# configs
alias zshconfig='vi ~/.zshrc'
alias vimconfig='vi ~/.vimrc'
alias aconfig='vi ~/.config/awesome/rc.lua'

# git
alias g='git'
alias ga='git add -p'
alias gc='git commit'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gp='git push'

# misc
alias vi='vim'
alias v='vim'
alias "cd.."="cd ../"
alias cl=clear
alias sagi="sudo apt-get install"
alias asearch="apt-cache search"
alias supdate="sudo apt-get update"
alias grep="grep --color=auto"
