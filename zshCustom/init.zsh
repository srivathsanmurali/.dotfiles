for i in `ls $ZSH_CUSTOM/scripts/`
do
source $ZSH_CUSTOM/scripts/$i;
done;

fpath+="$ZSH_CUSTOM/completions"

## asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

## setting theme
. $ZSH_CUSTOM/my_themes/simple.zsh-theme

