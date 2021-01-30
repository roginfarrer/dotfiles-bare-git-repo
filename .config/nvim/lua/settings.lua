local vim = vim

local Type = {GLOBAL_OPTION = "o", WINDOW_OPTION = "wo", BUFFER_OPTION = "bo"}
local add_options = function(option_type, options)
  if type(options) ~= "table" then
    error 'options should be a type of "table"'
    return
  end
  local vim_option = vim[option_type]
  for key, value in pairs(options) do
    vim_option[key] = value
  end
end
local Option = {}
Option.g = function(options)
  add_options(Type.GLOBAL_OPTION, options)
end
Option.w = function(options)
  add_options(Type.WINDOW_OPTION, options)
end
Option.b = function(options)
  add_options(Type.BUFFER_OPTION, options)
end

Option.g {
  mouse = "a",
  splitright = true,
  splitbelow = true,
  smartindent = true,
  linebreak = true,
  hidden = true,
  swapfile = false,
  undofile = true,
  updatetime = 300,
  ignorecase = true,
  smartcase = true,
  hlsearch = false,
  inccommand = "nosplit",
  lazyredraw = true,
  scrolloff = 10,
  completeopt = "menuone,noinsert,noselect",
  termguicolors = true
}
Option.b {
  swapfile = false,
  shiftwidth = 2
}
Option.w {
  number = true,
  relativenumber = true,
  foldlevel = 99,
  foldnestmax = 10,
  foldmethod = "syntax",
  foldexpr = "nvim_treesitter#foldexpr()"
}

vim.api.nvim_command('let mapleader = " "')
vim.api.nvim_command("colorscheme nightfly")

return Option
