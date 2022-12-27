-- Limit copilot to common languages
vim.g.copilot_filetypes = {
  ['*'] = false,
  ['python'] = true,
  ['lua'] = true,
  ['html'] = true,
  ['css'] = true,
  ['c'] = true,
  ['go'] = true,
}
