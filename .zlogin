if [ "$(tty)" = "/dev/tty1" ]; then
	export XDG_RUNTIME_DIR=/home/sri/.cache/runtime
	dbus-launch --exit-with-session sway
fi
