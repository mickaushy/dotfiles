" ----- neobundle.vim -----
 if !1 | finish | endif
" vim起動時のみruntimepathにneobundle.vimを追加
 if has('vim_starting')
   set nocompatible               " Be iMproved

 " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 読み込むプラグインを記載
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'chriskempson/vim-tomorrow-theme', { 'rtp': '.vim/' }
NeoBundle 'haya14busa/eew.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-splash'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'w0ng/vim-hybrid'
call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck



" ===== GENERAL & KEYMAP SETTINGS =====
" src: http://vimblog.hatenablog.com/entry/vimrc_set_recommended_options
" ----- view -----
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set nocursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:▸\ ,trail:~,eol:¬,extends:❯,precedes:❮

" ----- cursor -----
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=3               " 左右スクロールは一文字づつ行う

"  ----- file -----

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" ----- search -----

set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

" -----  indentation -----

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"  ----- env -----

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
" set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" Windows でもパスの区切り文字を / にする
set shellslash
" インサートモードから抜けると自動的にIMEをオフにする
set iminsert=2

"  ----- cli -----

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

"  ----- beep -----

"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない


"  ----- color -----
syntax on
set t_Co=256
set background=dark
colorscheme jellybeans

"  ----- keymap -----
" todo -  F6で相対行番号とか
" def leader
" jjでESC
inoremap <silent> jj <ESC><Right>
" jやkを見た目に合わせる(改行時)
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" insert中にC-hjklで移動
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
" cc, dd, yy → 行に対して
" C, D, Y → カーソルから行末まででないとおかしくね？
nnoremap Y y$     " 元は対行
" esc2回押しで検索ハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR>
" normalでのenterで改行
noremap <CR> o<ESC>

" カッコの補完
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap '' ''<Left>
inoremap "" ""<Left>
inoremap <> <><Left>

" ===== PLUGIN SETTINGS =====
" ----- emmet-vim -----
let g:user_emmet_settings = {
      \ 'lang': 'ja'
      \ }

" ----- vim-easymotion -----
map (easymotion-prefix)
let g:EasyMotion_leader_key = "<Space><Space>"
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'

" ----- vimfiler.vim -----
:let g:vimfiler_as_default_explorer = 1



" ----- lightline.vim -----
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ },
        \ 'separator': {'left': '', 'right': ''},
        \ 'subseparator': {'left': '', 'right': ''}
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:lightline.mode_map = {
    \ 'n' : 'NORM',
    \ 'i' : 'INS.',
    \ 'R' : 'REPL.',
    \ 'v' : 'V',
    \ 'V' : 'V.LINE',
    \ 'c': 'COMMAND',
    \ "\<C-v>": 'V.BLK',
    \ 's' : 'SEL.',
    \ 'S' : 'S-LINE',
    \ "\<C-s>": 'S.BLK',
    \ '?': '      ' }

" -------------------------
"
