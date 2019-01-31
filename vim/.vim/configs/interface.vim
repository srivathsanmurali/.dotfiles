" Srivathsan's interface settings

set t_Co=256
set background=light
colorscheme onehalflight 

" use vim seting rather than vi setting
set nocompatible

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

" open splits down and below
set splitbelow
set splitright

" searching
set hlsearch
set incsearch
"highligh Search ctermbg=Grey ctermfg=Black

" show matching brackets
set showmatch

" make backspace more sane
set backspace=indent,eol,start

" show line numbers
set nonumber

" no line wrapping
set wrap

" use mouse
set mouse=a

" always show 10 lines above and below cursor
set scrolloff=10

"" highlight long statements
highlight Overlength ctermbg=grey ctermfg=black
match Overlength /\%81v.\+/

highlight Visual ctermbg=black ctermfg=white
" -----------
" Indentation
" -----------
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

