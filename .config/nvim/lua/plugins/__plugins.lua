local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd [[packadd packer.nvim]]
-- Run :PackerCompile whenver this file is updated
vim.cmd [[autocmd BufWritePost __plugins.lua PackerCompile]]

return require("packer").startup(
  function(use)
    use {"wbthomason/packer.nvim", opt = true}

    -- Colors
    use "Rigellute/rigel"
    use "cocopon/iceberg.vim"
    use "bluz71/vim-nightfly-guicolors"
    use "Dualspc/spaceodyssey"

    -- use {"sheerun/vim-polyglot", config = function() require "plugins.polyglot" end}
    use "itchyny/lightline.vim"
    use {
      "mhinz/vim-startify",
      config = function()
        require "plugins.startify"
      end
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "plugins.treesitter"
      end
    }
    use "machakann/vim-sandwich"
    use "tpope/vim-commentary"
    use "tpope/vim-sleuth"
    use "junegunn/goyo.vim"
    use "jiangmiao/auto-pairs"
    use "tpope/vim-abolish"
    use "dhruvasagar/vim-open-url"
    use {
      "vim-test/vim-test",
      config = function()
        require "plugins.vim-test"
      end
    }
    use "wellle/targets.vim"
    if vim.fn.isdirectory("/usr/local/opt/fzf") then
      use {"/usr/local/opt/fzf", opt = vim.g.use_telescope}
    else
      use {"junegunn/fzf", rtp = "~/.fzf", run = "./install --bin", opt = vim.g.use_telescope}
    end
    use {
      "junegunn/fzf.vim",
      opt = vim.g.use_telescope,
      config = function()
        vim.cmd("source $HOME/.config/nvim/vim/fzf.vim")
      end
    }
    use {
      "nvim-telescope/telescope.nvim",
      config = function()
        require "plugins.telescope"
      end,
      opt = not vim.g.use_telescope,
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-fzf-writer.nvim"
      }
    }
    use "justinmk/vim-dirvish"
    use {"roginfarrer/vim-dirvish-dovish", branch = "main"}
    use "tpope/vim-eunuch"
    use "duggiefresh/vim-easydir"
    use "jesseleite/vim-agriculture"
    use {
      "tpope/vim-fugitive",
      config = function()
        require "plugins.git"
      end
    }
    use {
      "tpope/vim-rhubarb",
      config = function()
        require "plugins.git"
      end
    }
    use "whiteinge/diffconflicts"
    use "airblade/vim-gitgutter"
    use {
      "neoclide/coc.nvim",
      branch = "release",
      opt = vim.g.use_nvim_lsp,
      config = function()
        require "plugins.coc"
      end
    }
    use {"neovim/nvim-lspconfig", opt = not vim.g.use_nvim_lsp}
    use "svermeulen/vimpeccable"
    use {"hrsh7th/nvim-compe", opt = not vim.g.use_nvim_lsp}
    -- use 'Shougo/deoplete.nvim', Cond((g:use_nvim_lsp), { 'do': ':UpdateRemoteuseins' })
    -- use 'shougo/deoplete.nvim', Cond(g:use_nvim_lsp)
    use {
      "voldikss/vim-floaterm",
      config = function()
        require "plugins.floaterm"
      end
    }
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
    use {"plasticboy/vim-markdown"}
  end
)
