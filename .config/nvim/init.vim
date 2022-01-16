"  _ ____   _(_)_ __ ___  
" | '_ \ \ / / | '_ ` _ \ 
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|

set nocompatible
" --------------------
" ----- Plugings -----
" --------------------
filetype off

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'    

" formatting
Plug 'rhysd/vim-clang-format'
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

" Syntax Highlighting
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'gpanders/vim-scdoc', { 'for': 'scw' }
Plug 'thanethomson/vim-jenkinsfile'

" theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

filetype plugin indent on

set laststatus=2
set shortmess+=I

let g:vim_markdown_toc_autofit=1
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

let g:lightline = { 'colorscheme': 'PaperColor' }
set noshowmode		"lightline already shows the mode

let g:buffergator_autoupdate = 1
let g:buffergator_viewport_split_policy = "N"
let g:buffergator_vsplit_size = 3

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

set encoding=utf-8
set tabstop=8
set shiftwidth=8
set noexpandtab
set autoindent
set magic

set number
set scrolloff=3
set sidescroll=3

set ruler
set colorcolumn=81

set ignorecase
set smartcase

set hlsearch      "higlight search
set incsearch     "incremental search
set noinfercase

set showmatch     "show matching brackets

" file search
set path+=**
set wildmenu

set splitbelow	"split below
set splitright	"split right
set hidden		"hidden buffers
set notimeout

set mouse=a

set backupdir=~/.cache/nvim
set directory=~/.cache/nvim

set nofoldenable
set lazyredraw

let g:netrw_banner=0 "remove netrw banner

syntax on

" --------------------
" ----- Commands -----
" --------------------
command! Spell :setlocal spell! spell?

let mapleader="\<space>"

nnoremap  <C-h>     <Esc><C-w>h
nnoremap  <C-k>     <Esc><C-w>k
noremap   <C-l>     <Esc><C-w>l
noremap   <C-j>     <Esc><C-w>j
nnoremap  <C-e>     :Explore<CR>

" Copy to clipboard
nnoremap <S-y> "+y
vnoremap <S-y> "+y
nnoremap <C-t> :Tags<CR>
inoremap <C-t> :Tags<CR>

" Change split direction
nnoremap <C-w>- <C-w>t<C-w>K
nnoremap <C-w>\| <C-w>t<C-w>H

nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>p <Esc>:GFiles<CR>
nnoremap <leader>g :Rg<space>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>d :r! date +"%d %b %Y"<CR>

function! ToCamelCase()
	let l:snakeWord = expand("<cword>")
	let l:camelWord = system('camelcase ' . l:snakeWord)
	execute '%s/\<'.l:snakeWord.'\>/'.l:camelWord.'/gc'
endfunction

set tags=./tags

nnoremap Q <Nop>

"" Autocmd
autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
autocmd FileType text setlocal tw=80
autocmd FileType mail setlocal noautoindent
autocmd FileType html setlocal et ts=2 sw=2
autocmd FileType sh setlocal noet ts=4 sw=4
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType meson setlocal noet ts=2 sw=2
autocmd FileType go setlocal noet ts=8 sw=8
autocmd FileType python setlocal et ts=8 sw=8
autocmd FileType elixir setlocal et ts=4 sw=4
autocmd FileType c setlocal noet ts=8 sw=8 tw=80
autocmd FileType h setlocal noet ts=8 sw=8 tw=80
autocmd FileType cpp setlocal noet ts=8 sw=8 tw=80
autocmd FileType meson setlocal noet ts=8 sw=8 tw=80
autocmd FileType mail setlocal noautoindent

augroup filetypedetect
  autocmd BufRead,BufNewFile *qutebrowser-editor-* set ts=4 sw=4 et

set background=light
syntax enable
colorscheme PaperColor
highlight Search ctermbg=162 ctermfg=white
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight SignColumn ctermbg=none
highlight Comment cterm=bold
