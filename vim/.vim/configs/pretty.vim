" setting up colors properly
set t_Co=256
" colorscheme PaperColor
set background=light

" vert split 
highlight VertSplit cterm=NONE ctermfg=white ctermbg=NONE
highlight HorSplit cterm=NONE ctermfg=white ctermbg=NONE

" Git gutter column
highlight SignColumn ctermbg=None

" status line
hi s1 ctermbg=209 ctermfg=white
set laststatus=2
set statusline=%#s1#    " set hightlight
set statusline+=%f      " tail of the filename
set statusline+=%m      " modified flag
set statusline+=%=      "left/right separator
set statusline+=%y      "filetype
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" syntax highlighting
syntax on

