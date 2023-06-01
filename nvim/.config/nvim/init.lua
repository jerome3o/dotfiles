-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("core.keymaps")
require("core.packer")
require("core.opts")

require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.fzf")
require("plugins.telescope")
require("plugins.vim-visual-multi")
--
require("plugins.colourscheme")
require("plugins.lualine")
require("plugins.lsp_config")
require("plugins.dap_config")

require("plugins.luasnips_config")
require("plugins.lsp_zero_config")
require("plugins.lint")
require("plugins.nullls")
require("plugins.format")
require("plugins.fidget_config")
require("plugins.blamer")
require("plugins.copilot")
