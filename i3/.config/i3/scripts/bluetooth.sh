#!/bin/bash
result=$(echo -n "tp_music|qc_35|disconnect" | rofi -sep '|' -dmenu)

case "$result" in
  "tp_music")
    bluetoothctl << EOF
power on
disconnect
connect 18:D6:C7:19:F0:A5 
EOF
    ;;
    
  "qc_35")
    bluetoothctl << EOF
power on
disconnect
connect 04:52:C7:F0:8E:16 
EOF
    ;;
  "disconnect")
    bluetoothctl << EOF
power on
disconnect
EOF
    ;;
esac

