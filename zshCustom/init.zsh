for i in `ls $ZSH_CUSTOM/scripts/`
do
source $ZSH_CUSTOM/scripts/$i;
done;

fpath+="$ZSH_CUSTOM/completions"

## asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
export ECTO_EDITOR=kwrite
export ELIXIR_EDITOR=kwrite

## setting theme
. $ZSH_CUSTOM/my_themes/simple.zsh-theme
