function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <c-]> <plug>(lsp-definition)
    nmap <buffer> <leader>ls <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>lS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>lr <plug>(lsp-references)
    nmap <buffer> <leader>li <plug>(lsp-implementation)
    nmap <buffer> <leader>lt <plug>(lsp-type-definition)
    nmap <buffer> <leader>lR <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>lk <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

