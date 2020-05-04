call plug#begin('~/.vim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

" ======================
" INSERT REMAP
" ======================

inoremap jk <ESC>

" ======================
" NORMAL REMAP
" ======================
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!
nmap <CR> o<Esc>k
nmap <S-Enter> O<Esc>j
" compile and run cpp
let mapleader=" "
syntax on
set encoding=utf-8
set clipboard=unnamedplus
set spell spelllang=en_us
set laststatus=2
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Enable highlighting for search results
set hlsearch

" Color scheme
set termguicolors
let ayucolor="mirage"
colo ayu
set clipboard+=ideaput
" Absolute line number in insert mode
" Relative in normal mode
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" Change visual selection color
hi Visual ctermfg=NONE ctermbg=LightYellow cterm=bold,underline
" Show trailing white space
"set listchars=trail:.
"set list
"
" ======================
" Lightline Config 
" ======================
"
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Blue',
      \ }
