" To map <Esc> to exit terminal-mode: >
tnoremap <leader><Esc> <C-\><C-n>
" To map <Esc> to exit terminal-mode: >
tnoremap <leader>j <C-\><C-n>
" Open a new split with a terminal
nnoremap <leader>te :vs<CR>:terminal fish<CR>

" a paste from register chord
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'

" When term starts, auto go into insert mode
autocmd TermOpen * startinsert

" Turn off line numbers etc
autocmd TermOpen * setlocal listchars= nonumber norelativenumber

