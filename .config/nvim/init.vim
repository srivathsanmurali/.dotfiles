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
set number

set splitbelow    "split below
set splitright    "split right
set hlsearch      "higlight search
set incsearch     "incremental search
"set showmatch     "show matching brackets
set shiftwidth=4  "indent by 2 spaces
set tabstop=4     
set noexpandtab
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
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_toc_autofit = 1
Plug 'junegunn/goyo.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'rhysd/vim-clang-format'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'godlygeek/tabular'

Plug 'junegunn/fzf.vim'    

Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'PaperColor' }
set noshowmode "lightline already shows the mode

Plug 'preservim/nerdcommenter'
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

" nnoremap <leader>b :BuffergatorToggle<CR>
nnoremap <leader>b :Buffers<CR>
let g:buffergator_autoupdate = 1
let g:buffergator_viewport_split_policy = "N"
let g:buffergator_vsplit_size = 3

nnoremap <leader>g :Rg<space>

nnoremap <leader>t :tabnew<CR>

nnoremap <leader>p <Esc>:GFiles<CR>

nnoremap <C-t> :Tags<CR>
inoremap <C-t> :Tags<CR>

set tags=./tags

nnoremap Q <Nop>

"" Autocmd
" text
autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
autocmd FileType text setlocal tw=80
autocmd FileType mail setlocal noautoindent

" config
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType meson setlocal noet ts=2 sw=2

" languages
autocmd FileType go setlocal noet ts=4 sw=4
autocmd FileType python setlocal et ts=4 sw=4
autocmd FileType elixir setlocal et ts=2 sw=2
autocmd FileType c setlocal noet ts=4 sw=4 tw=80
autocmd FileType h setlocal noet ts=4 sw=4 tw=80
autocmd FileType cpp setlocal noet ts=4 sw=4 tw=80
autocmd FileType html setlocal et ts=2 sw=2

augroup filetypedetect
  autocmd BufRead,BufNewFile *qutebrowser-editor-* set ts=4 sw=4 et
