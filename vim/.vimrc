if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall -sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'joshdick/onedark.vim'
    Plug 'luochen1990/rainbow'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-emoji'
    Plug 'edkolev/tmuxline.vim'
call plug#end()

set t_Co=256
syntax on
colorscheme onedark
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:rainbow_active = 1

set nocompatible
set backspace=indent,eol,start
set clipboard=unnamedplus
set mouse=a
set path+=**
set number relativenumber
set hidden nobackup noswapfile
set hlsearch incsearch
set showmatch
set wildmenu
set smartcase

set expandtab smarttab
set tabstop=4 shiftwidth=4
set scrolloff=4
set autoindent smartindent cindent

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv
