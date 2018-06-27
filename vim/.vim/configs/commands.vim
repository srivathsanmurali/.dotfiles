"---------
" COMMANDS
"---------
" toggle spellcheck
command Spell :setlocal spell! spell?
hi clear SpellBad
hi SpellBad cterm=underline

" make current buffer executable
command Chmodx :!chmod a+x %

" Tab navigation like Firefox.
"nnoremap <C-k>     <Esc>:tabnew<CR>
"inoremap <C-k>     <Esc>:tabnew<CR>
"noremap <C-l>      <Esc>:tabnext<CR>
"inoremap <C-l>      <Esc>:tabnext<CR>
"inoremap <C-h>      <Esc>:tabprev<CR>
"noremap <C-h>      <Esc>:tabprev<CR>

" map <C-b> :bn<CR>
" map <C-S-b> :bp<CR>

map <C-e> :E<CR>

" Copy to clipboardd
nnoremap <S-y> "+y
vnoremap <S-y> "+y

"-------
" SNIPS
"-------
" adds a brief block for doxy like comments
function! Brief()
  " ~/.vim/snips/briefSnipp.txt
  r~/.vim/snips/briefSnipp.txt
endfunction
command Br call Brief()
