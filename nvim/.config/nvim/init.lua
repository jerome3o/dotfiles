require("plugins")
-- require("coc")
-- require("lspkeybinds")
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.opt.listchars = 'tab:▸ ,eol:¬,space:.'

map('n', '-', ':NERDTree<CR>')
map('n', '<C-p>', ':Files<CR>')
map('n', '<leader>l', ':set list!<CR>')

vim.cmd([[
  set number relativenumber
]])
