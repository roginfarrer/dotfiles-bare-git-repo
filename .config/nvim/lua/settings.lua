-- TODO: Remove when https://github.com/neovim/neovim/pull/13479 lands
local opts_info = vim.api.nvim_get_all_options_info()
local opt =
  setmetatable(
  {},
  {
    __index = vim.o,
    __newindex = function(_, key, value)
      vim.o[key] = value
      local scope = opts_info[key].scope
      if scope == "win" then
        vim.wo[key] = value
      elseif scope == "buf" then
        vim.bo[key] = value
      end
    end
  }
)

opt.completeopt = "menuone,noinsert,noselect"
opt.expandtab = true
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = [[nvim_treesitter#foldexpr()]]
opt.foldnestmax = 10
opt.hidden = true
opt.hlsearch = false
opt.ignorecase = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.lazyredraw = true
opt.linebreak = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.shiftwidth = 2
opt.tabstop = 2
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.swapfile = false
opt.termguicolors = true
opt.undofile = true
opt.updatetime = 300

vim.g.mapleader = " "
vim.cmd("colorscheme nightfly")
