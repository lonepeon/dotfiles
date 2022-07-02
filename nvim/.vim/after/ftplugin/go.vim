let b:textobj_function_select = function('textobj#function#go#select')

setlocal autoindent
setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

nnoremap <Plug>(GoAlternateFile) :call <SID>alternate(expand("%"))
nnoremap <Plug>(GoNextFunction) :call search('\<func\>', 'w')
nnoremap <Plug>(GoPreviousFunction) :call search('\<func\>', 'wb')

nmap <silent> <buffer> <leader>fsa <Plug>(GoAlternateFile)<cr>
nmap <silent> <buffer> ]m <Plug>(GoNextFunction)<cr>
nmap <silent> <buffer> [m <Plug>(GoPreviousFunction)<cr>

if exists("g:my_go_plugin_loaded")
  finish
end

function s:istestfile(filename)
  return match(a:filename, "_test.go$") >= 0
endfunction

function s:movetoalternate(filename)
  if filereadable(a:filename)
    execute "edit " . a:filename
  else
    echom "No alternative file found: " . a:filename
  endif
endfunction

function s:alternate(filename)
  if s:istestfile(a:filename)
    let l:sourcefile = substitute(a:filename, "_test.go$", ".go", "")
    call s:movetoalternate(l:sourcefile)
  else
    let l:testfile = substitute(a:filename, ".go$", "_test.go", "")
    call s:movetoalternate(l:testfile)
  endif
endfunction

let g:my_go_plugin_loaded = 1
