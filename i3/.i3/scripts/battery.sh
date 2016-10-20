#!/bin/bash

batPath0='/org/freedesktop/UPower/devices/battery_BAT0'
batPath1='/org/freedesktop/UPower/devices/battery_BAT1'

bat0="$(upower -i $batPath0 | grep 'percentage' | awk '{print $2}')"
bat1="$(upower -i $batPath1 | grep 'percentage' | awk '{print $2}')"

echo "[$bat0 , $bat1]"
