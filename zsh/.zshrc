if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="sri"
plugins=(git common-aliases)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# default editor as vim
export EDITOR='vim'

## Aliases
# configs
alias zshconfig='vi ~/.zshrc'
alias zshrefresh='source ~/.zshrc'
alias vimconfig='vi ~/.vimrc'
alias i3config='vi ~/.i3/config'

# git
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gc='git commit'
alias gs='git status'
alias gd='git diff --color-words'
alias gco='git checkout'
alias gp='git push'
alias gb='git branch'
alias gcl='git clone'
alias gl='git log --pretty=custom'

# misc
alias emacs='emacs -nw'
alias vi='vim'
alias v='vim'
alias sv="sudo vim"
alias "cd.."="cd ../"
alias cl=clear
alias sagi="sudo apt-get install"
alias sagr="sudo apt-get remove"
alias asearch="apt-cache search"
alias supdate="sudo apt-get update"
alias grep="grep --color=auto"
alias mk8="make -j4"
alias mk="make"
alias open="xdg-open"
alias copy="xclip -sel clip"
alias copyPWD="pwd | xclip -sel clip"
alias music="ncmpcpp"
alias pp='python -mjson.tool'
alias tmux='TERM=screen-256color-bce tmux'
alias hgrep='history | grep '
alias ls='ls --color=auto'

# use clang
alias useClang='export CXX=/usr/bin/clang++-3.8; export CC=/usr/bin/clang-3.8;'

alias kp="/home/sri/libsrc/kpcli.pl --kdb /home/sri/Dropbox/Security/KeepassMaster1.kdbx"

# xrandr
function addMonitor() {
  if [ -n "$1" ]
  then
    mon="$1"
  else
    mon=DP2
  fi
  if [ -n "$2" ]
  then
    dir="$2"
  else
    dir=--right-of
  fi
  xrandr --output $mon --auto $dir eDP1
}
function removeMonitor() {
  if [ -n "$1" ]
  then
    echo removing "$1"
    xrandr --output "$1" --off 
  else
    echo removing DP2
    xrandr --output DP2 --off 
    #echo 'specify output id'
  fi
}

function watchMarkdown() {
  if [ -n "$2" ]
  then
    out=$2
  else
    out="dev.pdf"
  fi
  if [ -n "$1" ]
  then
    echo "Watching $1 for changes and pandoc to $out"
    while true;
    do
      inotifywait -e modify $1;
      pandoc $1 -o $out -V geometry:margin=1in;
    done;
  else
    echo "Need input file"
  fi
}
# #redwood
# alias develSetup='. ${HOME}/redwood_ws/devel_linux/setup.zsh'
# alias rwSetup='. ${HOME}/redwood_ws/RedwoodInternal/Redwood/setup.zsh'
# 
# #nomoko
# alias runNomokoPipeline="cd /home/sri/nomoko_ws/projects/NomokoToolbox/ && python pipeline.py"
# #gcloud~redwood
# # The next line updates PATH for the Google Cloud SDK.
# source '/opt/google-cloud-sdk/path.zsh.inc'
# # The next line enables shell command completion for gcloud.
# source '/opt/google-cloud-sdk/completion.zsh.inc'

#keyboard shit
source ~/.xinitrc

# virtualenv and virtualenvwrapper
#export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

# nix package manager
source ${HOME}/.nix-profile/etc/profile.d/nix.sh

# tmuxp
DISABLE_AUTO_TITLE=true
