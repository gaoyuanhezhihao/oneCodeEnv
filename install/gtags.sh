set -e
set -x

cd $HOME
mkdir -p software
cd software
wget http://tamacom.com/global/global-6.6.5.tar.gz
tar -xvf global-6.6.5.tar.gz
cd global-6.6.5
./configure
make
sudo make install
