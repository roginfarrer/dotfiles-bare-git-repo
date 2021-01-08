" Copy visual selection to clipboard
map <C-c> "+y
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

" Make Y behave like it should
map Y y$

" When changing, don't save to register
nnoremap c "_c
vnoremap c "_c

" Fast saving
nmap <leader>w :w!<cr>
" Fast closing
nmap <leader>q :q<cr>
" Fast saving AND closing
nmap <leader>x :wq<CR>

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
" noremap <Leader>tp :tabprevious<CR>
" noremap <Leader>tn :tabnext<CR>
" noremap <S-Tab> :tabprevious<CR>
" noremap <Tab> :tabnext<CR>

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
" nnoremap <leader>wd :windo difft<CR>
" nnoremap <leader>wdd :windo diffo<CR>

nnoremap <leader>ek :vsp $HOME/.config/kitty/kitty.conf<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" For when syntax highlighting breaks
noremap <F12> <Esc>:syntax sync fromstart<CR>

nnoremap <leader>go :Gbrowse<CR>
vnoremap <leader>go :'<,'>Gbrowse<CR>
nnoremap <leader>gc :Gbrowse!<CR>
vnoremap <leader>gc :'<,'>Gbrowse!<CR>
