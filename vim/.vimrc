" Srivathsan's vimrc

" disable startup message
set shortmess+=I

source ~/.vim/configs/pretty.vim
source ~/.vim/configs/interface.vim
source ~/.vim/configs/plugins.vim
source ~/.vim/configs/filetype_specs.vim
source ~/.vim/configs/commands.vim

set shell=/bin/bash

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

