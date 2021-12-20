if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall -sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-emoji'
    Plug 'edkolev/tmuxline.vim'
call plug#end()

let g:rainbow_active = 1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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
set autoindent smartindent cindent

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif
