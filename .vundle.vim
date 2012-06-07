set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

""""" github
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/vimshell'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-visualstar'
Bundle 'thinca/vim-fontzoom'
Bundle 'taku-o/vim-vis'
Bundle 'taku-o/vim-toggle'
Bundle 'houtsnip/vim-emacscommandline'
Bundle 'h1mesuke/vim-alignta'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tyru/open-browser.vim'
Bundle 'othree/eregex.vim'
Bundle 'sjl/gundo.vim'
Bundle 't9md/vim-textmanip'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'lokaltog/vim-easymotion'
Bundle 'tsaleh/vim-matchit'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/matchparenpp'
Bundle 'vim-scripts/ShowMarks'
Bundle 'vim-scripts/tComment'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'kana/vim-fakeclip'
Bundle 'kana/vim-smartchr'
" twitter
Bundle 'basyura/TweetVim'
Bundle 'basyura/twibill.vim'
Bundle 'basyura/bitly.vim'
Bundle 'mattn/webapi-vim'
" operator
Bundle 'kana/vim-operator-user'
Bundle 'kana/vim-operator-replace'
Bundle 'tyru/operator-camelize.vim'
" textobj
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-fold'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-syntax'
Bundle 'kana/vim-textobj-indent'
Bundle 'thinca/vim-textobj-comment'
Bundle 'h1mesuke/textobj-wiw'

""""" www.vim.org
Bundle 'Markdown'
" colorscheme
Bundle 'desert256.vim'
Bundle 'desert-warm-256'
Bundle 'Zenburn'
Bundle 'wombat256.vim'
" それ以外のリポジトリ
" Bundle 'git://git.example.com/example.git'

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
" toggle
"------------------------------------
imap <C-c> <Plug>ToggleI
nmap <C-c> <Plug>ToggleN
vmap <C-c> <Plug>ToggleV
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
noremap <Plug>N N
map * <Plug>(visualstar-*)<Plug>N
map # <Plug>(visualstar-#)<Plug>N

"------------------------------------
" showmarks
"------------------------------------
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"------------------------------------
" YankRing
"------------------------------------
nnoremap <silent> <Leader>y :YRShow<CR>
let g:yankring_history_dir=expand('$HOME/.vim')
let g:yankring_history_file='yankring_history'
let g:yankring_max_history=10
let g:yankring_window_height=13

"------------------------------------
" matchit
"------------------------------------
:runtime macros/matchit.vim

"------------------------------------
" indent-guides
"------------------------------------
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

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
let plugin_dicwin_disable = 1 " キーマップが被るので無効化しておく
nnoremap / :M/
nnoremap ? :M?
nnoremap <Leader>/ /
nnoremap <Leader>? ?

"------------------------------------
" gundo
"------------------------------------
nnoremap <silent> <Leader>u :<C-u>GundoToggle<CR>

"------------------------------------
" textmanip
"------------------------------------
" 選択したテキストの移動
vmap <S-h> <Plug>(textmanip-move-left)
vmap <S-j> <Plug>(textmanip-move-down)
vmap <S-k> <Plug>(textmanip-move-up)
vmap <S-l> <Plug>(textmanip-move-right)
" 行の複製
"vmap <M-d> <Plug>(textmanip-duplicate-down)
"nmap <M-d> <Plug>(textmanip-duplicate-down)

"------------------------------------
" textobj-wiw
"------------------------------------
let g:textobj_wiw_default_key_mappings_prefix = ','

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
