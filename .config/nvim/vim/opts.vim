let mapleader = "\<Space>"
set mouse=a
set number
set relativenumber
set splitright
set splitbelow
set noswapfile
set smartindent
set expandtab
set shiftwidth=2
set linebreak
set hidden
set undodir=~/.vim_runtime/temp_dirs/undodir
set undofile
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
set foldenable
set foldlevelstart=10
set foldnestmax=10
" set foldmethod=syntax
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set signcolumn=yes
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Disable highlight search results
set nohlsearch
set inccommand="nosplit"
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Number of lines that offset buffer scrolling movement, so cursor doesn't get
" to the top/bottom 10 lines of buffer
set scrolloff=10
set shell=/usr/local/bin/zsh
set completeopt=menuone,noinsert,noselect

set termguicolors
colorscheme nightfly
" colorscheme spaceodyssey
