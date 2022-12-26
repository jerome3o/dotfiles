-- open fzf file finder
vim.keymap.set('n', '<C-p>', ':Files<CR>')
vim.keymap.set('n', '<leader>f', ':Rg<CR>')

-- always open in new tab
-- vim.g.fzf_action = {
--   enter = 'tab split'
-- }
