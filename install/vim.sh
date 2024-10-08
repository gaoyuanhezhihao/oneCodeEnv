#!/bin/bash
set -e # quit if any command fail
echo "install vim8"
DIR=$HOME/bin
sudo apt-get install build-essential cmake -y
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git -y
sudo apt-get build-dep vim-gnome-py2 -y
sudo apt-get instal libpython2.7-dev libpython3.5-dev -y
sudo apt-get install xorg-dev -y
git clone https://github.com/vim/vim ~/Downloads/vim
cd ~/Downloads/vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=auto \
            --enable-cscope \
            --with-x \
            --prefix=$DIR
make VIMRUNTIMEDIR=$DIR/share/vim/vim80
make
make install
git clone https://github.com/VundleVim/Vundle.vim.git ~/oneCodeEnv/vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer
