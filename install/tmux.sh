#!/bin/bash
set -ex # quit if any command fail

echo "installing tmux"
mkdir -p $HOME/bin
INSTALL_DIR=$HOME/bin

echo "install directory:"
echo $INSTALL_DIR

cd /tmp
wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz -O /tmp/tmux-2.3.tar.gz
wget https://github.com/libevent/libevent/archive/refs/tags/release-2.1.12-stable.tar.gz -O /tmp/libevent.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz -O /tmp/ncurses-6.0.tar.gz
# libevent 
tar -xvf libevent.tar.gz
cd libevent-2.1.12-stable
./configure --prefix=/$HOME/bin/
make
make install
cd ../ 
# ncurses
tar -xvzf ncurses-6.0.tar.gz
cd ncurses-6.0
export CPPFLAGS="-P"
./configure --prefix=$INSTALL_DIR
make
make install
cd ../
#tmux
tar -xvzf tmux-2.3.tar.gz
cd tmux-2.3

./configure --prefix=$INSTALL_DIR CFLAGS="-I$INSTALL_DIR/include -I$INSTALL_DIR/include/ncurses" LDFLAGS="-L$INSTALL_DIR/lib -L$INSTALL_DIR/include/ncurses -L$INSTALL_DIR/include"
make
make install
