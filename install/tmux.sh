wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
wget https://github.com/downloads/libevent/libevent/libevent-2.0.20-stable.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
# libevent 
tar -xvzf libevent-2.0.20-stable.tar.gz
cd libevent-2.0.20-stable
./configure --prefix=$HOME/tmux --disable-shared
make
make install
cd ../ 
# ncurses
tar -xvzf ncurses-6.0.tar.gz
cd ncurses-6.0
./configure --prefix=$HOME/tmux
make
make install
cd ../
# tmux
tar -xvzf tmux-2.3.tar.gz
cd tmux-2.3

$  ./configure --prefix=$HOME/tmux CFLAGS="-I$HOME/tmux/include -I$HOME/tmux/include/ncurses" LDFLAGS="-L$HOME/tmux/lib -L$HOME/tmux/include/ncurses -L$HOME/tmux/include"

$  make
$  make install
$  cd ../

