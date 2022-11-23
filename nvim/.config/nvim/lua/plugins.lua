-- Bootstrapping packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  use "preservim/nerdtree"
  use "preservim/tagbar"
  use "ryanoasis/vim-devicons"
  use "tpope/vim-commentary"
  -- use "neovim/nvim-lspconfig"
  use "mg979/vim-visual-multi"
  -- use {
  --   "neoclide/coc.nvim",
  --   run = "yarn install --frozen-lockfile"
  -- }

  use "junegunn/fzf.vim"
  use "junegunn/fzf"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

