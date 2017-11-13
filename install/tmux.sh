#!/bin/bash
echo "installing tmux"
mkdir -p $HOME/bin/tmux
$INSTALL_DIR=$HOME/bin/tmux

wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
wget https://github.com/downloads/libevent/libevent/libevent-2.0.20-stable.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
# libevent 
tar -xvzf libevent-2.0.20-stable.tar.gz
cd libevent-2.0.20-stable
./configure --prefix=$INSTALL_DIR --disable-shared
make
make install
cd ../ 
# ncurses
tar -xvzf ncurses-6.0.tar.gz
cd ncurses-6.0
./configure --prefix=$INSTALL_DIR
make
make install
cd ../
# tmux
tar -xvzf tmux-2.3.tar.gz
cd tmux-2.3

./configure --prefix=$INSTALL_DIR CFLAGS="-I$INSTALL_DIR/include -I$INSTALL_DIR/include/ncurses" LDFLAGS="-L$INSTALL_DIR/lib -L$INSTALL_DIR/include/ncurses -L$INSTALL_DIR/include"

make
make install
