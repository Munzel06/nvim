local lsp_zero = require('lsp-zero').preset({})

-- LSP-Server automatisch starten
lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- Keybindings für LSP-Funktionalität
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)

-- Mason für LSP-Installation einrichten
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp_zero.setup()
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	mapping = {
		['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
		['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'luasnip' },
	}
})

