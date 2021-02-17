local vimp = require'vimp'

require'compe'.setup {
  enabled = true;
  -- min_length = 1;
  -- preselect = 'enable' || 'disable' || 'always';
  -- throttle_time = ... number ...;
  -- source_timeout = ... number ...;
  -- incomplete_delay = ... number ...;
  -- allow_prefix_unmatch = false;

  source = {
    path = true;
    buffer = true;
    -- vsnip = true;
    nvim_lsp = true;
  };
}

-- vimp.inoremap({'expr', 'silent'}, '<C-Space>', [[:call compe#complete()]])
-- vimp.inoremap({'expr', 'silent'}, '<CR>', [[:call compe#confirm("<CR>")]])
-- vimp.inoremap({'expr', 'silent'}, '<C-e>', [[:call compe#close("<C-e>"))]])
-- inoremap <silent><expr> <C-Space> compe#complete()
--   inoremap <silent><expr> <CR>      compe#confirm('<CR>')
--   inoremap <silent><expr> <C-e>     compe#close('<C-e>')
