-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  vim.cmd('colorscheme rose-pine')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('ThePrimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
    }
  }

  use 'lervag/vimtex'

    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = { "markdown" },
      config = function()
          vim.g.mkdp_auto_start = 0
          vim.g.mkdp_open_to_the_world = 1
          vim.g.mkdp_port = 8202
          vim.g.mkdp_browser = ""
          vim.g.mkdp_filetypes = { "markdown" }
      end
  }

  -- nvim v0.7.2
  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
          "nvim-lua/plenary.nvim",
      },
  })

  use {
      "windwp/nvim-autopairs",
      config = function()
          require("nvim-autopairs").setup({})
      end
  }


end)
