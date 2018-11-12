#!/usr/bin/env sh

# Terminate existing polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
DISPLAY1="$(xrandr -q | grep 'DVI' | cut -d ' ' -f1)"
[[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar tbar -q&

DISPLAY2="$(xrandr -q | grep 'HDMI' | cut -d ' ' -f1)"
[[ ! -z $DISPLAY2 ]] && MONITOR=$DISPLAY2 polybar tbar -q&

echo $DISPLAY1
echo $DISPLAY2
