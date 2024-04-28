#!/bin/bash

echo "LucasB25-Setup :: Starting the Setup"

cd ~

# update everything
sudo apt-get update -y
sudo apt-get upgrade -y
echo "LucasB25-Setup :: Updated and upgraded the Current System"

# ensure hostname
hostnamevar=$(hostname)
if ! grep -q $hostnamevar "/etc/hosts"; then
    echo "127.0.0.1 $hostnamevar" >> /etc/hosts && echo "::1 $hostnamevar" >> /etc/hosts
    echo "Added $hostnamevar - hostname"
    
fi

# install sudo
sudo apt-get -y install sudo
echo "LucasB25-Setup :: Ensured sudo is installed"

# install curl
sudo apt-get -y install curl
echo "LucasB25-Setup :: Ensured curl is installed"

# remove apache
sudo apt-get purge -y --auto-remove apache*
echo "LucasB25-Setup :: Removed default installed apache package"

# install nodejs
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
sudo apt-get install -y nodejs
echo "LucasB25-Setup :: Installed nodejs"

# install pip3
sudo apt-get install -y ffmpeg python3-pip
echo "LucasB25-Setup :: Installed pip3 and ffmpeg"

# install java
wget https://download.java.net/openjdk/jdk18/ri/openjdk-18+36_linux-x64_bin.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo tar zxvf openjdk-18+36_linux-x64_bin.tar.gz -C /usr/lib/jvm
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-18/bin/java" 1
sudo update-alternatives --set java /usr/lib/jvm/jdk-18/bin/java
java -version
rm openjdk-18+36_linux-x64_bin.tar.gz
echo "LucasB25-Setup :: Installed java version 18 (openjdk)"

# install pm2
npm i -g pm2 npm-check-updates yarn npm@latest
echo "LucasB25-Setup :: Installed pm2, npm-check-updates yarn, npm@latest - via npm"

# install pm2-logrotate
pm2 install pm2-logrotate
pm2 set pm2-logrotate:max_size 50M
pm2 set pm2-logrotate:compress true
pm2 set pm2-logrotate:rotateInterval '0 12 * * *'
echo "LucasB25-Setup :: Installed pm2-logrotate to keep pm2 logs low, flushing when logs exceed 50M and everyday at 12:00 of your cron-time via cron: '0 12 * * *'"

# check
echo "Java Version: "
java -version
echo "Python Version: "
python3.9 --version
echo "Nodejs Version: "
node -v
echo "NPM Version: "
npm --version

# finish
echo "LucasB25-Setup :: Everything is setup"
echo "LucasB25-Setup :: A reboot is recommended"