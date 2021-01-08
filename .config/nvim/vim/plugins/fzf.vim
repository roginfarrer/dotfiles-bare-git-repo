" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
"

" Mine
let $FZF_DEFAULT_OPTS = '
\ --color=dark
\ --bind="?:toggle-preview"
\ --margin=1,4
\ --layout=reverse
\ '
" \ --color=fg:15,bg:-1,hl:14,fg+:#ffffff,bg+:-1,hl+:1
" \ --color=info:15,prompt:11,pointer:14,marker:4,spinner:11,header:-1
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_layout = { 'window': { 'width': 0.9 , 'height': 0.9 } }

" Changes visible output of :Rg to not show path:column:linenumber
" since it makes reading the actual line results more difficult
" Reference: https://github.com/junegunn/fzf.vim/issues/960
" let transformer = "| awk -F: 'BEGIN { OFS = FS } {$3 = $3 \"\" $2 \"\" $3; print}'"
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   "rg --column --line-number --no-heading --color=always --smart-case "..shellescape(<q-args>)..transformer,
"   \   1,
"   \   { 'options': '--delimiter=: --with-nth=4..' },
"   \   <bang>0)

" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
" nnoremap <silent> <C-p> :GFiles<CR>
" nmap <leader>c :Commands<CR>
" nnoremap <Leader>h :History<CR>
" nnoremap <Leader>b :Buffers<CR>
" nmap <leader>; :Buffers<CR>
" nmap <leader>f :Rg<CR>

" nnoremap <silent> <leader>fp :GFiles<CR>
" nnoremap <silent> <leader>ff :Files<CR>
" nnoremap <silent> <leader>fb :Buffers<CR>
" nnoremap <silent> <leader>fh :History<CR>
" nnoremap <silent> <leader>fc :Commands<CR>
" nnoremap <silent> <leader>fl :Rg<CR>
" nnoremap <silent> <Leader>f. :Files <C-R>=expand('%:h')<CR><CR>
" nnoremap <silent> <Leader>. :Files <C-R>=expand('%:h')<CR><CR>

" nnoremap <silent> <C-p> :Clap gfiles<CR>
" nmap <leader>c :Clap command<CR>
" nnoremap <Leader>h :Clap history<CR>
" nnoremap <Leader>b :Clap buffers<CR>
" nmap <leader>; :Clap buffers<CR>
" nmap <leader>f :Clap grep<CR>
" nmap <leader>ff :Clap files<CR>
