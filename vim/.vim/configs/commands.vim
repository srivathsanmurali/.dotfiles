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
nnoremap  <C-h>     <Esc><C-w>h
inoremap  <C-h>     <Esc><C-w>h
nnoremap  <C-k>     <Esc><C-w>k
inoremap  <C-k>     <Esc><C-w>k
noremap   <C-l>     <Esc><C-w>l
inoremap  <C-l>     <Esc><C-w>l
inoremap  <C-j>     <Esc><C-w>j
noremap   <C-j>     <Esc><C-w>j

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

nnoremap <leader>p    <Esc>:GFiles<CR>
inoremap <leader>p    <Esc>:GFiles<CR>

nnoremap <C-a> ggVGG"+y

nnoremap <leader>b :Buffers<CR>

nnoremap <leader>t :tabnew<CR>
nnoremap J :tabprev<CR>
nnoremap K :tabprev<CR>

nnoremap <C-t> :Tags<CR>
inoremap <C-t> :Tags<CR>

set tags=./tags
