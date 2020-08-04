#!/usr/bin/env bash

themes=$HOME/.config/rofi/monokai.rasi
result=$(echo -e "lock\nsuspend\npoweroff\nreboot" | rofi -dmenu -i -columns 5 -lines 1)

case "$result" in
  "lock")
	lock
    ;;
  "suspend")
	lock suspend
    ;;
  "poweroff")
    systemctl poweroff
    ;;
  "reboot")
    systemctl reboot
    ;;
esac
