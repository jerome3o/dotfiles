require("plugins")
-- require("lspkeybinds")

local function map(m, k, v)
  vim.keymap.set(m, k, v, {silent = true})
end

map('n', '-', ':NERDTree<CR>')

vim.cmd([[
  set number relativenumber
]])
