nnoremap <silent> <C-p> <cmd>Telescope git_files<CR>
nnoremap <silent> <Leader>f <cmd>Telescope live_grep<CR>
nnoremap <silent> <Leader>; :lua require'plugins.telescope'.recent_buffers()<CR>
nnoremap <silent> <Leader>h <cmd>Telescope oldfiles<CR>
nnoremap <silent> <Leader>c <cmd>Telescope command_history<CR>
