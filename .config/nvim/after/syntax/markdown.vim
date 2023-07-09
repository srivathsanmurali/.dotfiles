" Custom conceal
syntax match todoCheckbox '\v(\s+)?-\s\[\s\]'hs=e-4 conceal cchar=
syntax match todoCheckbox '\v(\s+)?-\s\[X\]'hs=e-4 conceal cchar=

hi def link todoCheckbox Normal
