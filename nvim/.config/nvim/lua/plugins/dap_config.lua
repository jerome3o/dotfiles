local dap = require('dap')

-- dap.configurations.python = {
--   {
--     type = 'python';
--     request = 'launch';
--     name = "Launch file";
--     program = "${file}";
--     pythonPath = function()
--       return '/usr/bin/python'
--     end;
--   },
-- }

require("dap-python").setup()

-- keymaps

local map = function(m, lhs, rhs)
  local opts = {remap = false, silent = false}
  vim.keymap.set(m, lhs, rhs, opts)
end

map('n', '<F5>', ':lua require"dap".continue()<CR>')
map('n', '<F9>', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<F10>', ':lua require"dap".step_over()<CR>')
map('n', '<F11>', ':lua require"dap".step_into()<CR>')
map('n', '<leader>y', ':lua require"dap".repl.open()<CR>')

