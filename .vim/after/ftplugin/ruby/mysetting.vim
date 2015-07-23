if exists('b:did_after_ftplugin_ruby_mysetting')
  finish
endif
let b:did_after_ftplugin_ruby_mysetting = 1

setlocal ts=2 sts=0 sw=2

augroup ruby
  autocmd!
augroup END

" nnoremap <buffer> <unique> [PREFIX]r :<C-u>Unite -start-insert ref/refe<CR>
" nnoremap <buffer> <unique> [PREFIX]R :<C-u>UniteWithCursorWord -start-insert ref/refe<CR>

" syntastic {{{
let g:syntastic_ruby_checkers = ['rubocop']
" }}}
