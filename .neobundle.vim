if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" プラグインの読み込み {{{

" 一般 {{{
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\  'build' : {
\    'windows' : 'make -f make_mingw32.mak',
\    'cygwin'  : 'make -f make_cygwin.mak',
\    'mac'     : 'make -f make_mac.mak',
\    'unix'    : 'make -f make_unix.mak',
\  },
\}

NeoBundle 'bling/vim-airline'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'houtsnip/vim-emacscommandline'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nelstrom/vim-qargs'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundleLazy 'Shougo/neocomplete', {
\  'depends' : ['Shougo/neosnippet', 'Shougo/context_filetype.vim'],
\  'vim_version' : '7.3.885',
\  'autoload' : {
\    'insert' : 1,
\  }
\}
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/ShowMarks'
NeoBundle 'vimtaku/hl_matchit.vim'
NeoBundle 'Yggdroot/indentLine'
" }}}

" Haskell {{{
NeoBundleLazy 'dag/vim2hs',                {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'eagletmt/ghcmod-vim',       {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'kana/vim-filetype-haskell', {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'ujihisa/ref-hoogle',        {'autoload':{'filetypes':['haskell']}}
" }}}

" Ruby {{{
" }}}

" colorscheme {{{
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'desert-warm-256'
NeoBundle 'desert256.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'wombat256.vim'
NeoBundle 'Zenburn'
" }}}

filetype plugin indent on
NeoBundleCheck

" }}}

" プラグインごとの初期設定 {{{

" neosnippet {{{
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif

"honza/vim-snippetsとか使う場合
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}}

" neocomplete {{{
let s:bundle = neobundle#get('neocomplete')
function! s:bundle.hooks.on_source(bundle)
  let g:acp_enableAtStartup = 0                                 " AutoComplPopを無効にする
  let g:neocomplete#enable_at_startup = 1                       " 起動時に有効
  let g:neocomplete#enable_smart_case = 1                       " smart_caseで絞る
  let g:neocomplete#sources#syntax#min_keyword_length = 4
  " let g:neocomplete#sources#dictionary#dictionaries = {
  " \  'default' : '',
  " \  'vimshell' : $HOME.'/.vimshell_hist',
  " \  'scheme' : $HOME.'/.gosh_completions'
  " \}

  inoremap <expr><C-G> neocomplete#undo_completion()
  inoremap <expr><C-L> neocomplete#complete_common_string()

  inoremap <silent> <CR> <C-R>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction

  inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  let g:neocomplete#enable_auto_select = 1

  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endfunction
unlet s:bundle
" }}}

" quickrun {{{
" g:quickrun#default_configを参考に上書きする感じで設定する
" 各言語ごとの設定は ~/.vim/ftplugin/[filetype]/mysetting.vim
let g:quickrun_config = {}
let g:quickrun_config['_'] = {
\  "runner" : "vimproc",
\  "runner/vimproc/updatetime" : 60,
\}
" }}}

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
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアするか
let g:ctrlp_use_migemo = 1            " 日本語ファイル名のマッチ(regexpモード時のみ動作)
let g:ctrlp_max_files = 100000        " ファイルスキャンのリミット
let g:ctrlp_mruf_max = 1000           " MRUの記録数
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
" }}}

" syntastic {{{
" 各言語ごとに走らせるツール設定は ~/.vim/ftplugin/[filetype]/mysetting.vim
let g:syntastic_mode_map = {
\  'mode': 'active',
\  'passive_filetypes': []
\}
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

" vim-submode {{{
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')
" }}}

" vim-surround {{{
" after/pluginの下にremap定義あり
"call SurroundRegister('g', 'jk', "「\r」") 何故かエラーになる
" }}}

" smart-input {{{
"トリガの追加
"call smartinput#map_to_trigger('i', '!', '!', '!')
"\%# でカーソル位置を表す正規表現
" call smartinput#define_rule({
" \ 'at': '\%#',
" \ 'char': '!',
" \ 'input': '!!',
" \ 'filetype': ['vi']})
"}}}

" smart-input-endwise {{{
call smartinput_endwise#define_default_rules()
"}}}

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

" emmet-vim {{{
let g:user_emmet_mode='iv'
let g:user_emmet_install_global = 0
autocmd FileType html,xml,eruby,css EmmetInstall
let g:user_emmet_leader_key='<C-Y>'
" }}}

" hl-matchit {{{
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_speed_level = 1
let g:hl_matchit_allow_ft = 'html,vim,ruby,sh'
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
