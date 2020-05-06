call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', {'as': 'dracula'}
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let mapleader=","

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
nmap <S-CR> O<Esc>j

set nocompatible
set encoding=utf-8
set clipboard=unnamed " system clipboard
set spell spelllang=en_us
set laststatus=2 " always show status bar
set tabstop=4
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set hlsearch " Enable highlighting for search results
" Color scheme
set background=dark
syntax on
set termguicolors
colorscheme gruvbox
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
      \ 'colorscheme': 'dracula',
      \ }

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
