if exists('b:did_ftplugin_haskell_mysetting')
  finish
endif
let b:did_ftplugin_haskell_mysetting = 1

setlocal ts=2 sts=0 sw=2

augroup haskell
  autocmd!
augroup END

" ghc-mod {{{
nnoremap <buffer> <unique> [GHC_MOD] <Nop>
nmap     <buffer> <unique> [PREFIX]g [GHC_MOD]
nnoremap <buffer> <unique> [GHC_MOD]t :<C-u>GhcModType<CR>
nnoremap <buffer> <unique> [GHC_MOD]T :<C-u>GhcModTypeClear<CR>
nnoremap <buffer> <unique> [GHC_MOD]c :<C-u>GhcModCheck<CR>
nnoremap <buffer> <unique> [GHC_MOD]l :<C-u>GhcModLint<CR>

autocmd! haskell BufWritePost <buffer> GhcModCheckAndLintAsync
" }}}
