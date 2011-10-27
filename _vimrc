"--------------------------------------------------------------------------------
" 基本設定
"--------------------------------------------------------------------------------
set scrolloff=0                                             " カーソルの上下に表示する行数
set formatoptions+=lmoq                                     " テキスト整形オプション、マルチバイト系を追加
set textwidth=0                                             " 自動改行無し
set autoread                                                " 他で書き換えられたら自動で読み直す
set backspace=eol,start,indent                              " バックスペースで何でも消せるように
set foldmethod=marker                                       " デフォルトの折り畳みを有効に
set noerrorbells                                            " ビープを鳴らさない
set novisualbell                                            " ビジュアルベル無効
set whichwrap=b,s,h,l,<,>,[,]                               " 行頭、行末でカーソルを止めない
set modeline                                                " モードラインを有効にする
set backup                                                  " バックアップを有効に
set swapfile                                                " スワップを有効に
if has('win32') || has('win64')                             " バックアップディレクトリを指定
    set backupdir=~/vimfiles/backup
else
    set backupdir=~/.vim/backup
endif
let &directory=&backupdir                                   " スワップディレクトリを指定
filetype indent on                                          " ファイルタイプによるインデント
filetype plugin on                                          " ファイルタイプによるプラグイン
let mapleader = ","                                         " キーマップリーダー

"--------------------------------------------------------------------------------
" ステータス
"--------------------------------------------------------------------------------
set showmode                                                " 最終行にメッセージを表示
set laststatus=2                                            " 常にステータスラインを表示
set statusline=
set statusline+=[*%n]\                                      " バッファ番号
set statusline+=%f\                                         " ファイル名
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'}    " 文字コード
set statusline+=%y                                          " ファイルタイプ
set statusline+=%r                                          " 読み取り専用フラグ
set statusline+=%h                                          " ヘルプバッファ
set statusline+=%w                                          " プレビューウィンドウ
set statusline+=%m                                          " バッファ状態[+]とか
set statusline+=%=                                          " 区切り
"set statusline+=\ %{strftime('%c')}                        " 時間
set statusline+=%4l/%4L%4p%%                                " どこにいるか
set statusline+=\ %3c                                       " 列
set statusline+=\ %4B                                       " 文字コード
set statusline+=%<                                          " 折り返しの指定

"--------------------------------------------------------------------------------
" 表示
"--------------------------------------------------------------------------------
syntax on
set showmatch                                               " 対応する括弧のハイライト
set showcmd                                                 " コマンドをステータス行に表示
set number                                                  " 行番号表示
set list                                                    " 不可視文字の表示
set lcs=eol:\ ,tab:>.,trail:_,extends:>,precedes:<          " 不可視文字の表示設定
set display=uhex                                            " 印字不可文字を16進表示
set cmdheight=2                                             " コマンド行の高さ
set showtabline=2                                           " タブバーを常に表示
set title                                                   " タイトルをウィンドウ枠に表示
set wrap                                                    " 長い行は折り返して表示

" 全角スペースのハイライト
scriptencoding utf-8

augroup highlightIdeographicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=Red guibg=Red
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" カレントウィンドウのカーソル行のみハイライト
setlocal cursorline
augroup cch
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"--------------------------------------------------------------------------------
" オートコマンド
"--------------------------------------------------------------------------------
" 編集するファイルのある場所をカレントディレクトリにする
augroup grlcd
  autocmd!
  autocmd BufEnter * lcd %:p:h
augroup END

" vimgrepの結果を常にQuickFixに表示する
augroup grepToQuickFix
  autocmd!
  autocmd QuickfixCmdPost vimgrep cw
augroup END

"--------------------------------------------------------------------------------
" インデント
"--------------------------------------------------------------------------------
set cindent                                                 " インデント有効
set autoindent
set smartindent
set ts=4 sts=0 sw=4                                         " タブで挿入されるスペース量の設定
set expandtab                                               " スペースをタブに展開する

"--------------------------------------------------------------------------------
" 補完・履歴
"--------------------------------------------------------------------------------
set wildmenu                                                " コマンド補完の強化
set wildchar=<tab>                                          " コマンド補完の開始キー
set wildmode=list:full                                      " リスト表示・最長マッチ
set history=1000                                            " コマンド履歴のサイズ
"set cdpath=                                                " cdコマンドで移動出来るディレクトリ定義

