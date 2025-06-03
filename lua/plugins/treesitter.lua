-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "markdown", "markdown_inline", "python", "java", "cpp", "go", "rust", "javascript", "typescript" }, -- Added a few common ones
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
      -- If you need to run TSUpdate programmatically for some reason later:
      -- require('nvim-treesitter.install').update({ with_sync = true })
    end
  }
}
