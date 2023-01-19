vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    local current_dir = debug.getinfo(1).source:match("@(.*/)")
    if string.find(current_dir, "momentum") then
    else
      if vim.lsp.buf.server_ready() then
        vim.lsp.buf.format()
      end
    end
  end,
})
