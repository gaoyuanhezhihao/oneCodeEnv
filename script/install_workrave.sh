set -e
wget https://github.com/rcaelers/workrave/archive/v1_10_16.tar.gz
tar -xvf v1_10_16.tar.gz
cd workrave-1_10_16
./autogen.sh
./configure
make
sudo make install
