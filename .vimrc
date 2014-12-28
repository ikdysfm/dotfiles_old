set encoding=utf-8
scriptencoding utf-8

if (has('win32') || has('win64'))
  set runtimepath+=$HOME/.vim,$HOME/.vim/after
endif

" PREFIXの設定 {{{
nnoremap [PREFIX] <Nop>
nmap <Space> [PREFIX]
" }}}

" プラグインの読み込み・設定 {{{
:source $VIMRUNTIME/macros/matchit.vim
:source <sfile>:h/.neobundle.vim
" }}}

" 基本設定 {{{
set hidden                                                  " 隠しバッファを許す
set mouse=                                                  " マウスを無効に
set scrolloff=0                                             " カーソルの上下に表示する行数
set formatoptions+=lmoq                                     " テキスト整形オプション、マルチバイト系を追加
set textwidth=0                                             " 自動改行無し
set autoread                                                " 他で書き換えられたら自動で読み直す
set backspace=eol,start,indent                              " バックスペースで何でも消せるように
set foldmethod=marker                                       " デフォルトの折り畳みを有効に
set noerrorbells                                            " ビープを鳴らさない
set novisualbell                                            " ビジュアルベル無効
set whichwrap=b,s,<,>,[,],~                                 " 行頭、行末でカーソルを止めない
set modeline                                                " モードラインを有効にする
set backup                                                  " バックアップを有効に
set swapfile                                                " スワップを有効に
set backupdir=~/.vim/backup                                 " バックアップディレクトリを指定
let &directory=&backupdir                                   " スワップディレクトリを指定
set undodir=~/.vim/undo                                     " undofileの保存場所
set virtualedit=block                                       " 矩形選択時に仮想編集を有効にする
set nrformats=hex                                           " インクリメントは常に10進数
set iminsert=0                                              " insert時にIMEをONにしない
set imsearch=0                                              " 検索時にIMEをONにしない
set imdisable                                               " IM無効化
set timeout
set timeoutlen=3000                                         " マッピングの待ち時間
set ttimeoutlen=10                                          " キーコードの待ち時間

setlocal omnifunc=syntaxcomplete#Complete                   " omni補完用
if has('win32') | set grepprg=jvgrep | endif                " grepの置き換え
if exists('+macmeta') | set macmeta | endif                 " METAキーを有効にする

set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,eucjp-ms,cp932
set fileformats=unix,dos,mac                                " ファイル形式の認識順序
set termencoding=utf-8                                      " 端末のエンコーディング
" }}}

" インデント {{{
set cindent                                                 " インデント有効
set autoindent
set smartindent
set ts=2 sts=0 sw=2                                         " タブで挿入されるスペース量の設定
set smarttab                                                " BSで行頭のスペースをまとめて消す
set expandtab                                               " スペースをタブに展開する
" }}}

" 補完・履歴 {{{
set wildmenu                                                " コマンド補完の強化
set wildchar=<tab>                                          " コマンド補完の開始キー
set wildmode=list:longest,full                              " リスト表示・最長マッチ
set history=1000                                            " コマンド履歴のサイズ
set pumheight=10                                            " 補完メニューの高さ
"set cdpath=                                                " cdコマンドで移動出来るディレクトリ定義
" if has('persistent_undo')                                 " undo履歴の永続化
"     set undodir=~/.vimundo
"     set undofile
" endif
" }}}

" 検索 {{{
set wrapscan                                                " 終端まで検索したら先頭に戻る
set ignorecase                                              " 大文字小文字を無視
set smartcase                                               " 但し大文字が入力された場合は無視しない
set infercase                                               " 自動補完で大文字小文字を修正する
set incsearch                                               " インクリメンタルサーチ
set hlsearch                                                " 検索文字のハイライト
" }}}

" 表示 {{{
syntax on
set showmatch                                               " 対応する括弧のハイライト
set matchtime=1                                             " 対応する括弧のハイライト時間
set showcmd                                                 " コマンドをステータス行に表示
set number                                                  " 行番号表示
set relativenumber                                          " 行番号表示
set list                                                    " 不可視文字の表示
set lcs=eol:\ ,tab:>\ ,trail:_,extends:>,precedes:<         " 不可視文字の表示設定
set display=uhex,lastline                                   " 印字不可文字を16進表示,長い行を表示
set cmdheight=2                                             " コマンド行の高さ
set showtabline=2                                           " タブバーを常に表示
set title                                                   " タイトルをウィンドウ枠に表示
set wrap                                                    " 長い行は折り返して表示

