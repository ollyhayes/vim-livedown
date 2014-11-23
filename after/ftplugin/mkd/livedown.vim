if !exists('g:livedown_open')
  let g:livedown_open = 1
endif

if !exists('g:livedown_port')
  let g:livedown_port = 1337
endif

function! s:buffer_switched()
  call system("livedown start " . expand('%:p') . 
        \ (g:livedown_open ? " --open" : "") .
        \ " --port " . g:livedown_port .
        \ " &")
  let g:livedown_open = 0
endfunction

function! LivedownPreview()
  call system("livedown start " . expand('%:p') . 
        \ " --open" .
        \ " --port " . g:livedown_port .
        \ " &")
endfunction

augroup livedown
  au! BufWinEnter <buffer> call s:buffer_switched()
  au! VimLeave <buffer> call system("livedown stop &")
augroup END
