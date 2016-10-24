#!/bin/bash

batPath0='/org/freedesktop/UPower/devices/battery_BAT0'
batPath1='/org/freedesktop/UPower/devices/battery_BAT1'
bat0Charging="$(acpitool -b | grep "#1" | awk -v cnt=0 '/Charging/ {++cnt} END {print cnt}')"
bat1Charging="$(acpitool -b | grep "#2" | awk -v cnt=0 '/Charging/ {++cnt} END {print cnt}')"

if [ $bat0Charging == 1 ]; then
  bat0=" $(upower -i $batPath0 | grep 'percentage' | awk '{print $2}')"
else
  bat0="$(upower -i $batPath0 | grep 'percentage' | awk '{print $2}')"
fi

if [ $bat1Charging == 1 ]; then
  bat1=" $(upower -i $batPath1 | grep 'percentage' | awk '{print $2}')"
else
  bat1="$(upower -i $batPath1 | grep 'percentage' | awk '{print $2}')"
fi

result="[ $bat0, $bat1 ]"
echo $result 
