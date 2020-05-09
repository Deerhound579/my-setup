if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Theme
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'itchyny/lightline.vim'

" Functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/LeaderF'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'kamykn/spelunker.vim' " better spellcheck
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'bkad/camelcasemotion'
if has('nvim')
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-Icons'
Plug 'kristijanhusak/defx-git'
else
Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

source $HOME/.config/nvim/mapping.vim

source $HOME/.config/nvim/plugins/lightline.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/defx.vim
source $HOME/.config/nvim/plugins/leaderf.vim
source $HOME/.config/nvim/plugins/gitgutter.vim
source $HOME/.config/nvim/plugins/misc.vim

let loaded_netrwPlugin = 1
let g:python_highlight_space_errors = 0
let g:rainbow_active = 1
" ======================
" GENERAL 
" ======================
" Absolute line number in insert mode
" Color scheme
" Relative in normal mode
" set spell spelllang=en_us
syntax on
let ayucolor="dark"
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="soft"
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox
set clipboard=unnamed " system clipboard
set encoding=utf-8
set expandtab " On pressing tab, insert 4 spaces
set hlsearch " Enable highlighting for search results
set laststatus=2 " always show status bar
set mouse=a
set nocompatible
set nospell " disable vim's spell check
set number relativenumber
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set ignorecase
set smartcase
set splitbelow
set splitright
set tabstop=4
set termguicolors

command! -nargs=* T execute 'split | resize' . float2nr(round(winheight(0)*0.3)) . '| terminal <args>'
command! -nargs=* VT execute 'vsplit | vertical resize' . float2nr(round(winwidth(0)*0.4)) . '| terminal <args>'
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber

    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

lua require'colorizer'.setup()
