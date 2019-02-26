"---------
" COMMANDS
"---------

let mapleader = "\<space>"

" toggle spellcheck
command! Spell :setlocal spell! spell?

hi clear SpellBad
hi SpellBad cterm=underline

" make current buffer executable
command! Chmodx :!chmod a+x %

" Tab navigation like Firefox.
nnoremap  <C-h>     <Esc><C-w>h<CR>
inoremap  <C-h>     <Esc><C-w>h<CR>
nnoremap  <C-k>     <Esc><C-w>k<CR>
inoremap  <C-k>     <Esc><C-w>k<CR>
noremap   <C-l>     <Esc><C-w>l<CR>
inoremap  <C-l>     <Esc><C-w>l<CR>
inoremap  <C-j>     <Esc><C-w>j<CR>
noremap   <C-j>     <Esc><C-w>j<CR>

nnoremap <leader>n  <Esc>:TilerNew<CR>
nnoremap <leader>m  <Esc>:TilerNew<CR>:GFiles<CR>
nnoremap <leader>q  <Esc>:TilerClose<CR>
nnoremap <leader>r  <Esc>:TilerReorder<CR>
nnoremap <leader><leader>  <Esc>:TilerFocus<CR>

" map <C-b> :bn<CR>
" map <C-S-b> :bp<CR>

nnoremap <C-e> :E<CR>

" Copy to clipboard
nnoremap <S-y> "+y
vnoremap <S-y> "+y

" editing the configuration files
nnoremap <leader>ev :e ~/.vim/configs<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>b    <Esc>:vsplit<CR>
inoremap <leader>b    <Esc>:vsplit<CR>
nnoremap <leader>v    <Esc>:split<CR>
inoremap <leader>v    <Esc>:split<CR>

nnoremap <leader>p    <Esc>:GFiles<CR>
inoremap <leader>p    <Esc>:GFiles<CR>

nnoremap <C-a> ggVGG"+y
