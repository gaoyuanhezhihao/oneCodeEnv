#!/bin/bash
set -e
set -x
cd /tmp
wget https://phoenixnap.dl.sourceforge.net/project/zsh/zsh/5.7.1/zsh-5.7.1.tar.xz
tar -xvf zsh-5.7.1.tar.xz
cd zsh-5.7.1
./configure
make
sudo make install
