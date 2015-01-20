set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/c.vim'

call vundle#end()

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

set tags=tags;

set background=dark
colo ron

set hlsearch
hi Search ctermbg=DarkBlue ctermfg=White

set viewoptions=cursor,folds,slash,unix
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set scrolloff=10
