" 0 = use coc.nvim
" 1 = use nvim lsp
let g:use_nvim_lsp = 0

" 0 = use fzf
" 1 = use telescope
let g:use_telescope = 1

source $HOME/.config/nvim/vim/plugins/_plugins.vim
source $HOME/.config/nvim/vim/opts.vim
source $HOME/.config/nvim/vim/keybindings.vim
source $HOME/.config/nvim/vim/autocmd.vim
source $HOME/.config/nvim/vim/terminal.vim
source $HOME/.config/nvim/vim/plugins/lightline.vim
luafile $HOME/.config/nvim/lua/plugins/treesitter.lua

if g:use_nvim_lsp
  source $HOME/.config/nvim/vim/plugins/lsp.vim
else
  source $HOME/.config/nvim/vim/plugins/coc.vim
endif

if g:use_telescope
  luafile $HOME/.config/nvim/lua/plugins/telescope.lua
  source $HOME/.config/nvim/vim/plugins/telescope.vim
else
  source $HOME/.config/nvim/vim/plugins/fzf.vim
endif

if !empty(glob('$HOME/.config/nvim/vim/local-config.vim'))
  source $HOME/.config/nvim/vim/local-config.vim
endif

