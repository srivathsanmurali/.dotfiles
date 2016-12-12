# setting caps lock key to escape
#setxkbmap -option caps:escape
setxkbmap -option ctrl:nocaps

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
