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
set backup                                                  " バックアップを有効に
set swapfile                                                " スワップを有効に
set backupdir=~/.vim/backup                                 " バックアップディレクトリを指定
let &directory=&backupdir                                   " スワップディレクトリを指定
filetype indent on                                          " ファイルタイプによるインデント
filetype plugin on                                          " ファイルタイプによるプラグイン
let mapleader = ","                                         " キーマップリーダー

"--------------------------------------------------------------------------------
" ステータス
"--------------------------------------------------------------------------------
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

"入力モード時、ステータスラインのカラーを変更
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#2E4340 ctermfg=yellow
"autocmd InsertLeave * highlight StatusLine guifg=#ccdc90 ctermfg=white
"augroup END

"--------------------------------------------------------------------------------
" 表示
"--------------------------------------------------------------------------------
syntax on
set showmatch                                               " 対応する括弧のハイライト
set showcmd                                                 " コマンドをステータス行に表示
set number                                                  " 行番号表示
set list                                                    " 不可視文字の表示
set lcs=tab:\ \ ,eol:\ ,trail:_,extends:>,precedes:<        " 不可視文字の表示設定
set display=uhex                                            " 印字不可文字を16進表示
set cmdheight=2                                             " コマンド行の高さ
set showtabline=2                                           " タブバーを常に表示
set title                                                   " タイトルをウィンドウ枠に表示
set wrap                                                    " 長い行は折り返して表示

" 全角スペースのハイライト
highlight JpSpace cterm=underline ctermfg=Red guifg=Red
au BufRead,BufNew * match JpSpace /　/

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=darkgray  guibg=black

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

" 適当な文字コード判別
set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

" 厳密な文字コード判別
" http://www.kawaz.jp/pukiwiki/?vim#content_1_7
" http://d.hatena.ne.jp/hazy-moon/20061229/1167407073
" if &encoding !=# 'utf-8'
    " set encoding=japan
    " set fileencoding=japan
" endif
" if has('iconv')
    " let s:enc_euc = 'euc-jp'
    " let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    " if iconv("?x87?x64?x87?x6a", 'cp932', 'eucjp-ms') ==# "?xad?xc5?xad?xcb"
        " let s:enc_euc = 'eucjp-ms'
        " let s:enc_jis = 'iso-2022-jp-3'
    " iconvがJISX0213に対応しているかをチェック
    " elseif iconv("?x87?x64?x87?x6a", 'cp932', 'euc-jisx0213') ==# "?xad?xc5?xad?xcb"
        " let s:enc_euc = 'euc-jisx0213'
        " let s:enc_jis = 'iso-2022-jp-3'
    " endif
    " fileencodingsを構築
    " if &encoding ==# 'utf-8'
        " let s:fileencodings_default = &fileencodings
        " let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        " let &fileencodings = &fileencodings .','. s:fileencodings_default
        " unlet s:fileencodings_default
    " else
        " let &fileencodings = &fileencodings .','. s:enc_jis
        " set fileencodings+=utf-8,ucs-2le,ucs-2
        " if &encoding =~# '^?(euc-jp?|euc-jisx0213?|eucjp-ms?)$'
            " set fileencodings+=cp932
            " set fileencodings-=euc-jp
            " set fileencodings-=euc-jisx0213
            " set fileencodings-=eucjp-ms
            " let &encoding = s:enc_euc
            " let &fileencoding = s:enc_euc
        " else
            " let &fileencodings = &fileencodings .','. s:enc_euc
        " endif
    " endif
    " 定数を処分
    " unlet s:enc_euc
    " unlet s:enc_jis
" endif

if has('win32') && has('kaoriya')                           " 文字幅認識の設定
    set ambiwidth=auto
else
    set ambiwidth=double
endif

"--------------------------------------------------------------------------------
" キーマップ
"--------------------------------------------------------------------------------
map <C-H> <BS>
map! <C-H> <BS>
nmap <ESC><ESC> :nohl<CR><ESC>
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap j gj
nmap k gk

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
cnoremap <C-A> <Home>
" 一文字戻る
"cnoremap <C-B><Left>
" カーソルの下の文字を削除
"cnoremap <C-D> <Del>
" 行末へ移動
cnoremap <C-E> <End>
" 一文字進む
"cnoremap <C-F> <Right>
" コマンドライン履歴を一つ進む
"cnoremap <C-N> <Down>
" コマンドライン履歴を一つ戻る
"cnoremap <C-P> <Up>
" 前の単語へ移動
"cnoremap <Esc><C-B> <S-Left>
" 次の単語へ移動
"cnoremap <Esc><C-F> <S-Right>

nmap <C-tab> :tabnext<cr>
nmap <C-S-tab> :tabprevious<cr>
nmap <C-t> :tabnew<cr>
"nmap <C-w> :tabclose<cr>
"imap <C-tab> <ESC>:tabnext<cr>i
"imap <C-S-tab> <ESC>:tabprevious<cr>i
"imap <C-t> <ESC>:tabnew<cr>
"imap <C-w> :tabclose<cr>

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
" NERD_commenter
"------------------------------------
let NERDSpaceDelims = 1                                 " コメントの間にスペースを空ける
map <Leader>x <Leader>c<space>                          " <Leader>xでコメントをトグル(NERD_commenter.vim)
"let NERDShutUp=1                                       " 未対応ファイルタイプのエラーメッセージを表示しない

" ------------------------------------
" neocomplcache
"------------------------------------
let g:neocomplcache_enable_at_startup = 1               " neocomplcacheを有効にする
"let g:neocomplcache_max_list = 100                     " 補完リストの最大件数
"let g:neocomplcache_max_keyword_width = 50             " 補完候補の表示幅
"g:neocomplcache_max_filename_width = 15                " 補完ファイル名の表示幅
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

"---------------------------------------------------------------------------
" カラー設定:
"---------------------------------------------------------------------------
set background=dark
colorscheme solarized
