-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion (Dependencies of lsp-zero or other completion plugins)
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = function()
      local lsp_zero = require('lsp-zero').preset({})

      lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        -- IMPORTANT: No servers for Mason to install
        ensure_installed = {},
        -- IMPORTANT: Prevent Mason from automatically installing servers
        automatic_installation = false,
        -- IMPORTANT: Exclude all servers that are installed via NixOS
        exclude = {
          "lua_ls",
          "pyright",
          "texlab",
          "bashls",
          "html",    -- Exclude LSP client name
          "cssls",   -- Exclude LSP client name
          "jsonls",  -- Exclude LSP client name
          "yamlls",
          "clangd",
          -- Add any other servers you install via Nix to this exclude list
          -- e.g., "rust_analyzer", "gopls", "nil"
        },
        handlers = {
          -- Use lsp_zero's default setup for most servers.
          -- This will find them in your system's PATH.
          lsp_zero.default_setup,

          -- Keep custom handlers for servers that need specific configuration,
          -- like `lua_ls` with its diagnostics globals.
          lua_ls = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup(lsp_zero.build_options('lua_ls', {
              settings = {
                Lua = {
                  diagnostics = { globals = { 'vim' } }
                }
              }
            }))
          end,

        }
      })
      lsp_zero.setup()
    end
  }
}
