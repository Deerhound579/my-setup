let g:gitgutter_terminal_reports_focus=0

function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  execute 'normal! zz'
  if line('.') == line
    1
    GitGutterNextHunk
    execute 'normal! zz'
  endif
endfunction

function! GitGutterPrevHunkCycle()
  let line = line('.')
  silent! GitGutterPrevHunk
  execute 'normal! zz'
  if line('.') == line
    execute 'normal! G'
    GitGutterPrevHunk
    execute 'normal! zz'
  endif
endfunction

nnoremap <silent> ]c :call GitGutterNextHunkCycle()<CR>
nnoremap <silent> [c :call GitGutterPrevHunkCycle()<CR>

