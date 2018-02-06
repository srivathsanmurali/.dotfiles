for i in `ls $ZSH_CUSTOM/scripts/`
do
source $ZSH_CUSTOM/scripts/$i;
done;

for i in `ls $ZSH_CUSTOM/plugins/`
do
source $ZSH_CUSTOM/plugins/$i;
done;

fpath+="$ZSH_CUSTOM/completions"

# default editor as vim
export EDITOR='vim'

# tmuxp
DISABLE_AUTO_TITLE=true

## asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

PROMPT='
%n@%m %~ %v
> '
