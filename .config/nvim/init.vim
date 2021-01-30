luafile $HOME/.config/nvim/main.lua

let g:lightline = {
      \ 'colorscheme': 'nightfly',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['percent', 'filetype'],
      \              ['gitbranch'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
