#!/bin/bash
set -e # quit if any command fail
set -x
echo "install vim9"
DIR=$HOME/bin
#sudo apt-get install build-essential cmake -y
#sudo apt install libncurses5-dev libgnome-desktop-3-dev libgnome-menu-3-dev \
#    libgtk2.0-dev libatk1.0-dev \
#    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
#    python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git -y
#sudo apt-get install libpython2.7-dev libpython3.8-dev -y
#sudo apt-get install xorg-dev -y

wget https://github.com/vim/vim/archive/refs/tags/v9.1.0748.zip -O vim_9.1.0748.zip

unzip vim_9.1.0748.zip
cd vim-9.1.0748/
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=auto \
            --enable-cscope \
            --with-x \
            --prefix=$DIR
make VIMRUNTIMEDIR=$DIR/share/vim/vim91
make
make install
# git clone https://github.com/VundleVim/Vundle.vim.git ~/oneCodeEnv/vim/bundle/Vundle.vim
# vim +PluginInstall +qall
