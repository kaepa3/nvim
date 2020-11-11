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

tnoremap <C-q> <C-\><C-n>
nnoremap <Leader>j :LspDefinition<CR>