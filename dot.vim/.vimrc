call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'

call plug#end()

inoremap jk <ESC>
let mapleader=" "
syntax on
set encoding=utf-8
set clipboard=unnamedplus
set spell spelllang=en_us
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Enable highlighting for search results
set hlsearch
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!

" Color scheme

let g:seoul256_background = 234
let g:seoul256_background = 255
colo seoul256-light
