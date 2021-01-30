" 0 = use coc.nvim, 1 = use nvim lsp
let g:use_nvim_lsp = 0

" 0 = use fzf, 1 = use telescope
let g:use_telescope = 1

" Plug Startup {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" }}}

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'             " Syntax highlighting for pretty much everything
Plug 'itchyny/lightline.vim'            " Custom statusline
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'mhinz/vim-startify'               
Plug 'Rigellute/rigel'                  
Plug 'cocopon/iceberg.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'Dualspc/spaceodyssey'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
" Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
" Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-abolish'
Plug 'dhruvasagar/vim-open-url'
Plug 'vim-test/vim-test'
Plug 'wellle/targets.vim'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim', Cond(!(g:use_telescope))
else
  Plug 'junegunn/fzf', Cond(!(g:use_telescope)), { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim', Cond(!(g:use_telescope))
endif
Plug 'nvim-lua/popup.nvim', Cond(g:use_telescope)
Plug 'nvim-lua/plenary.nvim', Cond(g:use_telescope)
Plug 'nvim-telescope/telescope.nvim', Cond(g:use_telescope)
Plug 'nvim-telescope/telescope-fzy-native.nvim', Cond(g:use_telescope)
Plug 'nvim-telescope/telescope-fzf-writer.nvim', Cond(g:use_telescope)
Plug 'justinmk/vim-dirvish'
Plug 'roginfarrer/vim-dirvish-dovish', {'branch' : 'main'}
Plug 'tpope/vim-eunuch'   
Plug 'duggiefresh/vim-easydir'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'whiteinge/diffconflicts'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', Cond(!(g:use_nvim_lsp), {'branch': 'release'})
Plug 'neovim/nvim-lspconfig', Cond(g:use_nvim_lsp)
Plug 'svermeulen/vimpeccable'
" Plug 'nvim-lua/completion-nvim', Cond(g:use_nvim_lsp)
Plug 'hrsh7th/nvim-compe', Cond(g:use_nvim_lsp)
Plug 'Shougo/deoplete.nvim', Cond((g:use_nvim_lsp), { 'do': ':UpdateRemotePlugins' })
Plug 'shougo/deoplete.nvim', Cond(g:use_nvim_lsp)
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'voldikss/vim-floaterm'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

source $HOME/.config/nvim/vim/opts.vim
source $HOME/.config/nvim/vim/keybindings.vim
source $HOME/.config/nvim/vim/autocmd.vim
source $HOME/.config/nvim/vim/terminal.vim
luafile $HOME/.config/nvim/lua/init.lua

source $HOME/.config/nvim/vim/plugins/lightline.vim
source $HOME/.config/nvim/vim/plugins/firenvim.vim
source $HOME/.config/nvim/vim/plugins/floaterm.vim
" source $HOME/.config/nvim/vim/plugins/prettier.vim
source $HOME/.config/nvim/vim/plugins/startify.vim
source $HOME/.config/nvim/vim/plugins/vim-test.vim
source $HOME/.config/nvim/vim/plugins/polyglot.vim
luafile $HOME/.config/nvim/lua/plugins/treesitter.lua

if g:use_nvim_lsp
  source $HOME/.config/nvim/vim/plugins/lsp.vim
  source $HOME/.config/nvim/vim/plugins/deoplete.vim
  luafile $HOME/.config/nvim/lua/plugins/compe.lua
  luafile $HOME/.config/nvim/lua/plugins/lsp.lua
else
  source $HOME/.config/nvim/vim/plugins/coc.vim
endif

if g:use_telescope
  luafile $HOME/.config/nvim/lua/plugins/telescope.lua
  source $HOME/.config/nvim/vim/plugins/telescope.vim
  nnoremap <silent> <Leader>d <cmd>lua require('plugins.telescope').search_dotfiles()<CR>
  nnoremap <silent> <Leader>c <cmd>lua require('plugins.telescope').search_config()<CR>
else
  source $HOME/.config/nvim/vim/plugins/fzf.vim
endif

if !empty(glob('$HOME/.config/nvim/vim/local-config.vim'))
  source $HOME/.config/nvim/vim/local-config.vim
endif
