#!/bin/bash

sudo apt-get update

echo "common packages" 
sudo apt install curl git net-tools vim -y

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Giovanni Brunno Previatti\""
read git_config_user_name
git config --global user.name "$git_config_user_name"

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"gpreviatt@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
read git_core_editor_to_vim

echo "installing vscode by snap package"
sudo snap install code --classic

echo "installing chrome" 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "Would you like to install php packages ? [y/n]"
read php_packages

if [ $php_packages = 'y' ]
then
    echo "Installing PHP"
    sudo apt-get install php php-common php-cli php-fpm php-xml php-zip php-mbstring php-gd php-curl php-codesniffer -y
    # Download latest composer snapshot and run it by php
    sudo wget https://getcomposer.org/composer.phar
    sudo mv composer.phar /bin/composer
    echo "Composer Installed Globally Successfully"
fi

echo "Would you like to install Java packages ? [y/n]"
read java_packages

if [ $java_packages = 'y' ]
then
    echo "Installing JAVA"
    echo "Installing JRE"
    sudo apt install default-jre
    java -version
    echo "Installing JDK"
    sudo apt install default-jdk
    javac -version
    echo "Installing MAVEN"
    sudo apt install maven
    mvn -version
fi

echo "installing docker"
sudo apt install docker docker.io docker-compose -y
sudo groupadd docker
sudo usermod -aG docker $USER
echo "you can use docker after rebot machine"

echo "installing Remmina"
sudo apt install remmina -y

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo "Done!"
