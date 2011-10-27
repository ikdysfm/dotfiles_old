"--------------------------------------------------------------------------------
" ��{�ݒ�
"--------------------------------------------------------------------------------
set scrolloff=0                                             " �J�[�\���̏㉺�ɕ\������s��
set formatoptions+=lmoq                                     " �e�L�X�g���`�I�v�V�����A�}���`�o�C�g�n��ǉ�
set textwidth=0                                             " �������s����
set autoread                                                " ���ŏ���������ꂽ�玩���œǂݒ���
set backspace=eol,start,indent                              " �o�b�N�X�y�[�X�ŉ��ł�������悤��
set foldmethod=marker                                       " �f�t�H���g�̐܂��݂�L����
set noerrorbells                                            " �r�[�v��炳�Ȃ�
set novisualbell                                            " �r�W���A���x������
set whichwrap=b,s,h,l,<,>,[,]                               " �s���A�s���ŃJ�[�\�����~�߂Ȃ�
set backup                                                  " �o�b�N�A�b�v��L����
set swapfile                                                " �X���b�v��L����
if has('win32') || has('win64')                             " �o�b�N�A�b�v�f�B���N�g�����w��
    set backupdir=~/vimfiles/backup
else
    set backupdir=~/.vim/backup
endif
let &directory=&backupdir                                   " �X���b�v�f�B���N�g�����w��
filetype indent on                                          " �t�@�C���^�C�v�ɂ��C���f���g
filetype plugin on                                          " �t�@�C���^�C�v�ɂ��v���O�C��
let mapleader = ","                                         " �L�[�}�b�v���[�_�[

"--------------------------------------------------------------------------------
" �X�e�[�^�X
"--------------------------------------------------------------------------------
set showmode                                                " �ŏI�s�Ƀ��b�Z�[�W��\��
set showcmd                                                 " �R�}���h���ŉ��s�ɕ\��
set laststatus=2                                            " ��ɃX�e�[�^�X���C����\��
set statusline=
set statusline+=[*%n]\                                      " �o�b�t�@�ԍ�
set statusline+=%f\                                         " �t�@�C����
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'}    " �����R�[�h
set statusline+=%y                                          " �t�@�C���^�C�v
set statusline+=%r                                          " �ǂݎ���p�t���O
set statusline+=%h                                          " �w���v�o�b�t�@
set statusline+=%w                                          " �v���r���[�E�B���h�E
set statusline+=%m                                          " �o�b�t�@���[+]�Ƃ�
set statusline+=%=                                          " ��؂�
"set statusline+=\ %{strftime('%c')}                        " ����
set statusline+=%4l/%4L%4p%%                                " �ǂ��ɂ��邩
set statusline+=\ %3c                                       " ��
set statusline+=\ %4B                                       " �����R�[�h
set statusline+=%<                                          " �܂�Ԃ��̎w��

"���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
"augroup InsertHook
"autocmd! InsertHook
"autocmd InsertEnter * highlight StatusLine guifg=#2E4340 ctermfg=yellow
"autocmd InsertLeave * highlight StatusLine guifg=#ccdc90 ctermfg=white
"augroup END

"--------------------------------------------------------------------------------
" �\��
"--------------------------------------------------------------------------------
syntax on
set showmatch                                               " �Ή����銇�ʂ̃n�C���C�g
set showcmd                                                 " �R�}���h���X�e�[�^�X�s�ɕ\��
set number                                                  " �s�ԍ��\��
set list                                                    " �s�������̕\��
set lcs=tab:\ \ ,eol:\ ,trail:_,extends:>,precedes:<        " �s�������̕\���ݒ�
set display=uhex                                            " �󎚕s������16�i�\��
set cmdheight=2                                             " �R�}���h�s�̍���
set showtabline=2                                           " �^�u�o�[����ɕ\��
set title                                                   " �^�C�g�����E�B���h�E�g�ɕ\��
set wrap                                                    " �����s�͐܂�Ԃ��ĕ\��

" �S�p�X�y�[�X�̃n�C���C�g
highlight JpSpace cterm=underline ctermfg=Red guifg=Red
au BufRead,BufNew * match JpSpace /�@/

" �J�����g�E�B���h�E�̃J�[�\���s�̂݃n�C���C�g
setlocal cursorline
augroup cch
  autocmd! cch
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=darkgray  guibg=black

