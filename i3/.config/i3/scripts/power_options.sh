#!/usr/bin/env bash

themes=$HOME/.config/rofi/monokai.rasi
result=$(echo -n "lock|logout|suspend|poweroff|reboot" | rofi -sep '|' -dmenu -columns 5 -lines 1 -width 1000)

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
