" VIMRC

set shell=/bin/bash

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"

" Plugins {{{

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'jesseleite/vim-agriculture'       " Support Rg with args
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Autocompletion, and linting, and pretty much eveything
Plug 'sheerun/vim-polyglot'             " Syntax highlighting for pretty much everything
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-eunuch'                 " Run common Unix commands inside Vim
Plug 'machakann/vim-sandwich'           " Adds commands for adding/deleting/replacing surrounding text
Plug 'tpope/vim-commentary'             " Adds commands for commenting lines
Plug 'tpope/vim-sleuth'                 " Smart detection of line indenting, tab spaces, etc
Plug 'mattn/emmet-vim'                  " You know, emmet
Plug 'junegunn/goyo.vim'                " Zen mode
Plug 'alvan/vim-closetag'               " Auto close html tags
Plug 'jiangmiao/auto-pairs'             " Autocomplete pairs
Plug 'itchyny/lightline.vim'            " Custom statusline
Plug 'Rigellute/rigel'                  " Colorscheme
Plug 'joshdick/onedark.vim'             " Colorscheme
Plug 'mhartington/oceanic-next'         " Colorscheme
Plug 'arzg/vim-colors-xcode'            " Colorscheme
Plug 'dhruvasagar/vim-open-url'         " Open URLs in a way that actually works
  nmap gx <Plug>(open-url-browser)
Plug 'tpope/vim-fugitive'               " Classic Git integration
Plug 'tpope/vim-rhubarb'                " Utilities on top of fugitive
  nnoremap <leader>go :Gbrowse<CR>
  vnoremap <leader>go :'<,'>Gbrowse<CR>
  nnoremap <leader>gc :Gbrowse!<CR>
  vnoremap <leader>gc :'<,'>Gbrowse!<CR>

"Plug 'justinmk/vim-dirvish'             " Directory navigation, replaces netrw
"  " Group directories first
"  let dirvish_mode = ':sort ,^.*/,' 
"  augroup dirvish_config
"    autocmd!
"  
"    autocmd FileType dirvish
"      \ nmap <silent><buffer> q <Plug>(dirvish_quit)
"      \|nnoremap <silent><buffer> <C-n> <nop>
"      \|nnoremap <silent><buffer> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
"  augroup END

Plug 'mhinz/vim-startify'               " Fancy Start Screen
  let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'f': '~/.config/fish/config.fish'}, {'k': '~/.config/kitty/kitty.conf'} ]
  let g:startify_change_to_dir = 0

Plug 'voldikss/vim-floaterm'            " Functionality for centering a terminal window
  let g:floaterm_width = 125
  let g:floaterm_position = 'center'
  let g:floaterm_keymap_toggle = '<C-t>'
Plug 'skywind3000/vim-terminal-help'    " Quick access to a terminal buffer
Plug 'dylanaraps/fff.vim'               " vim-like file manager, or paired-down NERDTree
  " Requires the fff utility to be installed on the system
  let g:fff#split = "40vnew"
  let g:fff#split_direction = "nosplitbelow nosplitright"
  " nnoremap f :F<CR>

Plug 'mvolkmann/vim-js-arrow-function'  " GOAT. Toggle between expression and statements
  nmap <silent> <leader>tb :call JsArrowFnBraceToggle()<CR>

Plug 'haya14busa/incsearch.vim'         " Improved search highlighting
  set hlsearch
  let g:incsearch#auto_nohlsearch = 1
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

Plug 'tpope/vim-abolish'
Plug 'cocopon/iceberg.vim'
" Plug 'Lokaltog/neoranger'
" Plug 'francoiscabrol/ranger.vim'
Plug 'mcchrish/nnn.vim'
  " Disable default mappings
  let g:nnn#set_default_mappings = 0
  nnoremap <silent> - :NnnPicker '%:p:h'<CR>
  let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

call plug#end()

" }}}

" Turns on detection for fyletypes, indentation files and plugin files
filetype plugin indent on

" Copy visual selection to clipboard
map <C-c> "+y
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

" When changing, don't save to register
nnoremap c "_c
vnoremap c "_c

" Set to auto read when a file is changed from the outside
set autoread

" Enable mouse support
set mouse=a

" Open all splits in the CORRECT direction
set splitright
set splitbelow

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
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Allows you to change buffers even if the current on has unsaved changes
set hidden

" Turn persistent undo on 
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Statusline Config
set statusline+=%F
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

