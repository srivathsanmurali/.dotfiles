# default editor as vim
set --export EDITOR 'vim'

function fish_greeting
  sort --random-sort ~/.wiseCompQuotes | head -n 1 | cowsay
end
