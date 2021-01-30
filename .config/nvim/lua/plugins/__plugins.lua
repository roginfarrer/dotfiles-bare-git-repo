local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require("packer").startup(
  function()
    local use = use

    use "sheerun/vim-polyglot"
    use "itchyny/lightline.vim"
    use {"glepnir/galaxyline.nvim", branch = "main"}
    use "mhinz/vim-startify"
    use "Rigellute/rigel"
    use "cocopon/iceberg.vim"
    use "bluz71/vim-nightfly-guicolors"
    use "Dualspc/spaceodyssey"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "machakann/vim-sandwich"
    use "tpope/vim-commentary"
    use "tpope/vim-sleuth"
    use "junegunn/goyo.vim"
    use "jiangmiao/auto-pairs"
    use "tpope/vim-abolish"
    use "dhruvasagar/vim-open-url"
    use "vim-test/vim-test"
    use "wellle/targets.vim"
    -- if isdirectory('/usr/local/opt/fzf')
    --   use '/usr/local/opt/fzf' | use 'junegunn/fzf.vim', Cond(!(g:use_telescope))
    -- else
    --   use 'junegunn/fzf', Cond(!(g:use_telescope)), { 'dir': '~/.fzf', 'do': './install --bin' }
    --   use 'junegunn/fzf.vim', Cond(!(g:use_telescope))
    -- endif
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-fzf-writer.nvim"
      }
    }
    -- use 'nvim-telescope/telescope-fzy-native.nvim', Cond(g:use_telescope)
    -- use 'nvim-telescope/telescope-fzf-writer.nvim', Cond(g:use_telescope)
    use "justinmk/vim-dirvish"
    use {"roginfarrer/vim-dirvish-dovish", branch = "main"}
    use "tpope/vim-eunuch"
    use "duggiefresh/vim-easydir"
    use "jesseleite/vim-agriculture"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "whiteinge/diffconflicts"
    use "airblade/vim-gitgutter"
    use {"neoclide/coc.nvim", branch = "release"}
    -- use {'neovim/nvim-lspconfig', disabled = not vim.g('use_nvim_lsp')}
    use "svermeulen/vimpeccable"
    -- use 'hrsh7th/nvim-compe', Cond(g:use_nvim_lsp)
    -- use 'Shougo/deoplete.nvim', Cond((g:use_nvim_lsp), { 'do': ':UpdateRemoteuseins' })
    -- use 'shougo/deoplete.nvim', Cond(g:use_nvim_lsp)
    use "voldikss/vim-floaterm"
    -- use {'glacambre/firenvim',  'do' =  { _ -> firenvim#install(0) } }
    use "kyazdani42/nvim-web-devicons"
    use "ryanoasis/vim-devicons"
    use "norcalli/nvim-colorizer.lua"
  end
)
