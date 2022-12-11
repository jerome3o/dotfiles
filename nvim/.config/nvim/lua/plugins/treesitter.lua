require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "lua", "vim", "json" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
