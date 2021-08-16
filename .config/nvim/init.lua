-- Some handy toggles for trying to setups
vim.g.use_nvim_lsp = false

_G.global = {}

require("pluginList")
require("settings")
require("autocmds")
require("keybindings")

if vim.g.use_nvim_lsp then
  require("plugins.lsp")
end

if vim.fn.empty(vim.fn.glob("$HOME/.config/nvim/local-config.vim")) == 0 then
  vim.cmd([[source $HOME/.config/nvim/local-config.vim]])
end
