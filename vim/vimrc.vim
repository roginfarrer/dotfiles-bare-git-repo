" VIMRC

" Plugins {{{

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Syntax highlighting for pretty much everything
Plug 'sheerun/vim-polyglot'

" FZF...
set rtp+=/usr/local/opt/fzf
" ...and the fzf vim plugin
Plug 'junegunn/fzf.vim'

" Autocompletion, and linting
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Tree pane that can open
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-vinegar'

" Praise tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'

" Statusline
Plug 'itchyny/lightline.vim'

" highlights text when yanked
Plug 'machakann/vim-highlightedyank'

" For better autocomplete of brackets
Plug 'rstacruz/vim-closer'

" Fancy start screen
Plug 'mhinz/vim-startify'

" Colorize hex colors
Plug 'chrisbra/Colorizer'

" Themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'Rigellute/rigel'

call plug#end()

" }}}

" General {{{
"
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable yanking to the clipboard
set clipboard=unnamed

" Automatically indent pasted lines
nnoremap p p=`]
nnoremap P P=`]

" Set to auto read when a file is changed from the outside
set autoread

" Enable mouse support
set mouse=n

" Open all splits to the right
set splitright

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
setlocal nobackup
setlocal nowritebackup

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Be smart when using tabs ;)
set smarttab

" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines
" 
" " always set autoindenting on
" set autoindent
" " copy the previous indentation on autoindenting
" set copyindent

" }}}

" Section Folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" }}}
"
" VIM user interface {{{

set number
set relativenumber
nnoremap <leader><CR> :nohlsearch<CR>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Use cursorline for insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" }}}

" Colors and Fonts {{{

" Enable syntax highlighting
syntax enable
set background=dark

if has('nvim') || has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

colorscheme challenger_deep
colorscheme rigel

if g:colors_name == 'rigel'
  " slightly easier to read and discern where the cursor is
  hi MatchParen ctermfg=yellow ctermbg=none guifg=yellow guibg=none term=underline gui=underline
endif

" Set syntax highlighting for config files
autocmd BufNewFile,BufRead *stylelintrc,*eslintrc,*babelrc,*jshintrc,*prettierrc setlocal syntax=json

" Syntax highlighting for flow
let g:javascript_plugin_flow = 1

" }}}

" Keybindings and moving around {{{

" Fast saving
nmap <leader>w :w!<cr>

" File searching
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>p :GFiles<CR>
" fuzzy find text in the working directory
nmap <leader>f :Rg
" Map ; to fuzzy search through open buffers
nmap ; :Buffers<CR>

" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>c :Commands<cr>

" newline without insert
nmap <CR> o<Esc>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" If you like long lines with line wrapping enabled, this solves the problem that pressing down jumpes your cursor “over” the current line to the next line. It changes behaviour so that it jumps to the next row in the editor (much more natural)
nnoremap j gj
nnoremap k gk

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Jump Into a tag from a tag under the cursor to its implementation in a new window
noremap <Leader>ji <C-w>]
" Jump Out into the original working ontext
noremap <Leader>jo <C-t>

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk]
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Zoom / Restore window.
" Maximize a buffer, then toggle it back
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-W>o :ZoomToggle<CR>

" Copy relative file path to clipboard
noremap <Leader>yf :let @*=expand("%")<cr>:echo "Copied file to clipboard"<cr>

" Toggle folds
noremap <Tab> za

" Copy file in netrw
nnoremap <silent> <Leader>c :silent exec "!cp '%:p' '%:p:h/%:t:r-copy.%:e'"<cr>

" }}}

" Lightline {{{

" ALways show the statusbar
set laststatus=2

let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'rigel' }

"}}}

" Git {{{

let g:github_enterprise_urls = ['https://github.csnzoo.com']
map <leader>go :Gbrowse<CR>

" }}}

" NERDTree {{{

let NERDTreeQuitOnOpen=1
" Single-click to toggle directory nodes, double-click to open non-directory
" nodes.
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=50

function! NerdTreeToggleFind()
  if g:NERDTree.IsOpen()
      NERDTreeClose
  elseif filereadable(expand('%'))
      NERDTreeFind
  else
      NERDTree
  endif
endfunction

nnoremap - :call NerdTreeToggleFind()<CR>

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>



" }}}

" Coc.nvim {{{

let g:coc_node_path="/Users/rfarrer/.nvm/versions/node/v12.4.0/bin/node"
let g:coc_global_extensions = ['coc-css', 'coc-pairs', 'coc-eslint', 'coc-prettier', 'coc-html', 'coc-tsserver', 'coc-json']

" => Set up Tab key for autocompletion

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" }}}

" Terminal {{{

" To map <Esc> to exit terminal-mode: >
tnoremap <Leader><Esc> <C-\><C-n>

" }}}

" FZF {{{

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" }}}

" Startify {{{

let g:startify_bookmarks = [ {'v': '~/dotfiles/vim/vimrc.vim'}, {'d': '~/dotfiles'}]

" }}}

" VIMRC {{{

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" }}}

" vim:foldmethod=marker:foldlevel=0
