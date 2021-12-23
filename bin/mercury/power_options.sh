#!/bin/sh

themes=$HOME/.config/rofi/monokai.rasi
result=$(printf "lock\npoweroff\nreboot\n" | dmenu -i -p "Power Menu:")

case "$result" in
  "lock")
	lock
    ;;
  "poweroff")
  	doas poweroff
    ;;
  "reboot")
  	doas reboot
    ;;
esac
