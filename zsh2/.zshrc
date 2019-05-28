ZSH_CUSTOM=${HOME}/.dotfiles/zshCustom

source $ZSH_CUSTOM/init.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh_local ] && source ~/.zsh_local
[ -f ~/.profile ] && source ~/.profile

# elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"
export ECTO_EDITOR=kwrite
export ELIXIR_EDITOR=kwrite

export BROWSER=qutebrowser
