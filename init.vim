"OSの種類を取得する
let s:os_type= system('uname')

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.config/nvim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  
 " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

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
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

" theme
set list "スペースの可視化"
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:% "space 対応"

" node
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" type script

"lsp
let g:lsp_diagnostics_enabled = 0
let g:lsp_log_file = ""
let g:lsp_log_verbose = 0
let lsp_signature_help_enabled = 0


command! ShowHighlight echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

" key mapping
if s:os_type == "Darwin\n"
    nnoremap <C-c> !pbcopy;pbpaste
endif
nnoremap <C-k> :LspDocumentFormat<CR>
