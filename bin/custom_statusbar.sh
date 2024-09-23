#!/bin/sh
[ -e ~/.config/studio.conf ] && . ~/.config/studio.conf

now_playing() {
  if [ "$(playerctl -p spotify status)" = "Playing" ]; then
    np=$(playerctl -p spotify -f '{{title}} ({{album}})' metadata)
    echo -n " $np"
  else
    echo -n ""
    return
  fi
}

get_disk_usage()
{
    data_vol_usage=$(df -h  | grep "/dev/nvme0n1p1" | awk '{ print $5 }')
    root_vol_usage=$(df -h  | grep "/dev/mapper/crypt-root" | awk '{ print $5 }')

    printf "Root %s | Data: %s" "$root_vol_usage" "$data_vol_usage"
}


get_volume() {
  volume=$(volctl status)
  if [ "$volume" = "mute" ]; then
    volume="Vol: $volume"
  elif [ "$volume" -gt 66 ]; then
    volume="Vol: $volume"
  elif [ "$volume" -gt 33 ]; then
    volume="Vol: $volume"
  else
    volume="Vol: $volume"
  fi

  echo -n "$volume"
}

date_today() {
  echo -n " $(date +'%A, %b %d')"
}

time_now_gmt() {
  echo -n " GMT: $(TZ=gmt date +'%R')"
}

time_now_sg() {
  echo -n " SG: $(date +'%r')"
}

network() {
	tun=$(
		nmcli device status |
			grep -E "\btun\b.*\bconnected\b" |
      		tr -s ' ' |
      		cut -d ' ' -f4- |
	  		sed 's/\s*$//g' |
	  		paste -sd '|' -
	)
	nw=$(
		nmcli device status |
			grep -E "\bwifi\b.*\bconnected\b" |
      		tr -s ' ' |
      		cut -d ' ' -f4- |
	  		sed 's/\s*$//g' |
	  		paste -sd '|' -
	)
	
	if [ -n "${nw}" ]; then
		echo -n "Wifi: ${nw}"
	fi
    if [ -n "${tun}" ]; then
        echo -n " | Tun: ${tun}"
    fi
}

get_battery_icon() {
  if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]; then
    echo -n " "
  elif [ "$1" -gt 95 ]; then
    echo -n " "
  elif [ "$1" -gt 75 ]; then
    echo -n " "
  elif [ "$1" -gt 50 ]; then
    echo -n " "
  elif [ "$1" -gt 25 ]; then
    echo -n " "
  else
    echo -n " "
  fi
}

get_bluetooth() {
  connected_device=$(bluetoothctl info | grep Name | cut -d: -f2- | xargs)
  if [ -n "$connected_device" ]; then
    echo -n " $connected_device"
  else
    echo -n ""
  fi
}

battery() {
  batcap=$(
    cat /sys/class/power_supply/BAT*/capacity \
    | awk '{sum+=$NF} END {print int(sum/NR)}'
  )
  
  if [ -n "$batcap" ]; then
    echo -n "Bat: $(get_battery_icon "$batcap")${batcap}"
  else
    echo -n ""
  fi
}

corona() {
  cat /tmp/corona |
  jq --raw-output '"Corona [ \(.confirmed.value)  \(.deaths.value)]"'
}

automon() {
    cat ~/.cache/automon
}

get_bar_from_number() {
    cur=$1
    max=$2
    used="█"
    empty="▒"
}

while true
do
    printf "%s %s | %s | %s | %s %s %s \n" "$(now_playing)" "$(network)" "$(get_volume)" "$(battery)" "$(date_today)" "$(time_now_gmt)" "$(time_now_sg)"
  sleep 1
done
