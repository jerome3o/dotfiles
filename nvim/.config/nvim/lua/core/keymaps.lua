-- header
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- misc keymaps

-- clear highlight
vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>')

-- close tab
vim.keymap.set('n', '<leader>w', ':wq<CR>')

-- General editor stuff
--- saving
vim.keymap.set('n', '<C-s>', ":w<CR>")
vim.keymap.set('i', '<C-s>', "<ESC>:w<CR>a")

--- back/forward navigation
vim.keymap.set('n', '<M-left>', "<C-o>")
vim.keymap.set('n', '<M-right>', "<C-i>")
vim.keymap.set('i', '<M-left>', "<ESC><C-o>i")
vim.keymap.set('i', '<M-right>', "<ESC><C-i>i")

--- surrounding selection with ([{'"
vim.keymap.set('v', '<leader>(', "c()<ESC>P")
vim.keymap.set('v', '<leader>[', "c[]<ESC>P")
vim.keymap.set('v', '<leader>{', "c{}<ESC>P")
vim.keymap.set('v', '<leader>"', 'c""<ESC>P')
vim.keymap.set('v', "<leader>'", "c''<ESC>P")

--- some handy nav shortcuts for tabs/windows
vim.keymap.set('n', '<leader>l', "<C-w>l")
vim.keymap.set('n', '<leader>h', "<C-w>h")
vim.keymap.set('n', '<leader>j', "<C-w>j")
vim.keymap.set('n', '<leader>k', "<C-w>k")

--- selection, adding shift+navigation binds
vim.keymap.set('n', '<S-up>', "v<UP>")
vim.keymap.set('v', '<S-up>', "<UP>")
vim.keymap.set('n', '<S-down>', "v<DOWN>")
vim.keymap.set('v', '<S-down>', "<DOWN>")

vim.keymap.set('n', '<S-home>', "v<HOME>")
vim.keymap.set('n', '<S-end>', "v<END>")
vim.keymap.set('n', '<S-left>', "vh")
vim.keymap.set('v', '<S-left>', "h")
vim.keymap.set('n', '<S-right>', "vl")
vim.keymap.set('v', '<S-right>', "l")


-- Copy/paste from clipboard

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')

-- Paste from yank reg
vim.keymap.set('n', '<leader>p', '"0p')
vim.keymap.set('n', '<leader>P', '"0P')

-- Tabs navigation
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
