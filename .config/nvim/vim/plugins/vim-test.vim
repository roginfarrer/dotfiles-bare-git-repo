  let g:test#javascript#runner = 'jest'
  let g:test#strategy = "neovim"
  let test#neovim#term_position = "vert"
  nmap t<C-n> :TestNearest<CR>
  nmap t<C-f> :TestFile<CR>
  nmap t<C-s> :TestSuite<CR>
  nmap t<C-l> :TestLast<CR>
  nmap t<C-g> :TestVisit<CR>