"--------------------------------------------------------------------------------
" 検索
"--------------------------------------------------------------------------------
set wrapscan                                                " 終端まで検索したら先頭に戻る
set ignorecase                                              " 大文字小文字を無視
set smartcase                                               " 但し大文字が入力された場合は無視しない
set incsearch                                               " インクリメンタルサーチ
set hlsearch                                                " 検索文字のハイライト

"--------------------------------------------------------------------------------
" エンコーディング
"--------------------------------------------------------------------------------
set fileformats=unix,dos,mac                                " ファイル形式の認識順序

set termencoding=utf-8                                      " 適当な文字コード判別
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

if has('win32') && has('kaoriya')                           " 文字幅認識の設定
    set ambiwidth=auto
else
    set ambiwidth=double
endif

"--------------------------------------------------------------------------------
" キーマップ
"--------------------------------------------------------------------------------
nnoremap <Space>.   :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s.  :<C-u>source $MYVIMRC<CR>
nnoremap <C-h>      :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

noremap j gj
noremap k gk
noremap gj j
noremap gk k

noremap ; :
noremap : ;

" 最後に変更したテキストを選択する
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>

nnoremap <ESC><ESC> :<C-u>nohl<CR><ESC>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" grep
nnoremap ;g <Esc>:<C-u>vimgrep // **/*<Left><Left><Left><Left><Left><Left>
nnoremap ;;g <Esc>:<C-u>vimgrep /<C-r><C-w>/ **/*

" 水平分割を分かりやすく
nnoremap <C-w>h <C-w>s

" クリップボードとの連携
if has('mac') && !has('gui')
    nnoremap <silent> gy :.w !pbcopy<CR><CR>
    vnoremap <silent> gy :w !pbcopy<CR><CR>
    nnoremap <silent> gp :r !pbpaste<CR>
    vnoremap <silent> gp :r !pbpaste<CR>
else
    noremap gy "+y
    noremap gp "+p
endif

" コマンドラインでのキーバインドを Emacs スタイルにする
" 行頭へ移動
cnoremap <C-a> <Home>
" 一文字戻る
"cnoremap <C-b><Left>
" カーソルの下の文字を削除
"cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
"cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
"cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
"cnoremap <C-p> <Up>
" 前の単語へ移動
"cnoremap <Esc><C-b> <S-Left>
" 次の単語へ移動
"cnoremap <Esc><C-f> <S-Right>

inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

"file name copy
nnoremap <silent><Leader>y :let @"=expand('%:p')<CR>:echo "Copy filename to noname register."<CR>

"--------------------------------------------------------------------------------
" コマンド
"--------------------------------------------------------------------------------
" エンコーディングの簡易切替コマンド
command! Cp932 edit ++enc=cp932
command! Sjis  Cp932
command! Eucjp edit ++enc=euc-jp
command! Utf8  edit ++enc=utf-8

" cdpathを考慮した引数補完を可能にする
command! -complete=customlist,CompleteCD -nargs=? CD  cd <args>
function! CompleteCD(arglead, cmdline, cursorpos)
  let pattern = join(split(a:cmdline, '\s', !0)[1:], ' ') . '*/'
  return split(globpath(&cdpath, pattern), "\n")
endfunction

" 既存のcdコマンドを置き換える
cnoreabbrev <expr> cd (getcmdtype() == ':' && getcmdline() ==# 'cd') ? 'CD' : 'cd'

"--------------------------------------------------------------------------------
" プラグインの設定
"--------------------------------------------------------------------------------

"------------------------------------
" pathogen
"------------------------------------
filetype off                                            " 一度ファイルタイプ判定をoff
call pathogen#runtime_append_all_bundles()              " .vim/bundle/plugin_nameを読み込むようにする
call pathogen#helptags()                                " .vim/bunle/plugin_nameのヘルプを読み込めるようにする
filetype on                                             " 最後にファイルタイプ判定を元に戻す

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
nnoremap <Leader>bh :<C-u>BufExplorerH<CR>                   " 水平分割を分かりやすく

"---------------------------------------------------------------------------
" カラー設定
"---------------------------------------------------------------------------
set t_Co=256
set background=dark
colorscheme solarized
