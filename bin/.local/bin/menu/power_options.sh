#!/usr/bin/env bash

themes=$HOME/.config/rofi/monokai.rasi
result=$(echo -e "lock\nlogout\nsuspend\npoweroff\nreboot" | rofi -dmenu -i -columns 5 -lines 1)

case "$result" in
  "lock")
    i3lock -c 000000
    ;;
  "logout")
    i3-msg exit
    ;;
  "suspend")
    i3lock -c 000000;
    systemctl suspend
    ;;
  "poweroff")
    systemctl poweroff
    ;;
  "reboot")
    systemctl reboot
    ;;
esac
