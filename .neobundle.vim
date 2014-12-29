if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

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

NeoBundle 'vim-jp/vimdoc-ja'

" help unite-source-file
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'bling/vim-airline'
NeoBundle 'cohama/vim-smartinput-endwise'
"NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'houtsnip/vim-emacscommandline'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-surround'
"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nelstrom/vim-qargs'
"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundleLazy 'Shougo/neocomplete', {
\  'depends' : ['Shougo/neosnippet', 'Shougo/context_filetype.vim'],
\  'vim_version' : '7.3.885',
\  'autoload' : {
\    'insert' : 1,
\  }
\}
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tyru/eskk.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'vim-scripts/ShowMarks'
NeoBundle 'vimtaku/hl_matchit.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundleLazy "majutsushi/tagbar", {"autoload":{"commands":["TagbarToggle"]}}
"NeoBundleLazy "wesleyche/SrcExpl", {"autoload":{"commands":["SrcExplToggle"]}}
" }}}

" markdown {{{
NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'kannokanno/previm', {'autoload':{'filetypes':['markdown']}}
" }}}

" Haskell {{{
NeoBundleLazy 'dag/vim2hs',                {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'eagletmt/ghcmod-vim',       {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'kana/vim-filetype-haskell', {'autoload':{'filetypes':['haskell']}}
" }}}

" TypeScript {{{
NeoBundleLazy 'leafgarland/typescript-vim', {'autoload':{'filetypes':['typescript']}}
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

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" }}}

" プラグインごとの初期設定 {{{

" unite {{{
"nnoremap [UNITE] <Nop>
"nmap [PREFIX]<Space> [UNITE]

""let g:unite_enable_start_insert = 1   " 常にインサートモードで起動する

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 200
endif

" オプションについてはhelp unite-options
"nnoremap <silent> [PREFIX]a :<C-u>Unite alignta:options<CR>
"xnoremap <silent> [PREFIX]a :<C-u>Unite alignta:arguments<CR>
nnoremap <silent> [PREFIX]b :<C-u>Unite -start-insert -buffer-name=files buffer file_mru<CR>
nnoremap <silent> [PREFIX]B :<C-u>Unite -start-insert -buffer-name=files buffer file_mru file_rec<CR>
"nnoremap <silent> [PREFIX]c :<C-u>Unite -start-insert -auto-preview colorscheme<CR>
nnoremap <silent> [PREFIX]g :<C-u>Unite grep:. -no-quit -buffer-name=search-buffer<CR>
nnoremap <silent> [PREFIX]G :<C-u>UniteResume -no-quit search-buffer<CR>
nnoremap <silent> [PREFIX]h :<C-u>Unite -start-insert help<CR>
nnoremap <silent> [PREFIX]H :<C-u>UniteWithCursorWord -start-insert help<CR>
"nnoremap <silent> [PREFIX]l :<C-u>Unite -start-insert line<CR>
nnoremap <silent> [PREFIX]o :<C-u>Unite -start-insert outline<CR>

autocmd! FileType unite call s:my_unite_settings()
function! s:my_unite_settings()
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction
" }}}

" vimfiler {{{
let g:vimfiler_as_default_explorer=1                    " netrwの代わりにデフォルトのファイラーにする

" VimFilerをExplorerっぽく使う
nnoremap <silent> [PREFIX]f :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<CR>

autocmd! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
  nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<CR>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<CR>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)
" }}}

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

" eskk.vim {{{
" smartinputのマッピングを上書く
autocmd VimEnter * imap <C-j> <Plug>(eskk:toggle)
autocmd VimEnter * cmap <C-j> <Plug>(eskk:toggle)

" let g:eskk#directory = "~/.eskk"
" let g:eskk#auto_save_dictionary_at_exit = 1

" ユーザ辞書
let g:eskk#dictionary = {
\  'path': "~/.skk-jisyo",
\  'sorted': 0,
\  'encoding': 'utf-8',
\}

" システム辞書
let g:eskk#large_dictionary = {
\  'path': "~/.eskk_dic/SKK-JISYO.L",
\  'sorted': 1,
\  'encoding': 'euc-jp',
\}

" ascii: ivory4:#8b8b83, gray:#bebebe
" hira: coral4:#8b3e2f, pink:#ffc0cb
" kata: forestgreen:#228b22, green:#00ff00
" abbrev: royalblue:#4169e1
" zenei: gold:#ffd700
let g:eskk#cursor_color = {
\  'ascii': ['#8b8b83', '#bebebe'],
\  'hira': ['#8b3e2f', '#ffc0cb'],
\  'kata': ['#228b22', '#00ff00'],
\  'abbrev': '#4169e1',
\  'zenei': '#ffd700',
\}
" }}}

" quickrun {{{
" g:quickrun#default_configを参考に上書きする感じで設定する
" filetypeごとの設定は ~/.vim/ftplugin/[filetype]/mysetting.vim
nnoremap <silent> [PREFIX]r :<C-u>QuickRun -outputter/buffer/split ":botright"<CR>
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {}
let g:quickrun_config['_'] = {
\  "runner" : "vimproc",
\  "runner/vimproc/updatetime" : 60,
\}
" これもそのうち移動
" let g:quickrun_config['markdown'] = {
" \  'type': 'markdown/pandoc',
" \  'outputter': 'browser',
" \  'cmdopt': '-s'
" \}
" }}}

