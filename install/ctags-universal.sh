git clone https://github.com/universal-ctags/ctags /tmp/ctags
cd /tmp/ctags/
./autogen.sh
./configure --prefix=$HOME/bin/
make
make install

