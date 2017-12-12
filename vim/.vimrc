" Srivathsan's vimrc

" use vim seting rather than vi setting
set nocompatible

"" ---------
"" INTERFACE
"" ---------

" setting up colors properly
set t_Co=256
set background=dark

" vert split 
highlight VertSplit cterm=NONE ctermfg=white ctermbg=NONE
highlight HorSplit cterm=NONE ctermfg=white ctermbg=NONE
set fillchars+=vert:│

" status line
hi s1 ctermbg=black ctermfg=white
set laststatus=2
set statusline=%#s1#    " set hightlight
set statusline+=%t      " tail of the filename
set statusline+=%m      " modified flag
set statusline+=%=      "left/right separator
set statusline+=%y      "filetype
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" file search
set path+=**
set wildmenu

" paste without indent
set paste

" hidden buffers
set hidden

" case insensitive search
set ignorecase
set smartcase
set noinfercase

" make backspace more sane
set backspace=indent,eol,start

" searching
set hlsearch
set incsearch
"highligh Search ctermbg=Grey ctermfg=Black

" use proper indents
set shiftwidth=2

" tabs are spaces
set expandtab

" an indentation every four columns
set tabstop=2

" let backspace delete indent
set softtabstop=2

" enable auto intend
set autoindent

" open splits down and below
set splitbelow
set splitright

" show matching brackets
set showmatch

" disable startup message
set shortmess+=I

" syntax highlighting
syntax on

" show line numbers
set number

" no line wrapping
set wrap

" use mouse
set mouse=a

" always show 10 lines above and below cursor
set scrolloff=10

"" highlight long statements
highlight Overlength ctermbg=grey ctermfg=black
match Overlength /\%81v.\+/

" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd FileType python set shiftwidth=4
" file specific settings
autocmd BufRead,BufNewFile *.tex, *.md set modeline spelllang=en_gb spell wrap tw=80 wrapmargin=2

"--------
" PLUGINS
"--------
set shell=/bin/bash

" VUNDLE SETUP
" set backup and swap directories to avoid clutter
let vimdir = expand('~/.vim/')
let swpdir = vimdir . 'swaps/'
let bkpdir = vimdir . 'backups/'
let unddir = vimdir . 'undos/'
  set undofile
if !isdirectory(swpdir) || !isdirectory(bkpdir) || !isdirectory(unddir)
  execute 'silent !mkdir -p ' . swpdir
  execute 'silent !mkdir -p ' . bkpdir
  execute 'silent !mkdir -p ' . unddir
endif

" Add // to enable building of bkp/swp dirs
let &directory = swpdir . '/'
let &backupdir = bkpdir . '/'
let &undodir   = unddir . '/'

" Switch filetype off for plugin/bundle loading
filetype off
filetype plugin indent off

" For Vundle
let bundledir = vimdir . 'bundle/'
let vundledir = bundledir . 'vundle/'
let vundleinstalled = 1

if !isdirectory(vundledir)
  let vundleinstalled = 0
  execute 'silent !mkdir -p ' . bundledir
  execute 'silent !git clone https://github.com/gmarik/vundle.git ' . vundledir
endif

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'

" PLUGIN SETUP
" tabular
Plugin 'godlygeek/tabular'

" git gutter to track changes
Plugin 'airblade/vim-gitgutter'
highlight SignColumn ctermbg=None

"control p
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" tabbar - use with ctags
Plugin 'majutsushi/tagbar'
let g:tagbar_sort=0
map <C-t> :Tagbar<CR>

Plugin 'tpope/vim-fugitive'

Plugin 'rust-lang/rust.vim'

Plugin 'rhysd/vim-clang-format'
let g:clang_format#code_style = "mozilla"

Plugin 'elixir-editors/vim-elixir'

" Trigger update after bundles loaded
if vundleinstalled == 0
  PluginInstall
endif
filetype plugin indent on

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

map <C-b> :bn<CR>
map <C-S-b> :bp<CR>

map <C-e> :E<CR>
"-------
" SNIPS
"-------
" adds a brief block for doxy like comments
function! Brief()
  " ~/.vim/snips/briefSnipp.txt
  r~/.vim/snips/briefSnipp.txt
endfunction
command Br call Brief()

"--------
" Syntax
"--------
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
