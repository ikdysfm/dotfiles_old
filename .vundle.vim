set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundleで管理するプラグイン
Bundle 'gmarik/vundle'
" github
Bundle 'unite.vim'
Bundle 'tpope/vim-surround'
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'altercation/vim-colors-solarized'
Bundle 'corntrace/bufexplorer'
Bundle 'taku-o/vim-vis'
Bundle 'taku-o/vim-toggle'
Bundle 'tpope/vim-surround'
Bundle 'houtsnip/vim-emacscommandline'
Bundle 'tsaleh/vim-align'
" www.vim.org
Bundle 'visualstar.vim'
Bundle 'ShowMarks'
Bundle 'YankRing.vim'
Bundle 'matchit.zip'
Bundle 'Indent-Guides'
Bundle 'tComment'
Bundle 'smartchr'
" それ以外のリポジトリ
" Bundle 'git://git.example.com/example.git'

" ------------------------------------
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
" bufexplorer
"------------------------------------
let bufExplorerDetailedHelp = 1

"------------------------------------
" toggle
"------------------------------------
imap <C-c> <Plug>ToggleI
nmap <C-c> <Plug>ToggleN
vmap <C-c> <Plug>ToggleV
"let g:toggle_pairs = {'&&':'||', '||':'&&'}

"------------------------------------
" Align
"------------------------------------
let g:Align_xstrlen = 3       " 日本語対策
let g:DrChipTopLvlMenu = ''   " DrChipメニューを無効にする

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
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"------------------------------------
" smartchr
"------------------------------------
inoremap <expr> = smartchr#loop(' = ', '=', ' == ')