"--------------------------------------------------------------------------------
" �C���f���g
"--------------------------------------------------------------------------------
set cindent                                                 " �C���f���g�L��
set autoindent
set smartindent
set ts=4 sts=0 sw=4                                         " �^�u�ő}�������X�y�[�X�ʂ̐ݒ�
set expandtab                                               " �X�y�[�X���^�u�ɓW�J����

"--------------------------------------------------------------------------------
" �⊮�E����
"--------------------------------------------------------------------------------
set wildmenu                                                " �R�}���h�⊮�̋���
set wildchar=<tab>                                          " �R�}���h�⊮�̊J�n�L�[
set wildmode=list:full                                      " ���X�g�\���E�Œ��}�b�`
set history=1000                                            " �R�}���h�����̃T�C�Y
"set cdpath=                                                " cd�R�}���h�ňړ��o����f�B���N�g����`

"--------------------------------------------------------------------------------
" ����
"--------------------------------------------------------------------------------
set wrapscan                                                " �I�[�܂Ō���������擪�ɖ߂�
set ignorecase                                              " �啶���������𖳎�
set smartcase                                               " �A���啶�������͂��ꂽ�ꍇ�͖������Ȃ�
set incsearch                                               " �C���N�������^���T�[�`
set hlsearch                                                " ���������̃n�C���C�g

"--------------------------------------------------------------------------------
" �G���R�[�f�B���O
"--------------------------------------------------------------------------------
set fileformats=unix,dos,mac                                " �t�@�C���`���̔F������

" �K���ȕ����R�[�h����
set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

" �����ȕ����R�[�h����
" http://www.kawaz.jp/pukiwiki/?vim#content_1_7
" http://d.hatena.ne.jp/hazy-moon/20061229/1167407073
" if &encoding !=# 'utf-8'
    " set encoding=japan
    " set fileencoding=japan
" endif
" if has('iconv')
    " let s:enc_euc = 'euc-jp'
    " let s:enc_jis = 'iso-2022-jp'
    " iconv��eucJP-ms�ɑΉ����Ă��邩���`�F�b�N
    " if iconv("?x87?x64?x87?x6a", 'cp932', 'eucjp-ms') ==# "?xad?xc5?xad?xcb"
        " let s:enc_euc = 'eucjp-ms'
        " let s:enc_jis = 'iso-2022-jp-3'
    " iconv��JISX0213�ɑΉ����Ă��邩���`�F�b�N
    " elseif iconv("?x87?x64?x87?x6a", 'cp932', 'euc-jisx0213') ==# "?xad?xc5?xad?xcb"
        " let s:enc_euc = 'euc-jisx0213'
        " let s:enc_jis = 'iso-2022-jp-3'
    " endif
    " fileencodings���\�z
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
    " �萔������
    " unlet s:enc_euc
    " unlet s:enc_jis
" endif

if has('win32') && has('kaoriya')                           " �������F���̐ݒ�
    set ambiwidth=auto
else
    set ambiwidth=double
endif

"--------------------------------------------------------------------------------
" �L�[�}�b�v
"--------------------------------------------------------------------------------
nnoremap <Space>.   :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s.  :<C-u>source $MYVIMRC<CR>
nnoremap <C-h>      :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" �Ō�ɕύX�����e�L�X�g��I������
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>

nnoremap <ESC><ESC> :nohl<CR><ESC>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" �N���b�v�{�[�h�Ƃ̘A�g
if has('mac') && !has('gui')
    nnoremap <silent> gy :.w !pbcopy<CR><CR>
    vnoremap <silent> gy :w !pbcopy<CR><CR>
    nnoremap <silent> gp :r !pbpaste<CR>
    vnoremap <silent> gp :r !pbpaste<CR>
else
    noremap gy "+y
    noremap gp "+p
endif

