sudo apt update

# copy dotfiles and append to .bashrc
dest=~
find "$(pwd)/config" -type f -name ".*" -exec ln -s {} $dest \;
printf "\n\nif [ -f ~/.jeromebashrc.sh ]; then \n\t. ~/.jeromebashrc.sh \nfi\n" | sudo tee -a "$dest/.bashrc"

# keybinds
sudo apt-get install -y xcape xbindkeys

# flameshot
sudo apt-get install -y flameshot

# vlc
sudo apt-get install -y vlc

# git
sudo apt-get install -y git
git config --global user.email "jeromeswannack@gmail.com"
git config --global user.name "Jerome Swannack"

# vim
sudo apt-get install -y vim

# htop
sudo apt-get install -y htop

# venv
sudo apt install -y python3.8-venv python3-pip

# vscode
sudo snap install --classic code

# discord
sudo snap install discord

# spotify
snap install spotify

# steam
sudo apt-get install -y steam

# brave browser
sudo apt install -y apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# nodejs
sudo apt-get install -y nodejs
sudo apt install -y npm