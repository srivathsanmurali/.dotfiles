#!/bin/sh

result=$(printf "logout\nlock\nsuspend\nhibernate\npoweroff\nreboot\n" | dmenu -i -p "Power Menu:")

case "$result" in
  "logout")
    loginctl terminate-session "${XDG_SESSION_ID-}"
    ;;
  "lock")
	lock
    ;;
  "suspend")
	lock suspend
    ;;
  "hibernate")
    systemctl hibernate 
    ;;
  "poweroff")
    systemctl poweroff
    ;;
  "reboot")
    systemctl reboot
    ;;
esac
