# Fresh PC setup for Jerome

Scripts and dotfiles to configure a fresh Ubuntu install for my usage

Dotfires can be installed with `stow`.

`sudo apt install stow`

`stow bash`

# TODO

Follow [this guide](https://dev.to/vonheikemen/getting-started-with-neovims-native-lsp-client-in-the-year-of-2022-the-easy-way-bp3) for nvim

# Other things

## Configure Sound / Alsa

To get sound playing through the front and back headphone jacks simultaneously

From terminal run `alsamixer`, navigate to Auto-Mute (you may not be able to see it initially if the terminal isn't maximised), and set to disabled.

# nvim

nvim config is a WIP - currently requires node for COC, I've had luck using nvm:
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 14.17.0
nvm alias default 14.17.0
```

Run packer install with `:PackerInstall` in nvim, this might fail, if so this might help:

```
cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim/
npm install -g yarn
yarn install 
yarn build
```

## coc

Install coc-jedi and coc-snippets

```
:CocInstall coc-jedi
:CocInstall coc-snippets
```

And don't forget to stow your vscode settings - they're used by coc-snippets
