#!/bin/sh
# gets the json object focused object
# jq
# tee
# sway

declare -r filter='
# returns the focused node by recursively traversing the node tree
def find_focused_node:
    if .focused then . else (if .nodes then (.nodes | .[] | find_focused_node) else empty end) end;
find_focused_node
'

swaymsg --type get_tree --raw |
  jq --raw-output "${filter}" |
  tee /tmp/sway_proc
