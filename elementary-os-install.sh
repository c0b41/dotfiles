sudo apt-get update
sudo apt-get -y install git-core
sudo apt-get -y install libmagickwand-dev imagemagick
sudo apt-get -y install festival
sudo apt-get -y install mpg123
sudo apt-get -y install mencoder
curl -OJL https://github.com/pornel/giflossy/releases/download/lossy%2F1.82.1/gifsicle-1.82.1-lossy.zip
unzip gifsicle-1.82.1-lossy.zip -d gifsicle
sudo mv gifsicle/linux/gifsicle-debian6 /usr/local/bin/gifsicle