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
