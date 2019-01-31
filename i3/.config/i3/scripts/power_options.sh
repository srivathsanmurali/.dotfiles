#!/usr/bin/env bash

result=$(echo -n "lock|suspend|poweroff|reboot" | rofi -sep '|' -dmenu)

case "$result" in
  "lock")
    i3lock -c 000000
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
