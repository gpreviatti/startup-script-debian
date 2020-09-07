sudo apt-get update

echo 'installing curl and snapd' 
sudo apt install curl -y

echo 'installing snap package manager'
sudo apt install snapd -y 

echo 'installing net-tools'
sudo apt install net-tools -y

echo 'installing git' 
sudo apt install git -y

echo 'installing vim'
sudo apt install vim -y

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Giovanni Brunno Previatti\""
read git_config_user_name
git config --global user.name "$git_config_user_name"

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"gpreviatt@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
read git_core_editor_to_vim

echo 'installing vscode by snap package'
sudo snap install code --classic

echo 'installing postman by snap package'
sudo snap install postman

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing PHP'
sudo apt-get install php php-common php-cli php-fpm php-xml php-zip php-mbstring php-gd php-curl php-codesniffer -y

# Download latest composer snapshot and run it by php
sudo wget https://getcomposer.org/composer.phar
sudo mv composer.phar /bin/composer
echo "Composer Installed Globally Successfully"

echo 'installing docker'
sudo apt install docker docker.io docker-compose -y
sudo groupadd docker
sudo usermod -aG docker $USER
echo 'you can use docker after rebot machine'

echo 'installing Dbeaver'
apt install default-jre -y
wget -c https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb -y

echo 'installing Remmina'
sudo apt install remmina -y

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo 'installing zsh autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing nvm in zsh'
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
echo "source ~/.zsh-nvm/zsh-nvm.plugin.zsh" >> ~/.zshrc
zsh
nvm install --lts
node --version
npm --version

echo 'Done!'
