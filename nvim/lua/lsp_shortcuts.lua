local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', '<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({ 'n', 'x' }, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

  -- AutoFormat
  lsp_zero.buffer_autoformat()

  --LSP signature when you type
  require "lsp_signature".on_attach({}, bufnr)
end


lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = {
    { name = "codeium" },
    { name = 'nvim_lsp' },
  }
})
