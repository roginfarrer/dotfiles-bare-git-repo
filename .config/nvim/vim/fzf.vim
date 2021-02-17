if g:use_telescope == v:false

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_colors = {
  \ 'bg+': ['bg', 'NormalFloat'],
  \ 'gutter': ['bg', 'Normal'] 
  \ }

" Mine
let $FZF_DEFAULT_OPTS = '
\ --color=dark
\ --bind="?:toggle-preview"
\ --layout=reverse
\ --keep-right
\ '
let g:fzf_layout = { 'window': { 'width': 0.9 , 'height': 0.9 } }

function! s:fzf_dotfiles()
  let command = 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-tree --full-tree -r --name-only HEAD'
  call fzf#run(fzf#wrap({ 
    \ 'dir': '~/', 
    \ 'source': command }))
endfunction

command! FZFDotfiles call s:fzf_dotfiles()

" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nnoremap <silent> <C-p> :GFiles<CR>
" nmap <leader>c :Commands<CR>
" nnoremap <Leader>h :History<CR>
" nnoremap <Leader>b :Buffers<CR>
nmap <leader>; :Buffers<CR>
" nmap <leader>f :Rg<CR>
" nmap <leader>d :FZFDotfiles<CR>

nnoremap <silent> <leader>fp :GFiles<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <Leader>f. :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fc :Commands<CR>
nnoremap <silent> <leader>fg :Rg<CR>
nnoremap <silent> <leader>fd :FZFDotfiles<CR>

nnoremap <silent> <Leader>. :Files <C-R>=expand('%:h')<CR><CR>

endif
