
# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.dotfiles/oh-my-zsh
ZSH_CUSTOM=${HOME}/.dotfiles/zshCustom
ZSH_THEME="sri"
plugins=(git common-aliases)

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
alias matlab-cli='matlab -nodisplay -nosplash'

# Music
alias music="ncmpcpp"
alias toggleMusic="ncmpcpp toggle"
alias playMusic="ncmpcpp play"
alias pauseMusic="ncmpcpp pause"
alias stopusic="ncmpcpp stop"

# tmuxp
DISABLE_AUTO_TITLE=true

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
  if [ -n "$3" ]
  then
    refmon="$1"
  else
    refmon=eDP1
  fi
  xrandr --output $mon --auto $dir $refmon
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

# display time in multiple countries
function tz() {
  echo "local         " `date`
  echo "Zurich        " `TZ='Europe/Zurich' date`
  echo "Pacific       " `TZ='America/Vancouver' date`
  echo "Singapore     " `TZ='Asia/Singapore' date`
}
