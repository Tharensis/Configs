set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'jnwhiteh/vim-golang'
Plugin 'BurntSushi/vim-toml'
Plugin 'wting/rust.vim'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'FredKSchott/CoVim'

syntax on
filetype plugin indent on

set enc=utf-8 tenc=utf-8
au BufNewFile,BufRead *.tex set ft=tex
au FileType tex setl spell spelllang=en
au FileType tex setl tw=72

set autoindent
set smartindent
set modeline
set tabstop=4
set shiftwidth=4
set number

colo slate

set hlsearch
hi Search ctermbg=DarkBlue ctermfg=White

set viewoptions=cursor,folds,slash,unix
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set scrolloff=10

map <C-n> :NERDTreeToggle<CR>

command W w ! sudo tee %
