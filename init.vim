"OSの種類を取得する
let g:os_type= system('uname')
let g:os = "mac"
if has('win64')
    let g:os = "win"
elseif g:os_type == 'Linux\n'
    let g:os = "linux"
endif

" dein
runtime scripts/deinconfig.vim
" vimconfig
runtime scripts/vimconfig.vim

" Fern 
autocmd VimEnter * nested Fern . -reveal=% -drawer -stay

" python see => https://qiita.com/sigwyg/items/41630f8754c2028a7a9f
if g:os== "mac"
  let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
  let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
else
  let g:python_host_prog = 'C:\Python27\python.exe'
  let g:python3_host_prog = '~\scoop\apps\python\current\python.exe'
endif 

" node
if g:os== "mac"
  let g:node_host_prog = '~/.nodebrew/current/bin/neovim-node-host'
  let g:ruby_host_prog = '~/.rbenv/shims/neovim-ruby-host'
else
  let g:ruby_host_prog = '~\scoop\apps\ruby\current\gems\bin\neovim-ruby-host'
endif

"{{lsp
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_file = ""
let g:lsp_log_verbose = 0
let lsp_signature_help_enabled = 0
let g:lsp_signs_enabled = 1
let g:lsp_settings = {
      \ 'efm-langserver': {
      \   'disabled': 0,
      \   'allowlist': ['markdown'],
      \  }
      \ }
function! s:on_lsp_buffer_enabled() abort
  setlocal completeopt=menu
  setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
  au!
  au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


"lsp}}



command! ShowHighlight echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

" template
if g:os== "mac"
    let g:sonictemplate_vim_template_dir = [
                \ '~/.config/nvim/template'
                \]
endif

" command 
runtime scripts/extracommand.vim
" key mapping
runtime scripts/keymapping.vim

"test

