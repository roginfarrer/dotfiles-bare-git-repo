" Inspired by https://github.com/Melandel/desktop/blob/90023f5e5f00c0f6b6eefd6036e77859130c68ed/setup/my_vimrc.vim#L1072

function! IsPreviouslyYankedItemValid()
  return @d != ''
endfunction

function! PromptUserForRenameOrSkip(filename)
  let rename_or_skip = input(a:filename.' already exists. Rename it or skip operation?(r/S) ')
  if rename_or_skip != 'r'
    return ''
  endif
  return input('Rename into:', a:filename)
endfunction

function! CopyPreviouslyYankedItemToCurrentDirectory()
  if !IsPreviouslyYankedItemValid()
    echomsg 'Select a path first!'
    return
  endif

  let cwd = getcwd()
  let item = trim(@d, '/\')
  let item_folder= fnamemodify(item, ':h')
  let item_filename= fnamemodify(item, ':t')

  let item_finalname = item_filename
  if !empty(glob(item_filename))
    let item_finalname = PromptUserForRenameOrSkip(item_filename)
    redraw
    echomsg 'a:'.item_finalname
    if item_finalname == ''
            return
    endif
  endif

  let cmd = 'robocopy '
  if isdirectory(item)
    let cmd .= printf('/e "%s" "%s\%s"', item, cwd, item_finalname)
  else
    let cmd .= printf('"%s" "%s" "%s"', item_folder, cwd, item_finalname)
  endif
echomsg cmd
  silent execute(printf(':!start /b %s', cmd))
endfunction

function! DeleteItemUnderCursor()
  let target = trim(getline('.'))
  silent execute(printf(':!trash %s', target))
  echomsg "Deleted " . target
  normal R
endfunction

function! MovePreviouslyYankedItemToCurrentDirectory(source)
  if !IsPreviouslyYankedItemValid()
    echomsg 'Select a path first!'
    return
  endif

  let cwd = getcwd()
  let item = trim(@d, '/\')
  let item_folder= fnamemodify(item, ':h')
  let item_filename= fnamemodify(item, ':t')

  let item_finalname = item_filename
  if !empty(glob(item_finalname))
    let item_finalname = PromptUserForRenameOrSkip(item_filename)
    if item_finalname == ''
            return
    endif
  endif

  let cmd = printf('move "%s" "%s\%s"', item, cwd, item_finalname)

  silent execute(printf(':!start /b %s', cmd))
endfunction

function! RenameItemUnderCursor()
  let target = trim(getline('.'))
  let filename = fnamemodify(target, ':t')
  let newname = input('Rename: ', filename)
  silent execute(printf(':!mv "%s" "%s"', target, expand("%") . newname))
  normal R
endfunction

function! CreateDirectory()
  let dirname = input('Directory name: ')
  if trim(dirname) == ''
    return
  endif
  let dirpath = expand("%") . dirname
  " elseif isdirectory(dirpath)
  "   redraw
  "   echomsg printf('"%s" already exists.', dirpath)
  "   return
  " endif
  let cmd = printf(':!mkdir "%s"', dirpath)
  silent execute(cmd)
  normal R
endf

function! CreateFile()
  let filename = input('File name: ')
  if trim(filename) == ''
    return
  endif
  let filepath = expand("%") . filename
  " elseif !empty(glob(filepath))
  "   redraw
  "   echomsg printf('"%s" already exists.', filepath)
  "   return
  " endif
  let cmd = printf(':!touch "%s"', filepath)
  silent execute(cmd)
  normal R
endf

function! GetDirvishConfig() 
  unmap <buffer> p
  nnoremap <silent><buffer> <C-n> <nop>
  nnoremap <silent><buffer> <C-p> :GFiles<CR>

  nmap <silent><buffer> q <Plug>(dirvish_quit)
  nnoremap <silent> <buffer> i :call CreateDirectory()<CR>
  nnoremap <silent> <buffer> I :call CreateFile()<CR>
  nnoremap <silent> <buffer> dd :call DeleteItemUnderCursor()<CR>
  nmap <silent> <buffer> cc :call RenameItemUnderCursor()<CR>

  " These probably don't work yet
  nmap <silent> <buffer> p :call CopyPreviouslyYankedItemToCurrentDirectory()<CR>
  nmap <silent> <buffer> P :call MovePreviouslyYankedItemToCurrentDirectory()<CR>
  " nmap <buffer> h <Plug>(dirvish_up)
endfunction

let dirvish_mode = ':sort ,^.*/,' 
augroup dirvish_config
  autocmd!

  autocmd FileType dirvish call GetDirvishConfig()
augroup END
