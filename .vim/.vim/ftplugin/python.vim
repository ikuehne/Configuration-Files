syntax on
set number
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set colorcolumn=81
set wrap
set tw=80

highlight ColorColumn
nmap \d :YcmCompleter GoTo<Enter>
nmap \e :w !python<Enter>
