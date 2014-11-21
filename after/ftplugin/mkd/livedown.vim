if !exists('g:livedown_open')
    let g:livedown_open = 1
endif

function! s:buffer_entered()
  call system("livedown start " . expand('%:p') . (g:livedown_open ? " --open" : "") . " &")
  let g:livedown_open = 0
endfunction

augroup livedown
  au!
  au BufEnter,BufWinEnter <buffer> call s:buffer_entered()
  au VimLeave <buffer> call system("livedown stop &")
augroup END
