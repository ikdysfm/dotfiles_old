if exists('b:did_after_ftplugin_vim_mysetting')
  finish
endif
let b:did_after_ftplugin_vim_mysetting = 1

setlocal ts=2 sts=0 sw=2

augroup vim
  autocmd!
augroup END
