sudo apt update

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
git config --global core.editor "vim"

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

# # brave browser
# sudo apt install -y apt-transport-https curl
# sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# sudo apt update
# sudo apt install -y brave-browser

# # nodejs
# sudo apt-get install -y nodejs
# sudo apt install -y npm

# App Image Launcher
sudo add-apt-repository -y ppa:appimagelauncher-team/stable
sudo apt-get update
sudo apt-get install -y appimagelauncher

# SSH

sudo apt update
sudo apt install -y openssh-server

# # install portaudio
# # This is for pyaudio and capturing mic data
# sudo apt-get install -y portaudio19-dev

# ruby (for jekyll)
sudo apt-get install -y ruby-full build-essential zlib1g-dev
# kvm-ok exported in `.jeromebashrc.sh`
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

gem install jekyll bundler


# Signal

# NOTE: These instructions only work for 64-bit Debian-based
# Linux distributions such as Ubuntu, Mint etc.

# 1. Install our official public software signing key:
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories:
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install Signal:
sudo apt update && sudo apt install signal-desktop
