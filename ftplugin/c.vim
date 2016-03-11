syntax on
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set colorcolumn=79
set number
set wrap
set tw=78
highlight ColorColumn
inoremap { {<CR>}<Esc>ko
nnoremap \c :make clean<Enter>
nnoremap \m :make<Enter>
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf_c.py"
