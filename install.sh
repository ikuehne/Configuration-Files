#! /bin/sh -e

# A very simple installation script for this configuration.  Uses symlinks so
# that updates to the repo will update the configuration.  Requires clang,
# python2, gcc, cmake, Python headers, and probably a bunch of other tools.
# Also requires that no ~/.zshrc or ~/_vimrc, etc. be present on the computer
# where the installation is being done; however, it will fail rather than
# overwriting them.

# Only links _vimrc and installs bundles by default.  It can take two
# command-line arguments to specify further actions: -zsh, to link .zshrc, and
# -filetype, to install filetype configuration.

if [ "$1" = "-zsh" ] || [ "$2" = "-zsh" ]; then
	ln -s .zshrc ~/.zshrc
fi

ln -s _vimrc ~/_vimrc
mkdir ~/.vim || true

if [ "$1" = "-filetype" ] || [ "$2" = "-filetype" ]; then
	ln -s ftplugin ~/.vim/ftplugin
	ln -s filetype.vim ~./vim/filetype.vim
fi

mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
