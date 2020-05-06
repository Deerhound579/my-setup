call plug#begin('~/.vim/plugged')

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
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'kamykn/spelunker.vim' " better spellcheck
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
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

let mapleader=","
let loaded_netrwPlugin = 1
let g:rainbow_active = 1
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" ======================
" INSERT REMAP
" ======================
"
inoremap jk <ESC> " ======================

" ======================
" NORMAL REMAP
" ======================
nnoremap <leader>/ :set spell!<CR>
" switch python interpreter
nnoremap <silent> <leader>pp : <C-u>CocCommand python.setInterpreter<CR>
nnoremap <silent> <leader>c : <C-u>CocConfig<CR>
nnoremap <CR> o<Esc>k
nnoremap <S-CR> O<Esc>j
nnoremap <leader>ev :split $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR>
" =======================
set nocompatible
set encoding=utf-8
set mouse=a
set clipboard=unnamed " system clipboard
" set spell spelllang=en_us
set nospell " disable vim's spell check
set laststatus=2 " always show status bar
set tabstop=4
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set hlsearch " Enable highlighting for search results
" Color scheme
set background=dark
syntax on
set termguicolors
let ayucolor="dark"
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="soft"
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
" Show trailing white space
"set listchars=trail:.
"set list
"
" ==================================================================
" Lightline Config 
" ==================================================================
set noshowmode
let g:lightline = {
            \ 'mode_map': {
            \ 'n' : 'N',
            \ 'i' : 'I',
            \ 'R' : 'R',
            \ 'v' : 'V',
            \ 'V' : 'VL',
            \ "\<C-v>": 'VB',
            \ 'c' : 'C',
            \ 's' : 'S',
            \ 'S' : 'SL',
            \ "\<C-s>": 'SB',
            \ 't': 'T',
            \ },
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'fileformat': "LightlineFileformat",
            \   'filetype': "LightlineFiletype",
            \   'cocstatus': 'LightlineCocStatus'
            \ },
            \ }


function! LightlineFileformat() 
    return winwidth(0) > 70 ? &fileformat: ''
endfunction

" trim virtualenv information
function! LightlineCocStatus()
    let l:status = coc#status()
    if winwidth(0) < 70
        return ''
    endif
    return &filetype ==# 'python' ? 
                \ matchstr(status, "'.*'") . ': ' . matchstr(status, "\\d.\\d.\\d") 
                \ : status
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction


" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
autocmd FileType json syntax match Comment +\/\/.\+$+ " json file


if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" ==================================================================
" Defx Config 
" ==================================================================
"
" https://juejin.im/entry/5d92f7eaf265da5b926bc022
let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

function! s:defx_mappings() abort
	setlocal signcolumn=no
    " Resize explorer using > and <
    nnoremap <silent><buffer><expr> > defx#do_action('resize',
        \ defx#get_context().winwidth + 10)
    nnoremap <silent><buffer><expr> < defx#do_action('resize',
        \ defx#get_context().winwidth - 10)
    nnoremap <silent><buffer><expr> l 
        \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> <CR>
        \ defx#is_directory() ?
        \ defx#do_action('open_directory') :
        \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
	nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> s
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction


call defx#custom#column('icon', {
    \ 'directory_icon': '▸',
    \ 'opened_icon': '▾',
    \ 'root_icon': ' ',
    \ })
call defx#custom#option('_', {
    \ 'columns': 'indent:git:icons:filename',
    \ 'winwidth': 25,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'listed': 1,
    \ 'show_ignored_files': 0,
    \ 'root_marker': '≡ ',
    \ 'ignored_files':
    \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
    \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
    \ })

" https://github.com/Shougo/defx.nvim/issues/175
function! s:open_defx_if_directory()
  let l:full_path = expand(expand('%:p'))
  if isdirectory(l:full_path)
    execute "Defx `expand('%:p')` | bd" . expand('%:r') 
  endif
endfunction

augroup defx_config
    autocmd!
    autocmd FileType defx call s:defx_mappings()
    autocmd BufEnter * call s:open_defx_if_directory()
augroup END
" ======================
" coc config
" ======================
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-snippets
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <LocalLeader>f  <Plug>(coc-format-selected)
nmap <LocalLeader>f  <Plug>(coc-format-selected) 
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
"
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:python3_host_prog="/Users/lisixian/.pyenv/versions/neovim/bin/python"

" " Neoformat Config

" let g:neoformat_enabled_python = ['yapf']
" let g:neoformat_enabled_javascript = ['prettier']
" let g:neoformat_only_msg_on_error = 1

" augroup fmt
"     autocmd!
"     autocmd BufWritePre * undojoin | Neoformat
" augroup END

" LeaderF
"
nnoremap <Leader>n :<C-u>LeaderfFunction<CR>
nnoremap <Leader>m :<C-u>LeaderfMru<CR>

" Rainbow
"
let g:rainbow_conf = {
            \	'guifgs': ['gold', 'DeepSkyBlue1', 'orange', 'maroon1','turquoise1', 'LightPink' ],
            \	'ctermfgs': ['lightyellow', 'lightblue', 'lightcyan', 'lightmagenta'],
            \	'operators': '_,_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'*': {},
            \		'tex': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \		},
            \		'lisp': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'vim': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \		},
            \		'html': {
            \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'css': 0,
            \	}
            \} 

" spell check
let g:spelunker_check_type = 2
let g:spelunker_disable_uri_checking = 1
let g:spelunker_disable_backquoted_checking = 1

" git gutter
let g:gitgutter_terminal_reports_focus=0
function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction
