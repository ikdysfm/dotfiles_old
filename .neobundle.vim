if has('vim_starting')
  set nocompatible                                         " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

""""" github
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
" NeoBundle 'Shougo/vimshell'
" NeoBundle 'tsukkee/unite-help'
" NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'thinca/vim-visualstar'
" NeoBundle 'thinca/vim-fontzoom'
" NeoBundle 'taku-o/vim-vis'
" NeoBundle 'taku-o/vim-toggle'
" NeoBundle 'houtsnip/vim-emacscommandline'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'tyru/open-browser.vim'
" NeoBundle 'othree/eregex.vim'
NeoBundle 'sjl/gundo.vim'
" NeoBundle 't9md/vim-textmanip'
" NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Lokaltog/vim-powerline'
" NeoBundle 'lokaltog/vim-easymotion'
" NeoBundle 'tsaleh/vim-matchit'
" NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'vim-scripts/matchparenpp'
NeoBundle 'vim-scripts/ShowMarks'
NeoBundle 'vim-scripts/tComment'
" NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'
" Haskell
" NeoBundle 'eagletmt/ghcmod-vim'
" NeoBundle 'eagletmt/unite-haddock'
" NeoBundle 'ujihisa/neco-ghc'
" js
" NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'vim-scripts/Simple-Javascript-Indenter'
" NeoBundle 'jelera/vim-javascript-syntax'
" NeoBundle 'teramako/jscomplete-vim'
" NeoBundle 'scrooloose/syntastic'
" operator
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'tyru/operator-camelize.vim'
" textobj
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-syntax'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'thinca/vim-textobj-comment'
" NeoBundle 'h1mesuke/textobj-wiw'

""""" www.vim.org
NeoBundle 'Markdown'
" colorscheme
NeoBundle 'desert256.vim'
NeoBundle 'desert-warm-256'
NeoBundle 'Zenburn'
NeoBundle 'wombat256.vim'
NeoBundle 'w0ng/vim-hybrid'

" それ以外のリポジトリ
" NeoBundle 'git://git.example.com/example.git'

filetype plugin indent on
NeoBundleCheck

"------------------------------------
" quick-run
"------------------------------------
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter': 'browser',
      \ 'cmdopt': '-s'
      \ }

"------------------------------------
" unite
"------------------------------------
"let g:unite_enable_start_insert = 1                      " 常にインサートモードで起動する
"imap <Nul> <Plug>(neocomplcache_start_unite_complete)
"imap <C-q> <Plug>(neocomplcache_start_unite_quick_match)
if has('win32')
  let g:unite_source_grep_command='jvgrep'
  let g:unite_source_grep_default_opts=''
  let g:unite_source_grep_recursive_opt='-R'
endif
nnoremap <silent> <Leader>a :<C-u>Unite alignta:options<CR>
xnoremap <silent> <Leader>a :<C-u>Unite alignta:arguments<CR>
nnoremap <silent> <Leader>b :<C-u>Unite -buffer-name=files buffer_tab file_mru file<CR>
"nnoremap <silent> <Leader>c :<C-u>Unite colorscheme<CR>
nnoremap <silent> <Leader>g :<C-u>Unite grep -no-quit<CR>
nnoremap <silent> <Leader>h :<C-u>Unite -start-insert help<CR>
nnoremap <silent> <Leader>H :<C-u>UniteWithCursorWord -start-insert help<CR>
nnoremap <silent> <Leader>l :<C-u>Unite -start-insert line<CR>
nnoremap <silent> <Leader>o :<C-u>Unite -start-insert outline<CR>

"------------------------------------
" VimFiler
"------------------------------------
" nnoremap <silent> <Leader>f :<C-u>execute "VimFiler" expand("%:p:h")<CR>
" nnoremap <silent> <Leader>F :<C-u>execute "VimFilerSplit" expand("%:p:h")<CR>
let g:vimfiler_as_default_explorer=1                    " netrwの代わりにデフォルトのファイラーにする

" VimFilerをExplorerっぽく使う
nnoremap <silent> <Leader>f :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
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

"------------------------------------
" C/Migemo
"------------------------------------
if has("migemo")
  set migemo
endif

"------------------------------------
" surround
"------------------------------------
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround

"------------------------------------
" neocomplcache
"------------------------------------
let g:neocomplcache_enable_at_startup = 1               " neocomplcacheを有効にする
"let g:neocomplcache_max_list = 100                     " 補完リストの最大件数
"let g:neocomplcache_max_keyword_width = 50             " 補完候補の表示幅
"let g:neocomplcache_max_filename_width = 15            " 補完ファイル名の表示幅
"let g:neocomplcache_auto_completion_start_length = 2   " 補完を開始する文字数
"let g:neocomplcache_enable_auto_select = 1             " 補完リストの先頭を自動選択するか
let g:neocomplcache_enable_smart_case = 1               " smart_case補完を有効にする
"let g:neocomplcache_enable_camel_case_completion = 1   " camel_case補完を有効にする
"let g:neocomplcache_enable_underbar_completion = 1     " アンダーバー区切りの補完を有効にする
let g:neocomplcache_min_syntax_length = 3               " シンタックスのキャッシュ最小文字長
"let g:neocomplcache_disable_caching_file_path_pattern  " キャッシュしないバッファ名の正規表現
"let g:neocomplcache_lock_buffer_name_pattern =         " 自動補完を無効化するバッファ名の正規表現
"let g:neocomplcache_dictionary_filetype_lists = {      " ファイルタイプごとの辞書設定
"let g:neocomplcache_keyword_patterns['default'] =      " キーワードパターンの設定

"------------------------------------
" neocomplcache-snippets-complete
"------------------------------------
let g:neocomplcache_snippets_dir='~/.vim/snippets'      " snippetの配置場所
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

"------------------------------------
" toggle
"------------------------------------
" imap <C-c> <Plug>ToggleI
" nmap <C-c> <Plug>ToggleN
" vmap <C-c> <Plug>ToggleV
"let g:toggle_pairs = {'&&':'||', '||':'&&'}

"------------------------------------
" Alignta
"------------------------------------
let g:alignta_default_options = "<<<1:1"

let g:unite_source_alignta_preset_arguments = [
      \ ["Align at '='", '='],  
      \ ["Align at ':'", ':'],
      \ ["Align at '|'", '|'],
      \ ["Align at ')'", ')'],
      \ ["Align at ']'", ']'],
      \ ["Align at '}'", '}'],
      \]

let s:comment_leadings = '^\s*\("\|#\|/\*\|//\|<!--\)'
let g:unite_source_alignta_preset_options = [
      \ ["Justify Left",      '<<' ],
      \ ["Justify Center",    '||' ],
      \ ["Justify Right",     '>>' ],
      \ ["Justify None",      '==' ],
      \ ["Shift Left",        '<-' ],
      \ ["Shift Right",       '->' ],
      \ ["Shift Left  [Tab]", '<--'],
      \ ["Shift Right [Tab]", '-->'],
      \ ["Margin 0:0",        '0'  ],
      \ ["Margin 0:1",        '01' ],
      \ ["Margin 1:0",        '10' ],
      \ ["Margin 1:1",        '1'  ],
      \
      \ 'v/' . s:comment_leadings,
      \ 'g/' . s:comment_leadings,
      \]
unlet s:comment_leadings

"------------------------------------
" visualstar
"------------------------------------
" noremap <Plug>N N
" map * <Plug>(visualstar-*)<Plug>N
" map # <Plug>(visualstar-#)<Plug>N

"------------------------------------
" showmarks
"------------------------------------
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"------------------------------------
" YankRing
"------------------------------------
" nnoremap <silent> <Leader>y :YRShow<CR>
" let g:yankring_history_dir=expand('$HOME/.vim')
" let g:yankring_history_file='yankring_history'
" let g:yankring_max_history=10
" let g:yankring_window_height=13

"------------------------------------
" matchit
"------------------------------------
" :runtime macros/matchit.vim

"------------------------------------
" indent-guides
"------------------------------------
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_color_change_percent = 30
" let g:indent_guides_guide_size = 1

"------------------------------------
" smartchr
"------------------------------------
inoremap <expr> = smartchr#loop('=', ' = ', ' == ')

"------------------------------------
" powerline
"------------------------------------
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'default'
let g:Powerline_theme = 'default'

"------------------------------------
" eregex
"------------------------------------
" let plugin_dicwin_disable = 1 " キーマップが被るので無効化しておく
" nnoremap / :M/
" nnoremap ? :M?
" nnoremap <Leader>/ /
" nnoremap <Leader>? ?

"------------------------------------
" gundo
"------------------------------------
nnoremap <silent> <Leader>u :<C-u>GundoToggle<CR>

"------------------------------------
" textmanip
"------------------------------------
" 選択したテキストの移動
"vmap <S-h> <Plug>(textmanip-move-left)
"vmap <S-j> <Plug>(textmanip-move-down)
"vmap <S-k> <Plug>(textmanip-move-up)
"vmap <S-l> <Plug>(textmanip-move-right)
" 行の複製
"vmap <M-d> <Plug>(textmanip-duplicate-down)
"nmap <M-d> <Plug>(textmanip-duplicate-down)

"------------------------------------
" textobj-wiw
"------------------------------------
" let g:textobj_wiw_default_key_mappings_prefix = ','

"------------------------------------
" vim-operator-replace
"------------------------------------
map _ <Plug>(operator-replace)

"------------------------------------
" operator-camelize.vim
"------------------------------------
map <Leader>C <Plug>(operator-camelize)
map <Leader>c <Plug>(operator-decamelize)

"------------------------------------
" vim-fontzoom
"------------------------------------
"silent! nmap <unique> <silent> <leader>0 :<C-u>Fontzoom!<CR>

"------------------------------------
" vim-fakeclip
"------------------------------------
let g:fakeclip_terminal_multiplexer_type = "tmux"

"------------------------------------
" ghc-mod.vim
"------------------------------------
" nnoremap [ghc] <Nop>
" nmap <Leader>G [ghc]
" nnoremap [ghc]t :<C-u>GhcModType<CR>
" nnoremap [ghc]T :<C-u>GhcModTypeClear<CR>
" nnoremap [ghc]c :<C-u>GhcModCheck<CR>
" nnoremap [ghc]l :<C-u>GhcModLint<CR>

"------------------------------------
" syntastic
"------------------------------------
" active=保存時に自動チェック、passive=手動
" let g:syntastic_mode_map = { 'mode': 'active',
"   \ 'active_filetypes': [],
"   \ 'passive_filetypes': ['html', 'javascript'] }
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checker = 'gjslint'

"------------------------------------
" Simple-Javascript-Indenter
"------------------------------------
" let g:SimpleJsIndenter_BriefMode = 1
" let g:SimpleJsIndenter_CaseIndentLevel = -1
