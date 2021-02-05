" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.coc\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  diffconflicts = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/diffconflicts"
  },
  firenvim = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nI\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0*source $HOME/.config/nvim/vim/fzf.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/iceberg.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  rigel = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/rigel"
  },
  spaceodyssey = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/spaceodyssey"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzf-writer.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/telescope-fzf-writer.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzf-writer.nvim", "plenary.nvim", "popup.nvim" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-agriculture"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-agriculture"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-dirvish-dovish"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-dirvish-dovish"
  },
  ["vim-easydir"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-easydir"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.floaterm\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.git\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-open-url"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-open-url"
  },
  ["vim-rhubarb"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.git\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.startify\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.vim-test\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  vimpeccable = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vimpeccable"
  }
}

-- Config for: coc.nvim
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.coc\frequire\0", "config", "coc.nvim")
-- Config for: fzf.vim
try_loadstring("\27LJ\2\nI\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0*source $HOME/.config/nvim/vim/fzf.vim\bcmd\bvim\0", "config", "fzf.vim")
-- Config for: vim-rhubarb
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.git\frequire\0", "config", "vim-rhubarb")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: vim-test
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.vim-test\frequire\0", "config", "vim-test")
-- Config for: vim-floaterm
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.floaterm\frequire\0", "config", "vim-floaterm")
-- Config for: vim-fugitive
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.git\frequire\0", "config", "vim-fugitive")
-- Config for: vim-startify
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.startify\frequire\0", "config", "vim-startify")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
