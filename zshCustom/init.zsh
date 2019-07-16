for i in `ls $ZSH_CUSTOM/scripts/`
do
source $ZSH_CUSTOM/scripts/$i;
done;

## activate completions
autoload -Uz compinit
compinit

fpath+="$ZSH_CUSTOM/completions"

## asdf
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash

# elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
export ECTO_EDITOR=kwrite
export ELIXIR_EDITOR=kwrite

export PATH=$PATH:~/.local/bin
export MANPATH=$MANPATH:~/.local/share/man/

## setting theme
. $ZSH_CUSTOM/my_themes/simple2.zsh-theme