" �R�}���h���C���ł̃L�[�o�C���h�� Emacs �X�^�C���ɂ���
" �s���ֈړ�
cnoremap <C-a> <Home>
" �ꕶ���߂�
"cnoremap <C-b><Left>
" �J�[�\���̉��̕������폜
"cnoremap <C-d> <Del>
" �s���ֈړ�
cnoremap <C-e> <End>
" �ꕶ���i��
"cnoremap <C-f> <Right>
" �R�}���h���C����������i��
"cnoremap <C-n> <Down>
" �R�}���h���C����������߂�
"cnoremap <C-p> <Up>
" �O�̒P��ֈړ�
"cnoremap <Esc><C-b> <S-Left>
" ���̒P��ֈړ�
"cnoremap <Esc><C-f> <S-Right>

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
" �R�}���h
"--------------------------------------------------------------------------------
" �G���R�[�f�B���O�̊ȈՐؑփR�}���h
command! Cp932 edit ++enc=cp932
command! Sjis  Cp932
command! Eucjp edit ++enc=euc-jp
command! Utf8  edit ++enc=utf-8

" cdpath���l�����������⊮���\�ɂ���
command! -complete=customlist,CompleteCD -nargs=? CD  cd <args>
function! CompleteCD(arglead, cmdline, cursorpos)
  let pattern = join(split(a:cmdline, '\s', !0)[1:], ' ') . '*/'
  return split(globpath(&cdpath, pattern), "\n")
endfunction

" ������cd�R�}���h��u��������
cnoreabbrev <expr> cd (getcmdtype() == ':' && getcmdline() ==# 'cd') ? 'CD' : 'cd'

"--------------------------------------------------------------------------------
" �v���O�C���̐ݒ�
"--------------------------------------------------------------------------------

"------------------------------------
" pathogen
"------------------------------------
filetype off                                            " ��x�t�@�C���^�C�v�����off
call pathogen#runtime_append_all_bundles()              " .vim/bundle/plugin_name��ǂݍ��ނ悤�ɂ���
call pathogen#helptags()                                " .vim/bunle/plugin_name�̃w���v��ǂݍ��߂�悤�ɂ���
filetype on                                             " �Ō�Ƀt�@�C���^�C�v��������ɖ߂�

"------------------------------------
" surround
"------------------------------------
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround

"------------------------------------
" NERD_commenter
"------------------------------------
let NERDSpaceDelims = 1                                 " �R�����g�̊ԂɃX�y�[�X���󂯂�
"map <Leader>x ,c<space>                                " ��s�R�����g�A�E�g�̃g�O��(Windows���Ǝ��s��ɃJ�[�\��������H)
"map <Leader>cs ,cs                                     " �����s�R�����g�A�E�g
"map <Leader>ca ,cA                                     " �s���R�����g
"let NERDShutUp=1                                       " ���Ή��t�@�C���^�C�v�̃G���[���b�Z�[�W��\�����Ȃ�

" ------------------------------------
" neocomplcache
"------------------------------------
let g:neocomplcache_enable_at_startup = 1               " neocomplcache��L���ɂ���
"let g:neocomplcache_max_list = 100                     " �⊮���X�g�̍ő匏��
"let g:neocomplcache_max_keyword_width = 50             " �⊮���̕\����
"g:neocomplcache_max_filename_width = 15                " �⊮�t�@�C�����̕\����
"let g:neocomplcache_auto_completion_start_length = 2   " �⊮���J�n���镶����
"let g:neocomplcache_enable_auto_select = 1             " �⊮���X�g�̐擪�������I�����邩
let g:neocomplcache_enable_smart_case = 1               " smart_case�⊮��L���ɂ���
"let g:neocomplcache_enable_camel_case_completion = 1   " camel_case�⊮��L���ɂ���
"let g:neocomplcache_enable_underbar_completion = 1     " �A���_�[�o�[��؂�̕⊮��L���ɂ���
let g:neocomplcache_min_syntax_length = 3               " �V���^�b�N�X�̃L���b�V���ŏ�������
"let g:neocomplcache_disable_caching_file_path_pattern  " �L���b�V�����Ȃ��o�b�t�@���̐��K�\��
"let g:neocomplcache_lock_buffer_name_pattern =         " �����⊮�𖳌�������o�b�t�@���̐��K�\��
"let g:neocomplcache_dictionary_filetype_lists = {      " �t�@�C���^�C�v���Ƃ̎����ݒ�
"let g:neocomplcache_keyword_patterns['default'] =      " �L�[���[�h�p�^�[���̐ݒ�

"---------------------------------------------------------------------------
" �J���[�ݒ�:
"---------------------------------------------------------------------------
set background=dark
colorscheme desert
