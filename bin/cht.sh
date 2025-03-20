#!/bin/sh
set -eu

languages=$(echo "cpp c sh python" | tr ' ' '\n')
coreutils=$(echo "xargs find mv sed awk" | tr ' ' '\n')

selected=$(printf "$languages\n$coreutils" | fzf --reverse)
read -p "query: " query

if printf "$languages" | grep -qs $selected; then
    URL=cht.sh/$selected/$(echo $query | tr ' ' '+')
else
    URL=cht.sh/$selected~$(echo $query | tr ' ' '+')
fi

tmux neww sh -c "curl $URL & while [ : ]; do sleep 1; done"
