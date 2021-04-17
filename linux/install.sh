dest=~

# Copy config
find "$(pwd)/config" -type f -name ".*" -exec ln -s {} $dest \;

# Append bash config to .bashrc
printf "\n\nif [ -f ~/.jeromebashrc.sh ]; then \n\t. ~/.jeromebashrc.sh \nfi\n" | sudo tee -a "$dest/.bashrc"


# Install programs
sudo apt update

# keybinds
. ./apps/keybinds.sh

# git
sudo apt -y install git

# vscode
sudo snap install --classic code

# discord
sudo snap install discord

# spotify
snap install spotify

# Runelite
. ./apps/runelite.sh

# steam
. ./apps/steam.sh

