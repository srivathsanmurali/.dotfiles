export ZSH_THEME_GIT_PROMPT_PREFIX="["
export ZSH_THEME_GIT_PROMPT_SUFFIX=']'
export ZSH_THEME_GIT_PROMPT_DIRTY="*"
export ZSH_THEME_GIT_PROMPT_CLEAN=""

function precmd() {
  PSVAR=`git_prompt_info`
}

PROMPT='
%n@%m %~ %v
> '
