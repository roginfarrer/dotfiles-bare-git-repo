vim.g.use_nvim_lsp = false
vim.g.use_nvim_lsp = true

require "settings"
-- require'init'
require "autocmds"
require "keybindings"

require "plugins.__plugins"
require "plugins.coc"
require "plugins.floaterm"
require "plugins.polyglot"
require "plugins.startify"
require "plugins.telescope"
require "plugins.treesitter"
require "plugins.vim-test"