" tagbar {{{
let s:bundle = neobundle#get('tagbar')
function! s:bundle.hooks.on_source(bundle)
  let g:tagbar_width = 40
  nnoremap <silent> [PREFIX]t :TagbarToggle<CR>
endfunction
unlet s:bundle
" }}}

" SrcExpl {{{
" nnoremap [SRC_EXPL] <Nop>
" nmap [PREFIX]s [SRC_EXPL]
" nnoremap <silent> [SRC_EXPL]<CR> :SrcExplToggle<CR>
"
" let s:bundle = neobundle#get('SrcExpl')
" function! s:bundle.hooks.on_source(bundle)
"   let g:SrcExpl_gobackKey = '<C-b>'
"   let g:SrcExpl_RefreshTime = 1000                        " カーソルを移動した際の更新時間
"   let g:SrcExpl_isUpdateTags = 0                          " 自動的にタグを更新しない
"   let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %' " タグの更新コマンド
"   let g:SrcExpl_winHeight = 12                            " 表示行数
"
"   " プロジェクト全体のタグを更新する関数
"   function! g:SrcExpl_UpdateAllTags()
"     let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
"     call g:SrcExpl_UpdateTags()
"     let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
"   endfunction
"
"   nnoremap <silent> [SRC_EXPL]u :call g:SrcExpl_UpdateTags()<CR>
"   nnoremap <silent> [SRC_EXPL]a :call g:SrcExpl_UpdateAllTags()<CR>
"   nnoremap <silent> [SRC_EXPL]n :call g:SrcExpl_NextDef()<CR>
"   nnoremap <silent> [SRC_EXPL]p :call g:SrcExpl_PrevDef()<CR>
" endfunction
" unlet s:bundle
" }}}

" nerdtree {{{
" 引数なしで起動された場合ツリーを表示
"autocmd vimenter * if !argc() | NERDTree | endif
" ツリーウィンドウだけ残るような場合はVimを終了する
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"nnoremap [PREFIX]t  :<C-u>NERDTreeToggle<CR>
"
"let g:NERDTreeShowHidden=1  " 隠しファイルを表示するか
"let g:NERDTreeMinimalUI=1   " メニューのショートカットを非表示にするかどうか
"let g:NERDTreeDirArrows=0   " ツリー表示の記号を非表示にするかどうか
" }}}"

" ctrlp {{{
"let g:ctrlp_by_filename = 0           " 起動時にdオプションを有効にするか
"let g:ctrlp_regexp = 0                " 起動時にrオプションを有効にするか
"let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアするか
"let g:ctrlp_use_migemo = 1            " 日本語ファイル名のマッチ(regexpモード時のみ動作)
"let g:ctrlp_max_files = 100000        " ファイルスキャンのリミット
"let g:ctrlp_mruf_max = 1000           " MRUの記録数
"let g:ctrlp_show_hidden = 1
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
" }}}

" syntastic {{{
" filetypeごとに走らせるツール設定は ~/.vim/ftplugin/[filetype]/mysetting.vim
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
let g:indentLine_faster = 1
" }}}

" showmarks {{{
"let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`.^[]<>"
" }}}

" emmet-vim {{{
let g:user_emmet_mode='iv'
let g:user_emmet_install_global = 0
autocmd FileType html,xml,eruby,css,markdown EmmetInstall
let g:user_emmet_leader_key='<C-Y>'
" }}}

" vim-markdown {{{
let g:markdown_fenced_languages = [
\ 'vim',
\ 'css',
\ 'xml',
\ 'javascript',
\ 'js=javascript',
\ 'json=javascript',
\ 'haskell',
\ 'hs=haskell',
\ 'ruby',
\ 'erb=eruby',
\ 'sql',
\ 'sh',
\]
" }}}

" previm {{{
let g:previm_open_cmd = 'open -a Safari'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
" }}}

" hl-matchit {{{
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_speed_level = 1
let g:hl_matchit_allow_ft = 'html,vim,ruby,sh'
" }}}

" Alignta {{{
" let g:alignta_default_options = "<<<1:1"
"
" let g:unite_source_alignta_preset_arguments = [
"       \ ["Align at '='", '='],
"       \ ["Align at ':'", ':'],
"       \ ["Align at '|'", '|'],
"       \ ["Align at ')'", ')'],
"       \ ["Align at ']'", ']'],
"       \ ["Align at '}'", '}'],
"       \]
"
" let s:comment_leadings = '^\s*\("\|#\|/\*\|//\|<!--\)'
" let g:unite_source_alignta_preset_options = [
"       \ ["Justify Left",      '<<' ],
"       \ ["Justify Center",    '||' ],
"       \ ["Justify Right",     '>>' ],
"       \ ["Justify None",      '==' ],
"       \ ["Shift Left",        '<-' ],
"       \ ["Shift Right",       '->' ],
"       \ ["Shift Left  [Tab]", '<--'],
"       \ ["Shift Right [Tab]", '-->'],
"       \ ["Margin 0:0",        '0'  ],
"       \ ["Margin 0:1",        '01' ],
"       \ ["Margin 1:0",        '10' ],
"       \ ["Margin 1:1",        '1'  ],
"       \
"       \ 'v/' . s:comment_leadings,
"       \ 'g/' . s:comment_leadings,
"       \]
" unlet s:comment_leadings
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
