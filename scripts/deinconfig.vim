let g:os= get(g:, 'os', 'mac')

let s:dein_dir = expand('~/.cache/dein')
let s:dein_dir = expand('~/.cache/dein')

if g:os== "mac"
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

elseif g:os == "win"
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

    if g:os== "mac"
        let g:rc_dir    = expand('~/.config/nvim/rc')
        let s:toml      = g:rc_dir . '/dein.toml'
        let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
        let s:mac_toml = g:rc_dir . '/dein_mac.toml'

        " TOML を読み込み、キャッシュしておく
        call dein#load_toml(s:mac_toml,  {'lazy': 0})
        call dein#load_toml(s:toml,      {'lazy': 0})
        call dein#load_toml(s:lazy_toml, {'lazy': 1})
    elseif g:os == "win"
        call dein#add('~\.cache\dein.vim')
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein_win.toml',{'lazy':0})
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein.toml', {'lazy':0})
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein_lazy.toml', {'lazy':1})
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

if g:os== "mac"
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

elseif g:os == "win"
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

    if g:os== "mac"
        let g:rc_dir    = expand('~/.config/nvim/rc')
        let s:toml      = g:rc_dir . '/dein.toml'
        let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
        let s:mac_toml = g:rc_dir . '/dein_mac.toml'

        " TOML を読み込み、キャッシュしておく
        call dein#load_toml(s:mac_toml,  {'lazy': 0})
        call dein#load_toml(s:toml,      {'lazy': 0})
        call dein#load_toml(s:lazy_toml, {'lazy': 1})
    elseif g:os == "win"
        call dein#add('~\.cache\dein.vim')
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein_win.toml',{'lazy':0})
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein.toml', {'lazy':0})
        call dein#load_toml( '~\AppData\Local\nvim\rc\dein_lazy.toml', {'lazy':1})
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
