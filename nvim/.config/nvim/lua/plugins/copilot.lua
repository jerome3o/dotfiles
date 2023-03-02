-- Limit copilot to common languages
vim.g.copilot_filetypes = {
  ['*'] = false,
  ['python'] = true,
  ['lua'] = true,
  ['html'] = true,
  ['css'] = true,
  ['c'] = true,
  ['go'] = true,
  ['javascript'] = true,
  ['typescript'] = true,
  ['java'] = true,
  ['rust'] = true,
  ['sh'] = true,
  ['yaml'] = true,
}
