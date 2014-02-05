if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" プラグインの読み込み {{{

" 一般 {{{
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\   'windows' : 'make -f make_mingw32.mak',
\   'cygwin'  : 'make -f make_cygwin.mak',
\   'mac'     : 'make -f make_mac.mak',
\   'unix'    : 'make -f make_unix.mak',
\   },
\ }

" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimfiler'
" NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-surround'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'Yggdroot/indentLine'
" }}}

" Haskell {{{
NeoBundleLazy 'eagletmt/ghcmod-vim',       {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'kana/vim-filetype-haskell', {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'dag/vim2hs',                {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'ujihisa/ref-hoogle',        {'autoload':{'filetypes':['haskell']}}
" }}}

" colorscheme {{{
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'desert256.vim'
NeoBundle 'desert-warm-256'
NeoBundle 'Zenburn'
NeoBundle 'wombat256.vim'
NeoBundle 'w0ng/vim-hybrid'
" }}}

filetype plugin indent on
NeoBundleCheck

" }}}

" プラグインごとの初期設定 {{{

" nerdtree {{{
" 引数なしで起動された場合ツリーを表示
autocmd vimenter * if !argc() | NERDTree | endif
" ツリーウィンドウだけ残るような場合はVimを終了する
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap [PREFIX]t  :<C-u>NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1  " 隠しファイルを表示するか
let g:NERDTreeMinimalUI=0   " メニューのショートカットを非表示にするかどうか
let g:NERDTreeDirArrows=0   " ツリー表示の記号を非表示にするかどうか
" }}}"

" ctrlp {{{
let g:ctrlp_by_filename = 0           " 起動時にdオプションを有効にするか
let g:ctrlp_regexp = 0                " 起動時にrオプションを有効にするか
let g:ctrlp_clear_cache_on_exit = 1   " 終了時キャッシュをクリアするか
let g:ctrlp_use_migemo = 1            " 日本語ファイル名のマッチ(regexpモード時のみ動作)
let g:ctrlp_mruf_max = 1000           " MRUの記録数
" }}}

" powerline {{{
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'default'
let g:Powerline_theme = 'default'
" }}}

" vim-surround {{{
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround
"call SurroundRegister('g', 'jk', "「\r」") 何故かエラーになる
" }}}

" yankround {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
"nmap gp <Plug>(yankround-gp)
"nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" yankroundが有効でない場合はCtrlPを動かす
nnoremap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"
" }}}

" indentLine {{{
let g:indentLine_color_term = 255
let g:indentLine_color_gui = '#444444'
let g:indentLine_char = '¦'
let g:indentLine_fileTypeExclude = ['nerdtree']
" }}}

" vim2hs {{{
let s:bundle = neobundle#get('vim2hs')
function! s:bundle.hooks.on_source(bundle)
  " let g:haskell_conceal_wide          = 0
  " let g:haskell_conceal               = 0
  " let g:haskell_conceal_enumerations  = 0
  " let g:haskell_quasi                 = 0
  " let g:haskell_interpolation         = 0
  " let g:haskell_regex                 = 0
  " let g:haskell_jmacro                = 0
  " let g:haskell_shqq                  = 0
  " let g:haskell_sql                   = 0
  " let g:haskell_json                  = 0
  " let g:haskell_xml                   = 0
  " let g:haskell_hsp                   = 0
  " let g:haskell_multiline_strings     = 0
endfunction
unlet s:bundle
" }}}

" }}}

" }}}
