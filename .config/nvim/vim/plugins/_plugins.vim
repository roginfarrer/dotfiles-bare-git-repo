if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Themes + Look & Feel {{{

Plug 'sheerun/vim-polyglot'             " Syntax highlighting for pretty much everything
  " https://github.com/plasticboy/vim-markdown#fenced-code-block-languages
  let g:vim_markdown_fenced_languages = ['javascript', 'js=javascript', 'jsx=javascript'] 
Plug 'itchyny/lightline.vim'            " Custom statusline
Plug 'mhinz/vim-startify'               
  let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'f': '~/.config/fish/config.fish'}, {'k': '~/.config/kitty/kitty.conf'} ]
  let g:startify_change_to_dir = 0

" ColorSchemes
Plug 'Rigellute/rigel'                  
Plug 'joshdick/onedark.vim'             
Plug 'mhartington/oceanic-next'         
Plug 'arzg/vim-colors-xcode'            
Plug 'haishanh/night-owl.vim'           
Plug 'bluz71/vim-nightfly-guicolors'    
Plug 'ghifarit53/tokyonight-vim'        
Plug 'challenger-deep-theme/vim'
Plug 'cocopon/iceberg.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'nvim-treesitter/nvim-treesitter'

" }}}

" File Editing Experience {{{

Plug 'machakann/vim-sandwich'           " Adds commands for adding/deleting/replacing surrounding text
Plug 'tpope/vim-commentary'             " Adds commands for commenting lines
Plug 'tpope/vim-sleuth'                 " Smart detection of line indenting, tab spaces, etc
Plug 'mattn/emmet-vim'                  " You know, emmet
Plug 'junegunn/goyo.vim'                " Zen mode
Plug 'alvan/vim-closetag'               " Auto close html tags
Plug 'jiangmiao/auto-pairs'                      " Autocomplete pairs
Plug 'mvolkmann/vim-js-arrow-function'  " GOAT. Toggle between expression and statements
  nmap <silent> <leader>tb :call JsArrowFnBraceToggle()<CR>
Plug 'tpope/vim-abolish'
Plug 'dhruvasagar/vim-open-url'         " Open URLs in a way that actually works
  nmap gx <Plug>(open-url-browser)
Plug 'vim-test/vim-test'
  let g:test#javascript#runner = 'jest'
  let g:test#strategy = "neovim"
  let test#neovim#term_position = "vert"
  nmap t<C-n> :TestNearest<CR>
  nmap t<C-f> :TestFile<CR>
  nmap t<C-s> :TestSuite<CR>
  nmap t<C-l> :TestLast<CR>
  nmap t<C-g> :TestVisit<CR>
Plug 'wellle/targets.vim'

" }}}

" File Navigation / Project Management {{{

if !(g:use_telescope)
  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
  endif
else
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif


" Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-dirvish'             " Directory navigation, replaces netrw

Plug 'roginfarrer/vim-dirvish-dovish', {'branch' : 'main'}
" Plug '~/repos/vim-dirvish-dovish'

Plug 'tpope/vim-eunuch'                 " Run common Unix commands inside Vim
Plug 'duggiefresh/vim-easydir'          " :e foo/bar.js will create 'foo' directory too
Plug 'jesseleite/vim-agriculture'       " Support Rg with args

" }}}

" Git {{{
Plug 'tpope/vim-fugitive'               " Classic Git integration
  nmap <leader>gs :G<CR>
Plug 'tpope/vim-rhubarb'                " Utilities on top of fugitive
Plug 'airblade/vim-gitgutter'
" }}}

" LSP {{{
if !(g:use_nvim_lsp)
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion, and linting, and pretty much eveything
else
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'aca/completion-tabnine', { 'do': './install.sh' }
    let g:completion_chain_complete_list = {
      \ 'default': [
      \    {'complete_items': ['lsp', 'snippet', 'tabnine' ]},
      \    {'mode': '<c-p>'},
      \    {'mode': '<c-n>'}
      \]
      \}
  " Plug 'nathunsmitty/nvim-ale-diagnostic', {'branch': 'main'}
endif 


" ALE {{{

" Plug 'dense-analysis/ale'
" Plug 'kevinclark/ale', {'branch': 'nvim-floating'}
" Plug 'jargonzombies/ale', {'branch': 'nvim-floating'}
" let g:ale_fixers = {
"       \   'css': ['prettier', 'stylelint'],
"       \   'scss': ['prettier', 'stylelint'],
"       \   'json': ['prettier'],
"       \   'javascript': ['prettier', 'eslint'],
"       \   'typescript': ['prettier', 'eslint'],
"       \   'javascriptreact': ['prettier', 'eslint'],
"       \   'typescriptreact': ['prettier', 'eslint'],
"       \   'markdown': ['prettier'],
"       \   'markdown.mdx': ['prettier'],
"       \   'vim': ['remove_trailing_lines', 'trim_whitespace'],
"       \   'lua': ['luafmt']
"       \}
let js_linters = ['stylelint', 'eslint']
" let g:ale_linters = {
"       \'typescript': js_linters,
"       \'typescriptreact': js_linters,
"       \'javascript': js_linters,
"       \'javascriptreact': js_linters,
"       \'css': ['stylelint'],
"       \'scss': ['stylelint'],
"       \}
let g:ale_linters_explicit = 1
let g:ale_typescript_prettier_use_local_config = 1
" let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 0
let g:ale_cursor_detail = 0
let g:ale_echo_cursor = 1
" nmap <silent> [g <Plug>(ale_previous_wrap)
" nmap <silent> ]g <Plug>(ale_next_wrap)

" }}}

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled = 0
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.mdx call prettier#Autoformat()
augroup END

" When using nvim-lsp... {{{

" }}}

" }}}

" Terminal {{{
Plug 'skywind3000/vim-terminal-help'    " Quick access to a terminal buffer
  let g:terminal_shell = '/usr/local/bin/fish'
  let g:terminal_list = 0
  let g:terminal_height = '20%'
Plug 'voldikss/vim-floaterm'
  nnoremap <silent> <C-t> :FloatermToggle<CR>
  tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>
" }}}

call plug#end()

" Must be set after plug#end()
" function! FormatLua(buffer) abort
"     return {
"     \   'command': 'luafmt --stdin'
"     \}
" endfunction
" call ale#fix#registry#Add('luafmt', 'FormatLua', ['lua'], 'luafmt for lua')

