set -e -x
#sudo apt-get install -y build-essential itstool libglib2.0-dev libxml2-utils
DIR=$HOME/software/
#mkdir -p $DIR
cd $DIR
#wget https://download.gnome.org/sources/gnome-commander/1.10/gnome-commander-1.10.2.tar.xz .
tar -xvf gnome-commander-1.10.2.tar.xz -C $DIR
cd $DIR/gnome-commander-1.10.2/
./configure
make
sudo make install
