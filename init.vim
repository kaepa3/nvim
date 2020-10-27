"OSの種類を取得する
let s:os_type= system('uname')
let s:os = "mac"
if has('win64')
    let s:os = "win"
elseif s:os_type == 'Linux\n'
    let s:os = "linux"
endif

let s:dein_dir = expand('~/.cache/dein')

if s:os== "mac"
  " プラグインが実際にインストールされるディレクトリ
  " dein.vim 本体
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  " dein.vim がなければ github から落としてくる
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  endif

elseif s:os == "win"
  "::dein Scripts-----------------------------
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.cache/dein.vim

  " Required:
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Let dein manage dein
    " Required:

    if s:os== "mac"
        let g:rc_dir    = expand('~/.config/nvim/rc')
        let s:toml      = g:rc_dir . '/dein.toml'
        let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
        let s:mac_toml = g:rc_dir . '/dein_mac.toml'

        " TOML を読み込み、キャッシュしておく
        call dein#load_toml(s:mac_toml,  {'lazy': 0})
        call dein#load_toml(s:toml,      {'lazy': 0})
        call dein#load_toml(s:lazy_toml, {'lazy': 1})
    elseif s:os == "win"
        call dein#add('~\.cache\dein.vim')
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein.toml', {'lazy':0})
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein_lazy.toml', {'lazy':1})
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein_win.toml',{'lazy':0})
    endif

    " Required:
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" dein auto plugin maintenance
let g:dein#auto_recache = 1

"
set virtualedit=block
"
set number
set laststatus=2
"
syntax on
"search
set hlsearch
set ignorecase
set smartcase

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~


set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set title
set showmatch

set wildmenu

" カレント行ハイライト
set cursorline

" マウス有効
set mouse=a

" インデント設定
filetype plugin indent on


" nerdtree
autocmd VimEnter * execute 'NERDTree' 
autocmd VimEnter * wincmd p 
" クリップボード
set clipboard=unnamed

" python see => https://qiita.com/sigwyg/items/41630f8754c2028a7a9f
if s:os_type == "Darwin\n"
  let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
  let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
else
  let g:python_host_prog = 'C:\Python27\python.exe'
  let g:python3_host_prog = '~\scoop\shims\python.exe'
endif 
" theme
set list "スペースの可視化"
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:% "space 対応"

" node
if s:os_type == "Darwin\n"
  let g:node_host_prog = '~/.nodebrew/current/bin/neovim-node-host'
  let g:ruby_host_prog = '~/.rbenv/shims/neovim-ruby-host'
endif

"lsp
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_file = ""
let g:lsp_log_verbose = 0
let lsp_signature_help_enabled = 0
let g:lsp_signs_enabled = 1


command! ShowHighlight echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

" key mapping
let g:mapleader = "\<Space>"
if s:os_type == "Darwin\n"
    nnoremap <C-c> !pbcopy;pbpaste
    nnoremap <Leader>. :new ~/.config/nvim/init.vim<CR>
elseif s:os == "win"
  nmap <C-v> <C-v>
  cmap <C-v> <C-v>
endif
nnoremap <C-k> :LspDocumentFormat<CR>
nnoremap <C-j> :LspPeekDefinition<CR>

tnoremap <C-q> <C-\><C-n>

