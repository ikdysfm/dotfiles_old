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
NeoBundle 'bling/vim-airline'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'houtsnip/vim-emacscommandline'
NeoBundle 'vim-scripts/ShowMarks'
NeoBundle 'nelstrom/vim-qargs'
NeoBundle 'tpope/vim-fugitive'
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
NeoBundle 'chriskempson/base16-vim'
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
let g:NERDTreeMinimalUI=1   " メニューのショートカットを非表示にするかどうか
let g:NERDTreeDirArrows=0   " ツリー表示の記号を非表示にするかどうか
" }}}"

" ctrlp {{{
let g:ctrlp_by_filename = 0           " 起動時にdオプションを有効にするか
let g:ctrlp_regexp = 0                " 起動時にrオプションを有効にするか
let g:ctrlp_clear_cache_on_exit = 1   " 終了時キャッシュをクリアするか
let g:ctrlp_use_migemo = 1            " 日本語ファイル名のマッチ(regexpモード時のみ動作)
let g:ctrlp_mruf_max = 1000           " MRUの記録数
" }}}

" vim-airline {{{
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1      " タブラインにもairlineを適用
let g:airline#extensions#tabline#show_buffers = 0 " （タブが一個の場合）バッファのリストをタブラインに表示する機能をオフ
let g:airline#extensions#tabline#tab_nr_type = 1  " 0でそのタブで開いてるウィンドウ数、1で左のタブから連番
let g:airline#extensions#tabline#fnamemod = ':t'  " タブに表示する名前（fnamemodifyの第二引数）
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
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#777777'
let g:indentLine_char = '¦'
let g:indentLine_fileTypeExclude = ['nerdtree']
" }}}

" showmarks {{{
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`.^[]<>"
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
