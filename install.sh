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

dir=`pwd`
echo "Current directory: "
echo ${dir}

if [ "$1" = "-zsh" ] || [ "$2" = "-zsh" ]; then
	# Try to install zsh on Ubuntu.
	sudo apt-get install zsh || true 2>/dev/null

	# Ditto with Arch.
	sudo pacman -S zsh || true 2>/dev/null
	echo "Linking .zshrc..."
	ln -s ${dir}/.zshrc ~/.zshrc
fi

echo "Linking _vimrc..."
ln -s ${dir}/_vimrc ~/_vimrc
mkdir ~/.vim || true

if [ "$1" = "-filetype" ] || [ "$2" = "-filetype" ]; then
	echo "Linking filetype files..."
	ln -s ${dir}/ftplugin ~/.vim/ftplugin
	ln -s ${dir}/filetype.vim ~/.vim/filetype.vim
	ln -s ${dir}/.ycm_extra_conf_c.py ~/.ycm_extra_conf_c.py
	ln -s ${dir}/.ycm_extra_conf_c++.py ~/.ycm_extra_conf_c++.py
fi

# Try to install some required packages on Ubuntu.
sudo apt-get install git build-essential cmake python-dev clang || true 2>/dev/null

# Ditto with Arch.
sudo pacman -S vim git base-devel cmake clang || true 2>/dev/null

echo "Installing Vundle..."
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing plugins..."
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
