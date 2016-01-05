syntax on
set number
set tabstop=3
set expandtab
set shiftwidth=3
set softtabstop=3
set colorcolumn=81
" Line wrapping.
set wrap
set tw=80

" <C-c> runs a Syntastic check.
nnoremap <C-c> :SyntasticCheck<Enter>
" \d skips to the definition of the given function (as long as it is in the
" same file.)
nnoremap \d "iyiw?let\s*\(rec\s*\)\=<C-r>i\s*\(\l\+\s*\)*=<Enter>/<C-r>i<Enter>
