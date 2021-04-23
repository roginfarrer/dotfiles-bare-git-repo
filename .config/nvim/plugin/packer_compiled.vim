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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rfarrer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
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
    loaded = false,
    needs_bufread = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nI\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0*source $HOME/.config/nvim/vim/fzf.vim\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/fzf.vim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n¡\1\0\0\a\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\b\0006\4\0\0'\6\6\0B\4\2\0029\4\a\4=\4\t\3=\3\n\2B\0\2\1K\0\1\0\14callbacks\22github.csnzoo.com\1\0\0\24get_github_type_url\20gitlinker.hosts\topts\1\0\0\1\0\1\rmappings\15<leader>gc\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
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
    config = { "\27LJ\2\nO\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0000source $HOME/.config/nvim/vim/lightline.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  neogit = {
    config = { "\27LJ\2\no\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\rmappings\1\0\0\vstatus\1\0\0\1\0\1\6B\16BranchPopup\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_buffer.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_calc.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_emoji.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_luasnip.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lsp.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lua.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_omni.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_path.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_snippets_nvim.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_spell.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_tags.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_treesitter.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_ultisnips.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsc.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsp.vim", "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vsnip.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/popup.nvim"
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
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/telescope.nvim"
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
  ["vim-lighthaus"] = {
    loaded = true,
    path = "/Users/rfarrer/.local/share/nvim/site/pack/packer/start/vim-lighthaus"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\ne\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\b\0\0\thtml\bcss\tscss\ash\15javascript\tyaml\tjson\30markdown_fenced_languages\6g\bvim\0" },
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

time("Defining packer_plugins", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: vim-markdown
time("Config for vim-markdown", true)
try_loadstring("\27LJ\2\ne\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\b\0\0\thtml\bcss\tscss\ash\15javascript\tyaml\tjson\30markdown_fenced_languages\6g\bvim\0", "config", "vim-markdown")
time("Config for vim-markdown", false)
-- Config for: vim-test
time("Config for vim-test", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.vim-test\frequire\0", "config", "vim-test")
time("Config for vim-test", false)
-- Config for: vim-fugitive
time("Config for vim-fugitive", true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.git\frequire\0", "config", "vim-fugitive")
time("Config for vim-fugitive", false)
-- Config for: neogit
time("Config for neogit", true)
try_loadstring("\27LJ\2\no\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\rmappings\1\0\0\vstatus\1\0\0\1\0\1\6B\16BranchPopup\nsetup\vneogit\frequire\0", "config", "neogit")
time("Config for neogit", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time("Config for nvim-colorizer.lua", false)
-- Config for: lightline.vim
time("Config for lightline.vim", true)
try_loadstring("\27LJ\2\nO\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0000source $HOME/.config/nvim/vim/lightline.vim\bcmd\bvim\0", "config", "lightline.vim")
time("Config for lightline.vim", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: vim-floaterm
time("Config for vim-floaterm", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.floaterm\frequire\0", "config", "vim-floaterm")
time("Config for vim-floaterm", false)
-- Config for: gitlinker.nvim
time("Config for gitlinker.nvim", true)
try_loadstring("\27LJ\2\n¡\1\0\0\a\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\b\0006\4\0\0'\6\6\0B\4\2\0029\4\a\4=\4\t\3=\3\n\2B\0\2\1K\0\1\0\14callbacks\22github.csnzoo.com\1\0\0\24get_github_type_url\20gitlinker.hosts\topts\1\0\0\1\0\1\rmappings\15<leader>gc\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time("Config for gitlinker.nvim", false)
-- Config for: vim-startify
time("Config for vim-startify", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.startify\frequire\0", "config", "vim-startify")
time("Config for vim-startify", false)
-- Config for: nvim-ts-autotag
time("Config for nvim-ts-autotag", true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time("Config for nvim-ts-autotag", false)
-- Config for: coc.nvim
time("Config for coc.nvim", true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.coc\frequire\0", "config", "coc.nvim")
time("Config for coc.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
