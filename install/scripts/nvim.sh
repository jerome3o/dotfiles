# neovim
# Need version 0.5.x or higher to use packer.nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
	~/.local/share/nvim/site/pack/packer/start/packer.nvim

# get version 0.8.3
wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

