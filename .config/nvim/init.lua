vim.g.use_nvim_lsp = false
vim.g.use_telescope = false

require "plugins.__plugins"

require "settings"
require "autocmds"
require "keybindings"

if vim.fn.empty(vim.fn.glob("$HOME/.config/nvim/local-config.vim")) == 0 then
  vim.cmd [[source $HOME/.config/nvim/local-config.vim]]
end
