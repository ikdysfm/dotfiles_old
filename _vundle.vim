set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundleで管理するプラグイン
Bundle 'gmarik/vundle'
" github
Bundle 'tpope/vim-surround'
Bundle 'thinca/vim-quickrun'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/neocomplcache'
Bundle 'altercation/vim-colors-solarized'
Bundle 'corntrace/bufexplorer'
Bundle 'taku-o/vim-vis'
Bundle 'tpope/vim-surround'
" www.vim.org
" Bundle 'example.vim'
" それ以外のリポジトリ
" Bundle 'git://git.example.com/example.git'

"------------------------------------
" surround
"------------------------------------
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround

"------------------------------------
" NERD_commenter
"------------------------------------
let NERDSpaceDelims = 1                                 " コメントの間にスペースを空ける
"map <Leader>x ,c<space>                                " 一行コメントアウトのトグル(Windowsだと実行後にカーソルが滑る？)
"map <Leader>cs ,cs                                     " 複数行コメントアウト
"map <Leader>ca ,cA                                     " 行末コメント
"let NERDShutUp=1                                       " 未対応ファイルタイプのエラーメッセージを表示しない

" ------------------------------------
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

" ------------------------------------
" bufexplorer
"------------------------------------
let bufExplorerDetailedHelp = 1
