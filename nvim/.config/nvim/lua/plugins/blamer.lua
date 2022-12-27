vim.g.blamer_enabled = 1
vim.g.blamer_delay = 300
vim.g.blamer_prefix = " -- "
vim.g.blamer_show_in_insert_modes = 0
vim.g.blamer_show_in_visual_modes = 0


-- Function that saves the current cursor positions
function save_cursor()
  vim.cmd("let g:cursor_line = line('.')")
  vim.cmd("let g:cursor_col = col('.')")
end
