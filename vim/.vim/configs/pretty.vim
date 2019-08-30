" vert split 
highlight VertSplit cterm=NONE ctermfg=white ctermbg=NONE
highlight HorSplit cterm=NONE ctermfg=white ctermbg=NONE

" Git gutter column
" highlight SignColumn ctermbg=None

" status line
hi s1 ctermbg=white ctermfg=black
hi s2 ctermbg=209 ctermfg=white
set laststatus=2
set statusline=%#s1#          " set hightlight
set statusline+=\ %t          " tail of the filename
set statusline+=\ %m          " modified flag
set statusline+=%#s2#          " set hightlight
set statusline+=%=            "left/right separator
set statusline+=%#s1#          " set hightlight
set statusline+=\ %y          "filetype
set statusline+=\ %p%%        "percent through file
set statusline+=\ %l:%c       "cursor column
set statusline+=\             "empty space

" syntax highlighting
syntax on

set t_Co=256
set background=dark
colorscheme monokai

" --------------
" netrw settings
" --------------
let g:netrw_banner = 0         " removes the banner
let g:netrw_liststyle = 1      " produces tree style output
