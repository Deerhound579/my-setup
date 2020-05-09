" ==================================================================
" Defx Config 
" ==================================================================
"
" https://juejin.im/entry/5d92f7eaf265da5b926bc022
let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>d
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
    execute "Defx `expand('%:p')` | bd " . expand('%:r') 
  endif
endfunction

augroup defx_config
    autocmd!
    autocmd FileType defx call s:defx_mappings()
    autocmd BufEnter * call s:open_defx_if_directory()
augroup END
