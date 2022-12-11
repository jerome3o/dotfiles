-- header
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- misc keymaps

-- clear highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- show whitespace
vim.keymap.set('n', '<leader>l', ':set list!<CR>')

-- close tab
vim.keymap.set('n', '<leader>w', ':wq<CR>')


-- tabs
vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')
vim.keymap.set('n', '<leader>0', ':tablast<CR>')

