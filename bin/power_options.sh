#!/bin/sh

themes=$HOME/.config/rofi/monokai.rasi
result=$(printf "lock\nsuspend\npoweroff\nreboot\n" | dmenu -i -p "Power Menu:")

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
