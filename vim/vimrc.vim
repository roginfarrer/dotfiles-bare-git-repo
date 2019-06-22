call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" source ~/dotfiles/vim/nerdtree.vim
source ~/dotfiles/vim/ultimate-basic-vim.vim

" Keybindings
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>g :GFiles<CR>
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
map <C-n> :NERDTreeToggle<CR>
" newline without insert
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
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
set laststatus=0
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
let g:user_emmet_leader_key="<tab>"

" ---------- VIM AIRLINE CONFIG ----------
let g:airline_theme="wombat"

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
