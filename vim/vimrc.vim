call plug#begin()
" Syntax highlighting for pretty much everything
Plug 'sheerun/vim-polyglot'
" Linting!
Plug 'w0rp/ale'
" FZF...
set rtp+=/usr/local/opt/fzf
" ...and the fzf vim plugin
Plug 'junegunn/fzf.vim'
" Autocompletion, and some basic linting
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Tree pane that can open
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'tpope/vim-commentary'
" Use the below two for flashing on yank
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
call plug#end()

" Start with the basic vim config
source ~/dotfiles/vim/ultimate-basic-vim.vim

" Color scheme
colorscheme challenger_deep
if has('nvim') || has('termguicolors')
  set termguicolors
endif

" Keybindings
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>g :GFiles<CR>
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>c :Commands<cr>
" fuzzy find text in the working directory
nmap <leader>f :Rg  
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
map <C-n> :NERDTreeToggle<CR>
" switch between the current and previous file
map <C-b> :e#<CR>
" Map ; to fuzzy search through open buffers
nmap ; :Buffers<CR>
" newline without insert
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Makes flash on yank
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" Remap ZoomWin 
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Change eslint error icons
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\}
" Fix files automatically on save
let g:ale_fix_on_save = 1
" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Change cursor on modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Set Gutentags to write its tag files to a directory outside any git repositories to avoid accidentally committing them
" let g:gutentags_cache_dir = '~/.vim/gutentags'
" Jump Into a tag from a tag under the cursor to its implementation in a new window
noremap <Leader>ji <C-w>]
" Jump Out into the original working ontext
noremap <Leader>jo <C-t>

set shiftwidth=2                " Use indents of 4 spaces
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set laststatus=2
set autoread
" Enable mouse support
set mouse=n
" Only show tabline if there are multiple tabs
set showtabline=1

" Copy visual selection to clipboard
map <C-c> "+y

" Copy relative file path to clipboard
noremap <Leader>yf :let @*=expand("%")<cr>:echo "Copied file to clipboard"<cr>

" Make current pane bigger or smaller
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" ---------- EMMET CONFIG ----------
" let g:user_emmet_leader_key="<tab>"

" ---------- Lightline CONFIG ----------
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

" ---------- NERDTree Config ----------
map <leader>r :NERDTreeFind<cr>
map <Leader>t :NERDTreeToggle<CR>
" Initialize NERDtree
:autocmd VimEnter * NERDTree


" -------------------------------------
"           Git Rhubarb               
" --------------------------------------
let g:github_enterprise_urls = ['https://git.csnzoo.com']
map <leader>go :Gbrowse<CR>

" -------------------------------------
"           Coc.nvim               
" --------------------------------------
let g:coc_node_path="/Users/rfarrer/.nvm/versions/node/v12.4.0/bin/node"

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Better display for messages
set cmdheight=1
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

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

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" -------------------------------------
"           FZF               
" --------------------------------------
" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': '10new' }
