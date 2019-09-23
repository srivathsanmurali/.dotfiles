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
"Plug 'airblade/vim-gitgutter'
" fugitive to work on git
Plug 'tpope/vim-fugitive'

" fzf
" Install fzf in your system
Plug 'junegunn/fzf.vim'
nnoremap <C-p> <Esc>:GFiles<CR>
inoremap <C-p> <Esc>:GFiles<CR>
nnoremap <C-d> <Esc>:Files<CR>
inoremap <C-d> <Esc>:Files<CR>

" Pandoc plugin
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown' }
" tabular
Plug 'godlygeek/tabular', { 'for': 'markdown' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" " let g:ycm_autoclose_preview_window_after_completion = 1
" " let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_show_diagnostics_ui = 0
" set completeopt-=preview

Plug 'pboettch/vim-cmake-syntax', { 'for': 'cmake'}

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }
set noshowmode

Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DoxygenToolkit.vim'

Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plug 'sickill/vim-monokai'
Plug 'crusoexia/vim-monokai'

Plug 'jeetsukumaran/vim-buffergator'
Plug 'editorconfig/editorconfig-vim'

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

Plug 'srivathsanmurali/OpenAPIValidate.vim'

Plug 'zhamlin/tiler.vim'

" Initialize plugin system
call plug#end()
