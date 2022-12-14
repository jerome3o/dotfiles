-- header
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- misc keymaps

-- clear highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- close tab
vim.keymap.set('n', '<leader>w', ':wq<CR>')

-- General editor stuff
vim.keymap.set('n', '<C-s>', ":w<CR>")
vim.keymap.set('i', '<C-s>', "<ESC>:w<CR>a")
vim.keymap.set('n', '<M-left>', "<C-o>")
vim.keymap.set('n', '<M-right>', "<C-i>")
vim.keymap.set('i', '<M-left>', "<ESC><C-o>i")
vim.keymap.set('i', '<M-right>', "<ESC><C-i>i")
vim.keymap.set('v', '(', "c()<ESC>P")
vim.keymap.set('v', '[', "c[]<ESC>P")
vim.keymap.set('v', '{', "c{}<ESC>P")

vim.keymap.set('n', '<leader>l', ":tabn<CR>")
vim.keymap.set('n', '<leader>h', ":tabp<CR>")

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

