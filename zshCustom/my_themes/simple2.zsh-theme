export ZSH_THEME_GIT_PROMPT_PREFIX="["
export ZSH_THEME_GIT_PROMPT_SUFFIX=']'
export ZSH_THEME_GIT_PROMPT_DIRTY="*"
export ZSH_THEME_GIT_PROMPT_CLEAN=""

function precmd() {
  psvar[1]=$(git_prompt_info)
  psvar[2]=$($HOME/.local/bin/prompt)
}

PROMPT='%2v> '
RPROMPT='%1v'
