vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    -- if vim.lsp.buf.server_ready() then
    --   vim.lsp.buf.format()
    -- end
  end,
})
