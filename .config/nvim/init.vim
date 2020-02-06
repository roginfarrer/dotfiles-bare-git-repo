" VIMRC

" Plugins {{{

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Fancy start screen
Plug 'mhinz/vim-startify'

" Syntax highlighting for pretty much everything
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

" Autocompletion, and linting, and pretty much eveything
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Project navigation
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" File Navigation
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'mattn/emmet-vim'
Plug 'dhruvasagar/vim-open-url'

" Statusline
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'

" For better autocomplete of brackets
Plug 'rstacruz/vim-closer'

" Colors & Themes
Plug 'Rigellute/rigel'
Plug 'joshdick/onedark.vim'

" Git
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'christoomey/vim-conflicted'

" Terminal
Plug 'voldikss/vim-floaterm'
Plug 'skywind3000/vim-terminal-help'

" Misc
" Plug 'psliwka/vim-smoothie'
Plug 'junegunn/goyo.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()

" }}}

" General {{{

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"

" Enable filetype plugins
filetype plugin on
filetype indent on

" Copy visual selection to clipboard
map <C-c> "+y
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

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

set hidden

" Turn persistent undo on 
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" }}}

" Section Folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" }}}

" VIM user interface {{{

set number
set relativenumber
nnoremap <leader><CR> :nohlsearch<CR>

" Always show the sign column
set signcolumn=yes

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"" Search
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

" NeoVim only
if has('nvim')
  set inccommand="nosplit"
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Use cursorline for insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" }}}

" Colors and Fonts {{{

" Enable syntax highlighting
set background=dark

if has('nvim') || has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

colorscheme rigel

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

" let g:rigel_airline = 1
" let g:airline_theme = 'rigel'
" let g:airline#extensions#coc#enabled = 1
" let g:airline_powerline_fonts = 1

let g:rigel_lightline = 1
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'rigel',
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

" File searching
" nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nmap <leader>; :Buffers<CR>
nnoremap <Leader>h :History<CR>
" fuzzy find text in the working directory
nmap <leader>f :Rg<CR>
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>c :Commands<CR>

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

" Git {{{

let g:github_enterprise_urls = ['https://github.csnzoo.com']
nnoremap <leader>go :Gbrowse<CR>
vnoremap <leader>go :'<,'>Gbrowse<CR>
nnoremap <leader>gc :Gbrowse!<CR>
vnoremap <leader>gc :'<,'>Gbrowse!<CR>

" }}}

" Coc.nvim {{{

let g:coc_node_path="/Users/rfarrer/.nvm/versions/node/v12.4.0/bin/node"

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-emoji',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-tsserver',
    \ 'coc-yaml',
    \ 'coc-stylelint',
    \ 'coc-snippets',
    \ 'coc-flow',
    \ 'coc-yank',
    \ 'coc-highlight',
    \ 'coc-lists' ]

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

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>es :CocCommand snippets.editSnippets<CR>

" Sets up :Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" }}}

" Terminal {{{

if has('nvim')
  " Allow moving split focus while in terminal mode
  " tnoremap <C-h> <c-\><c-n><c-w>h
  " tnoremap <C-j> <c-\><c-n><c-w>j
  " tnoremap <C-k> <c-\><c-n><c-w>k
  " tnoremap <C-l> <c-\><c-n><c-w>l

  " To map <Esc> to exit terminal-mode: >
  tnoremap <leader><Esc> <C-\><C-n>
  nnoremap <leader>te :vs<CR>:terminal<CR>

  tnoremap <expr> <A-p> '<C-\><C-n>"'.nr2char(getchar()).'pi'
endif

" When term starts, auto go into insert mode
autocmd TermOpen * startinsert

" Turn off line numbers etc
autocmd TermOpen * setlocal listchars= nonumber norelativenumber

" Creates a floating window with a most recent buffer to be used
function! CreateCenteredFloatingWindow()
  let width = float2nr(&columns * 0.6)
  let height = float2nr(&lines * 0.6)
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]
  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  autocmd BufWipeout <buffer> call CleanupBuffer(s:buf)
  " tnoremap <buffer> <silent> <Esc> <C-\><C-n><CR>:call DeleteUnlistedBuffers()<CR>
endfunction

function! OnTermExit(job_id, code, event) dict
  if a:code == 0
    call DeleteUnlistedBuffers()
  endif
endfunction

function! ToggleTerm(cmd)
  if empty(bufname(a:cmd))
    call CreateCenteredFloatingWindow()
    call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
  else
    call DeleteUnlistedBuffers()
  endif
endfunction

function! DeleteUnlistedBuffers()
  for n in nvim_list_bufs()
    if ! buflisted(n)
      let name = bufname(n)
      if name == '[Scratch]' ||
            \ matchend(name, ":bash") ||
            \ matchend(name, ":lazygit") ||
            \ matchend(name, ":tmuxinator-fzf-start.sh") ||
            \ matchend(name, ":hstarti")
        call CleanupBuffer(n)
      endif
    endif
  endfor
endfunction

function! CleanupBuffer(buf)
  if bufexists(a:buf)
    silent execute 'bwipeout! '.a:buf
  endif
endfunction

" Opens lazygit
function! ToggleLazyGit()
  call ToggleTerm('lazygit')
endfunction

nnoremap <silent> <Leader>' :call ToggleLazyGit()<CR>
 
" }}}

" FZF {{{

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_OPTS = ' --color=dark --color=fg:15,bg:-1,hl:14,fg+:#ffffff,bg+:-1,hl+:1 --color=info:15,prompt:11,pointer:14,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(15)
  let width = float2nr(110)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 8

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

nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>

" }}}

" Startify {{{

let g:startify_bookmarks = [ {'v': '~/dotfiles/vim/vimrc.vim'}, {'d': '~/dotfiles'}]
let g:startify_change_to_dir = 0

" }}}

" VIMRC {{{

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR> 

" }}}

" Dirvish {{{

" Group directories first
let dirvish_mode = ':sort ,^.*/,' 


augroup dirvish_config
  autocmd!

  autocmd FileType dirvish
    \ nmap <silent><buffer> q <Plug>(dirvish_quit)
    \|nnoremap <silent><buffer> <C-n> <nop>
    \|nnoremap <silent><buffer> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
augroup END

" }}}

" Emmet {{{

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" }}}

" Floatterm {{{

let g:floaterm_width = 125
let g:floaterm_position = 'center'
let g:floaterm_keymap_toggle = '<C-t>'

" }}}

" Open Url {{{

nmap gx <Plug>(open-url-browser)

" }}}

nmap <C-q> :tabe<CR>:lcd ~/Wayfair/homebase<CR>:tabe<CR>:lcd ~/Wayfair/monolith/resources<CR>:tabprevious<CR>

let g:session_autoload="no"

" When changing, don't save to register
nnoremap c "_c
vnoremap c "_c

" vim:foldmethod=marker:foldlevel=0
