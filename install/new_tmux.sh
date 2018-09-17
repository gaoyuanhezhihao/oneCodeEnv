#!/bin/bash
set -e # quit if any command fail

echo "installing tmux"
mkdir -p $HOME/bin
INSTALL_DIR=$HOME/bin

echo "install directory:"
echo $INSTALL_DIR

#sudo apt-get install libtool automake autotools-dev -y
cd /tmp
wget http://7xt5m9.com2.z0.glb.clouddn.com/tmux2.3tmux-2.3.tar.gz -O /tmp/tmux-2.3.tar.gz
wget http://7xt5m9.com2.z0.glb.clouddn.com/tmux2.3libevent-2.0.20-stable.tar.gz -O /tmp/libevent.tar.gz
wget http://7xt5m9.com2.z0.glb.clouddn.com/tmux2.3ncurses-6.0.tar.gz -O /tmp/ncurses-6.0.tar.gz
# libevent 
tar -xvf libevent.tar.gz
cd libevent-2.0.20-stable
./configure --prefix=/$HOME/bin/
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
#tmux
tar -xvzf tmux-2.3.tar.gz
cd tmux-2.3

./configure --prefix=$INSTALL_DIR CFLAGS="-I$INSTALL_DIR/include -I$INSTALL_DIR/include/ncurses" LDFLAGS="-L$INSTALL_DIR/lib -L$INSTALL_DIR/include/ncurses -L$INSTALL_DIR/include"
make
make install
