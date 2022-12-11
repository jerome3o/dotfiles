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

  -- colour scheme
  use 'tanvirtin/monokai.nvim'

  -- file tree selection
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- fzf selection
  use "junegunn/fzf.vim"
  use "junegunn/fzf"

  -- packer
  use 'wbthomason/packer.nvim'

  -- ctags - similar to ctrl+shift+. in vscode, TODO: configure
  -- use "preservim/tagbar"

  -- commenting/uncommenting with gc
  use "tpope/vim-commentary"

  -- power line
  use "nvim-lualine/lualine.nvim"

  -- preview git changes in the sidebar TODO: fix
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require('gitsigns').setup()
  --   end
  -- }
  
  -- multi cursor!
  use "mg979/vim-visual-multi"
  use {
    "neoclide/coc.nvim",
    run = "yarn install --frozen-lockfile"
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

