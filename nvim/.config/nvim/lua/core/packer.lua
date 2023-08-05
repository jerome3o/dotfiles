-- Bootstrapping packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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

  -- colour schemes
  use 'tanvirtin/monokai.nvim'
  use 'arcticicestudio/nord-vim'
  use 'dracula/vim'

  -- file tree selection
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- -- fzf selection
  -- use "junegunn/fzf.vim"
  -- use "junegunn/fzf"

  -- packer
  use 'wbthomason/packer.nvim'

  -- ctags - similar to ctrl+shift+. in vscode, TODO: configure
  -- use "preservim/tagbar"

  -- commenting/uncommenting with gc
  use "tpope/vim-commentary"

  -- power line
  use "nvim-lualine/lualine.nvim"

  -- syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'

  -- -- preview git changes in the sidebar TODO: fix
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- git blame
  use 'APZelos/blamer.nvim'

  -- multi cursor!
  use "mg979/vim-visual-multi"

  -- autocompletion and other language server stuff
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- visual updates for lsp
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
  }

  -- lsp configuration, snippets, autocompletion
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- { 'rafamadriz/friendly-snippets' },
    }
  }

  -- linting
  use 'mfussenegger/nvim-lint'


  -- null-ls, allows implementation of lsp functionality from lua
  use { "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("null-ls").setup()
    end
  }

  -- python debugger

  use {
    "mfussenegger/nvim-dap-python",
    requires = {
      "mfussenegger/nvim-dap"
    }
  }

  use "charliermarsh/ruff-lsp"

  -- python indentation, not sure if this works
  use 'Vimjas/vim-python-pep8-indent'

  use "github/copilot.vim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
