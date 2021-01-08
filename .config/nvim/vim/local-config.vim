let g:github_enterprise_urls = ['https://github.csnzoo.com']

" For vim-test
" Some monorepo magic to run the jest executable from the package you're in
autocmd BufEnter ~/Wayfair/homebase/packages/**/* let g:test#javascript#jest#executable = 'yarn --cwd '. fnamemodify(expand('%'), ':p:h') .' test'
