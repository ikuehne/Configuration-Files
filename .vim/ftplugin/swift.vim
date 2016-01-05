syntax on
set number
inoremap { {<CR>}<Esc>ko
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set colorcolumn=81
set wrap
set tw=80

highlight ColorColumn
nnoremap \c :w<Enter>:!swift "%"<Enter>
