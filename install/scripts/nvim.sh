# neovim
# Need version 0.5.x or higher to use packer.nvim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
	~/.local/share/nvim/site/pack/packer/start/packer.nvim

# nodejs needed for pyright language server
curl -sL install-node.vercel.app/lts | bash

# install pyright language server
sudo npm i -g pyright
