sudo add-apt-repository ppa:kubuntu-ppa/backports -y
sudo apt-get update -y
sudo apt-get install -y libkf5threadweaver-dev libkf5i18n-dev libkf5configwidgets-dev \
    libkf5coreaddons-dev libkf5itemviews-dev libkf5itemmodels-dev libkf5kio-dev libkf5parts-dev \
    libkf5solid-dev libkf5windowsystem-dev libkf5notifications-dev libkf5iconthemes-dev libelf-dev \
    libdw-dev cmake extra-cmake-modules gettext libqt5svg5-dev
cd /tmp
git clone --recurse-submodules https://github.com/KDAB/hotspot.git
mkdir build-hotspot
cd build-hotspot
cmake ../hotspot
make

# or `make install` it and launch it from your $PATH
#add-apt-repository ppa:kubuntu-ppa/backports -y
#apt-get update
#apt-get install -y libkf5threadweaver-dev libkf5i18n-dev libkf5configwidgets-dev \
    #libkf5coreaddons-dev libkf5itemviews-dev libkf5itemmodels-dev libkf5kio-dev \
    #libkf5solid-dev libkf5windowsystem-dev libelf-dev libdw-dev cmake \
    #extra-cmake-modules gettext
#git clone --recurse-submodules https://github.com/KDAB/hotspot.git
#mkdir build-hotspot
#cd build-hotspot
#cmake ../hotspot
#make
#sudo make install
## now you can run hotspot from the build folder:
##./bin/hotspot
