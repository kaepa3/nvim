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

" theme
set list "スペースの可視化"
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:% "space 対応"
" インデント設定
filetype plugin indent on


" クリップボード
set clipboard=unnamed
