" let g:ale_fixers = {
"       \   'css': ['prettier', 'stylelint'],
"       \   'scss': ['prettier', 'stylelint'],
"       \   'json': ['prettier'],
"       \   'javascript': ['prettier', 'eslint'],
"       \   'typescript': ['prettier', 'eslint'],
"       \   'javascriptreact': ['prettier', 'eslint'],
"       \   'typescriptreact': ['prettier', 'eslint'],
"       \   'markdown': ['prettier'],
"       \   'markdown.mdx': ['prettier'],
"       \   'vim': ['remove_trailing_lines', 'trim_whitespace'],
"       \   'lua': ['luafmt']
"       \}
" let js_linters = ['stylelint', 'eslint']
" let g:ale_linters = {
"       \'typescript': js_linters,
"       \'typescriptreact': js_linters,
"       \'javascript': js_linters,
"       \'javascriptreact': js_linters,
"       \'css': ['stylelint'],
"       \'scss': ['stylelint'],
"       \}
" let g:ale_linters_explicit = 1
" let g:ale_typescript_prettier_use_local_config = 1
" let g:ale_fix_on_save = 1
" let g:ale_virtualtext_cursor = 0
" let g:ale_cursor_detail = 0
" let g:ale_echo_cursor = 1
" nmap <silent> [g <Plug>(ale_previous_wrap)
" nmap <silent> ]g <Plug>(ale_next_wrap)

" Must be set after plug#end()
" function! FormatLua(buffer) abort
"     return {
"     \   'command': 'luafmt --stdin'
"     \}
" endfunction
" call ale#fix#registry#Add('luafmt', 'FormatLua', ['lua'], 'luafmt for lua')
