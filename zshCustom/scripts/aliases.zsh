## Aliases
# configs
alias i3config='vi ~/.config/i3/config'
alias nixconfig='sudoedit /etc/nixos/configuration.nix'
alias vimconfig='vi ~/.dotfiles/vim/'
alias zshconfig='vi ~/.dotfiles/zshCustom'
alias zshrefresh='source ~/.zshrc'
alias muttconfig='vi ~/.config/mutt/'

# git
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit'
alias gchp='git cherry-pick'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff --color-words'
alias gdc='git diff --color-words --cached'
alias gl='git l'
alias gp='git push'
alias gpo='git remote prune origin'
alias gr='git gr'
alias gs='git status'

# misc
#alias tmux='TERM=screen-256color-bce tmux'
alias "cd.."="cd ../"
alias asearch="apt-cache search"
alias cl=clear
alias copy="xclip -sel clip"
alias copyPWD="pwd | xclip -sel clip"
alias emacs='emacs -nw'
alias ec='emacsclient'
alias emptyDir='rm -rf *'
alias grep="grep --color=auto"
alias hgrep='history | grep '
alias ls='ls --color=auto'
alias matlab-cli='matlab -nodisplay -nosplash'
alias mk8="make -j4"
alias mk9="make -j9"
alias mk="make"
alias music="ncmpcpp"
alias open="xdg-open"
alias pp='python -mjson.tool'
alias sagi="sudo apt-get install"
alias sagr="sudo apt-get remove"
alias supdate="sudo apt-get update"
alias sv="sudoedit"
alias v='vim'
alias vi='vim'
alias vims='vimSessionSelect'
alias todo='. $ZSH_CUSTOM/bin/todo'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias pjson='python -m json.tool'

alias neomutt='neomutt -F ~/.config/mutt/muttrc'
alias mutt='neomutt -F ~/.config/mutt/muttrc'

# Music
alias music="ncmpcpp"
alias pauseMusic="ncmpcpp pause"
alias playMusic="ncmpcpp play"
alias stopusic="ncmpcpp stop"
alias toggleMusic="ncmpcpp toggle"
alias playlist="~/.local/bin/mpc_playlist | less"
