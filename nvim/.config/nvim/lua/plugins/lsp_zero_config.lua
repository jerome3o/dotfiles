local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.nvim_workspace()

lsp.set_preferences({
  suggest_lsp_servers = false
})


lsp.setup()
