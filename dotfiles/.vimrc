set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'fatih/vim-go'
Plugin 'fatih/molokai'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete.vim'
Plugin 'BurntSushi/vim-toml'
Plugin 'wting/rust.vim'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'eglimi/vim-rust'

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

map <C-n> :NERDTreeToggle<CR>

command W w ! sudo tee %

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
