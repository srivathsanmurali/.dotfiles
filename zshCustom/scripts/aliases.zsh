## Aliases
# configs
alias zshconfig='vi ~/.zshrc'
alias zshrefresh='source ~/.zshrc'
alias vimconfig='vi ~/.vimrc'
alias i3config='vi ~/.i3/config'
alias nixconfig='sudoedit /etc/nixos/configuration.nix'

# git
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gc='git commit'
alias gs='git status'
alias gd='git diff --color-words'
alias gdc='git diff --color-words --cached'
alias gco='git checkout'
alias gchp='git cherry-pick'
alias gp='git push'
alias gb='git branch'
alias gcl='git clone'
alias gl='git l'
alias gr='git gr'

# misc
alias emacs='emacs -nw'
alias vi='vim'
alias v='vim'
alias sv="sudoedit"
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
#alias tmux='TERM=screen-256color-bce tmux'
alias hgrep='history | grep '
alias ls='ls --color=auto'
alias matlab-cli='matlab -nodisplay -nosplash'
alias mk9="make -j9"

# Music
alias music="ncmpcpp"
alias toggleMusic="ncmpcpp toggle"
alias playMusic="ncmpcpp play"
alias pauseMusic="ncmpcpp pause"
alias stopusic="ncmpcpp stop"