if has('win32') && has('kaoriya')                           " 文字幅認識の設定
  set ambiwidth=auto
else
  set ambiwidth=double
endif

" markdownのハイライト設定
let g:markdown_fenced_languages = [
\ 'css',
\ 'erb=eruby',
\ 'javascript',
\ 'js=javascript',
\ 'json=javascript',
\ 'ruby',
\ 'xml',
\]
" }}}

" キーマップ(filetypeに依存しないもの) {{{
" filetypeに依存するmapは ~/.vim/ftplugin/[filetype]/mysetting.vim
nnoremap [PREFIX]e. :<C-u>tab drop $MYVIMRC<CR>
nnoremap [PREFIX]eg :<C-u>tab drop $MYGVIMRC<CR>
nnoremap [PREFIX]en :<C-u>tab drop $HOME/.neobundle.vim<CR>
nnoremap <expr> [PREFIX]es ":<C-u>tab drop $HOME/.vim/ftplugin/" . &filetype . "/mysetting.vim<CR>}"
nnoremap [PREFIX].  :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif<CR>

" OSレベルのキーマップで<C-h>を<BS>にしている前提
" unite helpに移行
" nnoremap <BS>       :<C-u>help<Space>
" nnoremap <BS><BS>   :<C-u>help<Space><C-r><C-w><CR>

noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap Y y$

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" 最後に変更したテキストを選択する
nnoremap gcv `[v`]
vnoremap gcv :<C-u>normal gc<CR>
onoremap gcv :<C-u>normal gc<CR>

nnoremap <C-l> :nohl<CR><C-l>

nnoremap / /\v
nnoremap ? ?\v
nnoremap n nzz
nnoremap N Nzz
nnoremap * *Nzz
nnoremap # #Nzz
nnoremap g* g*zz
nnoremap g# g#zz

" ビジュアルモードでインデント変更後も選択状態を継続する
vnoremap < <gv
vnoremap > >gv

"diff
"nnoremap <Leader>d :<C-u>vertical diffsplit 

" クリップボードとの連携 -> fakeclipの導入が前提
"if has('mac') && !has('gui')
"  nnoremap <silent> gy :.w !pbcopy<CR><CR>
"  vnoremap <silent> gy :w !pbcopy<CR><CR>
"  nnoremap <silent> gp :r !pbpaste<CR>
"  vnoremap <silent> gp :r !pbpaste<CR>
"else
  noremap gy "+y
  noremap gp "+p
"endif

inoremap <Nul> <C-x><C-o>
" }}}

" オートコマンド {{{
augroup vimrc
  autocmd!
augroup END

" 全角スペースのハイライト
autocmd vimrc ColorScheme * highlight IdeographicSpace term=underline ctermbg=Red guibg=Red
autocmd vimrc VimEnter,WinEnter * match IdeographicSpace /　/

" カレントウィンドウのカーソル行のみハイライト
autocmd vimrc WinEnter,BufWinEnter,WinEnter * setlocal cursorline
autocmd vimrc WinLeave * setlocal nocursorline

" インサートモードに入った時にカーソル行(列)の色を変更する
autocmd vimrc InsertEnter * highlight CursorLine ctermbg=24 guibg=#112299 | highlight CursorColumn ctermbg=24 guibg=#112299
autocmd vimrc InsertLeave * highlight CursorLine ctermbg=236 guibg=#303030 | highlight CursorColumn ctermbg=236 guibg=#303030

" スワップファイルがあった場合常にRead-Onlyで開く
autocmd vimrc SwapExists * let v:swapchoice = 'o'

" 編集中ファイルの場所をカレントディレクトリにする -> デメリットが大きい
" autocmd vimrc BufEnter * lcd %:p:h

" vimgrepの結果を常にQuickFixに表示する -> uniteに統一
" autocmd vimrc QuickfixCmdPost vimgrep cw
" }}}

" コマンド {{{
" cdpathを考慮した引数補完を可能にする
command! -complete=customlist,CompleteCD -nargs=? CD  cd <args>
function! CompleteCD(arglead, cmdline, cursorpos)
  let pattern = join(split(a:cmdline, '\s', !0)[1:], ' ') . '*/'
  return split(globpath(&cdpath, pattern), "\n")
endfunction

" 既存のcdコマンドを置き換える
cnoreabbrev <expr> cd (getcmdtype() == ':' && getcmdline() ==# 'cd') ? 'CD' : 'cd'
" }}}

" カラー設定 {{{
"set t_Co=256
"set background=light
colorscheme wombat256mod
" }}}
