ZSH_CUSTOM=${HOME}/.dotfiles/zshCustom

. $ZSH_CUSTOM/init.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# compiler settings
export CC=clang CXX=clang++

# elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
export ECTO_EDITOR=kwrite
export ELIXIR_EDITOR=kwrite
