" Set syntax highlighting for config files
" autocmd BufNewFile,BufRead,BufEnter *stylelintrc,*eslintrc,*babelrc,*jshintrc,*prettierrc setlocal filetype=json

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Use cursorline for insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Highlight on Yank
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Substitute", timeout=250}

autocmd BufEnter,BufRead *.tsx set filetype=typescriptreact