set number
set relativenumber
" nnoremap <leader><CR> :nohlsearch<CR>

" Always show the sign column
set signcolumn=yes

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

set inccommand="nosplit"

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Use cursorline for insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" Colors and Fonts {{{

" Enable syntax highlighting
set background=dark

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" colorscheme rigel
" colorscheme xcodedarkhc
colorscheme iceberg

" Set syntax highlighting for config files
autocmd BufNewFile,BufRead *stylelintrc,*eslintrc,*babelrc,*jshintrc,*prettierrc setlocal syntax=json

" Syntax highlighting for flow
let g:javascript_plugin_flow = 1

syntax enable

" Statusline (Lightline) {{{

" don't display mode, e.g. '-- INSERT --'
set noshowmode              

" ALways show the statusbar
set laststatus=2

let g:rigel_lightline = 1
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" \ 'colorscheme': 'rigel',
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

"}}}

" }}}

" Keybindings and moving around {{{

" Fast saving
nmap <leader>w :w!<cr>
" Fast closing
nmap <leader>q :q<cr>

" Lazygit
nnoremap <silent> <Leader>lg :call ToggleLazyGit()<CR>

" newline without insert
nmap <CR> o<Esc>"_cc<Esc>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" If you like long lines with line wrapping enabled, this solves the problem that pressing down jumpes your cursor “over” the current line to the next line. It changes behaviour so that it jumps to the next row in the editor (much more natural)
nnoremap j gj
nnoremap k gk

" Number of lines that offset buffer scrolling movement, so cursor doesn't get
" to the top/bottom 10 lines of buffer
set scrolloff=10

" Tab shortcuts
noremap <Leader>tp :tabprevious<CR>
noremap <Leader>tn :tabnext<CR>
noremap <S-Tab> :tabprevious<CR>
noremap <Tab> :tabnext<CR>

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
noremap <Space><Space> za

" Diff windows
nnoremap <leader>wd :windo difft<CR>
nnoremap <leader>wdd :windo diffo<CR>

" }}}

" Terminal {{{

" To map <Esc> to exit terminal-mode: >
tnoremap <leader><Esc> <C-\><C-n>
" To map <Esc> to exit terminal-mode: >
tnoremap <leader>j <C-\><C-n>
" Open a new split with a terminal
nnoremap <leader>te :vs<CR>:terminal fish<CR>

" a paste from register chord
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'

" When term starts, auto go into insert mode
autocmd TermOpen * startinsert

" Turn off line numbers etc
autocmd TermOpen * setlocal listchars= nonumber norelativenumber
 
" }}}

" FZF {{{

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'

" Mine
let $FZF_DEFAULT_OPTS = '
\ --color=dark 
\ --color=fg:15,bg:-1,hl:14,fg+:#ffffff,bg+:-1,hl+:1 
\ --color=info:15,prompt:11,pointer:14,marker:4,spinner:11,header:-1 
\ --layout=reverse 
\ --margin=1,4 
\ --bind="?:toggle-preview"
\ '
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.9)
  let width = float2nr(&columns * 0.8)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
" nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <C-p> :Files<CR>
nmap <leader>c :Commands<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>b :Buffers<CR>
nmap <leader>; :Buffers<CR>
nmap <leader>f :Rg<CR>

nnoremap <silent> <leader>fp :Files<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fc :Commands<CR>
nnoremap <silent> <Leader>f. :Files <C-R>=expand('%:h')<CR><CR>

" }}}

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR> 

function! HomebaseTab()
  execute 'tabe'
  execute 'tcd ~/Wayfair/homebase'
  execute 'Startify'
endfunction
function! ResourcesTab()
  execute 'tabe'
  execute 'tcd ~/Wayfair/monolith/resources'
  execute 'Startify'
endfunction

nmap <C-q><C-h> :call HomebaseTab()<CR>
nmap <C-q><C-r> :call ResourcesTab()<CR>
nmap <silent> <C-q> :call HomebaseTab()<CR>:call ResourcesTab()<CR>:-2tabc<CR>

source $HOME/.config/nvim/configs/functions.vim
source $HOME/.config/nvim/configs/coc.vim
if !empty(glob('$HOME/.config/nvim/local-config.vim'))
  source $HOME/.config/nvim/local-config.vim
endif

autocmd bufnewfile,bufread *.js set filetype=javascriptreact

" Load with folds collapsed
" vim:foldmethod=marker:foldlevel=0
