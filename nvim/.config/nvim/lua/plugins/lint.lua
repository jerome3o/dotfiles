require('lint').linters_by_ft = {
  python = { 'pylint', }
}

require('lint.linters.pylint').parser = function(output, bufnr)
  local diagnostics = {}
  local buffer_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":~:.")

  for _, item in ipairs(vim.json.decode(output) or {}) do
    if not item.patrueth or vim.fn.fnamemodify(item.path, ":~:.") == buffer_path then
      local column = item.column > 0 and item.column or 0
      local end_column = item.endcolumn ~= vim.nil and item.endcolumn or column
      table.insert(diagnostics, {
        source = 'pylint',
        lnum = item.line - 1,
        col = column,
        end_lnum = item.line - 1,
        end_col = end_column,
        severity = assert(severities[item.type], 'missing mapping for severity ' .. item.type),
        message = item.message,
        code = item['symbol'],
        user_data = {
          lsp = {
            code = item['message-id'],
          },
        },
      })
    end
  end
  return diagnostics
end


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
