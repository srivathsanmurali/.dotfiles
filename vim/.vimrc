" Srivathsan's vimrc

" use vim seting rather than vi setting
set nocompatible

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

" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd FileType python set shiftwidth=4
" file specific settings
autocmd BufRead,BufNewFile *.tex, *.md set modeline spelllang=en_gb spell wrap tw=80 wrapmargin=2
"--------
" PLUGINS
"--------

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
" vim themes
Plugin 'flazz/vim-colorschemes'

" using airline for better status line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_right_sep='|'
let g:airline#extensions#tabline#enabled = 1
5

" vim-fugitive for git
Plugin 'tpope/vim-fugitive'

" tabular
Plugin 'godlygeek/tabular'

" git gutter to track changes
Plugin 'airblade/vim-gitgutter'
highlight SignColumn ctermbg=None

" nerd tree
Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['^.git$', '\.pyc$', '\~$']
autocmd vimenter * if !argc() | NERDTree | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" tabbar - use with ctags
Plugin 'majutsushi/tagbar'

" Trigger update after bundles loaded
if vundleinstalled == 0
  PluginInstall
endif
filetype plugin indent on
syntax on

"---------
" COMMANDS
"---------
" toggle spellcheck
command Spell :setlocal spell! spell?

" make current buffer executable
command Chmodx :!chmod a+x %

"Nerd tree
map <C-n> :NERDTreeToggle<CR>
:nnoremap <F2> :NERDTreeToggle<CR>
:inoremap <F2> <Esc>:NERDTreeToggle<CR>
let g:NERDTreeMapOpenInTabSilent="<F3>"

"tabbar
map <F4> <ESC>:TagbarToggle<CR>

" Tab navigation like Firefox.
nnoremap <C-k>     <Esc>:tabnew<CR>
inoremap <C-k>     <Esc>:tabnew<CR>
noremap <C-l>      <Esc>:tabnext<CR>
inoremap <C-l>      <Esc>:tabnext<CR>
inoremap <C-h>      <Esc>:tabprev<CR>
noremap <C-h>      <Esc>:tabprev<CR>

" refresh hotkey
:nnoremap <F5> :edit<CR>
:inoremap <F5> <Esc>:edit<CR>
"----------
" INTERFACE
"---------

" setting up colors properly
set t_Co=256
colorscheme badwolf

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

set colorcolumn=80
"highlight colorcolumn ctermbg=grey guibg=orange

"-------
" SNIPS
"-------
" adds a brief block for doxy like comments
function! Brief()
  " ~/.vim/snips/briefSnipp.txt
  r~/.vim/snips/briefSnipp.txt
endfunction
command Br call Brief()
