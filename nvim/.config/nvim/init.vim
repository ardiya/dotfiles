" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('data') . '/plugged')

" "{{ The Basics }}
Plug 'itchyny/lightline.vim'                       " Lightline statusbar
Plug 'luochen1990/rainbow'                         " Color bracket rainbow
Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview

"{{ File management }}
Plug 'preservim/nerdtree'                         " Nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree

"{{ Productivity }}
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tabnine/YouCompleteMe'
Plug 'kgreenek/vim-ros-ycm'

" "{{ Themes }}
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

" "{{ Tim Pope Plugins }}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'                          " Change surrounding marks

" "{{ Junegunn Choi Plugins }}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
Plug 'junegunn/vim-emoji'                          " Vim needs emojis!

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" "{{ Extra Plugin Settings }}
colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:rainbow_active = 1
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

set nocompatible                " disable compatibility to old-time vi
set number relativenumber       " Display line numbers
set showmatch                   " highlight matching [{()}]
set path+=**                    " Searches current directory recursively.
set wildmenu                    " Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set mouse=a                     " Enable mouse support

" insert four spaces instead of a tab character.
set tabstop=4
set shiftwidth=4
set expandtab

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Neovide settings
set guifont=FantasqueSansMono\ Nerd\ Font\ Mono:h16
let g:neovide_refresh_rate=60
let g:neovide_remember_window_size = v:true
let g:neovide_transparency=0.8
let g:neovide_cursor_vfx_mode="sonicboom"
let g:neovide_cursor_vfx_particle_lifetime=1.5
let g:neovide_cursor_trail_length=1.0

let g:ycm_clangd_binary_path = getenv('HOME') . '/Software/clang+llvm-13.0.0/bin/clangd'
