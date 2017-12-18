#!/bin/bash
echo "install vim8"
DIR=$HOME/bin
#sudo apt-get build-dep vim-gnome-py2
git clone https://github.com/vim/vim
cd vim
cd src
./configure --with-features=huge --enable-gui=gnome2 --enable-luainterp=yes --enable-pythoninterp=yes --enable-perlinterp=yes --prefix=$DIR
make
make install
git clone https://github.com/VundleVim/Vundle.vim.git ~/oneCodeEnv/vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe/
python2 ./install.py --clang-completer
