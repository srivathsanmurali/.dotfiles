#!/usr/bin/env bash

# Disable DPMS turning off the screen
xset dpms force on
xset s off

# Disable bell
xset -b

# set caps lock to ctrl key.
setxkbmap -option ctrl:nocaps

# rotate the right monitor
# xrandr --output HDMI-0 --rotate left

export XDG_CURRENT_DESKTOP=KDE

export SSH_ASKPASS=/usr/lib/ssh/ksshaskpass
eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
export SSH_AUTH_SOCK
ssh-add </dev/null

# Start i3 and log to ~/.i3/logfile
echo "Starting at $(date)" >> ~/.config/i3/logfile
exec /usr/bin/i3 -V -d all >> ~/.config/i3/logfile
