-- require("luasnip.loaders.from_vscode").load({
--   paths = { "~/.config/Code/User/snippets" },
-- })

-- local ls = require("luasnip")
-- ls.filetype_extend("all", {"python"})

local ls = require("luasnip")

require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets/" })
