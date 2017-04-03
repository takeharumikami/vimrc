
" Path設定
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

" set filetype
autocmd bufnewfile,bufread *.jade set filetype=jade
autocmd bufnewfile,bufread *.styl set filetype=stylus
autocmd bufnewfile,bufread *.md set filetype=markdown
autocmd bufnewfile,bufread *.go set filetype=go

" ==============================
" ======= Vim setting ==========
" ==============================

" ファイル形式の検出を無効
filetype off
" ファイル形式別プラグインのロードを有効化
filetype plugin on
" ファイル形式別インデントのロードを有効化
filetype indent on

" Vim のデフォルト設定
set nocompatible
" 行数
set number
" コマンドモードでの補完設定
set wildmode=longest:full,list
" swapファイルを作成しない
set noswapfile
" 不可視文字の表示 タブ スペース 改行
set list
set listchars=tab:▸\ ,trail:~,eol:↲,extends:»,precedes:«,nbsp:%
" 検索ハイライト
set hlsearch
" タブをスペースに変更
set expandtab
" タブを常に非表示
set showtabline=0
" タブ幅
set tabstop=2
" Tabキー押下時のカーソル移動幅
set softtabstop=2
" インデント幅
set shiftwidth=2

" カレント行ハイライト
set cursorline
" アンダーラインをひく
autocmd VimEnter,ColorScheme * : highlight CursorLine cterm=underline ctermbg=234



" ==============================
" ========= Neobundle ==========
" ==============================

" neobundle
NeoBundle 'Shougo/neobundle.vim'

" ===== packages ======
" tree
NeoBundle 'scrooloose/nerdtree'
" syntax
NeoBundle 'scrooloose/syntastic.git'
" 補完
NeoBundle 'Shougo/neocomplcache'
" ステータスライン
" NeoBundle 'itchyny/lightline.vim'
" ファイラ
NeoBundle "kien/ctrlp.vim"
" コメントアウト
NeoBundle "tomtom/tcomment_vim"
" fの検索カスタマイズ
" NeoBundle 'rhysd/clever-f.vim'

" color schema
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'

" HTML5
NeoBundle 'taichouchou2/html5.vim'
" CSS3
NeoBundle 'hail2u/vim-css3-syntax'
" JADE
NeoBundle 'digitaltoad/vim-jade'
" STYLUS
NeoBundle 'wavded/vim-stylus'
" MARKDOWN
NeoBundle 'tpope/vim-markdown'

" javascript
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Simple-Javascript-Indenter'

" c++
NeoBundle 'vim-jp/cpp-vim'
"NeoBundle 'kelan/gyp.vim'

" python
NeoBundle 'hdima/python-syntax'

" golang
NeoBundle 'fatih/vim-go'

" ===== color setting =====
" 構文ハイライトを有効
syntax on
" 背景色
set background=dark
" コメントの色変更
" autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#8ABEB7

let g:molokai=256
colorscheme molokai

" let g:hybrid_use_Xresources = 1
" colorscheme hybrid

" let g:jellybeans_use_lowcolor_black = 0
" colorscheme jellybeans

" let g:solarized_termcolors=256
" colorscheme solarized


" ==============================
" ========== Utils =============
" ==============================

" ======= NERDTREE =======
" keybind of NERDTree
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

" 引数なしならNERDTree起動（ファイルを指定しなかった場合）
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * NERDTree /Users/A12708/project
endif

let NERDTreeWinSize=45

" ======= neocomplcache setting =======
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
""inoremap <expr><C-i>  neocomplcache#cancel_popup()



" ==============================
" ==========javascript==========
" ==============================

" ===== syntastic =====
" set syntastic jshint
let g:syntastic_javascript_checker = "jshint"
"let g:syntastic_javascript_jshint_conf = "~/.jshintrc"

" ===== Simple javascript indenter =====
" shiftwidthを1にしてインデント
let g:SimpleJsIndenter_BriefMode = 1
" switchのインデント調整
let g:SimpleJsIndenter_CaseIndentLevel = -1



" ==============================
" ==========  golang  ==========
" ==============================

"let g:go_highlight_methods = 1
"let g:go_highlight_interfaces = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1



" ==============================
" ======= キーマッピング =======
" ==============================

" 複数tab一括操作
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" 括弧の自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" カーソル移動時 画面中央にマッピング
noremap { {zz
noremap } }zz
noremap j jzz
noremap k kzz
noremap w wzz
noremap b bzz
noremap + +zz
noremap - -zz
noremap e ezz
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap <C-f> <C-f>zz
noremap <C-b> <C-b>zz
noremap <C-w><C-w> <C-w><C-w>zz
noremap <C-o> <C-o>zz
noremap <C-i> <C-i>zz

" 改行で画面中央にマッピング
" map o o<C-[>zzi
noremap <CR> <CR>zz
cnoremap <CR> <CR>zz
" imap <CR> <CR><C-[>zza

" 検索時画面中央にマッピング
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # *zz

"=======emacs キーバインド======
"移動"
imap <C-f> <C-e><Right>
imap <C-b> <C-e><Left>
""imap <C-e> <C-i><End>
""imap <C-a> <C-i><Home>

" ======便利キーバインド======
" 改行のみ、キーソルはそのまま
imap <C-j> <CR><Esc>k$a<CR>

" =====末尾空白削除======
autocmd BufWritePre * :%s/\s\+$//ge

" End of NeoBundle
call neobundle#end()
