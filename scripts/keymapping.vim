let g:os= get(g:, 'os_type', 'mac')
let g:mapleader = "\<Space>"
if g:os== "mac"
    nnoremap <C-c> !pbcopy;pbpaste
    nnoremap <Leader>. :new ~/.config/nvim/init.vim<CR>
elseif g:os== "win"
  nmap <C-v> <C-v>
  cmap <C-v> <C-v>
endif
nnoremap <C-k> :LspDocumentFormat<CR>
nnoremap <C-j> :LspPeekDefinition<CR>
nnoremap <Leader>j :LspDefinition<CR>
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>c :LspDocumentDiagnostics<CR>
nnoremap <Leader>r :LspRename<CR>
" ターミナルからの脱出
tnoremap <C-q> <C-\><C-n>

" 次の行へ
inoremap <silent> <C-n> <ESC>o

" Fern 開く
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
