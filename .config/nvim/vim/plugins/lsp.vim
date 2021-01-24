" autocmd BufEnter * lua require'completion'.on_attach()
" lua require("lsp-ale-diagnostic")

" :lua << END
"   local nvim_lsp = require('lspconfig')

"   local servers = {'tsserver', 'vimls', 'cssls'}
"   for _, lsp in ipairs(servers) do
"     nvim_lsp[lsp].setup{}
"   end
" END

nnoremap <silent> K  :call <SID>show_documentation()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nmap     <silent> <leader>lr <cmd>lua vim.lsp.buf.rename()<CR>
nmap     <silent> <leader>do <cmd>lua vim.lsp.buf.code_action()<CR>

function! s:show_documentation()
  " try looking up term in vim manual if in a vim file
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    silent execute(':lua vim.lsp.buf.hover()')
  endif
endfunction

" Diagnostics
nmap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nmap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" " Enable the inline diagnostic messaging
" let g:diagnostic_enable_virtual_text = 1
" " Disable diagnostics while in insert mode
" let g:diagnostic_insert_delay = 1

" Completion
" Use in every buffer, not just those with an LSP
" autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" imap <C-Space> <Plug>(completion_trigger)
" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)
" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
" set shortmess+=c
"" Avoid showing message extra message when using completion
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
" let g:completion_trigger_keyword_length = 0
