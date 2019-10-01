"  _ ____   _(_)_ __ ___  
" | '_ \ \ / / | '_ ` _ \ 
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|

set shortmess+=I

" file search
set path+=**
set wildmenu

set hidden      "hidden buffers

" case insensitive search
set ignorecase
set smartcase
set noinfercase

set splitbelow    "split below
set splitright    "split right
set hlsearch      "higlight search
set incsearch     "incremental search
set showmatch     "show matching brackets
set shiftwidth=2  "indent by 2 spaces
set expandtab     "expand tabs to spaces
set tabstop=2     "each tab is 2 spaces
set autoindent    "autoindent code

" highlight long statements
highlight Overlength ctermbg=gray ctermfg=black
match Overlength /\%81v.\+/

let g:netrw_banner=0 "remove netrw banner

" --------------------
" ----- Plugings -----
" --------------------
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'editorconfig/editorconfig-vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'godlygeek/tabular'


Plug 'junegunn/fzf.vim'    
nnoremap <C-p> <Esc>:GFiles<CR>
inoremap <C-p> <Esc>:GFiles<CR> "fzf file launcher

Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'PaperColor' }
set noshowmode "lightline already shows the mode

call plug#end()

" --------------------
" ----- Commands -----
" --------------------
command! Spell :setlocal spell! spell?

command! Chmodx :!chmod a+x % " make current buffer executable

nnoremap  <C-h>     <Esc><C-w>h
inoremap  <C-h>     <Esc><C-w>h
nnoremap  <C-k>     <Esc><C-w>k
inoremap  <C-k>     <Esc><C-w>k
noremap   <C-l>     <Esc><C-w>l
inoremap  <C-l>     <Esc><C-w>l
inoremap  <C-j>     <Esc><C-w>j
noremap   <C-j>     <Esc><C-w>j
nnoremap  <C-e>     :Explore<CR>
nnoremap <C-a> ggVGG "select everything

" Copy to clipboard
nnoremap <S-y> "+y
vnoremap <S-y> "+y


let mapleader=" "
" editing the configuration files
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <leader>b :BuffergatorToggle<CR>
let g:buffergator_autoupdate = 1
let g:buffergator_viewport_split_policy = "N"
let g:buffergator_vsplit_size = 3

nnoremap <leader>t :tabnew<CR>
nnoremap J :tabnext<CR>
nnoremap K :tabprev<CR>

nnoremap <C-t> :Tags<CR>
inoremap <C-t> :Tags<CR>

set tags=./tags

nnoremap Q <Nop>
