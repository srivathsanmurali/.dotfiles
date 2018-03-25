" VUNDLE SETUP
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
Plugin 'mhinz/vim-mix-format'

" Trigger update after bundles loaded
if vundleinstalled == 0
  PluginInstall
endif
