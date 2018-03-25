" Filetype settings 

filetype plugin indent on

"--------
" Syntax
"--------
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda

" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd FileType python set shiftwidth=4
" file specific settings
autocmd BufRead,BufNewFile *.tex, *.md set modeline spelllang=en_gb spell wrap tw=80 wrapmargin=2
