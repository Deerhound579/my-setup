let mapleader=","

" ======================
" INSERT REMAP
" ======================
"
inoremap jk <ESC> 
inoremap <leader>k <C-o>dd
inoremap <leader>a <C-o>0
inoremap <C-z>     <C-o>u
" ======================
" NORMAL REMAP
" ======================
nnoremap <leader>/ :set spell!<CR>
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>w <C-w>w
nnoremap <CR> o<Esc>k
nnoremap <S-CR> O<Esc>j
nnoremap <silent> <S-Up> <c-w>+
nnoremap <silent> <S-Down> <c-w>-
nnoremap <silent> <S-Left> <c-w><
nnoremap <silent> <S-Right> <c-w>>
" ======================
" TERMINAL REMAP
" ======================
tnoremap <C-n> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
