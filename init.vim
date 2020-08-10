"::dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein.vim

" Required:
if dein#load_state('C:\Users\yamaz\.cache\dein')
  call dein#begin('C:\Users\yamaz\.cache\dein')

  " Let dein manage dein
  " Required:
  call dein#add('C:\Users\yamaz\.cache\dein.vim')

  
  call dein#load_toml( 'C:\Users\yamaz\AppData\Local\nvim\rc\dein.toml', {'lazy':0}) 
  call dein#load_toml( 'C:\Users\yamaz\AppData\Local\nvim\rc\dein_lazy.toml', {'lazy':1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"
set number
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
let g:python_host_prog = 'C:\Python27\python.exe'
let g:python3_host_prog = 'C:\Users\yamaz\scoop\shims\python.exe'

" theme
set list "スペースの可視化"
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:% "space 対応"

" node
" type script

"lsp
let g:lsp_diagnostics_enabled = 0
let g:lsp_log_file = ""
let g:lsp_log_verbose = 0
let lsp_signature_help_enabled = 0

"keybind
nmap <C-v> <C-v>
cmap <C-v> <C-v>
