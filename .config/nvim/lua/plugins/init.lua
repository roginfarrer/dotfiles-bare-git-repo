local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  if vim.fn.input("Download Packer? (y for yes): ") ~= "y" then
    return
  end

  local out = vim.fn.system(string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", install_path))

  print(out)
  print("Downloading packer.nvim...")
end

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"

    -- Colors
    use "Rigellute/rigel"
    use "cocopon/iceberg.vim"
    use "bluz71/vim-nightfly-guicolors"
    use "Dualspc/spaceodyssey"

    -- use {"sheerun/vim-polyglot", config = require "plugins.polyglot"}
    use "itchyny/lightline.vim"
    use {"mhinz/vim-startify", config = require "plugins.startify"}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = require "plugins.treesitter"}
    use "machakann/vim-sandwich"
    use "tpope/vim-commentary"
    use "tpope/vim-sleuth"
    use "junegunn/goyo.vim"
    use "jiangmiao/auto-pairs"
    use "tpope/vim-abolish"
    use "dhruvasagar/vim-open-url"
    use {"vim-test/vim-test", config = require "plugins.vim-test"}
    use "wellle/targets.vim"
    -- if not vim.g.use_telescope then
    if vim.fn.isdirectory("/usr/local/opt/fzf") then
      use {"/usr/local/opt/fzf", disable = vim.g.use_telescope}
    else
      use {"junegunn/fzf", rtp = "~/.fzf", run = "./install --bin", disable = vim.g.use_telescope}
    end
    use {"junegunn/fzf.vim", disable = vim.g.use_telescope}
    -- end
    use {
      "nvim-telescope/telescope.nvim",
      config = require "plugins.telescope",
      disabled = not vim.g.use_telescope,
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-fzf-writer.nvim"
      }
    }
    use "justinmk/vim-dirvish"
    use {"roginfarrer/vim-dirvish-dovish", branch = "main"}
    use "tpope/vim-eunuch"
    use "duggiefresh/vim-easydir"
    use "jesseleite/vim-agriculture"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "whiteinge/diffconflicts"
    use "airblade/vim-gitgutter"
    use {"neoclide/coc.nvim", branch = "release", disable = vim.g.use_nvim_lsp, config = require "plugins.coc"}
    use {"neovim/nvim-lspconfig", disable = not vim.g.use_nvim_lsp}
    use "svermeulen/vimpeccable"
    use {"hrsh7th/nvim-compe", disable = not vim.g.use_nvim_lsp}
    -- use 'Shougo/deoplete.nvim', Cond((g:use_nvim_lsp), { 'do': ':UpdateRemoteuseins' })
    -- use 'shougo/deoplete.nvim', Cond(g:use_nvim_lsp)
    use {"voldikss/vim-floaterm", config = require "plugins.floaterm"}
    use {
      "glacambre/firenvim",
      run = function()
        vim.fn["firenvim#install"](0)
      end
    }
    use "kyazdani42/nvim-web-devicons"
    use "ryanoasis/vim-devicons"
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "colorizer".setup()
      end
    }
  end
)
