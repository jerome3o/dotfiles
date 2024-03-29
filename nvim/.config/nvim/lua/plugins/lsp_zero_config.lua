-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')

-- lsp.nvim_workspace()

-- lsp.set_preferences({
--   suggest_lsp_servers = false
-- })

-- lsp.setup()


-- Instead of actually using lsp-zero (which caused bugs recently) I will just use its configuration

---
-- LSP Support
---

local function lsp_keymaps(bufnr)
  local map = function(m, lhs, rhs)
    local opts = { remap = false, silent = true, buffer = bufnr }
    vim.keymap.set(m, lhs, rhs, opts)
  end

  -- LSP actions
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  -- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  map('n', 'gr', '<cmd>lua require("telescope.builtin").references{}<CR>')
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
  map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  map('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

  -- Diagnostics
  map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local function lsp_settings()
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  sign({ name = 'DiagnosticSignError', text = '✘' })
  sign({ name = 'DiagnosticSignWarn', text = '▲' })
  sign({ name = 'DiagnosticSignHint', text = '⚑' })
  sign({ name = 'DiagnosticSignInfo', text = '' })


  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
      border = 'rounded',
    }
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
      border = 'rounded',
    }
  )

  local command = vim.api.nvim_create_user_command

  command('LspWorkspaceAdd', function()
    vim.lsp.buf.add_workspace_folder()
  end, { desc = 'Add folder to workspace' })

  command('LspWorkspaceList', function()
    vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = 'List workspace folders' })

  command('LspWorkspaceRemove', function()
    vim.lsp.buf.remove_workspace_folder()
  end, { desc = 'Remove folder from workspace' })
end

local function lsp_attach(client, bufnr)
  local buf_command = vim.api.nvim_buf_create_user_command

  lsp_keymaps(bufnr)

  buf_command(bufnr, 'LspFormat', function()
    vim.lsp.buf.format()
  end, { desc = 'Format buffer with language server' })
end

lsp_settings()

require('mason').setup({})
require('mason-lspconfig').setup({})

-- require('mason-lspconfig').setup_handlers({
--   function(server_name)
--     require('lspconfig')[server_name].setup({
--       -- on_attach = lsp_attach,
--       -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
--     })
--   end
-- })


---
-- Snippet engine setup
---

local luasnip = require('luasnip')

luasnip.config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave'
})

require('luasnip.loaders.from_vscode').lazy_load()


---
-- Autocompletion
---

local cmp = require('cmp')

vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }

local cmp_config = {
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'buffer', keyword_length = 1 },
    { name = 'luasnip', keyword_length = 1 },
  },
  window = {
    documentation = vim.tbl_deep_extend(
      'force',
      cmp.config.window.bordered(),
      {
        max_height = 15,
        max_width = 60,
      }
    )
  },
  formatting = {
    fields = { 'abbr', 'menu', 'kind' },
    format = function(entry, item)
      local short_name = {
        nvim_lsp = 'LSP',
        nvim_lua = 'nvim'
      }

      local menu_name = short_name[entry.source.name] or entry.source.name

      item.menu = string.format('[%s]', menu_name)
      return item
    end,
  },
  mapping = {
    -- confirm selection
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = false }),

    -- navigate items on the list
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    -- scroll up and down in the completion documentation
    ['<C-f>'] = cmp.mapping.scroll_docs(5),
    ['<C-u>'] = cmp.mapping.scroll_docs(-5),

    -- toggle completion
    ['<C-e>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
        fallback()
      else
        cmp.complete()
      end
    end),

    ['ESC'] = cmp.mapping(function(fallback)
      cmp.close()
      fallback()
    end),

    -- go to next placeholder in the snippet
    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- go to previous placeholder in the snippet
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- -- when menu is visible, navigate to next item
    -- -- when line is empty, insert a tab character
    -- -- else, activate completion
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   local col = vim.fn.col('.') - 1

    --   if cmp.visible() then
    --     cmp.select_next_item(cmp_select_opts)
    --   elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    --     fallback()
    --   else
    --     cmp.complete()
    --   end
    -- end, { 'i', 's' }),

    -- -- when menu is visible, navigate to previous item on list
    -- -- else, revert to default behavior
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item(cmp_select_opts)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  }
}

cmp.setup(cmp_config)

local format_fn = function(diagnostic)
  return string.format("%s (%s) %s", diagnostic.message, diagnostic.code, diagnostic.source)
end
local virutal_format = function(diagnostic)
  return diagnostic.code
end

vim.diagnostic.config({
  virtual_text = {
    format = virutal_format
  },
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
    format = format_fn,
  },
})
