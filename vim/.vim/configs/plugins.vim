" Plug setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Provides plug help
Plug 'junegunn/vim-plug'

" git gutter to track changes
Plug 'airblade/vim-gitgutter'
" fugitive to work on git
Plug 'tpope/vim-fugitive'

"control p
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" tabbar - use with ctags
Plug 'majutsushi/tagbar'
let g:tagbar_sort=0
map <C-t> :Tagbar<CR>

" Pandoc plugin
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown' }
" tabular
Plug 'godlygeek/tabular', { 'for': 'markdown' }

Plug 'valloric/youcompleteme'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" --------------------------
" Languages specific plugins
" --------------------------

" rust plugin
" provides -> sytax highlighting
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" clang-format for c++
Plug 'rhysd/vim-clang-format', { 'for': 'cpp' }
let g:clang_format#code_style = "mozilla"

" syntax highlighting for elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
" uses mix format to format elixir code
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

" Initialize plugin system
call plug#end()
