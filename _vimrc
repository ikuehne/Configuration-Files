set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wlangstroth/vim-racket'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
: Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Bundle 'gmarik/vundle'
Bundle 'raichoo/haskell-vim'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'keith/swift.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype on
set background=dark
filetype indent plugin on
set scrolloff=10

" Change youcompleteme background
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#4D4D4D guibg=#0000ff

" For OCaml
au BufRead,BufNewFile *.ml,*.mli compiler ocaml
syntax on

" Keymap for appending to a word.
nnoremap ee ea

" Keymap for reformatting a paragraph.
nnoremap \f gwip

" Let backspace cover things.
set backspace=indent,eol,start

" Stop YCM from messing with Syntastic
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_confirm_extra_conf = 0

" Let Syntastic use OCamlc
let g:syntastic_ocaml_use_ocamlc = 1
let g:syntastic_ocaml_use_janestreet_core = 1
let g:syntastic_ocaml_janestreet_core_dir = "/home/ikuehne/.opam/system/lib/core"

" Stop slow Syntastic checks
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['python'] }

if filereadable("./.dirconfig")
    source ./.dirconfig
endif
