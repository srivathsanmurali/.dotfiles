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

" tabular
Plug 'godlygeek/tabular'

" git gutter to track changes
Plug 'airblade/vim-gitgutter'

"control p
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" tabbar - use with ctags
Plug 'majutsushi/tagbar'
let g:tagbar_sort=0
map <C-t> :Tagbar<CR>


" --------------------------
" Languages specific plugins
" --------------------------

" rust plugin
" provides -> sytax highlighting
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" clang-format for c++
Plug 'rhysd/vim-clang-format'
let g:clang_format#code_style = "mozilla"

" syntax highlighting for elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
" uses mix format to format elixir code
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

" Initialize plugin system
call plug#end()
