sudo add-apt-repository -y ppa:leolik/leolik 
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y libnotify-bin
pkill notify-osd
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install -y notifyosdconfig
