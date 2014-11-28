augroup livedown
  au! BufWinEnter <buffer> call LivedownPreview()
  au! VimLeave <buffer> call LivedownKill()
augroup END
