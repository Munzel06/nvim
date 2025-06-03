-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Load when entering insert mode
    config = function()
      require("nvim-autopairs").setup({})
      -- Add any custom rules or configurations for nvim-autopairs here
    end
  }
}
