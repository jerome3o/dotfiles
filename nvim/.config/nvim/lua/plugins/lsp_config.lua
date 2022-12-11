require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "jedi_language_server", "sumneko_lua" },
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").jedi_language_server.setup({ on_attach = on_attach })
require("lspconfig").sumneko_lua.setup({ on_attach = on_attach })

