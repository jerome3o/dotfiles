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

# vim
sudo apt-get install -y vim

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

vsdir=~/.config/Code/User
snippetdir="$vsdir/snippets"
mkdir -p $snippetdir
find "$(pwd)/vscode/snippets" -type f -name "*.json" -exec ln -s {} $snippetdir \;
find "$(pwd)/vscode" -maxdepth 1 -name "*.json" -exec ln -s {} $vsdir \;

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

# docker
sudo apt-get update
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# App Image Launcher
sudo add-apt-repository -y ppa:appimagelauncher-team/stable
sudo apt-get update
sudo apt-get install -y appimagelauncher

# SSH

sudo apt update
sudo apt install -y openssh-server

# install portaudio
# This is for pyaudio and capturing mic data
sudo apt-get install -y portaudio19-dev

# ruby (for jekyll)
sudo apt-get install -y ruby-full build-essential zlib1g-dev

# install gems as user - this is exported in `.jeromebashrc.sh`
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

gem install jekyll bundler
