let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled = 0
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.mdx call prettier#Autoformat()
augroup END
